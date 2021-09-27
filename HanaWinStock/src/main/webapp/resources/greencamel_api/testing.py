import yfinance as yf
import pandas as pd
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from sklearn.preprocessing import MinMaxScaler
import matplotlib.pyplot as plt
from tensorflow.keras.callbacks import CSVLogger
import joblib
import tensorflow as tf
import sys


from flask import Flask,jsonify,render_template, Response
from flask import request as flaskRequest
from apscheduler.schedulers.background import BackgroundScheduler
from apscheduler.executors.pool import ThreadPoolExecutor, ProcessPoolExecutor
import pandas as pd
import time
from config import *
from sqlalchemy.engine import create_engine
import requests
import json
from flask_cors import CORS, cross_origin

app = Flask(__name__)
cors = CORS(app)
app.config['CORS_HEADERS'] = 'Content-Type'



executors = {
    'default': ThreadPoolExecutor(16),
    'processpool': ProcessPoolExecutor(4)
}

ENGINE_PATH_WIN_AUTH = DIALECT + '+' + SQL_DRIVER + '://' + USERNAME + ':' + PASSWORD +'@' + HOST + ':' + str(PORT) + '/?service_name=' + SERVICE
engine = create_engine(ENGINE_PATH_WIN_AUTH)
conn = engine.connect()


def getSymbols():
    data = conn.execute("select symbol from gc_stock")
    results = data.fetchall()
    results = list(map(lambda x: x[0] , results))
    return results

symbols = getSymbols();

def insertDailyFor5years():
    for symbol in symbols:
        try:
            url = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-charts"
            querystring = {"symbol":symbol,"interval":"1d","range":"5y","region":"US"}
            headers = {
                'x-rapidapi-host': "apidojo-yahoo-finance-v1.p.rapidapi.com",
                'x-rapidapi-key': "886154e1cemsh2cd846fa2cb5bd4p100be8jsn6237c6c8a470"
                }
            response = requests.request("GET", url, headers=headers, params=querystring)
            result = response.text
            data = json.loads(result)
            datainfo = data["chart"]["result"][0]["indicators"]
            timeinfo = data["chart"]["result"][0]["timestamp"]
            for i in range(len(timeinfo)):
                try:
                    unix_time = timeinfo[i]
                    volume = datainfo['quote'][0]["volume"][i]
                    low = datainfo['quote'][0]["low"][i]
                    close =datainfo['quote'][0]["close"][i]
                    high = datainfo['quote'][0]["high"][i]
                    open = datainfo['quote'][0]["open"][i]
                    inserting_sql = "INSERT INTO GC_DAILY_STOCK( UNIX_TIME , SYMBOL , VOLUME , LOW , CLOSE , HIGH , OPEN   )  VALUES( {},'{}',{},{},{},{},{}  )".format(unix_time , symbol,  volume , low , close , high , open )
                    conn.execute(inserting_sql)
                except Exception as e:
                    print(e)
                    continue
        except Exception as e:
            print(e)
            continue

@app.route("/startInsertStocks")
def startInsertStock():
    try:
        if insertStock.state == 1:
            return {"result" : "success" , "state" : "alreadyStartedProcessing"}
        elif insertStock.state == 0:
            insertStock.start()
            return {"result" : "success" , "state" : "startedProcessing"}
        elif insertStock.state == 2:
            insertStock.resume()
            return {"result" : "success" , "state" : "resumedProcessing"}
        else:
            return {"result" : "fail" , "state" : "unknownState"}
    except Exception as e:
        return {"result" : "fail" , "state" : str(e)}

@app.route("/pauseInsertStocks")
def pauseInsertStock():
    try:
        if insertStock.state == 1:
            insertStock.pause()
            return {"result" : "success" , "state" : "pausedProcessing"}
        elif insertStock.state == 0:
            return {"result" : "success" , "state" : "notStartedProcessing"}
        elif insertStock.state == 2:
            return {"result" : "fail" , "state" : "alreadyPausedProcessing"}
        else:
            return {"result" : "fail" , "state" : "unknownState"}
    except Exception as e:
        return {"result" : "fail" , "state" : str(e)}


