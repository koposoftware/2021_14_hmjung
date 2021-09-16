<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<meta charset="UTF-8">
   <title>chatting</title>
   <style>
      *{
         margin:0;
         padding:0;
      }
      .container{
         margin: 0 auto;
         padding: 25px
      }
      .container h1{
         text-align: left;
         padding: 5px 5px 5px 15px;
         color: #5f5f5f;
         border-left: 3px solid #FFBB00;
         margin-bottom: 20px;
      }
      .chatting{
         background-color: #f5f5f5;
         height: 600px;
         overflow: auto;
      }
      .chatting .me{
         color: #000;
         text-align: right;
      }
      .chatting .others{
         color: #000;
         text-align: left;
      }
      input{
         height: 25px;
         margin-left: 5px;
         margin-right: 5px;
      }
      #yourMsg{
         text-align:center;
         display:inline;
      }
   

   </style>
</head>

<script type="text/javascript">
   var ws;
   test =null;
   function wsOpen(room){
      ws = new WebSocket("ws://" + location.host + "/HanaWinStock/chatting/" + "AAPL");
      test = ws
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
         var msg = data.data;
         console.log(msg)
         if(msg != null && msg.trim() != ''){
            var d = JSON.parse(msg);
            if(d.type == "getId"){
               var si = d.sessionId != null ? d.sessionId : "";
               if(si != ''){
                  $("#sessionId").val(si); 
               }
            }else if(d.type == "message"){
               if(d.sessionId == $("#sessionId").val()){
                  $("#chatting").append("<p class='me'>"+ d.userName +":" + d.msg + "</p>");   
               }else{
                  $("#chatting").append("<p class='others'>" + d.userName + " :" + d.msg + "</p>");
               }
                  
            }else{
               console.warn("unknown type!")
            }
         }
      }

      document.addEventListener("keypress", function(e){
         if(e.keyCode == 13){ //enter press
            send();
         }
      });
   }

   $(document).ready(function chatName(){
   
      var userName = '<%=(String)session.getAttribute("ses_name")%>';
      /* var userName = $("#userName").val(); */
      console.log(userName); 
      if(userName == null || userName.trim() == ""){
         alert("사용자 이름을 입력해주세요.");
         $("#userName").focus();
      }else{
         var room = '<%= request.getParameter("symbol") %>';
         wsOpen(room);
         $("#yourName").hide();
         $("#yourMsg").show();
      }
   });
   

   function send() {
      var room = 'AAPL';
      var option ={
         type: "message",
         sessionId : $("#sessionId").val(),
         userName : '<%=(String)session.getAttribute("ses_name")%>',
         room : room,
         msg : $("#chat").val()
      }
      ws.send(JSON.stringify(option))
      $('#chat').val("");
   }
</script>
<body>
   <h3 class="greenFontBold mt-5" style="text-align:center;" ><%= request.getParameter("chattingName") %> 채팅</h3>
   <div id="container" class="container">
   <input type="hidden" id="sessionId" value="">
      <div id="chatting" class="chatting">
      </div>
      <!--
       <div id="yourName">
         <table class="inputTable">
            <tr>
               <th>사용자</th>
               <th><input type="text" name="userName" id="userName"></th>
               <th><button onclick="chatName()" id="startBtn">등록</button></th>
            </tr>
         </table>
      </div> --> 
      <div id="yourMsg">
         <table class="inputTable">
            <tr>
               <th>메시지</th>
               <th><input id="chat" style="width:260px;" placeholder="보낼 메시지를 입력해주세요."></th>
               <th><button onclick="send()" id="sendBtn">보내기</button></th>
            </tr>
         </table>
      </div>
   </div>
</body>

</html>


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
						<button class="waves-effect waves-light btn btn-light mb-5" id="trigger-chat" type="button">채팅 서버</button>
						<button class="btn btn-danger btn-flat mb-5 btn-xs remove-chat" id="close-chat"><i class="fa fa-remove"></i></button>
					</div>
					
					
					<div class="col-md-9 right-col">
						
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
					<div class="col-md-9 right-col">
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
			</section>
		</div>
	</div>





	<footer class="main-footer">
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
