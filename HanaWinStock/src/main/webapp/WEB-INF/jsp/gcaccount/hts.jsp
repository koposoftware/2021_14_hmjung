<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="${ pageContext.request.contextPath }/resources/images/favicon.ico">
<title>GreenCamel</title>
<!-- Vendors Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">

<link href="https://www.amcharts.com/lib/3/plugins/export/export.css" rel="stylesheet" type="text/css" />

<!-- Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/client.js"></script>
<!--   <script src="https://www.webrtc-experiment.com/one-to-many-video-broadcasting/meeting.js"></script>
  <script src="https://cdn.firebase.com/v0/firebase.js"></script> -->
		
	<script src="${ pageContext.request.contextPath }/resources/main.js"></script>
	<script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
<style>
.enlarged-btn {
	height: 350px;
	width: 100%;
	background-color: white;
}

.remove-chart {
	float: right;	
}
	


.remove-chat{
	float : right;
}



</style>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script> -->





<script>


/* 	
	function getRealTimeData() {
		$.ajax({type : 'get',
		url : "${pageContext.request.contextPath }/ajax/realTimeStock.json",
		data : {start : "2021-08-31-17:37:20",
				end : "2021-08-31-17:40:50",
				symbols : allSymbols.join(",")
		},
		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
		datatype : 'json',
		success : function(data) {
			console.log(data)
			console.log("success")
			test = data
			for(let i in data){
				allSymbolInfo[ data[i].symbol ] = data[i]
			}
		},
		error : function() {
			console.log("error")
			}
		})
	}
 */
 
 
//-------------------------------web socket----------------------------------
/* 						<div class="col-md-12 right-col">
						<div id="chart-area">
							<div class="row" id="row-chat">
								<div class="col" id="row-chat-col"></div>
							</div>
							<div class="row" id="row-one">
								<div class="col" id="row-one-col"></div>
							</div>
							<div class="row" id="row-two">
								<div class="col" id="row-two-col"></div>
							</div>
							<div class="row" id="row-three">
								<div class="col" id="row-three-col"></div>
							</div>
							<div class="row" id="row-final">
								<div class="col-md-4" id="sc-one"></div>
								<div class="col-md-4" id="sc-two"></div>
								<div class="col-md-4" id="sc-three"></div>
								<div class="col-md-6" id="lc-one"></div>
								<div class="col-md-6" id="lc-two"></div>
							</div>
						</div>
					</div>
				</div>				
			$("#three-cross").click(function(){
					box_counts  = 3;
					$('#box-one').appendTo('#sc-one');
					$('#box-one').show()
					
					$('#box-two').appendTo('#sc-two');
					$('#box-two').show()
					
					$('#box-three').appendTo("#sc-three");
					$('#box-three').show()

				})
			})			 */	


		function chatServer(box){
			enterChatServer(box_info[box]['symbol'])			
			$('#box-' + box).appendTo('row-chat-col')
		}


		 var room;
 
 		 function enterChatServer(symbol){
 			 if(!Object.keys(stockNameMap).includes(symbol)){
 				 myAlarm("warning:error:해당 종목은 존재 하지 않습니다.")
 			 }else{
 				$('#direct-chat').empty()
 				if(chattingToggle == 1){
 					openchatbox()
 				}else{
 					ws.close();
 				}
 				room = symbol
 				wsOpen(room)
 				}
 		 }
 		 function openchatbox(){
 			console.log("opening chat box")
 			
			$('#close-chat').show()
			
			$('.left-col').each(function(){
				$(this).removeClass('col-xs-12');
				$(this).addClass('col-md-3');				
			})
			$('.right-col').each(function(){
				$(this).removeClass('col-md-12')
				$(this).addClass('col-md-9')				
			})
			$('.full-chat-box').hide()
			$('.full-chat-box').show()
			chattingToggle = 2;
 		 }
 		
 		function removechatbox(){
 			$('#close-chat').hide()
 			$('#direct-chat').empty()
 			$('.left-col').each(function(){
 				$(this).removeClass('col-md-3');
 				$(this).addClass('col-xs-12');
 			})
 			$('.right-col').each(function(){
 				$(this).removeClass('col-md-9')
 				$(this).addClass('col-md-12')
 			})
 			$('.full-chat-box').hide()
 			if(chattingToggle == 2){
 				ws.close()	
 			}						
 			chattingToggle = 1;			
 		}
 		 
 		 
	     function wsOpen(room){
		      ws = new WebSocket("ws://" + location.host + "/HanaWinStock/account/hts/" + room);
		      wsEvt();      
		  }			 
    	 function wsEvt() {
    	     ws.onopen = function(data){
    	        //소켓이 열리면 초기화 세팅하기
    	        console.log('소켓열림');
    	        console.log('ws : ' + ws.url);
    	     }
    	     
    	     ws.onmessage = function(data) {
    	        //메시지를 받으면 동작
    	        console.log("msg received")
    	        var msg = data.data;
    	        console.log("msg : " +  msg);
    	        if(msg != null && msg.trim() != ''){
    	           var d = JSON.parse(msg);
    	           if(d.type == "getId"){
    	              var si = d.sessionId != null ? d.sessionId : "";
    	              if(si != ''){
    	                 $("#sessionId").val(si); 
    	              }
    	           }else if(d.type == "message"){
    	              if(d.sessionId == $("#sessionId").val()){
    	                  var newmsg = '<div class="direct-chat-msg clearfix right mb-30">' +
    	                  				'<div class="direct-chat-text">'+
    	                  				'<p>' + d.msg + '</p>'+
    	                  				'<p class="direct-chat-timestamp"><time datetime="'+ d.year+'">'+ d.hourMin +'</time></p>'+
    	                  				'</div></div>';        	  
    	            	  $("#direct-chat").append(newmsg);   
    	              }else{
    	            	  var newmsg ='<div class="direct-chat-msg mb-30">'+
    	            	  '<div class="clearfix mb-15">' +
							'<span class="direct-chat-name">James Anderson</span>' + 
						  '</div>' +
 						'<img class="direct-chat-img avatar" src="${ pageContext.request.contextPath }/resources/images/user1-128x128.jpg" alt="message user image">'+
 						' <div class="direct-chat-text">' +
 						'<p>' + d.msg + '</p>' +
 						'<p class="direct-chat-timestamp"><time datetime="'+  d.year  +'">'+ d.hourMin+'</time></p>' +
 						'</div></div>';    	            	  					    	            	  
    	            	 $("#direct-chat").append(newmsg);
    	              }
    	                 
    	           }else{
    	              console.warn("unknown type!")
    	           }
    	        }
    	     }
   		 }
   	    document.addEventListener("keypress", function(e){
      	        if(e.keyCode == 13){ //enter press
      	           send();
      	        }
      	 });
    		
    	 function send() {
    	      
    	      var d = new Date();
    	      var option ={
    	         type: "message",
    	         sessionId : $("#sessionId").val(),
    	         userName : "${leagueAccountVO.id}",
    	         room : room,
    	         msg : $("#chat").val(),
    	         tier : "${leagueAccountVO.tier}",
    	         year : String(d.getFullYear()),
    	         hourMin : String(d.getHours()) + ":" + String(d.getMinutes())     	   
    	      }
    	      console.log(option)
    	      ws.send(JSON.stringify(option))
    	      $('#chat').val("");
    	   }
 
 
