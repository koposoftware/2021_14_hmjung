<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>   
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
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">

<!-- Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Web-Ticker-master/jquery.webticker.min.js"></script>


<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard26-chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<script>
	function shuffle(a) {
	    var j, x, i;
	    for (i = a.length - 1; i > 0; i--) {
	        j = Math.floor(Math.random() * (i + 1));
	        x = a[i];
	        a[i] = a[j];
	        a[j] = x;
	    }
	    return a;
	}
	
	const CSS_COLOR_NAMES = shuffle([
		  "AliceBlue",
		  "AntiqueWhite",
		  "Aqua",
		  "Aquamarine",
		  "Azure",
		  "Beige",
		  "Bisque",
		  "Black",
		  "BlanchedAlmond",
		  "Blue",
		  "BlueViolet",
		  "Brown",
		  "BurlyWood",
		  "CadetBlue",
		  "Chartreuse",
		  "Chocolate",
		  "Coral",
		  "CornflowerBlue",
		  "Cornsilk",
		  "Crimson",
		  "Cyan",
		  "DarkBlue",
		  "DarkCyan",
		  "DarkGoldenRod",
		  "DarkGray",
		  "DarkGrey",
		  "DarkGreen",
		  "DarkKhaki",
		  "DarkMagenta",
		  "DarkOliveGreen",
		  "DarkOrange",
		  "DarkOrchid",
		  "DarkRed",
		  "DarkSalmon",
		  "DarkSeaGreen",
		  "DarkSlateBlue",
		  "DarkSlateGray",
		  "DarkSlateGrey",
		  "DarkTurquoise",
		  "DarkViolet",
		  "DeepPink",
		  "DeepSkyBlue",
		  "DimGray",
		  "DimGrey",
		  "DodgerBlue",
		  "FireBrick",
		  "FloralWhite",
		  "ForestGreen",
		  "Fuchsia",
		  "Gainsboro",
		  "GhostWhite",
		  "Gold",
		  "GoldenRod",
		  "Gray",
		  "Grey",
		  "Green",
		  "GreenYellow",
		  "HoneyDew",
		  "HotPink",
		  "IndianRed",
		  "Indigo",
		  "Ivory",
		  "Khaki",
		  "Lavender",
		  "LavenderBlush",
		  "LawnGreen",
		  "LemonChiffon",
		  "LightBlue",
		  "LightCoral",
		  "LightCyan",
		  "LightGoldenRodYellow",
		  "LightGray",
		  "LightGrey",
		  "LightGreen",
		  "LightPink",
		  "LightSalmon",
		  "LightSeaGreen",
		  "LightSkyBlue",
		  "LightSlateGray",
		  "LightSlateGrey",
		  "LightSteelBlue",
		  "LightYellow",
		  "Lime",
		  "LimeGreen",
		  "Linen",
		  "Magenta",
		  "Maroon",
		  "MediumAquaMarine",
		  "MediumBlue",
		  "MediumOrchid",
		  "MediumPurple",
		  "MediumSeaGreen",
		  "MediumSlateBlue",
		  "MediumSpringGreen",
		  "MediumTurquoise",
		  "MediumVioletRed",
		  "MidnightBlue",
		  "MintCream",
		  "MistyRose",
		  "Moccasin",
		  "NavajoWhite",
		  "Navy",
		  "OldLace",
		  "Olive",
		  "OliveDrab",
		  "Orange",
		  "OrangeRed",
		  "Orchid",
		  "PaleGoldenRod",
		  "PaleGreen",
		  "PaleTurquoise",
		  "PaleVioletRed",
		  "PapayaWhip",
		  "PeachPuff",
		  "Peru",
		  "Pink",
		  "Plum",
		  "PowderBlue",
		  "Purple",
		  "RebeccaPurple",
		  "Red",
		  "RosyBrown",
		  "RoyalBlue",
		  "SaddleBrown",
		  "Salmon",
		  "SandyBrown",
		  "SeaGreen",
		  "SeaShell",
		  "Sienna",
		  "Silver",
		  "SkyBlue",
		  "SlateBlue",
		  "SlateGray",
		  "SlateGrey",
		  "Snow",
		  "SpringGreen",
		  "SteelBlue",
		  "Tan",
		  "Teal",
		  "Thistle",
		  "Tomato",
		  "Turquoise",
		  "Violet",
		  "Wheat",
		  "White",
		  "WhiteSmoke",
		  "Yellow",
		  "YellowGreen",
		]);		



	
	
	function getDonutData(attr){
		console.log("get data")
		console.log(stockMapJson.length)
		var data = []
		for(let i in stockMapJson){
			console.log("ok" )
			console.log(stockMapJson[i][attr]  )
			data.push( stockMapJson[i][attr] )
		}
		return data;
	}
	
	function getDonutSymbols(){
		console.log("get symbols")
		console.log(stockMapJson)
		var symbols = []
		for(let i in stockMapJson){
			symbols.push(stockMapJson[i]["symbol"]  )
		}
		return symbols;
	}
	
	function getColors(){
		console.log("get colors")
		console.log(stockMapJson)
		var colorList = []
		for(let i in stockMapJson){
			var randomColor = '#'+Math.floor(Math.random()*16777215).toString(16);
			colorList.push( randomColor )
		}
		return colorList;
		
	}
	// 글로벌 변수 집합------------------------
	
	leagueAccountVO = '${leagueAccountVO}'
	stockMap = '${stockMap}'
	logMap = '${logMap}'
	stockSummaryList = JSON.parse('${stockSummaryList}')
	stockNameMap = JSON.parse('${stockNameMap}')
	stockList = Object.keys(stockSummaryList )
	stockMapJson = JSON.parse('${stockMapString}')
	dailyData = {}
	
	 colorList =  getColors()
	 labelList =  getDonutSymbols()
	 
	 attrNameConvertion = {  "totalCounts" : "주식 개수" , 
		                     "earnedTotal" : "전체 이득" ,
		                     "spentTotal" : "전체 비용"
		                     }  	 	 
	 function initDonut(attr){
			if( $('#doughnut-chart').length > 0 ){
				//var attr = "totalCounts"
				var ctx7 = document.getElementById("doughnut-chart").getContext("2d");
				$("#donut-title").text(   attrNameConvertion[attr]  )
				
				console.log("start donut")
				colorList =   colorList
				labelList =  labelList
				dataList = getDonutData(attr)
				
				var data7 = {
					 labels: labelList
				,			
				datasets: [
					{
						data: dataList,
						backgroundColor: colorList ,
						hoverBackgroundColor: colorList
					}]
				};			
				var doughnutChart = new Chart(ctx7, {
					type: 'doughnut',
					data: data7,
					options: {
						animation: {
							duration:	3000
						},
						responsive: true,
						legend: {
							labels: {
							fontFamily: "Nunito Sans",
							fontColor:"#878787"
							}
						},
						tooltip: {
							backgroundColor:'rgba(33,33,33,1)',
							cornerRadius:0,
							footerFontFamily:"'Nunito Sans'"
						},
						elements: {
							arc: {
								borderWidth: 0
							}
						}
					}
				});
			}
		 
		 
	 }
	
	
	$(document).ready(function() {	

		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != ""){
			myAlarm(fullMsg)
		}
		
		$(".looping").each(function(){			
			symbol = $(this).attr("id")
			console.log(symbol)
			$('#' + symbol + " .longname").text(stockNameMap[symbol] )
			$('#' + symbol + " .market-price" ).text(stockSummaryList[symbol]["currentPrice"]  )
			$("#" + symbol + " .volume").text(stockSummaryList[symbol]["averageVolume10days"]   )
			
			
			change = stockSummaryList[symbol]["regularMarketChangePercent"]
			if(parseFloat(change) < 0 ){
				$("#" + symbol + " .change").addClass("badge-danger")
			}else{
				$("#" + symbol + " .change").addClass("badge-success")
			}
			
			$("#" + symbol + " .change").text(stockSummaryList[symbol]["regularMarketChangePercent"])
			
						
		})
		 if(stockList.length > 0 ){
			getDailyData()			
		}	 			
		initDonut("totalCounts")				
	})		

	function init(symbol){
		am4core.disposeAllCharts();	
		$("#chartTitle").text(stockNameMap[symbol])
		$("#chartParent").empty()
		newId = "chartdivnew-" + symbol
		newdiv = '<div id="'+  newId  + '" class="h-600"></div>'
		$("#chartParent").append(newdiv)
		getinitdataLine( symbol )  
	}
	
	function getDailyData(){
		stocklist = Object.keys(stockSummaryList);
		symboljoin = stocklist.join(",");
		currentTime = ~~(Date. now() / 1000)
		startTime = currentTime -  (31536000 * 0.3)   //5년전 데이터
		$.ajax({type : 'get',
      		url : "${pageContext.request.contextPath }/ajax/getDailyStockValues.json",
      		data : {symboljoin  :symboljoin  , 
      			    startTime: startTime
      		},
      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
      		datatype : 'json',
      		success : function(result) {	      			
      			console.log("daily data time success")
      			dailyData = result      			
      			newId = "chartdivnew-" + stockList[0]
      			newdiv = '<div id="'+  newId  + '" class="h-600"></div>'
      			
      			$("#chartParent").append(newdiv)
      			getinitdataLine( stockList[0] ) 
      			$('#chartTitle').text(   stockNameMap[stockList[0] ]    )
      		},
      		error : function() {
      			console.log("error")
      		}
      	})				
	}	

	function transact(symbol){
		$(".logclass").each(function(){
			$(this).hide()
		})
		
		$('#log-' + symbol).show()		
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
			<div class="content-header">
				<div class="d-flex align-items-center">
					<div class="me-auto">
						<h4 class="page-title">개인 포트폴리오</h4>
						<div class="d-inline-block align-items-center">
							<nav>
								<ol class="breadcrumb">
									<li class="breadcrumb-item"><a href="#">
											<i class="mdi mdi-home-outline"></i>
										</a></li>
									<li class="breadcrumb-item" aria-current="page">포트폴리오</li>
									<li class="breadcrumb-item active" aria-current="page">주식 정보 및 로그 정보</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 ms-10">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title" id="chartTitle"></h4>
							<button class="waves-effect waves-light btn btn-light mb-5  dropdown-toggle" type="button" data-bs-toggle="dropdown">종목</button>
							<div class="dropdown-menu dropdown-menu-end">
								<c:forEach items="${ stockMap }" var="accountStockVO" varStatus="loop">
									<a class="dropdown-item tic-one" onclick="init( '${accountStockVO.symbol}'  )" href="#">${accountStockVO.symbol}</a>
								</c:forEach>
							</div>
						</div>
						<div class="box-body">
							<div class="chart" id="chartParent"></div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>


				<div class="col-md-5 ms-10">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title" id="donut-title"></h4>
							<button class="waves-effect waves-light btn btn-light mb-5  dropdown-toggle" type="button" data-bs-toggle="dropdown">종목</button>
							<div class="dropdown-menu dropdown-menu-end">
								<a class="dropdown-item tic-one" onclick="initDonut( 'totalCounts'  )" href="#">주식개수</a>
								<a class="dropdown-item tic-one" onclick="initDonut( 'earnedTotal'  )" href="#">전체이득</a>
								<a class="dropdown-item tic-one" onclick="initDonut( 'spentTotal'  )" href="#">전체비용</a>
							</div>
						</div>


						<div class="box-body">

							<div>
								<canvas id="doughnut-chart" height="200"></canvas>
							</div>
						</div>
					</div>
				</div>


			</div>
			<!-- ----------------------------------------------------------------------------------------------------- -->
			<div class="row">
				<!-- Main content -->
				<section class="content">
					<div class="row">
						<div class="col-12">
							<div class="box">
								<div class="box-header with-border">
									<h4 class="box-title">현재 보유 금액 :<fmt:formatNumber value="${leagueAccountVO.balance}" type="currency" currencySymbol="$" /></h4>
								</div>
								<div class="box-body">
									<div class="table-responsive">
										<table class="table table-bordered dataTable no-footer table-striped" id="dataTable_crypto" role="grid">
											<thead>
												<tr role="row">

													<th class="text-end">종목 코드</th>
													<th class="text-end">현재 가격</th>
													<th class="text-end">거래량</th>
													<th class="text-end">24시간 주가 변동률%</th>
													<th class="text-end">보유 개수</th>
													<th class="text-end">전체 비용</th>
													<th class="text-end">전체 이득</th>
													<th class="text-end">로그</th>
													<th class="text-end">종목 상세</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ stockMap }" var="accountStockVO" varStatus="loop">
													<tr role="row" id="${accountStockVO.symbol }" class="looping">
														<td><small><a href="#" class="hover-warning"></a><span class="longname"></span></small>
															<h6 class="text-muted">${ accountStockVO.symbol }</h6></td>
														<td class="text-end"><p>
																<span>$</span> <span class="market-price"></span>
															</p></td>
														<td class="text-end"><p>
																<span class="volume"></span>
															</p></td>
														<td class="text-end"><p>
																<span class="change badge badge-xl"></span><span>%</span>
															</p></td>

														<td class="no-wrap text-end"><label class="badge badge-xl badge-success">${accountStockVO.totalCounts } </label></td>
														<td class="no-wrap text-end"><span>$</span> <label class="badge badge-xl badge-danger">${accountStockVO.spentTotal }</label></td>
														<td class="no-wrap text-end"><span>$</span> <label class="badge badge-xl badge-success">${accountStockVO.earnedTotal }</label></td>
														<td>																														
														<button type="button" onclick="transact('${accountStockVO.symbol }')"  class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-right">확인</button>						
														</td>
														<td><a href="#">
																<span class="sparklines">
																	<button id="chart_${accountStockVO.symbol}" class="waves-effect waves-light btn btn-secondary btn-sm">
																		<i class="mdi mdi-arrow-right"></i>
																	</button>
																</span>
															</a></td>

													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
								<!-- /.box-body -->
							</div>
						</div>
					</div>
				</section>

			</div>

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



	<div class="modal modal-right fade" id="modal-right" tabindex="-1">
		<div class="modal-dialog" style="width:70%">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">트랜잭션</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:forEach items="${ logMap }" var="log" varStatus="loop">						
						<div  class="logclass" id="log-${log.key }">
						<h4>${log.key }</h4>
						<div class="box">
									<div class="box-header with-border">
										<h4 class="box-title">최근 트랜잭션</h4>
										<ul class="box-controls pull-right">
											<li><a class="box-btn-close" href="#"></a></li>
											<li><a class="box-btn-slide" href="#"></a></li>
											<li><a class="box-btn-fullscreen" href="#"></a></li>
										</ul>
									</div>
									<div class="box-body">
										<div class="table-responsive">
											<table class="table table-bordered table-striped no-margin">
												<thead>
													<tr>
														<th>시간</th>
														<th>액션</th>
														<th>주가</th>
														<th>개수</th>
														<th>거래전 잔액</th>
														<th>거래후 잔액</th>
													</tr>
												</thead>
												<tbody>
													
													<c:forEach items="${ log.value }" var="eachLog" varStatus="loop">		
													<tr>																			
														<td>${eachLog.time }</td>
														<c:if test="${eachLog.action eq 'B' }">
															<td>매수</td>
														</c:if>
														<c:if test="${eachLog.action eq 'S' }">
															<td>매도</td>
														</c:if>														
														<td>${eachLog.momentPrice }</td>
														<td>${eachLog.counts }</td>
														<td><span class="description-text"><fmt:formatNumber value="${eachLog.preBalance }" type="currency" currencySymbol="$" /></span></td>
														<td><span class="description-text"><fmt:formatNumber value="${eachLog.postBalance }" type="currency" currencySymbol="$" /></span></td>
														</tr>	
													</c:forEach>
																									
												</tbody>
											</table>
										</div>
									</div>
									<!-- /.box-body -->
								</div>							
						</div>

					</c:forEach>

				</div>
				<div class="modal-footer modal-footer-uniform">
					<button type="button" class="btn btn-danger" data-bs-dismiss="modal">나가기</button>
					
				</div>
			</div>
		</div>
	</div>














	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>
	<!-- Vendor JS -->
	<script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.resize.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.pie.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.categories.js"></script>

	<!-- Crypto Admin App -->
	<script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>




	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/chart.js-master/Chart.min.js"></script>






</body>
</html>