@app.route("/startInsertSummaryStocks")
def startInsertSummaryStock():
    try:
        if insertSummary.state == 1:
            return {"result" : "success" , "state" : "alreadyStartedProcessing"}
        elif insertSummary.state == 0:
            insertSummary.start()
            return {"result" : "success" , "state" : "startedProcessing"}
        elif insertSummary.state == 2:
            insertSummary.resume()
            return {"result" : "success" , "state" : "resumedProcessing"}
        else:
            return {"result" : "fail" , "state" : "unknownState"}
    except Exception as e:
        return {"result" : "fail" , "state" : str(e)}


@app.route("/pauseInsertSummaryStocks")
def pauseInsertSummaryStock():
    try:
        if insertSummary.state == 1:
            insertSummary.pause()
            return {"result" : "success" , "state" : "pausedProcessing"}
        elif insertSummary.state == 0:
            return {"result" : "success" , "state" : "notStartedProcessing"}
        elif insertSummary.state == 2:
            return {"result" : "fail" , "state" : "alreadyPausedProcessing"}
        else:
            return {"result" : "fail" , "state" : "unknownState"}
    except Exception as e:
        return {"result" : "fail" , "state" : str(e)}


@app.route("/updateSymbols",methods=['GET'] )
def updateSymbols():
    try:
        print("hello")
        newSymbol = flaskRequest.args['symbol']
        print(newSymbol)
        newLongName = flaskRequest.args['longName']
        print(newLongName)
        df = pd.read_csv("symbol_names.csv")
        print("reading")
        df = df.append(pd.DataFrame({"symbol" : newSymbol, "longName" : newLongName}   , index = [df.index.values.max() + 1] ) )
        print("apprending")
        df.to_csv("symbol_names.csv" , index = False)
        print("writing")
        global symbols
        symbols = pd.read_csv("symbol_names.csv")["symbol"].tolist()
        print("updating")
        return {"result":"success"}
    except Exception as e:
        return {"result" : "fail" , "state" : str(e)}

#@cross_origin()
@app.route("/getSymbols")
def getSymbols():
    return jsonify({"symbols" : symbols})


@app.route("/trySymbol" ,methods=['GET'])
def trySymbo():
    try:
        newSymbol = flaskRequest.args['symbol']
        quote_url = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes"
        quote_querystring = {"region":"US","symbols": newSymbol }
        quote_headers = {
            'x-rapidapi-host': "apidojo-yahoo-finance-v1.p.rapidapi.com",
            'x-rapidapi-key': "886154e1cemsh2cd846fa2cb5bd4p100be8jsn6237c6c8a470"
        }
        response = requests.request("GET", quote_url, headers=quote_headers, params=quote_querystring)
        result = response.text
        return {"result" : "success" , "state" : result}
    except Exception as e:
        return {"result" : "fail" , "state" : str(e)}


@app.route("/deleteSymbol")
def deleteSymbol():
    try:
        print("delete start")
        deleteSymbol = flaskRequest.args['symbol']
        print(deleteSymbol)
        df = pd.read_csv("symbol_names.csv")
        if deleteSymbol in df.symbol.values.tolist():
            df = df.loc[df["symbol"] != deleteSymbol ]
            df.to_csv("symbol_names.csv" , index= False)
            global symbols
            symbols = pd.read_csv("symbol_names.csv")["symbol"].tolist()
            return {"result" : "success" , "state" : "deleted"}
        else:
            return {"result" : "success" , "state" : "notExisting" }
    except exception as e:
        return {"result" : "fail" , "state" : str(e)}

def processData(data,lb):
    X,Y = [],[]
    for i in range(len(data)-lb-1):
        X.append(data[i:(i+lb),0])
        Y.append(data[(i+lb),0])
    return np.array(X),np.array(Y)

