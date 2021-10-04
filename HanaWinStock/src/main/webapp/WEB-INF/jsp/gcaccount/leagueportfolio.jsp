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

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">	  
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>

<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/dashboard26-chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

<style>
.chatDirect{
  position: fixed;
  bottom: 0;
  right: 0;
  width: 300px;
  border: 1px solid gray;
  background-color:white;
}
</style>

<script>

	myid = '${userVO.id}'
    openDirect('${userVO.id}')


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
			//randomNum = getRandomInt(CSS_COLOR_NAMES.length ) 
			//randomColor = CSS_COLOR_NAMES[randomNum]
			//colorList.push( randomColor )
		}
		return colorList;
		
	}
	
	function getRandomInt(max) {
		  return Math.floor(Math.random() * max);
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
	

	

	
	
	function initDonut2(attr){
			if( $('#doughnut-chart2').length > 0 ){
				//var attr = "totalCounts"
				var ctx7 = document.getElementById("doughnut-chart2").getContext("2d");
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
	
	
	
	 function initDonut(attr){
			if( $('#doughnut-chart').length > 0 ){
				//var attr = "totalCounts"
				var ctx7 = document.getElementById("doughnut-chart").getContext("2d");
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
		$("#view-transaction").click(function(){
			location.href = "${pageContext.request.contextPath}/account/viewother/transaction/" + '${viewId}' + "/1"			
		})

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
				$("#" + symbol + " .change").addClass("text-danger")
			}else{
				$("#" + symbol + " .change").addClass("text-success")
			}
			
			$("#" + symbol + " .change").text(stockSummaryList[symbol]["regularMarketChangePercent"].toFixed(3) + "%"  )
			
						
		})
		 if(stockList.length > 0 ){
			getDailyData()			
		}	 			
		initDonut('totalCounts')
		initDonut2('spentTotal')			
	})		

	function init(symbol){
		am4core.disposeAllCharts();	
		$("#chartTitle").text(stockNameMap[symbol])
		$("#chartParent").empty()
		newId = "chartdivnew-" + symbol
		
		
		newdiv = '<div id="'+  newId  + '" class="h-350"></div>'
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
      			newdiv = '<div id="'+  newId  + '" class="h-350"></div>'
      			
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
		$("#clicked-symbol").text( symbol + " 거래내역")
		$('#log-' + symbol).show()		
	}
	

	
	
	</script>

