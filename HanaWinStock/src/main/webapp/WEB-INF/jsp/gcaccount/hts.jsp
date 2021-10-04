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
<title>하나윈스톡</title>
<!-- Vendors Style-->


<link href="https://www.amcharts.com/lib/3/plugins/export/export.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">

<!-- Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>

<style>

.box-one-body{
	padding:0px;
}
.box-two-body{
	padding:0px;
}

.box-three-body{
	padding:0px;
}



.chatDirect {
	position: fixed;
	bottom: 0;
	right: 0;
	width: 300px;
	border: 1px solid gray;
	background-color: white;
	z-index: 50;
	
}

.enlarged-btn {
	height: 350px;
	width: 100%;
	background-color: white;
}

.remove-chart {
	float: right;
}

.remove-chat {
	float: right;
}

#video {
	text-align: center;
	//
	rest
	of
	rules
	here
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 200px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 2;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}




/* Change the background color of the dropdown button when the dropdown content is shown */




</style>

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.js"></script> -->

<script>
//-----------------------------------------------------------------
		am4lang_ko_KR={_decimalSeparator:".",_thousandSeparator:",",_big_number_suffix_3:"k",_big_number_suffix_6:"M",_big_number_suffix_9:"G",_big_number_suffix_12:"T",_big_number_suffix_15:"P",_big_number_suffix_18:"E",_big_number_suffix_21:"Z",_big_number_suffix_24:"Y",_small_number_suffix_3:"m",_small_number_suffix_6:"μ",_small_number_suffix_9:"n",_small_number_suffix_12:"p",_small_number_suffix_15:"f",_small_number_suffix_18:"a",_small_number_suffix_21:"z",_small_number_suffix_24:"y",_byte_suffix_B:"B",_byte_suffix_KB:"KB",_byte_suffix_MB:"MB",_byte_suffix_GB:"GB",_byte_suffix_TB:"TB",_byte_suffix_PB:"PB",_date:"yyyy-MM-dd",_date_millisecond:"mm:ss SSS",_date_second:"HH:mm:ss",_date_minute:"HH:mm",_date_hour:"HH:mm",_date_day:"MMM dd",_date_week:"ww",_date_month:"MMM",_date_year:"yyyy",_duration_millisecond:"SSS",_duration_millisecond_second:"ss.SSS",_duration_millisecond_minute:"mm:ss SSS",_duration_millisecond_hour:"hh:mm:ss SSS",_duration_millisecond_day:"d'd' mm:ss SSS",_duration_millisecond_week:"d'd' mm:ss SSS",_duration_millisecond_month:"M'm' dd'd' mm:ss SSS",_duration_millisecond_year:"y'y' MM'm' dd'd' mm:ss SSS",_duration_second:"ss",_duration_second_minute:"mm:ss",_duration_second_hour:"hh:mm:ss",_duration_second_day:"d'd' hh:mm:ss",_duration_second_week:"d'd' hh:mm:ss",_duration_second_month:"M'm' dd'd' hh:mm:ss",_duration_second_year:"y'y' MM'm' dd'd' hh:mm:ss",_duration_minute:"mm",_duration_minute_hour:"hh:mm",_duration_minute_day:"d'd' hh:mm",_duration_minute_week:"d'd' hh:mm",_duration_minute_month:"M'm' dd'd' hh:mm",_duration_minute_year:"y'y' MM'm' dd'd' hh:mm",_duration_hour:"hh'h'",_duration_hour_day:"d'd' hh'h'",_duration_hour_week:"d'd' hh'h'",_duration_hour_month:"M'm' dd'd' hh'h'",_duration_hour_year:"y'y' MM'm' dd'd' hh'h'",_duration_day:"d'd'",_duration_day_week:"d'd'",_duration_day_month:"M'm' dd'd'",_duration_day_year:"y'y' MM'm' dd'd'",_duration_week:"w'w'",_duration_week_month:"w'w'",_duration_week_year:"w'w'",_duration_month:"M'm'",_duration_month_year:"y'y' MM'm'",_duration_year:"y'y'",_era_ad:"AD",_era_bc:"BC",A:"AM",P:"PM",AM:"AM",PM:"PM","A.M.":"오전","P.M.":"오후",January:"1월",February:"2월",March:"3월",April:"4월",May:"5월",June:"6월",July:"7월",August:"8월",September:"9월",October:"10월",November:"11월",December:"12월",Jan:"1월",Feb:"2월",Mar:"3월",Apr:"4월","May(short)":"5월",Jun:"6월",Jul:"7월",Aug:"8월",Sep:"9월",Oct:"10월",Nov:"11월",Dec:"12월",Sunday:"일요일",Monday:"월요일",Tuesday:"화요일",Wednesday:"수요일",Thursday:"목요일",Friday:"금요일",Saturday:"토요일",Sun:"일",Mon:"월",Tue:"화",Wed:"수",Thu:"목",Fri:"금",Sat:"토",_dateOrd:function(e){var _="일";if(e<11||e>13)switch(e%10){case 1:case 2:case 3:_="일"}return _},"Zoom Out":"축소",Play:"시작",Stop:"정지",Legend:"범례","Click, tap or press ENTER to toggle":"켜고 끄려면 클릭, 탭 혹은 엔터를 눌러주세요.",Loading:"불러오는 중",Home:"홈",Chart:"차트","Serial chart":"시리얼 차트","X/Y chart":"X/Y 차트","Pie chart":"파이 차트","Gauge chart":"게이지 차트","Radar chart":"레이더 차트","Sankey diagram":"생키 다이어그램","Flow diagram":"플로우 다이어그램","Chord diagram":"코드 다이어그램","TreeMap chart":"트리맵 차트","Force directed tree":"포스 디렉티드 트리","Sliced chart":"슬라이스 차트",Series:"시리즈","Candlestick Series":"캔들스틱 시리즈","OHLC Series":"OHLC 시리즈","Column Series":"컬럼 시리즈","Line Series":"라인 시리즈","Pie Slice Series":"파이 슬라이스 시리즈","Funnel Series":"퍼널 시리즈","Pyramid Series":"피라미드 시리즈","X/Y Series":"X/Y 시리즈",Map:"맵","Press ENTER to zoom in":"확대하려면 엔터를 누르세요.","Press ENTER to zoom out":"축소하려면 엔터를 누르세요.","Use arrow keys to zoom in and out":"확대 혹은 축소하려면 방향키를 이용하세요.","Use plus and minus keys on your keyboard to zoom in and out":"확대 혹은 축소하려면 키보드의 +/- 키를 이용하세요.",Export:"내보내기",Image:"이미지",Data:"데이터",Print:"인쇄","Click, tap or press ENTER to open":"열려면, 클릭, 탭 또는 엔터를 누르세요.","Click, tap or press ENTER to print.":"출력하려면, 클릭, 탭 또는 엔터를 누르세요.","Click, tap or press ENTER to export as %1.":"%1(으)로 내보내려면 클릭, 탭 또는 엔터를 누르세요.",'To save the image, right-click this link and choose "Save picture as..."':'이미지를 저장하려면, 이 링크를 마우스로 우클릭하여 "다른 이름으로 저장"을 선택하세요.','To save the image, right-click thumbnail on the left and choose "Save picture as..."':'이미지를 저장하려면, 좌측 썸네일을 마우스로 우클릭하여 "다른 이름으로 저장"을 선택하세요.',"(Press ESC to close this message)":"(이 메시지를 끄려면 ESC를 누르세요.)","Image Export Complete":"이미지 내보내기 완료","Export operation took longer than expected. Something might have gone wrong.":"내보내기가 지연되고 있습니다. 문제가 없는지 확인이 필요합니다.","Saved from":"다음으로부터 저장됨: ",PNG:"",JPG:"",GIF:"",SVG:"",PDF:"",JSON:"",CSV:"",XLSX:"","Use TAB to select grip buttons or left and right arrows to change selection":"선택 범위를 변경하려면 선택 버튼이나 좌우 화살표를 이용하세요.","Use left and right arrows to move selection":"선택 범위를 움직이려면 좌우 화살표를 이용하세요.","Use left and right arrows to move left selection":"왼쪽 선택 범위를 움직이려면 좌우 화살표를 이용하세요.","Use left and right arrows to move right selection":"오른쪽 선택 범위를 움직이려면 좌우 화살표를 이용하세요.","Use TAB select grip buttons or up and down arrows to change selection":"선택 범위를 변경하려면 선택 버튼이나 상하 화살표를 이용하세요.","Use up and down arrows to move selection":"선택 범위를 움직이려면 상하 화살표를 이용하세요.","Use up and down arrows to move lower selection":"하단 선택 범위를 움직이려면 상하 화살표를 이용하세요.","Use up and down arrows to move upper selection":"상단 선택 범위를 움직이려면 상하 화살표를 이용하세요.","From %1 to %2":"%1 부터 %2 까지","From %1":"%1 부터","To %1":"%1 까지","No parser available for file: %1":"파일 파싱 불가능: %1","Error parsing file: %1":"파일 파싱 오류: %1","Unable to load file: %1":"파일 로드 불가능: %1","Invalid date":"날짜 올바르지 않음"}
				
		myid = '${userVO.id}'
	    openDirect('${userVO.id}')
									
		userAccountInfo = JSON.parse('${userAccountInfo}')
			
			
		function chatServer(box){
			enterChatServer(box_info[box]['symbol'])
		
		}


		 var room;
 
 		 function enterChatServer(symbol){ 			 			 
 			 $('.full-chat-box .box-title').text( stockNameMap[symbol] )		
 			 if(!Object.keys(stockNameMap).includes(symbol)){
 				 myAlarm("warning:error:해당 종목은 존재 하지 않습니다.")
 			 }else{
 				$('#direct-chat').empty()
 				if(chattingToggle == 1){
 					openchatbox(symbol)
 				}else{
 					ws.close();
 				}
 				room = symbol
 				wsOpen(room)
 				}
 		 }
 		 
 		 

 		 function openchatbox(symbol){
 			console.log("opening chat box")
 			$("#video-area").empty()
			$('#close-chat').show()
			
			
			$('.left-col').each(function(){
				$(this).removeClass('col-xs-12');
				$(this).addClass('col-md-3');				
			})
			$('.right-col').each(function(){
				$(this).removeClass('col-md-12')
				$(this).addClass('col-md-9')				
			})			
			$('.full-chat-box').show()
			$('.full-chat-box .box-title').text( stockNameMap[symbol] )		
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
 			$("#video-area").empty()
			if(chattingToggle == 2){
				ws.close()
			}	 									
 			chattingToggle = 1;			
 		} 		  		 
	    function wsOpen(room){
		      ws = new WebSocket("ws://" + location.host + "/HanaWinStock/account/" + room);
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
    	            	  	'<a href="'+  "${pageContext.request.contextPath}" +  "/account/viewother/account/" +   d.userName  + '" >'+
							'<span class="direct-chat-name">'+   d.userName+ '</span>' + 
							'</a>' +
						  '</div>' +
 						'<img class="direct-chat-img avatar" src="${ pageContext.request.contextPath }/resources/images/tier/'+d.tier+'.png" alt="message user image">'+
 						' <div class="direct-chat-text">' +
 						'<p>' + d.msg + '</p>' +
 						'<p class="direct-chat-timestamp"><time datetime="'+  d.year  +'">'+ d.hourMin+'</time></p>' +
 						'</div></div>';    	            	  					    	            	  
    	            	 $("#direct-chat").append(newmsg);
    	              }    	                 
    	           }else if( d.type == "ad" ){
 	            	  console.log(d.msg)
 	            	  if(!$("#ad-video").length ){
 	            		 video_url ="${pageContext.request.contextPath}"  +  d.msg.split("main\\webapp")[1]
 	 	            	  console.log(video_url)
 	 	            	  test = video_url
 	 	            	  var video_area = '<video  controls class="w-p100" id="ad-video">' +
 	 	         						'<source  type="video/mp4" src="' +  video_url  +  '" >' + 	         						
 	 	         		                '</video>' 	            	  
 	 	         		  $("#video-area").append(video_area)             	            	   	            	 
 	 	            	  $('#video-area video').trigger('play'); 	            	  
 		 	         		var ve = document.getElementById("ad-video");
 			 	       		if( ve != null && ve.addEventListener) {	
 			 	       				ve.addEventListener('ended', function() {
 			
 			 	       					console.log("종료");
 				 	       				$("#video-area").empty()			
 			 	       				},false);		
 			 	       		} 	            		   	            		   	            		  
 	            	  }else{
 	            		  console.log("other video is already playing")
 	            	  } 	
 	            	  		 	       		 	         		                 	         		                 	            	  
    	           }else{
    	              console.warn("unknown type!")
    	              console.log(d.type)
    	              ok = d.type
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
		xtime = ~~(Date. now() / 1000) -  1632768509     //1631215740                   //1631215740  
		                                 
		//1631969794
		maximumTicCounts = 70
		allSymbols  = []
		chartDict = {};
 		dataDict = {}						
		clicked_box = "none";
		box_counts = 0;		
		realdata = {}
		
		init_tic = 60
		init_tic_counts = 30;
		
		
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
		
					
	
		function start(box){
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
/* 			$("#box-" + box + " .symbol").html(result.symbol);
 */
			var num = parseFloat(result.marketPrice.toFixed(2));			
			$("#box-" + box + " .marketPrice").html(num);
		  
			$("#box-" + box + " .marketVolume").text(result.marketVolume);
			
			$("#box-" + box + " .ask").text(result.ask)
			$("#box-" + box + " .bid").text(result.bid)
			
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
				      				dataDict[box_info[box]["symbol"]].shift();
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
				      			realdata[box] = result
				      			chartDict[box_info[box]["symbol"]].addData(
										{ date:  new Date( (~~(Date. now() / 1000)  - xtime)  * 1000  )   ,  //parseInt(result.unixTime) * 1000) 
			  				 				price: result.marketPrice /* ,  
			  				 				quantity: result.marketVolume */ },
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
					chartDiv.classList.add("col-xl-9");
					chartDiv.classList.add("col-12");
					let chartBody = document.querySelector(".box-" + box + "-body .chart .chart-row" );					
					chartBody.prepend(chartDiv);
					
					$("#box-" + box  +" .hide-toggle" ).show()
					

					box_info[box]['symbol'] =  symbol;
					options = {						
							chart : {
								height : 400,
								type : 'candlestick',
							},
							series : [ {
								data : data
							} ],
							
							defaultLocale: 'ko',
							
							
							xaxis : {                          //xaxis : {type : 'datetime'},   <---- default
								  type: 'category',
								  labels: {
									rotateAlways: true,
								    formatter: function(val) {
								      return dayjs(val).format('HH:mm:ss')          
								    },
								    show: true,
								  	rotate: -45,
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
					chartDiv.classList.add("col-xl-9");
					chartDiv.classList.add("col-12");
					
					chartDiv.classList.add("h-400");
					
					
					let chartBody = document.querySelector(".box-" + box + "-body .chart .chart-row" );		
					chartBody.prepend(chartDiv);	
					
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
			  				 				price: currentData.avg_price/* ,  
			  				 				quantity: currentData.max_vol */});			      				
			      				}
			      			var interfaceColors = new am4core.InterfaceColorSet();
			      			chart.data = data;
			      			chart.language.locale = am4lang_ko_KR;
			      			
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
							valueAxis.tooltip.disabled = false;
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
							

/* 							var valueAxis2 = chart.yAxes.push(new am4charts.ValueAxis());
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
							valueAxis2.renderer.fontSize = "0.8em" */

							// uncomment these lines to fill plot area of this axis with some color
/* 							valueAxis2.renderer.gridContainer.background.fill = interfaceColors.getFor("alternativeBackground");
							valueAxis2.renderer.gridContainer.background.fillOpacity = 0.05; */

							/* var series2 = chart.series.push(new am4charts.ColumnSeries());
							series2.columns.template.width = am4core.percent(50);
							series2.dataFields.dateX = "date";
							series2.dataFields.valueY = "quantity";
							series2.yAxis = valueAxis2;
							series2.tooltipText = "{valueY.value}";
							series2.name = "Series 2"; */
							
							
							chart.cursor = new am4charts.XYCursor();
							chart.cursor.xAxis = dateAxis;
							
						/* 	var scrollbarX = new am4charts.XYChartScrollbar();
							scrollbarX.series.push(series);
							scrollbarX.marginBottom = 20;
							chart.scrollbarX = scrollbarX;	 */													
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
							
						
					/* 		series2.stroke = am4core.color("#ff0000");
							series2.heatRules.push({
								  "target": series2.columns.template,
								  "property": "fill",
								  "min": am4core.color("#F5DBCB"),
								  "max": am4core.color("#ED7B84"),
								  "dataField": "valueY"
								}); */
							
							
							
							
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
						/* 	dateAxis.events.on("validated", function () {
							    am4core.iter.each(dateAxis.renderer.labels.iterator(), function (label) {
							        label.fillOpacity = label.fillOpacity;
							    })
							}) */

							// this makes date axis labels which are at equal minutes to be rotated
						/* 	dateAxis.renderer.labels.template.adapter.add("rotation", function (rotation, target) {
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
							}) */

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
			
		
		stockNameMap =  '${stockNameMap}'					
		stockNameMap  = JSON.parse(stockNameMap)
		
		
		function printLongName(symbol , box){
			var longName = stockNameMap[symbol] 	
			$('#box-' + box  + " .box-title2").html(longName)
			
		}
		
		
			
		
		var ws;	
		var chattingToggle = 1;

		

		

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
					updateCurrentUserInfo()
					
			
					$("#box-one").hide()
					$("#box-two").hide()
					$("#box-three").hide()
					
					$(".hide-toggle").hide()										
					
								
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
								
								rlogo_id  = previous_symbol + "_logoBox"
								console.log("rlogo_id : " +  rlogo_id)
								$("#" + rlogo_id).remove()
								
								
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
								$('#remove-chart-'+clicked_box).show()
								if(box_info[clicked_box]["type"] == "candlestick" ){
									getinitdata(  clicked_box , newSymbol  );	
								}else if(box_info[clicked_box]["type"] == "line" ){								
									getinitdataLine(clicked_box , newSymbol  )
								}
																						
							}
								allSymbols.push(newSymbol)
								printLongName(newSymbol , clicked_box)
								
								add_logo_box(newSymbol)
								
								
								
							} 
						})
						
						
			

					$(".remove-chart").click(function(){
						rbox = this.id.split("-")[2]
						
						rlogo_id =  box_info[rbox]["symbol"] + "_logoBox"
						console.log("rlogo_id : " +  rlogo_id)
						$("#" + rlogo_id).remove()
						
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
						$("#box-" + rbox + " .hide-toggle").hide();						
						$("#box-" + rbox + " .box-title").html("")																
						
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
					
					if(box_counts == 3){
						$('#remove-chart-three').trigger("click")
					}															
					
					box_counts  = 2;	
					if(box_info["one"]["symbol"] == null){
						newTrading("one" , "#row-one-col")
					}else{
						$('#box-one').appendTo("#row-one-col");
						$('#box-one').show()
					}					
					
					if(box_info["two"]["symbol"] == null){
						console.log("new trade")
						newTrading("two" , "#row-two-col")
					}else{
						$('#box-two').appendTo('#row-two-col');
						$('#box-two').show()
					}
					
					$('#box-three').hide()					
				})
				
				$("#three-horizontal").click(function(){
					box_counts  = 3;
					
					if(box_info["one"]["symbol"] == null){
						newTrading("one" , "#row-one-col")
					}else{
						$('#box-one').appendTo('#row-one-col');
						$('#box-one').show();
					}					
					
					if(box_info["two"]["symbol"] == null){
						console.log("new trade")
						newTrading("two" , "#row-two-col")
					}else{
						$('#box-two').appendTo('#row-two-col');
						$('#box-two').show();
					}
										

					if(box_info["three"]["symbol"] == null){
						console.log("new trade")
						newTrading("three" , "#row-three-col")
					}else{
						$('#box-three').appendTo('#row-three-col');
						$('#box-three').show()
					}											
					
				})
				
				
				
				$("#t-shape").click(function(){
					console.log("three cross")
					box_counts  = 3;					
					
					if(box_info["one"]["symbol"] == null){
						newTrading("one" , "#row-one-col")
					}else{
						$('#box-one').appendTo('#row-one-col');
						$('#box-one').show();
					}					
				
					if(box_info["two"]["symbol"] == null){
						console.log("new trade")
						newTrading("two" , "#lc-one")
					}else{
						$('#box-two').appendTo('#lc-one');
						$('#box-two').show();
					}
					
					
					if(box_info["three"]["symbol"] == null){
						console.log("new trade")
						newTrading("three" , "#lc-two")
					}else{
						$('#box-three').appendTo('#lc-two');
						$('#box-three').show()
					}	
				
				})
				
				
			
				
		
				
				
							
		      	$("#one").click(function(){
		      		if(box_counts == 3){
						$('#remove-chart-three').trigger("click")
						$('#remove-chart-two').trigger("click")
					}else if(box_counts == 2){
						$('#remove-chart-two').trigger("click")
					}	
		      		
		      		
		      		
		      		
		      		box_counts  = 1;
		      		
		      		if(box_info["one"]["symbol"] == null){
						newTrading("one" , "#row-one-col")
					}else{
						$('#box-one').appendTo("#row-one-col");		      	
						$('#box-one').show()
					}	
					
					
					$('#box-two').hide()
					$('#box-three').hide()
					
				})
				
				$("#two-vertical").click(function(){
					
					if(box_counts == 3){
						$('#remove-chart-three').trigger("click")
						$('#remove-chart-two').trigger("click")
					}
		      							
					
					
					box_counts  = 2;
					
					if(box_info["one"]["symbol"] == null){
						newTrading("one" , "#lc-one")
					}else{
						$('#box-one').appendTo('#lc-one');
						$('#box-one').show()
					}					
				
					if(box_info["two"]["symbol"] == null){
						console.log("new trade")
						newTrading("two" , "#lc-two")
					}else{
						$('#box-two').appendTo('#lc-two');
						$('#box-two').show()
					}

					
					$('#box-three').hide()						
				})
				
				$("#three-vertical").click(function(){
					box_counts  = 3;
					if(box_info["one"]["symbol"] == null){
						newTrading("one" , "#sc-one")
					}else{
						$('#box-one').appendTo('#sc-one');
						$('#box-one').show()
					}					
				
					if(box_info["two"]["symbol"] == null){
						newTrading("two" , "#sc-two")
					}else{
						$('#box-two').appendTo('#sc-two');
						$('#box-two').show()
					}
					
					
					if(box_info["three"]["symbol"] == null){
						newTrading("three" , "#sc-three")
					}else{
						$('#box-three').appendTo("#sc-three");
						$('#box-three').show()
					}

				})

				
				
				$("#three-cross").click(function(){
					console.log("three cross")
					box_counts  = 3;					
					
					if(box_info["one"]["symbol"] == null){
						newTrading("one" , "#sc-one")
					}else{
						$('#box-one').appendTo('#sc-one');
						$('#box-one').show()
					}					
				
					if(box_info["two"]["symbol"] == null){
						newTrading("two" , "#sc-two")
					}else{
						$('#box-two').appendTo('#sc-two');
						$('#box-two').show()
					}
					
					
					if(box_info["three"]["symbol"] == null){
						newTrading("three" , "#sc-three")
					}else{
						$('#box-three').appendTo("#sc-three");
						$('#box-three').show()
					}															
				})
				
				$(".btn-buy").click(function(){
					box =  $(this).parents(".chart" ).attr("id").split("-")[1]
					symbol = box_info[box]["symbol"]
					action  = "B"									
					
					userCounts = $('#chart-' + box + " .actionCount").val()
					wholeTransact(symbol , action , userCounts, box)
					
					$('#chart-' + box + " .actionCount").val("")
					
				})
				
				$(".btn-sell").click(function(){
					box =  $(this).parents(".chart" ).attr("id").split("-")[1]
					
					symbol = box_info[box]["symbol"]
					console.log("selling symbol :" + symbol  )
					action  = "S"					
					userCounts = $('#chart-' + box + " .actionCount").val()
					wholeTransact(symbol , action , userCounts, box)
					
					$('#chart-' + box + " .actionCount").val("")
				})
	
			
				beginTrading()

			})
			
		function newTrading(box , id){		 	
			for(let i in userAccountInfo["stockList"] ){
				if( ! allSymbols.includes( userAccountInfo["stockList"][i]["symbol"]  )){
					newSymbol = userAccountInfo["stockList"][i]["symbol"]
					clicked_box = box
					$(".box-" + clicked_box + "-header").show();
					console.log( "newSymbol : " +   newSymbol)
					$('#remove-chart-'+clicked_box).show()
					if(box_info[clicked_box]["type"] == "candlestick" ){
						getinitdata(  clicked_box , newSymbol  );	
					}else if(box_info[clicked_box]["type"] == "line" ){								
						getinitdataLine(clicked_box , newSymbol  )
					}
					allSymbols.push(newSymbol)
					printLongName(newSymbol , clicked_box)			
					$("#box-" +  clicked_box  ).appendTo( id  /* "#row-one-col"  */ )
					$("#box-" +  clicked_box).show()
					add_logo_box(newSymbol)								
					break;
				}
			}											
		}
		
					
			
			

					
		function beginTrading(){
		 	if(userAccountInfo["stockList"].length == 0){
				newSymbol = "AAPL"
			}else{
				newSymbol = userAccountInfo["stockList"][0]["symbol"]
			}
			
			clicked_box = "one"
				$(".box-" + clicked_box + "-header").show();
			
			console.log( "newSymbol : " +   newSymbol)
			$('#remove-chart-'+clicked_box).show()
			if(box_info[clicked_box]["type"] == "candlestick" ){
				getinitdata(  clicked_box , newSymbol  );	
			}else if(box_info[clicked_box]["type"] == "line" ){								
				getinitdataLine(clicked_box , newSymbol  )
			}
			allSymbols.push(newSymbol)
			printLongName(newSymbol , clicked_box)
			
			$("#box-one").appendTo("#row-one-col")
			$("#box-one").show()
			add_logo_box(newSymbol)			
		}
		
		
		
		
		
	
		
		
		
		
			
			
					//----------------------------sell buy-------------------------------------
	
		function wholeTransact(symbol , action , counts , box){
			if(userAccountInfo["accountType"] == 'leagueAccountVO'){
				key = userAccountInfo["account"]["id"]
				console.log("key : "  +  key)
			}else{
				key = userAccountInfo["account"]["gcaNumber"]
				console.log("key : "  +  key)				
			}
			$.ajax({type : 'post',
	      		url : "${pageContext.request.contextPath }/ajax/account/updateUserAccountInfo.json",
	      		data : {
	      			accountType : userAccountInfo["accountType"],
	      			accountKey : key	      		
	      		},
	      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
	      		dataType: 'text',
	      		success : function(result) {
	      			userAccountInfo = JSON.parse(result)
	      			valid = validPrice(symbol ,box  , action   , counts )
	      			realPrice = realdata[box]["marketPrice"]
	      			console.log("update success")
	      			if(valid){
	      				$.ajax({type : 'post',
				      		url : "${pageContext.request.contextPath }/ajax/account/transact.json",
				      		data : {
				      			accountType : userAccountInfo["accountType"],
				      			symbol : symbol,
				      			action : action,
				      			counts : counts,
				      			price : realPrice,
				      			preBalance : userAccountInfo["account"]["balance"],
				      			gcaNumber : key				      		
				      		},
				      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
				      		datatype : 'json',
				      		success : function(result) {
				      			console.log("transaction result : ")
				      			console.log(result)
				      			if(result["result"] == "success"){
				      				myAlarm("success::주문이 체결 되었습니다.")
				      				$.ajax({type : 'post',
				      		      		url : "${pageContext.request.contextPath }/ajax/account/updateUserAccountInfo.json",
				      		      		data : {
				      		      			accountType : userAccountInfo["accountType"],
				      		      			accountKey: key	      		
				      		      		},
				      		      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
				      		      		dataType: 'text',
				      		      		success : function(result) {
				      		      			userAccountInfo = JSON.parse(result)
				      		      			console.log("update success")
					      		      		updateCurrentUserInfo()
				      		      		},
				      		      		error : function() {
				      		      			console.log("update fail")
				      		      		}
				      		      		
				      		      		// 여기서
				      		      		
				      		      		
				      		      	})	
				      			}else{
				      				myAlarm("warning:error:주문이 체결중 문제가 발생 했습니다.")
				      			}
				      		},
				      		error : function() {
				      			myAlarm("warning:error:주문이 체결중 문제가 발생 했습니다.")	      			
				      		}
				      	})	      				
	      			}	      				      		
	      		},
	      		error : function(e) {
	      			console.log("update fail")
	      			console.log(e)
	      		}
	      	})						
			
		}		
	
					
		function transact(symbol , action , counts , price){
			if(userAccountInfo["accountType"] == "league"){
				key = userAccountInfo["account"]["id"]
			}else{
				key = userAccountInfo["account"]["gcaNumber"]
			}
			
			$.ajax({type : 'post',
	      		url : "${pageContext.request.contextPath }/ajax/account/transact.json",
	      		data : {
	      			accountType : userAccountInfo["accountType"],
	      			symbol : symbol,
	      			action : action,
	      			counts : counts,
	      			price : price,
	      			preBalance : userAccountInfo["account"]["balance"],
	      			gcaNumber : key
	      		
	      		},
	      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
	      		datatype : 'json',
	      		success : function(result) {
	      			if(result["result"] == "true"){
	      				myAlarm("success:체결:주문이 체결 되었습니다.")
	      			}else{
	      				myAlarm("warning:error:주문이 체결중 문제가 발생 했습니다.")
	      			}
	      			updateUserAccountInfo()
	      		},
	      		error : function() {
	      			myAlarm("warning:error:주문이 체결중 문제가 발생 했습니다.")	      			
	      		}
	      	})							
		}
		
		function updateUserAccountInfo(){
			if(userAccountInfo["accountType"] == "league"){
				key = userAccountInfo["account"]["id"]
			}else{
				key = userAccountInfo["account"]["gcaNumber"]
			}
			$.ajax({type : 'post',
	      		url : "${pageContext.request.contextPath }/ajax/account/updateUserAccountInfo.json",
	      		data : {
	      			accountType : userAccountInfo["accountType"],
	      			accountKey : key	      		
	      		},
	      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
	      		dataType: 'text',
	      		success : function(result) {
	      			userAccountInfo = JSON.parse(result)
	      			console.log("update success")
	      		},
	      		error : function() {
	      			console.log("update fail")
	      		}
	      	})						
			
			
		}			
		function toFixed(x) {
			  if (Math.abs(x) < 1.0) {
			    var e = parseInt(x.toString().split('e-')[1]);
			    if (e) {
			        x *= Math.pow(10,e-1);
			        x = '0.' + (new Array(e)).join('0') + x.toString().substring(2);
			    }
			  } else {
			    var e = parseInt(x.toString().split('+')[1]);
			    if (e > 20) {
			        e -= 20;
			        x /= Math.pow(10,e);
			        x += (new Array(e+1)).join('0');
			    }
			  }
			  return x;
		}
		
		
		function validPrice(symbol ,box  , action   , counts ){
			realPrice = realdata[box]["marketPrice"]				
			if(action == "B"){				
				if(userAccountInfo["account"]["balance"]  <   realPrice * counts){
					console.log(userAccountInfo["account"]["balance"])
					myAlarm("warning:error:계좌에 돈이 총분하지 않습니다.}.")
					return false;
				}
			}else if(action == "S"){			
				exist = false;
				for(i in userAccountInfo["stockList"]){
					if(userAccountInfo["stockList"][i]['symbol'] == symbol  ){
						exist = true
						if(userAccountInfo["stockList"][i]['totalCounts']  < counts   ){
							myAlarm("warning:error:주식 보유 개수가 총분하지 않습니다.")
							return false;
						}else{
							return true;
						}					
					}										
				}				
				if(exist == false){
					return false;
				}																				
			}							
			return true;
		}
		
		
		function updateCurrentUserInfo(){
			$("#userCurrentBalance").text(  parseInt(userAccountInfo["account"]["balance"] ) )
			
			margin = userAccountInfo["account"]["balance"].toFixed(3) - 100000000 
			if( margin < 0 ){
				$("#userCurrentRatio").removeClass("text-success")
				$("#userCurrentRatio").addClass("text-danger")
				$("#userCurrentRatio").text(  "-$" +    String(Math.abs(margin.toFixed(3) ) ) )
			}else{
				$("#userCurrentRatio").removeClass("text-danger")		
				$("#userCurrentRatio").addClass("text-success")
				$("#userCurrentRatio").text(   margin.toFixed(3)  )
			}
			$("#portfolio tbody").empty()
			for(let i in userAccountInfo["stockList"]){
				console.log("table update")
				index = parseInt(i) + 1
				div = '<tr>'+ 
					  '<td>'+  index +    '</td>' +
					  '<td>'+userAccountInfo["stockList"][i]["symbol"]+'</td>' +
					  '<td>'+userAccountInfo["stockList"][i]["totalCounts"]+'</td>' +
					  '<td>$'+userAccountInfo["stockList"][i]["spentTotal"].toFixed(3)+'</td>' +
					  '<td>$'+userAccountInfo["stockList"][i]["earnedTotal"].toFixed(3)+'</td>' + 
					  '</tr>'											
				$("#portfolio tbody").append(div)
			}
	
		}

		
		function add_logo_box(symbol){
			div = '<div class="col-md-4 realestate sponsored" id="'+  symbol + "_logoBox"    +  '">' + 
			     '<div class="box box-body bg-hexagons-white pull-up">' + 
			      '<div class="media align-items-center p-0">' +
			      '<div class="col-md-3">'+
			      '<img alt="" class="avatar" src="${ pageContext.request.contextPath }/resources/images/stocklogos/'+  symbol+ '.png">'  +
			      '</div>' + 
			      '<div class="col-md-3">' + 
			       '<h3 class="no-margin text-bold">'+symbol+ '</h3>' +
			       '</div></div></div></div>'			       
			$("#logo-area").append(div)
			       
		}

				