@app.route("/predictStock")
def predictStock():
    try:
        print("predicting stock futures")
        symbol = flaskRequest.args['symbol']
        days_predict = int(flaskRequest.args['days_predict'])

        model_name_query = "select model_name , lb from gc_ai_models where symbol = '{}' and flag = 'true'".format(symbol)
        models = conn.execute(model_name_query)
        models_results = models.fetchall()
        model_name =  models_results[0][0]
        model_path =  symbol+   "/" + model_name
        lb =  int(models_results[0][1])
        current_unix_time = int(time.time())
        safety_num = 100
        start_unix_time = current_unix_time - ( lb * 86400 * safety_num )

        model = tf.keras.models.load_model(model_path)
        query = "SELECT close  FROM GC_DAILY_STOCK where symbol = '{}'  and unix_time > {} ORDER BY unix_time asc".format(symbol , start_unix_time)
        data = conn.execute(query)
        results = data.fetchall()
        result_values = list(map(lambda x: float(x[0]) , results  ))
        result_values = result_values[-lb:]

        cl = np.expand_dims(result_values, axis=1)
        scl = joblib.load(model_path+'/scaler.gz')
        cl =scl.transform(cl.reshape(-1,1))
        whole_data = cl

        for i in range(days_predict):
            cdata = whole_data[-lb:]
            cdata_expanded =   tf.expand_dims(cdata, axis=0)
            output = model.predict(cdata_expanded)
            whole_data = np.append(whole_data, output , axis= 0)

        final_results = scl.inverse_transform(whole_data)
        real_begin_values = final_results[:lb].flatten().tolist()
        predict_values = final_results[lb:].flatten().tolist()

        return {"result" : "success" , "real_begin_values" : real_begin_values , "predict_values" : predict_values , "lb" : lb  }



    except Exception as e:
        print("error : {}".format(e))
        return {"result" : "fail" , "state" : str(e)}



