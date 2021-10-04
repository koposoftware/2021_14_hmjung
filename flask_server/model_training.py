import yfinance as yf
import pandas as pd
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.layers import LSTM
from sklearn.preprocessing import MinMaxScaler
import matplotlib.pyplot as plt
import tensorflow as tf


from config import *
import pandas as pd
import time
from config import *
from sqlalchemy.engine import create_engine
import requests
import json
import joblib
from tensorflow.keras.callbacks import CSVLogger
import sys


ENGINE_PATH_WIN_AUTH = DIALECT + '+' + SQL_DRIVER + '://' + USERNAME + ':' + PASSWORD +'@' + HOST + ':' + str(PORT) + '/?service_name=' + SERVICE
engine = create_engine(ENGINE_PATH_WIN_AUTH)
conn = engine.connect()

def getSymbols():
    data = conn.execute("select symbol from gc_stock")
    results = data.fetchall()
    results = list(map(lambda x: x[0] , results))
    return results

symbols = getSymbols();


for symbol in symbols:
    url = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/market/get-charts"
    querystring = {"symbol":symbol,"interval":"1d","range":"3mo","region":"US"}
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
        unix_time = timeinfo[i]
        if unix_time > 1632253775:
            print("inserting : {}".format(symbol))
            volume = datainfo['quote'][0]["volume"][i]
            low = datainfo['quote'][0]["low"][i]
            close =datainfo['quote'][0]["close"][i]
            high = datainfo['quote'][0]["high"][i]
            open = datainfo['quote'][0]["open"][i]
            inserting_sql = "INSERT INTO GC_DAILY_STOCK( UNIX_TIME , SYMBOL , VOLUME , LOW , CLOSE , HIGH , OPEN   )  VALUES( {},'{}',{},{},{},{},{}  )".format(unix_time , symbol,  volume , low , close , high , open )
            conn.execute(inserting_sql)
---
import matplotlib.font_manager as fm
font_location = 'C:/Users/hmchu/AppData/Local/Microsoft/Windows/Fonts/NanumGothic.ttf'  #font 경로 설정
font_name = fm.FontProperties(fname=font_location).get_name()
plt.rc('font', family=font_name)





unix_time = 1474551000
symbol = 'AAPL'
train_ratio = 0.9
train_epoch = 300 #300
lb=10
training_optimizer='adam'
training_loss='mse'
layer_node = 256
model_name = "last_model"
model_path =  symbol+   "/" + model_name

unix_time = int(unix_time)
train_ratio = float(train_ratio)
train_epoch = int(train_epoch)
lb = int(lb)
layer_node = int(layer_node)

5

data=yf.download('AMZN',start='2020-06-01', interval='1h',  end='2021-07-07',progress=False)[['Close']]

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



#Create a function to process the data into lb observations look back slices
# and create the train test dataset (90-10)
def processData(data,lb):
    X,Y = [],[]
    for i in range(len(data)-lb-1):
        X.append(data[i:(i+lb),0])
        Y.append(data[(i+lb),0])
    return np.array(X),np.array(Y)


X,y = processData(cl,lb)
X_train,X_test = X[:int(X.shape[0]*train_ratio)],X[int(X.shape[0]*train_ratio):]
y_train,y_test = y[:int(y.shape[0]*train_ratio)],y[int(y.shape[0]*train_ratio):]
print(X_train.shape[0],X_train.shape[1])
print(X_test.shape[0], X_test.shape[1])
print(y_train.shape[0])
print(y_test.shape[0])




#Build the model
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
plt.plot(scl.inverse_transform(y_train.reshape(-1,1)), label="실제 값")
plt.plot(scl.inverse_transform(Xt), label="추론 값")
plt.legend()
plt.title("학습 데이터셋")
plt.savefig('{}/train_result.png'.format(model_path))


plt.figure(figsize=(12,8))
Xt = model.predict(X_test)
plt.plot(scl.inverse_transform(y_test.reshape(-1,1)), label="실제 값")
plt.plot(scl.inverse_transform(Xt), label="추론 값")
plt.legend()
plt.title("검증 데이터셋")
plt.savefig('{}/test_result.png'.format(model_path))

plt.figure(figsize=(12,8))
plt.plot(history.history['loss'])
plt.plot(history.history['val_loss'])
plt.title('손실 로그')
plt.ylabel('손실')
plt.xlabel('에포크')
plt.legend(['학습', '검증'], loc='upper left')
plt.savefig('{}/loss_result.png'.format(model_path))







start_unix_time = unix_time
end_unix_time = int(time.time())


joblib.dump(scl, model_path + '/scaler.gz')
training_loss_func = training_loss

insert_sql = '''INSERT INTO gc_ai_models( symbol , start_unix_time , end_unix_time ,
flag , model_name , last_loss , last_val_loss, train_ratio , lb , train_epoch , training_optimizer , training_loss_func , layer_node )
VALUES ( '{}',{},{},'{}','{}',{},{},{},{},{},'{}','{}' , {} )'''.format(symbol , start_unix_time , end_unix_time,"false", model_name ,
 last_loss , last_val_loss , train_ratio , lb , train_epoch ,  training_optimizer , training_loss_func ,layer_node )

conn.execute( insert_sql)

print(5)


------------------------ predict ---------------------------





symbol = "AAPL"
model_name = "second_model"
model_path =  symbol+   "/" + model_name
days_predict = 50


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


{"result" : "success" , "real_begin_values" : real_begin_values , "predict_values" : predict_values , "lb" : lb  }