</head>
<body class="theme-success" style="background-color:white;">
	<header class="header-light">
		<jsp:include page="/resources/home/include/header.jsp" />
	</header>

	<aside>
		<jsp:include page="/resources/dash/include/sidebar.jsp" />
	</aside>
	<section class="content" style="background-color: #f5f5f5;">
		<div class="container">
			<c:if test="${viewId eq userVO.id }">
				<h4 class="page-title">개인 포트폴리오</h4>
			</c:if>

			<c:if test="${viewId ne userVO.id }">
				<h4 class="page-title">${viewId }&nbsp;포트폴리오</h4>
				<button type="button" class="waves-effect waves-light btn btn-outline btn-primary mb-5" id="view-transaction">거래내역</button>	
			</c:if>
			<div class="row">
				<div class="col-md-9">
					<div class="box">
						<div class="box-header with-border">
							<h4 class="box-title" id="chartTitle"></h4>
							<button class="waves-effect waves-light btn btn-light dropdown-toggle" type="button" data-bs-toggle="dropdown">종목</button>
							<div class="dropdown-menu text-center">
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


				<div class="col-md-3">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-11">
							<div class="box">
								<div class="box-header with-border">
									<h4 class="box-title" id="donut-title">개수</h4>									
								</div>
								<div class="box-body">
									<div>
										<canvas id="doughnut-chart" height="150"></canvas>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-11">
							<div class="box">
								<div class="box-header with-border">
									<h4 class="box-title" id="donut-title">전체비용</h4>																		
								</div>
								<div class="box-body">
									<div>
										<canvas id="doughnut-chart2" height="150"></canvas>
									</div>
								</div>
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
									<h4 class="box-title">
										현재 보유 금액 :
										<fmt:formatNumber value="${leagueAccountVO.balance}" type="currency" currencySymbol="$" />
									</h4>
								</div>
								<div class="box-body">




									<div class="table-responsive">
										<table class="table">
											<thead class="bg-primary">
											
												<tr>
													<th style="width:12.857%;">종목 코드</th>
													<th style="width:12.857%;">현재 가격</th>
													<th style="width:12.857%;">거래량</th>
													<th style="width:12.857%;">전일비</th>
													<th style="width:12.857%;">보유 개수</th>
													<th style="width:12.857%;">전체 비용</th>
													<th style="width:12.857%;">전체 이득</th>
													<th style="width:5%;">거래내역</th>
													<th style="width:5%;">종목 상세</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${ stockMap }" var="accountStockVO" varStatus="loop">
													<tr role="row" id="${accountStockVO.symbol }" class="looping">
														<td><small><a href="#" class="hover-warning"></a><span class="longname"></span></small>
															<h6 class="text-muted">${ accountStockVO.symbol }</h6></td>
														<td><p>
																<span>$</span> <span class="market-price"></span>
															</p></td>
														<td><p>
																<span class="volume"></span>
															</p></td>
														<td><p>
																<span class="change"></span>
															</p></td>

														<td class="no-wrap">${accountStockVO.totalCounts }</td>
														<td class="no-wrap"><fmt:formatNumber value="${accountStockVO.spentTotal  }" type="currency" currencySymbol="$" /></td>
														<td class="no-wrap"><fmt:formatNumber value="${accountStockVO.earnedTotal  }" type="currency" currencySymbol="$" /></td>
														<td>
															<button type="button" onclick="transact('${accountStockVO.symbol }')" class="btn btn-sm" data-bs-toggle="modal" data-bs-target="#modal-right"><i class="mdi mdi-arrow-right"></i></button>
														</td>
														<td><a href="${pageContext.request.contextPath}/stockinfo/stock/${accountStockVO.symbol}">
																<span class="sparklines">
																	<button id="chart_${accountStockVO.symbol}" class="btn btn-sm">
																		<i class="mdi mdi-arrow-right"></i>
																	</button>
																</span>
															</a></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>

										<%-- 	<table class="table table-bordered dataTable no-footer table-striped" id="dataTable_crypto" role="grid">
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
															<button type="button" onclick="transact('${accountStockVO.symbol }')" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modal-right">확인</button>
														</td>
														<td><a href="${pageContext.request.contextPath}/stockinfo/stock/${accountStockVO.symbol}">
																<span class="sparklines">
																	<button id="chart_${accountStockVO.symbol}" class="waves-effect waves-light btn btn-secondary btn-sm">
																		<i class="mdi mdi-arrow-right"></i>
																	</button>
																</span>
															</a></td>

													</tr>
												</c:forEach>
											</tbody>
										</table> --%>
									</div>
								</div>
								<!-- /.box-body -->
							</div>
						</div>
					</div>
				</section>

			</div>

		</div>



	</section>




	<footer class="footer_three" style="background-color:white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>
	
	<div class="control-sidebar-bg"></div>



	<div class="modal modal-right fade" id="modal-right" tabindex="-1">
		<div class="modal-dialog" style="width:70%">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<c:forEach items="${ logMap }" var="log" varStatus="loop">						
						<div  class="logclass" id="log-${log.key }">
						
						<div class="box">
									<div class="box-header with-border">
										<h4 class="box-title" id="clicked-symbol">${log.key } 거래내역</h4>										
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

 	<script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script> 
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.resize.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.pie.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.categories.js"></script>

	<!-- Crypto Admin App -->
<%-- 	<script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script>
 --%>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>




	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/chart.js-master/Chart.min.js"></script>

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