@app.route("/createModel")
def createModel():
    try:
        print("creating model")
        symbol = flaskRequest.args['symbol']
        unix_time = flaskRequest.args['unix_time']
        train_ratio = flaskRequest.args['train_ratio']
        train_epoch = flaskRequest.args['train_epoch']
        lb = flaskRequest.args['lb']
        training_optimizer = flaskRequest.args['training_optimizer']
        training_loss = flaskRequest.args['training_loss']
        layer_node = flaskRequest.args['layer_node']
        model_name = flaskRequest.args['model_name']
        #model_path = flaskRequest.args['model_path']
        print(unix_time)
        print(train_ratio)
        print(train_epoch)
        print(lb)
        print(training_optimizer)
        print(training_loss)
        print(layer_node)
        print(model_name)
        print(symbol)

        model_path =  symbol+   "/" + model_name

        unix_time = int(unix_time)
        train_ratio = float(train_ratio)
        train_epoch = int(train_epoch)
        lb = int(lb)
        layer_node = int(layer_node)

        query = "select close from GC_DAILY_STOCK where unix_time > {} and symbol = '{}' order by unix_time asc".format(unix_time , symbol)

        data = conn.execute(query)
        results = data.fetchall()
        result_values = list(map(lambda x: float(x[0]) , results  ))
        cl = np.expand_dims(result_values, axis=1)
        cl = cl.astype('float32')
        train = cl[0:int(len(cl)*0.80)]
        scl = MinMaxScaler()
        scl.fit(train.reshape(-1,1))
        cl =scl.transform(cl.reshape(-1,1))

        X,y = processData(cl,lb)
        X_train,X_test = X[:int(X.shape[0]*train_ratio)],X[int(X.shape[0]*train_ratio):]
        y_train,y_test = y[:int(y.shape[0]*train_ratio)],y[int(y.shape[0]*train_ratio):]
        print(X_train.shape[0],X_train.shape[1])
        print(X_test.shape[0], X_test.shape[1])
        print(y_train.shape[0])
        print(y_test.shape[0])

        model = Sequential()
        model.add(LSTM(layer_node,input_shape=(lb,1)))
        model.add(Dense(1))
        model.compile(optimizer=training_optimizer,loss=training_loss)

        #Reshape data for (Sample,Timestep,Features)
        X_train = X_train.reshape((X_train.shape[0],X_train.shape[1],1))
        X_test = X_test.reshape((X_test.shape[0],X_test.shape[1],1))

        csv_logger = CSVLogger('training.log')

        orig_stdout = sys.stdout
        f = open('train_log.txt', 'w')
        sys.stdout = f
        history = model.fit(X_train,y_train,epochs=train_epoch,validation_data=(X_test,y_test),shuffle=False , callbacks=[csv_logger])
        sys.stdout = orig_stdout
        f.close()
        last_loss = history.history["loss"][-1]
        last_val_loss = history.history["val_loss"][-1]

        tf.keras.models.save_model(model,  model_path)

        plt.figure(figsize=(12,8))
        Xt = model.predict(X_train)
        plt.plot(scl.inverse_transform(y_train.reshape(-1,1)), label="Actual")
        plt.plot(scl.inverse_transform(Xt), label="Predicted")
        plt.legend()
        plt.title("Train Dataset")
        plt.savefig('{}/train_result.png'.format(model_path))

        plt.figure(figsize=(12,8))
        Xt = model.predict(X_test)
        plt.plot(scl.inverse_transform(y_test.reshape(-1,1)), label="Actual")
        plt.plot(scl.inverse_transform(Xt), label="Predicted")
        plt.legend()
        plt.title("Test Dataset")
        plt.savefig('{}/test_result.png'.format(model_path))

        start_unix_time = unix_time
        end_unix_time = int(time.time())

        joblib.dump(scl, model_path + '/scaler.gz')
        training_loss_func = training_loss

        insert_sql = '''INSERT INTO gc_ai_models( symbol , start_unix_time , end_unix_time ,
        flag , model_name , last_loss , last_val_loss, train_ratio , lb , train_epoch , training_optimizer , training_loss_func , layer_node )
        VALUES ( '{}',{},{},'{}','{}',{},{},{},{},{},'{}','{}' , {} )'''.format(symbol , start_unix_time , end_unix_time,"false", model_name ,
         last_loss , last_val_loss , train_ratio , lb , train_epoch ,  training_optimizer , training_loss_func ,layer_node )
        print(insert_sql)
        conn.execute( insert_sql)

        return {"result" : "success" , "symbol" : symbol , "training_loss" : training_loss}


    except Exception as e:
        return {"result" : "fail" , "state" : str(e)}





def insertStockInfo():
    for i in range(len(symbols)):
        print(symbols[i])
        try:
            symbol = symbols[i]
            url = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary"

            querystring = {"symbol":symbol ,"region":"US"}

            headers = {
                'x-rapidapi-host': "apidojo-yahoo-finance-v1.p.rapidapi.com",
                'x-rapidapi-key': "886154e1cemsh2cd846fa2cb5bd4p100be8jsn6237c6c8a470"
                }
            response = requests.request("GET", url, headers=headers, params=querystring)
            data = json.loads(response.text)
            if "longName" in data["price"]:
                longName = data["price"]["longName"]
            else:
                longName = "NULL"

            if "sector" in data["summaryProfile"]:
                sector =  data["summaryProfile"]["sector"]
            else:
                sector = "NULL"

            symbol = data["price"]["symbol"]

            if "phone" in data["summaryProfile"]:
                phone =  data["summaryProfile"]["phone"]
            else:
                phone = "NULL"
            if "website" in data["summaryProfile"]:
                website = data["summaryProfile"]["website"]
            else:
                website = "NULL"

            conn.execute("INSERT INTO GC_STOCK( SYMBOL , LONG_NAME  ,  SECTOR , PHONE , WEBSITE) VALUES ( :1 , :2, :3, :4, :5)", (symbol , longName  , sector , phone , website) )
        except Exception as e:
            print("error : {}".format(e) )
            try:
                print(data["summaryProfile"][e])
            except:
                continue