//-----------------------------------------------------------------
		xtime = ~~(Date. now() / 1000) - 1631215740  
		
		
		maximumTicCounts = 500
		allSymbols  = []
		chartDict = {};
 		dataDict = {}						
		clicked_box = "none";
		box_counts = 0;		
		realdata = {}
		
		init_tic = 60
		init_tic_counts = 50;
		
		
		linedataTic = 2;
		lineGraphExtraSec = 20;
		
		stockNameMap = {}
		
		userId ="${userVO.id}"
		box_info = {}
		box_info["one"] =  {"symbol" : null,
				"type" : "candlestick",
				"tic" : 60,
				"start_date": (~~(Date. now() / 1000) - init_tic * init_tic_counts ) - xtime ,
				"end_date" : null}
		box_info["two"] =  {"symbol" : null,
				"type" : "candlestick",
				"tic" : 60,
				"start_date": (~~(Date. now() / 1000) - init_tic * init_tic_counts ) - xtime ,
				"end_date" : null}
		box_info["three"] =  {"symbol" : null,
				"type" : "candlestick",
				"tic" : 60,
				"start_date": (~~(Date. now() / 1000) - init_tic * init_tic_counts ) - xtime ,
				"end_date" : null}		
		
		interval = {}
		
		interval["one"] = {}
		interval["one"]["flag"] = false
		
		interval["two"] = {}
		interval["two"]["flag"] = false
		
		interval["three"] = {}
		interval["three"]["flag"] = false
		
		
		if (localStorage.getItem("allSymbols") != null
				&& localStorage.getItem("allSymbols") != "") {
			allSymbols = localStorage.getItem("allSymbols").split(",")
		}			
		
		function instantGratification( fn, delay ) {
		    fn();
		    setInterval( fn, delay );
		}
		
					
	
		function start2(box){
			$('#modal-center-dates').modal('show');						
			clicked_box = box;				
		}
		
		function checkTradingHour(){
			let newyorktime = new Date( (~~(Date. now() / 1000)  - xtime) * 1000   ).toLocaleString('en-US', { timeZone: 'America/New_York' });
			let newyorkDay = new Date(newyorktime).getDay();
			if(newyorkDay == 6 || newyorkDay == 0){
				return false;
			}
			let newyorkHour = new Date(newyorktime).getHour();
			let newyorkMin = new Date(newyorktime).getMinutes();
			if(newyorkHour <=  9 ){
				if(neyorkHour <= 30){
					return false;
				}
			}
			if(newyorkHour >= 4){
				return false;
			}			
			return true;
		}
		
		//tic('three' , 10  )
		function tic(box , sec){
			box_info[box]["tic"] = sec;
			box_info[box]["start_date"] =  (~~(Date. now() / 1000) - sec * init_tic_counts ) - xtime
			if(box_info[box]["type"] == "candlestick" ){
				if(interval[box]["flag"]){
					clearInterval(interval[box]["func"])
					interval[box]['flag'] = false;
				}
				symbol = box_info[box]["symbol"];
				delete chartDict[symbol]
				delete dataDict[symbol] 
				
				var rchartId = "chart_"  +   symbol ;						
				
				let rchartDiv = document.querySelector("#" + rchartId)
				
				let rchartBody = document.querySelector(".box-" + box + "-body .chart .chart-row")
				rchartBody.removeChild(rchartDiv )										
				
				getinitdata(  box , symbol );
			}
		}
	
		function numberWithCommas(x) {
		    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		
			
		function printRealData(symbol , box , result){
			$("#box-" + box + " .symbol").html(result.symbol);
			//$("#box-" + box + " .marketPrice").html(result.marketPrice);
		  	var thisval= parseFloat($("#box-" + box + " .marketPrice").html());
			var thisval2 = parseFloat(result.marketPrice);
			$("#box-" + box + " .marketPrice").css("color" , "red")
		  	$({ val : parseFloat($("#box-" + box + " .marketPrice").text()) }).animate({ val : parseFloat(result.marketPrice)  }, {
			   duration: 2000,
			  	step: function() {
			  		
			    var num = numberWithCommas(this.val.toFixed(2)  );
			    $("#box-" + box + " .marketPrice").html(num);
					
			  	},
			  	complete: function() {
			  		
			    var num = numberWithCommas(this.val.toFixed(2) );
			    $("#box-" + box + " .marketPrice").html(num);
			    $("#box-" + box + " .marketPrice").css("color" , "black")
			  }
			});
		  	
			$("#box-" + box + " .marketChangePercent").html(result.marketChangePercent);
			$("#box-" + box + " .marketVolume").html(result.marketVolume);
			$("#box-" + box + " .bid").html(result.bid + "/" + result.bidSize );
			$("#box-" + box + " .ask").html(result.ask + "/" + result.askSize );
			$("#box-" + box + " .dividendsYield").html(result.dividendsYield);
			$("#box-" + box + " .floatingShares").html(result.floatingShares);
			$("#box-" + box + " .shortRatio").html(result.shortRatio);
			$("#box-" + box + " .shareOutstanding").html(result.shareOutstanding);
			$("#box-" + box + " .epsForward").html(result.epsForward);			
		}

		
		
		function candlefirstrun( symbol , tic , type  , box){
			$.ajax({type : 'get',
	      		url : "${pageContext.request.contextPath }/ajax/getRealTimeStock.json",
	      		data : {interval : tic,
	      				symbol : symbol,
	      				startTime :  ~~(Date. now() / 1000) - tic - xtime,  // ~~(Date. now() / 1000) - tic,
	      				endTime :   ~~(Date. now() / 1000)  - xtime  // ~~(Date. now() / 1000) 
	      		},
	      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
	      		datatype : 'json',
	      		success : function(result) {	      			
	      			console.log("one real time success")

	      			realdata[box] = result
	      			
	      			dataDict[box_info[box]["symbol"]].push(
	      					{
	      						x : new Date(parseInt(result.unixTime) * 1000),  
	   							y : [result.firstPrice, 
	   								result.maxPrice,
	   								result.minPrice,
	   								result.lastPrice]	
	      						}					      			
	      			)
	      			// check maximumTicCounts 
	      			if(dataDict[box_info[box]["symbol"]].length > maximumTicCounts ){
	      				console.log("over 500 data deleting")
	      				for (var i = dataDict[box_info[box]["symbol"]].length  - 1; i >= 0; i--) {
							  // remove element if index is odd
						  if (i % 2 == 1)
							  dataDict[box_info[box]["symbol"]].splice(i, 1);
						}	
	      			}
	      			chartDict[box_info[box]["symbol"]].updateSeries([{
	      				data: dataDict[box_info[box]["symbol"]]
			       	}])
			       	
			       	printRealData(symbol , box , result)				       	
	      		},
	      		error : function() {
	      			console.log("error")
	      			}
				})
				
			}
			
			
			
			function linefirstrun(symbol , tic , type  , box){
				console.log("line graph real time starting")
				$.ajax({type : 'get',
		      		url : "${pageContext.request.contextPath }/ajax/getRealTimeStock.json",
		      		data : {interval :linedataTic , // box_info[box]['tic'],
		      				symbol : symbol,
		      				startTime :  ~~(Date. now() / 1000) - linedataTic  - xtime - lineGraphExtraSec, 
		      				endTime :   ~~(Date. now() / 1000)  - xtime  
		      		},
		      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
		      		datatype : 'json',
		      		success : function(result) {	      			
		      			console.log("one real time success")
		      			realdata[box] = result
		      			chartDict[box_info[box]["symbol"]].addData(
								{ date:  new Date( (~~(Date. now() / 1000)  - xtime)  * 1000  )   ,  //parseInt(result.unixTime) * 1000) 
	  				 				price: result.marketPrice ,  
	  				 				quantity: result.marketVolume },
						         1);
		      			//chartDict[box_info[box]["symbol"]].series.removeIndex(0);
		      			
		      			printRealData(symbol , box , result)
		      									       
		      		},
		      		error : function() {
		      			console.log("error")
		      		}
		      	})												
			}

	
		function startIntervalOne(  symbol , tic , type  , box ){
			if(checkTradingHour){			
				if(interval[box]["flag"]){
					console.log("clearing previous interval")
					clearInterval(interval[box]["func"])				
				}						
				if( type == "candlestick"){
					console.log("candle real time data started")
					interval[box]["func"] = setInterval(function(){
						$.ajax({type : 'get',
				      		url : "${pageContext.request.contextPath }/ajax/getRealTimeStock.json",
				      		data : {interval : tic,
				      				symbol : symbol,
				      				startTime :  ~~(Date. now() / 1000) - tic - xtime,  // ~~(Date. now() / 1000) - tic,
				      				endTime :   ~~(Date. now() / 1000)  - xtime  // ~~(Date. now() / 1000) 
				      		},
				      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
				      		datatype : 'json',
				      		success : function(result) {	      			
				      			console.log("one real time success")

				      			realdata[box] = result
				      			
				      			dataDict[box_info[box]["symbol"]].push(
				      					{
				      						x : new Date(parseInt(result.unixTime) * 1000),  
				   							y : [result.firstPrice, 
				   								result.maxPrice,
				   								result.minPrice,
				   								result.lastPrice]	
				      						}					      			
				      			)
				      			// check maximumTicCounts 
				      			if(dataDict[box_info[box]["symbol"]].length > maximumTicCounts ){
				      				console.log("over 500 data deleting")
				      				for (var i = dataDict[box_info[box]["symbol"]].length  - 1; i >= 0; i--) {
										  // remove element if index is odd
									  if (i % 2 == 1)
										  dataDict[box_info[box]["symbol"]].splice(i, 1);
									}	
				      			}
				      			chartDict[box_info[box]["symbol"]].updateSeries([{
				      				data: dataDict[box_info[box]["symbol"]]
						       	}])
						       	
						       	printRealData(symbol , box , result)				       	
				      		},
				      		error : function() {
				      			console.log("error")
				      		}
				      	})					
					}, tic * 1000 ) 
					candlefirstrun( symbol , tic , type  , box );
				}else if( type == "line"){
					interval[box]["func"] = setInterval(function(){
						console.log("line graph real time starting")
						$.ajax({type : 'get',
				      		url : "${pageContext.request.contextPath }/ajax/getRealTimeStock.json",
				      		data : {interval :linedataTic , // box_info[box]['tic'],
				      				symbol : symbol,
				      				startTime :  ~~(Date. now() / 1000) - linedataTic  - xtime - lineGraphExtraSec, 
				      				endTime :   ~~(Date. now() / 1000)  - xtime  
				      		},
				      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
				      		datatype : 'json',
				      		success : function(result) {	      			
				      			console.log("one real time success")
				      			realdata[box] = result
				      			chartDict[box_info[box]["symbol"]].addData(
										{ date:  new Date( (~~(Date. now() / 1000)  - xtime)  * 1000  )   ,  //parseInt(result.unixTime) * 1000) 
			  				 				price: result.marketPrice ,  
			  				 				quantity: result.marketVolume },
								         1);
				      			//chartDict[box_info[box]["symbol"]].series.removeIndex(0);
				      			
				      			printRealData(symbol , box , result)
				      									       
				      		},
				      		error : function() {
				      			console.log("error")
				      		}
				      	})												
					}, linedataTic * 1000)				// tic * 1000 		
					linefirstrun(symbol , tic , type  , box)
				}
				interval[box]["flag"] = true;
			}
		}
		

			
		
		function getinitdata( box , symbol ){
			
			box_info[box]['type'] = "candlestick"
			delete chartDict[symbol];
			delete dataDict[symbol];
		
			
			$.ajax({type : 'get',
	      		url : "${pageContext.request.contextPath }/ajax/getInitStockValuesLines.json",
	      		data : {interval : box_info[box]['tic'],
	      				symbols : symbol,
	      				startTime : box_info[box]["start_date"],
	      				endTime :   ~~(Date. now() / 1000)  - xtime
	      		},
	      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
	      		datatype : 'json',
	      		success : function(result) {	      			
	      			console.log("success")
	      			let data = [];
	      			for(let i in result){
	      				currentData = result[i]	      					      				
      					data.push({
      						x : new Date(parseInt(currentData.grp_id) * 1000),
   							y : [currentData.min_created_value, 
   								currentData.max_value,
   								currentData.min_value,
   								currentData.max_created_value]	
      						}) 	      					
     					}	      				
	      			
	      			dataDict[symbol] = data
	      																		
					console.log( "newSymbol : " +   symbol)
					let chartId = "chart_" +  symbol																																			
					let chartDiv = document.createElement("div");									
					chartDiv.id = chartId
					chartDiv.classList.add("col-xl-8");
					chartDiv.classList.add("col-12");
					let chartBody = document.querySelector(".box-" + box + "-body .chart .chart-row" );					
					chartBody.appendChild(chartDiv);
					
					$("#box-" + box  +" .hide-toggle" ).show()
					

					box_info[box]['symbol'] =  symbol;
					options = {
							chart : {
								height : 550,
								type : 'candlestick',
							},
							series : [ {
								data : data
							} ],
							title : {
								text : 'CandleStick Chart',
								align : 'left'
							},
							xaxis : {                          //xaxis : {type : 'datetime'},   <---- default
								  type: 'category',
								  labels: {
								    formatter: function(val) {
								      return dayjs(val).format('MMM DD HH:mm')          
								    }
								  }
							},
							yaxis : {
								tooltip : {
									enabled : true
								}
							}
						}		
					
					
					chart = new ApexCharts(document.querySelector("#chart_" + symbol  ),options);
					chart.render();
					chartDict[symbol] =  chart;
					/* chart.updateSeries([ {
						data : data
					}]) */
				//-------------------------------------------------staring realtime -------------------------------------------------	
				startIntervalOne(symbol , box_info[box]['tic'] ,  "candlestick" , box); 
				
				//--------------------------------------------------------------------------------------------------					
										      			
	      		},
	      		error : function() {
	      			console.log("error")
	      			}
	      		})
			}
		
		
			function initData(box){
				clicked_box = box;
				let chartbox = document.querySelector("#chartbox");				
			}
		
			var chartReg = {};
			function createChart(chartdiv, charttype) {
			  // Check if the chart instance exists
			   maybeDisposeChart(chartdiv);

			  // Create new chart
			   chartReg[chartdiv] = am4core.create(chartdiv, charttype);
			   return chartReg[chartdiv];
			}

			function maybeDisposeChart(chartdiv) {
			  if (chartReg[chartdiv]) {
			    chartReg[chartdiv].dispose();
			    delete chartReg[chartdiv];
			  }
			}
			
		
			function getinitdataLine(box, symbol){
					let data = [];															
					delete chartDict[symbol];
					delete dataDict[symbol];					
					box_info[box]['type'] = "line"
					
					
					let chartId = "linechart_" +  symbol
					let chartDiv = document.createElement("div");									
					chartDiv.id = chartId
					chartDiv.classList.add("col-xl-8");
					chartDiv.classList.add("col-12");
					
					chartDiv.classList.add("h-550");
					
					
					let chartBody = document.querySelector(".box-" + box + "-body .chart .chart-row" );		
					chartBody.appendChild(chartDiv);	
					
					$("#box-" + box  +" .hide-toggle" ).show()
					
					
					am4core.useTheme(am4themes_animated);					
					var chart = createChart("linechart_" +  symbol, am4charts.XYChart)
					
					box_info[box]['symbol'] =  symbol;
					
					
					chart.padding(0, 15, 0, 15);
					chart.colors.step = 3;
					$.ajax({type : 'get',
			      		url : "${pageContext.request.contextPath }/ajax/getInitStockValuesLines.json",
			      		data : {interval :  linedataTic ,  //box_info[box]['tic']
			      				symbols : symbol,			      				            
			      				startTime :  (~~(Date. now() / 1000) - (linedataTic * init_tic_counts * 3)   ) - xtime,   //(~~(Date. now() / 1000) - (linedataTic * init_tic_counts)   ) - xtime,  // box_info[box]['tic'] 
			      				endTime :   ~~(Date. now() / 1000)  - xtime
			      		},
			      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
			      		datatype : 'json',
			      		success : function(result){	      			
			      			console.log("success")	      			
			      			for(let i  = 0 ;  i <  result.length   ; i++ ){
			      				currentData = result[i]	    
			  				 	data.push({ date: new Date( parseInt(currentData.grp_id)  * 1000 ), 
			  				 				price: currentData.avg_price,  
			  				 				quantity: currentData.max_vol});			      				
			      				}
			      			var interfaceColors = new am4core.InterfaceColorSet();
			      			chart.data = data;
			      			chart.leftAxesContainer.layout = "vertical";
							
							// uncomment this line if you want to change order of axes
							//chart.bottomAxesContainer.reverseOrder = true;
							
							var dateAxis = chart.xAxes.push(new am4charts.DateAxis());
							
							dateAxis.renderer.grid.template.location = 0;
							dateAxis.renderer.ticks.template.length = 8;
							dateAxis.renderer.ticks.template.strokeOpacity = 0.1;
							dateAxis.renderer.grid.template.disabled = true;
							dateAxis.renderer.inside = true;
							dateAxis.renderer.axisFills.template.disabled = true;
							dateAxis.renderer.ticks.template.disabled = true;
							
							dateAxis.renderer.ticks.template.strokeOpacity = 0.2;

							// these two lines makes the axis to be initially zoomed-in
							//dateAxis.start = 0.7;
							//dateAxis.keepSelection = true;

							var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
							valueAxis.tooltip.disabled = true;
							valueAxis.zIndex = 1;
							valueAxis.renderer.baseGrid.disabled = true;
							valueAxis.renderer.minLabelPosition = 0.05;
							valueAxis.renderer.maxLabelPosition = 0.95;

							// Set up axis
							valueAxis.renderer.inside = true;
							valueAxis.height = am4core.percent(60);
							valueAxis.renderer.labels.template.verticalCenter = "bottom";
							valueAxis.renderer.labels.template.padding(2,2,2,2);
							//valueAxis.renderer.maxLabelPosition = 0.95;
							valueAxis.renderer.fontSize = "0.8em"

							// uncomment these lines to fill plot area of this axis with some color
							valueAxis.renderer.gridContainer.background.fill = interfaceColors.getFor("alternativeBackground");
							valueAxis.renderer.gridContainer.background.fillOpacity = 0.05;


							var series = chart.series.push(new am4charts.LineSeries());
							
							
							series.dataFields.dateX = "date";
							series.dataFields.valueY = "price";
							series.tooltipText = "{valueY.value}";
							series.name = "Series 1";
							

							var valueAxis2 = chart.yAxes.push(new am4charts.ValueAxis());
							valueAxis2.tooltip.disabled = true;

							// this makes gap between panels
							valueAxis2.marginTop = 30;
							valueAxis2.renderer.baseGrid.disabled = true;
							valueAxis2.renderer.inside = true;
							valueAxis2.height = am4core.percent(40);
							valueAxis2.zIndex = 3
							valueAxis2.renderer.labels.template.verticalCenter = "bottom";
							valueAxis2.renderer.labels.template.padding(2,2,2,2);
							//valueAxis2.renderer.maxLabelPosition = 0.95;
							valueAxis2.renderer.fontSize = "0.8em"

							// uncomment these lines to fill plot area of this axis with some color
							valueAxis2.renderer.gridContainer.background.fill = interfaceColors.getFor("alternativeBackground");
							valueAxis2.renderer.gridContainer.background.fillOpacity = 0.05;

							var series2 = chart.series.push(new am4charts.ColumnSeries());
							series2.columns.template.width = am4core.percent(50);
							series2.dataFields.dateX = "date";
							series2.dataFields.valueY = "quantity";
							series2.yAxis = valueAxis2;
							series2.tooltipText = "{valueY.value}";
							series2.name = "Series 2";
							
							
							chart.cursor = new am4charts.XYCursor();
							chart.cursor.xAxis = dateAxis;
							
							var scrollbarX = new am4charts.XYChartScrollbar();
							scrollbarX.series.push(series);
							scrollbarX.marginBottom = 20;
							chart.scrollbarX = scrollbarX;														
							series.stroke = am4core.color("#ff0000"); // 
							chartDict[symbol] = chart
							
							dateAxis.interpolationDuration = 500;
							dateAxis.rangeChangeDuration = 500;
							series.interpolationDuration = 500;
							series.defaultState.transitionDuration = 0;
							series.tensionX = 0.8;
							chart.events.on("datavalidated", function () {
							    dateAxis.zoom({ start: 1 / 15, end: 1.2 }, false, true);
							});
							
						
							series2.stroke = am4core.color("#ff0000");
							series2.heatRules.push({
								  "target": series2.columns.template,
								  "property": "fill",
								  "min": am4core.color("#F5DBCB"),
								  "max": am4core.color("#ED7B84"),
								  "dataField": "valueY"
								});
							
							
							
							
							// -----------------------------------------starting realtime-------------------------------------------------
							startIntervalOne(symbol , box_info[box]['tic'] ,  "line" , box) 
							oneIntervalFlag = true;
							//--------------------------------------------------------------------------------------------------
							
							series.fillOpacity = 1;
							var gradient = new am4core.LinearGradient();
							gradient.addColor(am4core.color("red"), 0.2);
							gradient.addColor(am4core.color("red"), 0);
							series.fill = gradient;

							// this makes date axis labels to fade out
							dateAxis.renderer.labels.template.adapter.add("fillOpacity", function (fillOpacity, target) {
							    var dataItem = target.dataItem;
							    return dataItem.position;
							})

							// need to set this, otherwise fillOpacity is not changed and not set
							dateAxis.events.on("validated", function () {
							    am4core.iter.each(dateAxis.renderer.labels.iterator(), function (label) {
							        label.fillOpacity = label.fillOpacity;
							    })
							})

							// this makes date axis labels which are at equal minutes to be rotated
							dateAxis.renderer.labels.template.adapter.add("rotation", function (rotation, target) {
							    var dataItem = target.dataItem;
							    if (dataItem.date && dataItem.date.getTime() == am4core.time.round(new Date(dataItem.date.getTime()), "minute").getTime()) {
							        target.verticalCenter = "middle";
							        target.horizontalCenter = "left";
							        return -90;
							    }
							    else {
							        target.verticalCenter = "bottom";
							        target.horizontalCenter = "middle";
							        return 0;
							    }
							})

							// bullet at the front of the line
							var bullet = series.createChild(am4charts.CircleBullet);
							bullet.circle.radius = 5;
							bullet.fillOpacity = 1;
							bullet.fill = am4core.color("red");
							bullet.isMeasured = false;

							series.events.on("validated", function() {
							    bullet.moveTo(series.dataItems.last.point);
							    bullet.validatePosition();
							});
							
						
							
			      			},
			      		error : function() {
			      			console.log("error")
			      			}
			      		})
				}
				
			function graphType(box , type){
				console.log("graphType : " + box + " : " + type)
				box_info[box]["type"] = type
								
				current_symbol = box_info[box]["symbol"]
				if(current_symbol != null){
					if(type == "line"){						
						$("#chart-" + box).remove("#chart_" +  current_symbol );
						var previousChart = document.getElementById("chart_" +  current_symbol);
						var parentDiv = previousChart.parentNode;
						parentDiv.removeChild(previousChart);						
						box_info[box]['type'] = "line"									
						getinitdataLine( box , current_symbol);																		
					}else if(type == "candlestick"){
						$("#chart-" + box).remove("#chart_" +  current_symbol);
						var previousChart = document.getElementById("linechart_" +  current_symbol);
						var parentDiv = previousChart.parentNode;
						parentDiv.removeChild(previousChart);
						box_info[box]['type'] = "candle"
						getinitdata( box , current_symbol)
					}
				}						
			}			
			
/* 			<!-- modal -->
			<div class="modal center-modal fade" id="modal-center-chat" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title">종목 코드 입력</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<p>종목 코드 입력 <br>
							예시. <br>
							전체방 : ALL <br>
							애플 : APPL <br>
							테슬라 : TSLA <br>
							</p>
							
							<input class="bootstrap-tagsinput bg-transparent" type="text" id="chat-symbol-code">
						</div>
						<div class="modal-footer modal-footer-uniform">
							<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
							<button type="button" id="enter-chat" data-bs-dismiss="modal" class="btn btn-primary float-end">확인</button>
						</div>
					</div>
				</div>
			</div>	 */
		var ws;	
		var chattingToggle = 1;
		
	

		// Define MediaStreams callbacks.

		// Sets the MediaStream as the video element src.
		function gotLocalMediaStream(mediaStream) {
		  localVideo.srcObject = mediaStream;
		  localStream = mediaStream;
		  trace('Received local stream.');
		  callButton.disabled = false;  // Enable call button.
		}

		// Handles error by logging a message to the console.
		function handleLocalMediaStreamError(error) {
		  trace(`navigator.getUserMedia error: ${error.toString()}.`);
		}

		// Handles remote MediaStream success by adding it as the remoteVideo src.
		function gotRemoteMediaStream(event) {
		  const mediaStream = event.stream;
		  remoteVideo.srcObject = mediaStream;
		  remoteStream = mediaStream;
		  trace('Remote peer connection received remote stream.');
		}


		// Add behavior for video streams.

		// Logs a message with the id and size of a video element.
		function logVideoLoaded(event) {
		  const video = event.target;
		  trace(`${video.id} videoWidth: ${video.videoWidth}px, ` +
		        `videoHeight: ${video.videoHeight}px.`);
		}

		// Logs a message with the id and size of a video element.
		// This event is fired when video begins streaming.
		function logResizedVideo(event) {
		  logVideoLoaded(event);

		  if (startTime) {
		    const elapsedTime = window.performance.now() - startTime;
		    startTime = null;
		    trace(`Setup time: ${elapsedTime.toFixed(3)}ms.`);
		  }
		}

		// Connects with new peer candidate.
		function handleConnection(event) {
		  const peerConnection = event.target;
		  const iceCandidate = event.candidate;

		  if (iceCandidate) {
		    const newIceCandidate = new RTCIceCandidate(iceCandidate);
		    const otherPeer = getOtherPeer(peerConnection);

		    otherPeer.addIceCandidate(newIceCandidate)
		      .then(() => {
		        handleConnectionSuccess(peerConnection);
		      }).catch((error) => {
		        handleConnectionFailure(peerConnection, error);
		      });

		    trace(`${getPeerName(peerConnection)} ICE candidate:\n` +
		          `${event.candidate.candidate}.`);
		  }
		}

		// Logs that the connection succeeded.
		function handleConnectionSuccess(peerConnection) {
		  trace(`${getPeerName(peerConnection)} addIceCandidate success.`);
		};

		// Logs that the connection failed.
		function handleConnectionFailure(peerConnection, error) {
		  trace(`${getPeerName(peerConnection)} failed to add ICE Candidate:\n`+
		        `${error.toString()}.`);
		}

		// Logs changes to the connection state.
		function handleConnectionChange(event) {
		  const peerConnection = event.target;
		  console.log('ICE state change event: ', event);
		  trace(`${getPeerName(peerConnection)} ICE state: ` +
		        `${peerConnection.iceConnectionState}.`);
		}

		// Logs error when setting session description fails.
		function setSessionDescriptionError(error) {
		  trace(`Failed to create session description: ${error.toString()}.`);
		}

		// Logs success when setting session description.
		function setDescriptionSuccess(peerConnection, functionName) {
		  const peerName = getPeerName(peerConnection);
		  trace(`${peerName} ${functionName} complete.`);
		}

		// Logs success when localDescription is set.
		function setLocalDescriptionSuccess(peerConnection) {
		  setDescriptionSuccess(peerConnection, 'setLocalDescription');
		}

		// Logs success when remoteDescription is set.
		function setRemoteDescriptionSuccess(peerConnection) {
		  setDescriptionSuccess(peerConnection, 'setRemoteDescription');
		}

		// Logs offer creation and sets peer connection session descriptions.
		function createdOffer(description) {
		  trace(`Offer from localPeerConnection:\n${description.sdp}`);

		  trace('localPeerConnection setLocalDescription start.');
		  localPeerConnection.setLocalDescription(description)
		    .then(() => {
		      setLocalDescriptionSuccess(localPeerConnection);
		    }).catch(setSessionDescriptionError);

		  trace('remotePeerConnection setRemoteDescription start.');
		  remotePeerConnection.setRemoteDescription(description)
		    .then(() => {
		      setRemoteDescriptionSuccess(remotePeerConnection);
		    }).catch(setSessionDescriptionError);

		  trace('remotePeerConnection createAnswer start.');
		  remotePeerConnection.createAnswer()
		    .then(createdAnswer)
		    .catch(setSessionDescriptionError);
		}

		// Logs answer to offer creation and sets peer connection session descriptions.
		function createdAnswer(description) {
		  trace(`Answer from remotePeerConnection:\n${description.sdp}.`);

		  trace('remotePeerConnection setLocalDescription start.');
		  remotePeerConnection.setLocalDescription(description)
		    .then(() => {
		      setLocalDescriptionSuccess(remotePeerConnection);
		    }).catch(setSessionDescriptionError);

		  trace('localPeerConnection setRemoteDescription start.');
		  localPeerConnection.setRemoteDescription(description)
		    .then(() => {
		      setRemoteDescriptionSuccess(localPeerConnection);
		    }).catch(setSessionDescriptionError);
		}


		// Handles start button action: creates local MediaStream.
		function startAction() {
		  startButton.disabled = true;
		  navigator.mediaDevices.getUserMedia(mediaStreamConstraints)
		    .then(gotLocalMediaStream).catch(handleLocalMediaStreamError);
		  trace('Requesting local stream.');
		}

		// Handles call button action: creates peer connection.
		function callAction() {
		  callButton.disabled = true;
		  hangupButton.disabled = false;

		  trace('Starting call.');
		  startTime = window.performance.now();

		  // Get local media stream tracks.
		  const videoTracks = localStream.getVideoTracks();
		  const audioTracks = localStream.getAudioTracks();
		  if (videoTracks.length > 0) {
		    trace(`Using video device: ${videoTracks[0].label}.`);
		  }
		  if (audioTracks.length > 0) {
		    trace(`Using audio device: ${audioTracks[0].label}.`);
		  }

		  const servers = null;  // Allows for RTC server configuration.

		  // Create peer connections and add behavior.
		  localPeerConnection = new RTCPeerConnection(servers);
		  trace('Created local peer connection object localPeerConnection.');

		  localPeerConnection.addEventListener('icecandidate', handleConnection);
		  localPeerConnection.addEventListener(
		    'iceconnectionstatechange', handleConnectionChange);

		  remotePeerConnection = new RTCPeerConnection(servers);
		  trace('Created remote peer connection object remotePeerConnection.');

		  remotePeerConnection.addEventListener('icecandidate', handleConnection);
		  remotePeerConnection.addEventListener(
		    'iceconnectionstatechange', handleConnectionChange);
		  remotePeerConnection.addEventListener('addstream', gotRemoteMediaStream);

		  // Add local stream to connection and create offer to connect.
		  localPeerConnection.addStream(localStream);
		  trace('Added local stream to localPeerConnection.');

		  trace('localPeerConnection createOffer start.');
		  localPeerConnection.createOffer(offerOptions)
		    .then(createdOffer).catch(setSessionDescriptionError);
		}

		// Handles hangup action: ends up call, closes connections and resets peers.
		function hangupAction() {
		  localPeerConnection.close();
		  remotePeerConnection.close();
		  localPeerConnection = null;
		  remotePeerConnection = null;
		  hangupButton.disabled = true;
		  callButton.disabled = false;
		  trace('Ending call.');
		}
		

		// Gets the "other" peer connection.
		function getOtherPeer(peerConnection) {
		  return (peerConnection === localPeerConnection) ?
		      remotePeerConnection : localPeerConnection;
		}

		// Gets the name of a certain peer connection.
		function getPeerName(peerConnection) {
		  return (peerConnection === localPeerConnection) ?
		      'localPeerConnection' : 'remotePeerConnection';
		}

		// Logs an action (text) and the time when it happened on the console.
		function trace(text) {
		  text = text.trim();
		  const now = (window.performance.now() / 1000).toFixed(3);

		  console.log(now, text);
		}

		$(document).ready(function() {			

			
				 	$('#send-msg').click(function(){
						send();
					}) 					
					/*  var ws;
			 		 function enterChatServer(symbol){
			 			 alert('${stockSummaryList}')
			 		 } */
					$("#enter-chat").click(function(){
						enterChatServer($("#chat-symbol-code").val())
						$("#chat-symbol-code").val("")
					})
					
					removechatbox()
				
					
			
					$("#box-one").hide()
					$("#box-two").hide()
					$("#box-three").hide()
					$(".box-header").hide()     
					$(".hide-toggle").hide()					
					stockNameMap =  '${stockNameMap}'					
					stockNameMap  = JSON.parse(stockNameMap);
								
					let fullMsg = '${msg}'
					if (fullMsg != null && fullMsg != "") {
						myAlarm(fullMsg)
					}
					
					
					let chartbox = document.querySelector("#chartbox")					
					$('#add-symbol').click(function(){
						if(! Object.keys(stockNameMap ).includes($("#symbol-code").val()) ){
							myAlarm("warning:실패:존재 하지 않는 종목 입니다.");							
						} else if (  allSymbols.includes($("#symbol-code").val())){
							myAlarm("warning:실패:이미 화면에 존재 합니다.");
						}else{
							var newSymbol = $("#symbol-code").val()	
							if(interval[clicked_box]["flag"]){								
								
								previous_symbol = box_info[clicked_box]["symbol"]
								
								clearInterval(interval[clicked_box]["func"])
								interval[clicked_box]['flag'] = false;
								
								
								delete chartDict[previous_symbol ]
								delete dataDict[previous_symbol ] 
								allSymbols.pop(previous_symbol)
								var rchartId = "chart_"  +   previous_symbol;						
								if(box_info[clicked_box]["type"] == "line"){
									rchartId = "line" + rchartId
								}				
								let rchartDiv = document.querySelector("#" + rchartId)								
								let rchartBody = document.querySelector(".box-" + clicked_box+ "-body .chart .chart-row")
								rchartBody.removeChild(rchartDiv );
								if(box_info[clicked_box]["type"] == "line"){
									getinitdataLine(  clicked_box , newSymbol  );
								}else{
									getinitdata(  clicked_box , newSymbol  );	
								}
								
							}else{
								$(".box-" + clicked_box + "-header").show();
																								
								console.log( "newSymbol : " +   newSymbol)
								$('#modal-' +clicked_box ).removeClass('enlarged-btn');
								$('#remove-chart-'+clicked_box).show()
								if(box_info[clicked_box]["type"] == "candlestick" ){
									getinitdata(  clicked_box , newSymbol  );	
								}else if(box_info[clicked_box]["type"] == "line" ){								
									getinitdataLine(clicked_box , newSymbol  )
								}
																						
							}
								allSymbols.push(newSymbol)
							} 
						})
					$(".attr").hover(
				            function() {
				                $(".attr").css("color","red");
				            },
				            function() {
				                $(".attr").css("color","black");
				            }
				        );

					$(".remove-chart").click(function(){
						rbox = this.id.split("-")[2]
						
						clearInterval(interval[rbox]["func"])
						
						interval[rbox]['flag'] = false;
						allSymbols.pop(box_info[rbox]["symbol"])
						
						delete chartDict[box_info[rbox]['symbol']]
						delete dataDict[box_info[rbox]['symbol']]
						var rchartId = "chart_"  +   box_info[rbox]["symbol"] ;						
						if(box_info[rbox ] ['type'] == "line" ){
							rchartId = "line" + rchartId
						}
						let rchartDiv = document.querySelector("#" + rchartId)						
						let rchartBody = document.querySelector(".box-" + rbox + "-body .chart .chart-row")						
						rchartBody.removeChild(rchartDiv );
						
						
						
						box_info[rbox] =  {"symbol" : null,
							"type" : "candlestick",
							"tic" : init_tic,
							"start_date": (~~(Date. now() / 1000) - init_tic * init_tic_counts ) - xtime ,
							"end_date" : null
							}
						//$("#remove-chart-" + rbox).hide()
						$("#modal-" + rbox).addClass("enlarged-btn");
						$("#box-" + rbox + " .hide-toggle").hide();
						$(".box-" + rbox + "-header").hide()
					})
						
					
					$('#add-date').click(function(){
						
						valid = true;
						$(".stock-time").each(function(){
							console.log($(this).val())
							
							if( ! (/^\d+$/.test($(this).val() ) )  ) {
								valid = false;
								msg = "숫자만 입력 바랍니다."								
								myAlarm("warning:에러:" + msg)								        
							}   
						})
						
						year = $("#stock-year").val()
						month =$("#stock-month").val()
						day = $("#stock-day").val()
						hour = $("#stock-hour").val()
						miniute = $("#stock-miniute").val()													
						
						if(valid){
							
							second_valid = true;
							selected_time_str = year + "/" + month + "/" + day + "/ " + hour +":"+miniute+":00"
							console.log(selected_time_str)
							selected_time = (new Date(selected_time_str).getTime()/1000)
							console.log(selected_time)
							if(selected_time >  ~~(Date. now() / 1000) ){														
								second_valid = false;
								myAlarm("warning:에러:현재 시간 보다 과거를 선택 바랍니다.")								
							}else if( ~~(Date. now() / 1000)  - selected_time > 31556952 * 2  ){
								//현재 보다 2년 이상인지 확인
								myAlarm("warning:warning:2년 넘는 시간에는 자동으로 틱이 하루로 변경 됩니다.")
								box_info[clicked_box]["tic"] = 86400
							}   
							if(second_valid){
								box_info[clicked_box]["start_date"] =  selected_time							
								console.log("changed date  : " +  String(box_info[clicked_box]["start_date"]) ) 	
								if(box_info[clicked_box]["type"] == "candlestick" ){
									if(interval[clicked_box]["flag"]){
										clearInterval(interval[clicked_box]["func"])
										interval[clicked_box]['flag'] = false;
									}
									symbol = box_info[clicked_box]["symbol"];
									delete chartDict[symbol]
									delete dataDict[symbol] 
									
									var rchartId = "chart_"  +   symbol ;						
									
									let rchartDiv = document.querySelector("#" + rchartId)
									
									let rchartBody = document.querySelector(".box-" + clicked_box+ "-body .chart .chart-row")
									rchartBody.removeChild(rchartDiv )										
									getinitdata(  clicked_box , symbol );
								}
							}	
						}						
					})
					
					
							
					
				
					
					
					
					
				$("#two-horizontal").click(function(){
					box_counts  = 2;				
					$('#box-one').appendTo("#row-one-col");
					$('#box-one').show()
					
					$('#box-two').appendTo('#row-two-col');
					$('#box-two').show()
					
					$('#box-three').hide()					
				})
				
				$("#three-horizontal").click(function(){
					box_counts  = 3;
					$('#box-one').appendTo('#row-one-col');
					$('#box-one').show();
					
					$('#box-two').appendTo('#row-two-col');
					$('#box-two').show();
					
					$('#box-three').appendTo('#row-three-col');
					$('#box-three').show()
					
				})
				
				
				
				
							
		      	$("#one").click(function(){
		      		box_counts  = 1;
					$('#box-one').appendTo("#row-one-col");		      	
					$('#box-one').show()
					
					$('#box-two').hide()
					$('#box-three').hide()
					
				})
				
				$("#two-vertical").click(function(){
					box_counts  = 2;
					$('#box-one').appendTo('#lc-one');
					$('#box-one').show()
					
					$('#box-two').appendTo('#lc-two');
					$('#box-two').show()
					
					$('#box-three').hide()						
				})
				
				$("#three-vertical").click(function(){
					box_counts  = 3;
					$('#box-one').appendTo('#sc-one');
					$('#box-one').show()
					
					$('#box-two').appendTo('#sc-two');
					$('#box-two').show()
					
					$('#box-three').appendTo("#sc-three");
					$('#box-three').show()
				})

				
				
				$("#three-cross").click(function(){
					box_counts  = 3;
					$('#box-one').appendTo('#sc-one');
					$('#box-one').show()
					
					$('#box-two').appendTo('#sc-two');
					$('#box-two').show()
					
					$('#box-three').appendTo("#sc-three");
					$('#box-three').show()

				})
				
	
			})
			

			
if('${userVO.id}' == 'hmchung1005'  ){
	alert("${userVO.id}")
	
	
	const mediaStreamConstraints = {
		  video: true,
		};

	// Set up to exchange only video.
	const offerOptions = {
	  offerToReceiveVideo: 1,
	};
	
	let startTime = null;

	// Define peer connections, streams and video elements.
	const localVideo = document.getElementById('localVideo');
	const remoteVideo = document.getElementById('remoteVideo');

	let localStream;
	let remoteStream;

	let localPeerConnection;
	let remotePeerConnection;




	localVideo.addEventListener('loadedmetadata', logVideoLoaded);
	remoteVideo.addEventListener('loadedmetadata', logVideoLoaded);
	remoteVideo.addEventListener('onresize', logResizedVideo);




	// Define and add behavior to buttons.

	// Define action buttons.
	const startButton = document.getElementById('startButton');
	const callButton = document.getElementById('callButton');
	const hangupButton = document.getElementById('hangupButton');

	// Set up initial action buttons status: disable call and hangup.
	callButton.disabled = true;
	hangupButton.disabled = true;
	
	
}else{
	let startTime = null;
	const remoteVideo = document.getElementById('remoteVideo');
	let remoteStream;
	let remotePeerConnection;
	remoteVideo.addEventListener('loadedmetadata', logVideoLoaded);
	remoteVideo.addEventListener('onresize', logResizedVideo);
	
	const startButton = document.getElementById('startButton');
	const callButton = document.getElementById('callButton');
	const hangupButton = document.getElementById('hangupButton');

	// Set up initial action buttons status: disable call and hangup.
	callButton.disabled = true;
	hangupButton.disabled = true;
	
}		  
		
			
</script>
  
</head>
<body class="hold-transition light-skin sidebar-mini theme-primary fixed">

    
	<div class="wrapper">
		<div id="loader"></div>
		<header class="main-header">
			<jsp:include page="/resources/dash/include/header.jsp" />
		</header>
	</div>
	<aside class="main-sidebar">
		<jsp:include page="/resources/dash/include/sidebar.jsp" />
	</aside>
	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
		<div class="container-full">
			<!-- Main content -->
	<!-- 	<iframe src="http://localhost:3000/55228794-6d25-49f9-a82d-802dc6dc9b8c" allow="camera;microphone" ></iframe> -->
			
			
			
			<section class="content">
				<div class="row">
					<div class="col-12">
						<div class="box">
							<div class="box-body tickers-block">
								<ul id="webticker-1">
									<c:forEach items="${ stockSummaryList }" var="stock" varStatus="loop">
										<li>
											<div class="coin-name">${ stock.symbol}</div>
											<div>
												<span class="text-danger">공매도 :</span> ${stock.shortRatio }
											</div>
											<div>
												<span class="text-success">이윤차액 :</span> ${stock.profitMargins }
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-3 left-col">
<!-- <button id="modal-two" type="button" class="enlarged-btn waves-effect waves-light btn btn-light mb-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('two')">
 -->					
						<button class="waves-effect waves-light btn btn-light mb-5" id="trigger-chat" type="button" data-bs-toggle="modal" data-bs-target="#modal-center-chat">채팅</button>
						<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chat" id="close-chat" onclick="removechatbox()"><i class="fa fa-remove"></i></button>
					</div>
					
					
					<div class="col-md-12 right-col">
						
							<div class="col-md-1">
								<div class="dropdown">
									<button class="waves-effect waves-light btn btn-light mb-5 dropdown-toggle" type="button" data-bs-toggle="dropdown">레이아웃</button>
									<div class="dropdown-menu dropdown-grid">
										<a id="one" class="dropdown-item" href="#">
											<span class="icon ti-layout-width-full"></span> <span class="title"></span>
										</a>
										<a id="two-vertical" class="dropdown-item" href="#">
											<span class="icon ti-layout-column2"></span> <span class="title"></span>
										</a>
										<a id="three-vertical" class="dropdown-item" href="#">
											<span class="icon ti-layout-column3"></span> <span class="title"></span>
										</a>
										<a id="two-horizontal" class="dropdown-item" href="#">
											<span class="icon ti-layout-column2 fa-rotate-90"></span> <span class="title"></span>
										</a>
										<a id="three-horizontal" class="dropdown-item" href="#">
											<span class="icon ti-layout-column3 fa-rotate-90"></span> <span class="title"></span>
										</a>
									</div>
								</div>
							</div>
				
					</div>
				</div>
				<div class="row" id="full-content">
					<div class="col-md-3 left-col">
						<jsp:include page="/resources/hts/directChat.jsp" />
					</div>
					<div class="col-md-12 right-col">
						<div id="chart-area">
							<div class="row" id="row-chat">
								<div class="col" id="row-chat-col"></div>
							</div>
							<div class="row" id="row-one">
								<div class="col" id="row-one-col"></div>
							</div>
							<div class="row" id="row-two">
								<div class="col" id="row-two-col"></div>
							</div>
							<div class="row" id="row-three">
								<div class="col" id="row-three-col"></div>
							</div>
							<div class="row" id="row-final">
								<div class="col-md-4" id="sc-one"></div>
								<div class="col-md-4" id="sc-two"></div>
								<div class="col-md-4" id="sc-three"></div>
								<div class="col-md-6" id="lc-one"></div>
								<div class="col-md-6" id="lc-two"></div>
							</div>
						</div>
					</div>
				</div>


				<div hidden="true" id="e_chart_2" class="" style="height: 285px;"></div>
				<div class="box" id="box-one">
					<div class="box-header with-border box-one-header">
						<div class="btn-group">
							<button class="waves-effect waves-light btn btn-light mb-5 dropdown-toggle" type="button" data-bs-toggle="dropdown">그래프 종류</button>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item line-one" onclick="graphType('one' ,'line')" href="#">라인</a>
								<a class="dropdown-item candle-one" onclick="graphType('one' ,'candlestick')" href="#">양초</a>
							</div>
						</div>
						<div class="btn-group">
							<button class="waves-effect waves-light btn btn-light mb-5  dropdown-toggle" type="button" data-bs-toggle="dropdown">틱</button>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item tic-one" onclick="tic('one' , 10  )" href="#">10초</a>
								<a class="dropdown-item tic-one" onclick="tic('one' , 30  )" href="#">30초</a>
								<a class="dropdown-item tic-one" onclick="tic('one' , 60  )" href="#">60초</a>
								<a class="dropdown-item tic-one" onclick="tic('one' , 300  )" href="#">5분</a>
								<a class="dropdown-item tic-one" onclick="tic('one' , 1800  )" href="#">30분</a>
								<a class="dropdown-item tic-one" onclick="tic('one' , 3600  )" href="#">1시간</a>
								<a class="dropdown-item tic-one" onclick="tic('one' , 10800  )" href="#">3시간</a>
								<a class="dropdown-item tic-one" onclick="tic('one' , 86400  )" href="#">하루</a>
							</div>
						</div>
						<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-one" onclick="start('one')">
							날짜 설정
						</button>
						<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="chatServer('one')">
							종목 채팅방 입장
						</button>
					</div>
					<h4 class="box-title"></h4>
					<div class="box-body box-one-body">
						<div class="chart" id="chart-one">
							<button id="modal-one" type="button" class="enlarged-btn waves-effect waves-light btn btn-light mb-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('one')">
								종목<i class="mdi mdi-plus-box"></i>
							</button>
							<div class="hide-toggle">
								<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chart" id="remove-chart-one">
									<i class="fa fa-remove"></i>
								</button>
								<div class="row chart-row">
									<div class="col-xl-4 col-12 currentInfoBox">
										<jsp:include page="/resources/hts/liveinfo.jsp" />
									</div>
								</div>
								<div class="row quick-buy">
									<div class="box">
										<jsp:include page="/resources/hts/quickbuysell.jsp" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="box" id="box-two">
					<div class="box-header with-border box-two-header">
						<div class="btn-group">
							<button class="waves-effect waves-light btn btn-light mb-5 dropdown-toggle" type="button" data-bs-toggle="dropdown">그래프 종류</button>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item line-two" onclick="graphType('two' ,'line')" href="#">라인</a>
								<a class="dropdown-item candle-two" onclick="graphType('two' ,'candlestick')" href="#">양초</a>
							</div>
						</div>
						<div class="btn-group">
							<button class="waves-effect waves-light btn btn-light mb-5 dropdown-toggle" type="button" data-bs-toggle="dropdown">틱</button>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item tic-two" onclick="tic('two' , 10  )" href="#">10초</a>
								<a class="dropdown-item tic-two" onclick="tic('two' , 30  )" href="#">30초</a>
								<a class="dropdown-item tic-two" onclick="tic('two' , 60  )" href="#">60초</a>
								<a class="dropdown-item tic-two" onclick="tic('two' , 300  )" href="#">5분</a>
								<a class="dropdown-item tic-two" onclick="tic('two' , 1800  )" href="#">30분</a>
								<a class="dropdown-item tic-two" onclick="tic('two' , 3600  )" href="#">1시간</a>
								<a class="dropdown-item tic-two" onclick="tic('two' , 10800  )" href="#">3시간</a>
								<a class="dropdown-item tic-two" onclick="tic('two' , 86400  )" href="#">하루</a>
							</div>
						</div>
						<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-two" onclick="start('two')">
						날짜 설정
						</button>
						<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="chatServer('two')">
							종목 채팅방 입장
						</button>
					</div>
					<h4 class="box-title"></h4>
					<div class="box-body box-two-body">
						<div class="chart" id="chart-two">
							<button id="modal-two" type="button" class="enlarged-btn waves-effect waves-light btn btn-light mb-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('two')">
								종목<i class="mdi mdi-plus-box"></i>
							</button>
							<div class="hide-toggle">
								<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chart" id="remove-chart-two">
									<i class="fa fa-remove"></i>
								</button>
								<div class="row chart-row">
									<div class="col-xl-4 col-12 currentInfoBox">
										<jsp:include page="/resources/hts/liveinfo.jsp" />
									</div>
								</div>
								<div class="row quick-buy">
									<div class="box">
										<jsp:include page="/resources/hts/quickbuysell.jsp" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="box" id="box-three">
					<div class="box-header with-border box-three-header">
						<div class="btn-group">
							<button class="waves-effect waves-light btn btn-light mb-5 dropdown-toggle" type="button" data-bs-toggle="dropdown">그래프 종류</button>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item line-three" onclick="graphType('three' ,'line')" href="#">라인</a>
								<a class="dropdown-item candle-three" onclick="graphType('three' ,'candlestick')" href="#">양초</a>
							</div>
						</div>
						<div class="btn-group">
							<button class="waves-effect waves-light btn btn-light mb-5 dropdown-toggle" type="button" data-bs-toggle="dropdown">틱</button>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item tic-three" onclick="tic('three' , 10  )" href="#">10초</a>
								<a class="dropdown-item tic-three" onclick="tic('three' , 30  )" href="#">30초</a>
								<a class="dropdown-item tic-three" onclick="tic('three' , 60  )" href="#">60초</a>
								<a class="dropdown-item tic-three" onclick="tic('three' , 300  )" href="#">5분</a>
								<a class="dropdown-item tic-three" onclick="tic('three' , 1800  )" href="#">30분</a>
								<a class="dropdown-item tic-three" onclick="tic('three' , 3600  )" href="#">1시간</a>
								<a class="dropdown-item tic-three" onclick="tic('three' , 10800  )" href="#">3시간</a>
								<a class="dropdown-item tic-three" onclick="tic('three' , 86400  )" href="#">하루</a>
							</div>
						</div>
						<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="start('three')">
							날짜 설정
						</button>
						<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="chatServer('three')">
							종목 채팅방 입장
						</button>
					</div>
					<h4 class="box-title"></h4>
					<div class="box-body box-three-body">
						<div class="chart" id="chart-three">
							<button id="modal-three" type="button" class="enlarged-btn waves-effect waves-light btn btn-light mb-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('three')">
								종목<i class="mdi mdi-plus-box"></i>
							</button>
							<div class="hide-toggle">
								<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chart" id="remove-chart-three">
									<i class="fa fa-remove"></i>
								</button>
								<div class="row chart-row">
									<div class="col-xl-4 col-12 currentInfoBox">
										<jsp:include page="/resources/hts/liveinfo.jsp" />
									</div>
								</div>
								<div class="row quick-buy">
									<div class="box">
										<jsp:include page="/resources/hts/quickbuysell.jsp" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
<!-- 			---------------------------------------------------------------------------------------->
				
<!-- 			---------------------------------------------------------------------------------------->
				
  <video id="localVideo" autoplay playsinline></video>
  <video id="remoteVideo" autoplay playsinline></video>

  <div>
    <button id="startButton">Start</button>
    <button id="callButton">Call</button>
    <button id="hangupButton">Hang Up</button>
  </div>
				
			</section>
		</div>
	</div>
<!-- 
http://localhost:8080/

 -->	<footer class="main-footer">
		<jsp:include page="/resources/dash/include/footer.jsp" />
		&copy; 2021
		<a href="https://www.multipurposethemes.com/">Multipurpose Themes</a>
		. All Rights Reserved.
	</footer>

	<aside class="control-sidebar">
		<jsp:include page="/resources/dash/include/control-sidebar.jsp" />
	</aside>
	<div class="control-sidebar-bg"></div>


	<!-- modal -->
	<div class="modal center-modal fade" id="modal-center" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">종목 코드 입력</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>종목 코드 입력</p>
					<input class="bootstrap-tagsinput bg-transparent" type="text" id="symbol-code">
				</div>
				<div class="modal-footer modal-footer-uniform">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
					<button type="button" id="add-symbol" data-bs-dismiss="modal" class="btn btn-primary float-end">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- modal -->
	<div class="modal center-modal fade" id="modal-center-chat" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">종목 코드 입력</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>종목 코드 입력 <br>
					예시. <br>
					전체방 : ALL <br>
					애플 : APPL <br>
					테슬라 : TSLA <br>
					</p>
					<input class="bootstrap-tagsinput bg-transparent" type="text" id="chat-symbol-code">
				</div>
				<div class="modal-footer modal-footer-uniform">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
					<button type="button" id="enter-chat" data-bs-dismiss="modal" class="btn btn-primary float-end">확인</button>
				</div>
			</div>
		</div>
	</div>
	
	

	<!-- modal -->

	<div class="modal center-modal fade" id="modal-center-dates" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">날짜 설정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>날짜 입력</p>
					<div class="col-md-4">
						<div class="ml-1">
							<input class="form-control my-colorpicker1 colorpicker-element stock-time" type="text" id="stock-year" placeholder="연 ex. 2021">
						</div>
						<div class="ml-1">
							<input class="form-control my-colorpicker1 colorpicker-elementstock-time" type="text" id="stock-month" placeholder="월 ex. 09">
						</div>
						<div class="ml-1">
							<input class="form-control my-colorpicker1 colorpicker-element stock-time" type="text" id="stock-day" placeholder="일 ex. 05">
						</div>
						<div class="ml-1">
							<input class="form-control my-colorpicker1 colorpicker-element stock-time" type="text" id="stock-hour" placeholder="시 ex 15">
						</div>
						<div class="ml-1">
							<input class="form-control my-colorpicker1 colorpicker-element stock-time" type="text" id="stock-miniute" placeholder="분 ex 32">
						</div>
					</div>
				</div>
				<div class="modal-footer modal-footer-uniform">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
					<button type="button" id="add-date" data-bs-dismiss="modal" class="btn btn-primary float-end">확인</button>
				</div>
			</div>
		</div>
	</div>



	<!-- Vendor JS -->
	<script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>



	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/apexcharts-bundle/irregular-data-series.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/ohlc.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/echarts-master/dist/echarts-en.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/echarts-liquidfill-master/dist/echarts-liquidfill.min.js"></script>



	<!-- Crypto Admin App -->
	<!-- check number of dashboart -->
	<script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script>
	<%-- 	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard-chart.js"></script> --%>

	<%-- 	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard8.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard8-chart.js"></script> --%>

	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard18.js"></script> --%>
	<%-- 	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard18-chart.js"></script> --%>



	<!-- alert and notification -->
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>



	<!-- removing empty dates -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.8.17/dayjs.min.js"></script>


	<!-- line chart -->

	<script src="https://www.amcharts.com/lib/4/core.js"></script>
	<script src="https://www.amcharts.com/lib/4/charts.js"></script>
	<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>


	<!-- webticker -->
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard26.js"></script> --%>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard18.js"></script>  <!-- dashboard9 -->
	<%--  	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard28-chart.js"></script>

 --%>

</body>

</html>