</script>

</head>
<body class="theme-success" style="background-color: white;">




	<header class="header-light">
		<jsp:include page="/resources/home/include/header.jsp" />
	</header>

 	<aside>
		<jsp:include page="/resources/dash/include/sidebar.jsp" />
	</aside> 
	
	
	<section class="content" style="background-color: #f5f5f5;">		
		<div class="row">		
		
			<div class="col-md-2">
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
						<a id="t-shape" class="dropdown-item" href="#">
							<span class="icon"> <img style="width: 30px;" src="https://img.icons8.com/external-kiranshastry-lineal-kiranshastry/64/000000/external-layout-alignment-and-tools-kiranshastry-lineal-kiranshastry-2.png" />
							</span>
						</a>


					</div>
				</div>
			</div>

			<div class="col-md-8">
				<div class="row" id="logo-area"></div>
			</div>
			<div class="col-md-2">
				<div class="row">
					<h3>
						<span class="text-warning">잔액: $<span id="userCurrentBalance"></span></span>
					</h3>
				</div>
				<h5>
					<span> 순 이익: </span> <span id="userCurrentRatio"></span>
				</h5>
			</div>




		</div>

		<div class="row">
			<!-- <div class="left-col">
						<button id="modal-two" type="button" class="enlarged-btn waves-effect waves-light btn btn-light mb-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('two')">
						<button class="waves-effect waves-light btn btn-light mb-5" id="trigger-chat" type="button" data-bs-toggle="modal" data-bs-target="#modal-center-chat">채팅</button>						
					</div> -->



		</div>
		<div class="row" id="full-content">
			<div class="left-col">
				<jsp:include page="/resources/hts/directChat.jsp" />
			</div>
			<div class="col-md-12 right-col">
				<div id="chart-area">
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

		
			<div class="row" id="portfolio">
				<div class="box">
					<table class="table">
						<thead class="bg-primary">
							<tr>
								<th>#</th>
								<th>종목</th>
								<th>주식 개수</th>
								<th>사용 금액</th>
								<th>이득 금액</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
				</div>
			</div>
		


		<div hidden="true" id="e_chart_2" class="" style="height: 285px;"></div>
		<div id="chartdivs">
			<div class="box" id="box-one">
				<div class="box-header with-border box-one-header">
					<div class="btn-group">	
					<button id="modal-one" type="button" class="waves-effect waves-light btn btn-light mb-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('one')">
							종목<i class="mdi mdi-plus-box"></i>
						</button>
					</div>
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
					<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-one" onclick="start('one')">날짜 설정</button>
					<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="chatServer('one')">종목 채팅방 입장</button>
				</div>
				<h4 class="box-title2 ms-10"></h4>
				<div class="box-body box-one-body">
					<div class="chart" id="chart-one">
						<div class="hide-toggle">
							<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chart" id="remove-chart-one">
								<i class="fa fa-remove"></i>
							</button>
							<div class="row chart-row">
								<div class="col-xl-3 col-12 currentInfoBox">
									<jsp:include page="/resources/hts/liveinfo.jsp" />
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="box" id="box-two">
				<div class="box-header with-border box-two-header">
					<div class="btn-group">
						<button id="modal-two" type="button" class="waves-effect waves-light btn btn-light mb-5 ms-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('two')">
							종목<i class="mdi mdi-plus-box"></i>
						</button>
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
					<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-two" onclick="start('two')">날짜 설정</button>
					<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="chatServer('two')">종목 채팅방 입장</button>
				</div>
				<h4 class="box-title2 ms-10"></h4>
				<div class="box-body box-two-body">
					<div class="chart" id="chart-two">
						<div class="hide-toggle">
							<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chart" id="remove-chart-two">
								<i class="fa fa-remove"></i>
							</button>
							<div class="row chart-row">
								<div class="col-xl-3 col-12 currentInfoBox">
									<jsp:include page="/resources/hts/liveinfo.jsp" />
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			<div class="box" id="box-three">
				<div class="box-header with-border box-three-header">
					<div class="btn-group">
						<button id="modal-three" type="button" class="waves-effect waves-light btn btn-light mb-5 ms-5 add-symbol" data-bs-toggle="modal" data-bs-target="#modal-center" onclick="initData('three')">
							종목<i class="mdi mdi-plus-box"></i>
						</button>
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
					<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="start('three')">날짜 설정</button>
					<button type="button" class="waves-effect waves-light btn btn-light mb-5 start-three" onclick="chatServer('three')">종목 채팅방 입장</button>
				</div>
				<h4 class="box-title2 ms-10"></h4>
				<div class="box-body box-three-body">
					<div class="chart" id="chart-three">

						<div class="hide-toggle">
							<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chart" id="remove-chart-three">
								<i class="fa fa-remove"></i>
							</button>
							<div class="row chart-row">
								<div class="col-xl-3 col-12 currentInfoBox">
									<jsp:include page="/resources/hts/liveinfo.jsp" />
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<!-- 
http://localhost:8080/

 -->
	<footer class="footer_three" style="background-color: white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>

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
					<p>
						종목 코드 입력 <br> 예시. <br> 전체방 : ALL <br> 애플 : APPL <br> 테슬라 : TSLA <br>
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
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>
	<!-- Vendor JS -->
	<script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>



	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/apexcharts-bundle/irregular-data-series.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/apexcharts-bundle/dist/apexcharts.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/ohlc.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/echarts-master/dist/echarts-en.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/echarts-liquidfill-master/dist/echarts-liquidfill.min.js"></script>


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
	<!-- dashboard9 -->
	<%--  	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard28-chart.js"></script>

 --%>
	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>
	<!-- Corenav Master JavaScript -->
	<script src="${ pageContext.request.contextPath }/resources/home/corenav-master/coreNavigation-1.1.3.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/home/js/nav.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>



</body>

</html>