def insertSummary():
    cunix_time = int(time.time())
    for symbol in symbols:
        print(symbol)
        try:
            keys = []
            keys.append("unix_time")
            values = (cunix_time,)
            print("insert summary")
            url = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/stock/v2/get-summary"
            querystring = {"symbol":symbol ,"region":"US"}
            headers = {
                'x-rapidapi-host': "apidojo-yahoo-finance-v1.p.rapidapi.com",
                'x-rapidapi-key': "886154e1cemsh2cd846fa2cb5bd4p100be8jsn6237c6c8a470"
                }
            response = requests.request("GET", url, headers=headers, params=querystring)
            data = json.loads(response.text)
            for x in gc_summary_stock_config.keys():
                ckey = x
                for j in gc_summary_stock_config[ckey].keys():
                    column = j
                    db_col = gc_summary_stock_config[ckey][column]
                    if column in data[ckey]:

                        if data[ckey][column] == {}:
                            continue
                        elif "raw" in data[ckey][column]:
                            try:
                                ele = float(data[ckey][column]["raw"])
                                values =  values + (ele , )
                                keys.append(db_col)
                            except:
                                continue;
                        else:
                            keys.append(db_col)
                            ele = data[ckey][column]
                            values =  values + (ele , )
            db_cols = ",".join(keys)
            params =  ",".join([ "?" for x in range(len(keys))  ])
            conn.execute("INSERT INTO GC_SUMMARY_STOCK({}) VALUES{}".format(db_cols , values)  )
        except Exception as e:
            print(symbol  + " ---------------------")
            print(e )
            print(" ---------------------")


def gc_realtime_stock_insert():
        try:
            quote_url = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/v2/get-quotes"
            quote_querystring = {"region":"US","symbols": ",".join(symbols) }
            quote_headers = {
                'x-rapidapi-host': "apidojo-yahoo-finance-v1.p.rapidapi.com",
                'x-rapidapi-key': "886154e1cemsh2cd846fa2cb5bd4p100be8jsn6237c6c8a470"
                }
            response = requests.request("GET", quote_url, headers=quote_headers, params=quote_querystring)
            data = json.loads(response.text)
            resultlen = len(data["quoteResponse"]["result"])
            gc_realtime_stock_keys =  list(gc_realtime_stock_config.keys())
            for i in range(resultlen):
                current_data = data["quoteResponse"]["result"][i]
                current_dict = {key: current_data[key] for key in gc_realtime_stock_keys if key in current_data.keys()}
                insertingDict = {}
                for key in current_dict.keys():
                    insertingDict[gc_realtime_stock_config[key]] = current_dict[key]
                if insertingDict["BID"] == 0:
                    insertingDict["BID"] = insertingDict["MARKET_PRICE"]
                if insertingDict["ASK"] == 0:
                    insertingDict["ASK"] =  insertingDict["MARKET_PRICE"]
                columns = ",".join(list(insertingDict.keys()))
                columns = columns + ",UNIX_time"
                values = str(tuple(insertingDict.values()) +(int(time.time()),))
                inserting_sql = "INSERT INTO GC_REALTIME_STOCK({}) VALUES{}".format(columns , values)
                result = conn.execute(inserting_sql)
            print("realtime inserting done")
        except Exception as e:
            print("unknown error : " + str(e))







if __name__ == '__main__':
    insertStock = BackgroundScheduler(timezone='Asia/Seoul', executors=executors)
    insertStock.add_job(gc_realtime_stock_insert, 'interval', seconds=3)

    insertSummary = BackgroundScheduler(timezone='Asia/Seoul', executors=executors)
    insertSummary.add_job(startInsertSummaryStock, 'interval', seconds=3600)


    app.run(host='0.0.0.0', port=8000, debug=True, use_reloader=False)
