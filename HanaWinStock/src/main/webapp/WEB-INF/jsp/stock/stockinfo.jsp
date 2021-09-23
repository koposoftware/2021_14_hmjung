<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
	
	
 	stockSummary = '${stockSummary}'
	data = JSON.parse('${list}')
	symbol = '${symbol}' 	
	dailyData = { '${symbol}'  : data  }
	
	
	
	
	$(document).ready(function() {	
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}		
		getinitdataLine(symbol)
			
	})
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
			<section class="content">
				<div class="row">

					<div class="col-md-9">
						<div class="box">
							<div class="box-header with-border">
								<h4 class="box-title" id="chartTitle">${symbol }</h4>
								<br>
								<h4 class="box-title" id="longTitle">${stockNameVO.longName }</h4>
							</div>
							<div class="box-body">
								<div class="chart" id="chartParent">
									<div id="chartdivnew-${symbol }" class="h-450"></div>
								</div>
							</div>
							<!-- /.box-body -->
						</div>
					</div>
					<div class="col-md-3">
						<div class="row">
							<div class="box bg-danger pull-up">
								<div class="box-body text-center">
									<h2 class="mb-0 text-bold">${symbol }</h2>
									<h4>${stockNameVO.longName }</h4>
									<ul class="flexbox flex-justified text-center mt-30 bb-1 border-dark pb-20">
										<li class="be-1 border-dark">
											<div>주가</div> <small class="fs-18"><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="3" value="${realTimeStockVO.marketPrice }" /></small>
										</li>

										<li class="be-1 border-dark">
											<div>bid</div> <small class="fs-18"><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="3" value="${realTimeStockVO.bid }" /></small>
										</li>

										<li>
											<div>ask</div> <small class="fs-18"><fmt:formatNumber type="currency" currencySymbol="$" maxFractionDigits="3" value="${realTimeStockVO.ask }" /></small>
										</li>
									</ul>
									<ul class="flexbox flex-justified text-center mt-20">
										<li class="be-1 border-dark">
											<div>평균 거래량</div> <small class="fs-18"><fmt:formatNumber type="number" value="${stockSummary.averageDailyVolume3Month}" /></small>
										</li>

										<li class="be-1 border-dark">
											<div>bid size</div> <small class="fs-18"><fmt:formatNumber type="number" value="${stockSummary.bidSize}" /></small>
										</li>

										<li>
											<div>ask size</div> <small class="fs-18">54<fmt:formatNumber type="number" value="${stockSummary.askSize}" /></small>
										</li>
									</ul>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="box">


								<table class="table table-bordered no-margin">
									<tbody>
										<tr>
											<td>산업</td>
											<td>${stockNameVO.sector }</td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${stockNameVO.phone }</td>
										</tr>
										<tr>
											<td>웹사이트</td>
											<td><a href="${stockNameVO.website }">
													<i class="mdi mdi-home-outline"></i>${stockNameVO.website }
												</a></td>
										</tr>
									</tbody>
								</table>

							</div>

						</div>

					</div>
				</div>
				<div class="row">
					<div class="col-md-3">
						<div class="box">

							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-striped table-hover no-margin">
										<tbody>
											<tr>
												<td>bidSize</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.bidSize}" /></td>
											</tr>
											<tr>
												<td>enterpriseToRevenue</td>
												<td>${stockSummary.enterpriseToRevenue }</td>
											</tr>
											<tr>
												<td>WeekChange52</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.weekChange52 }" /></td>
											</tr>
											<tr>
												<td>forwardEps</td>
												<td>${stockSummary.forwardEps }</td>
											</tr>
											<tr>
												<td>sharesOutstanding</td>
												<td><span><fmt:formatNumber value="${stockSummary.sharesOutstanding}" type="number" /></span></td>
											</tr>
											<tr>
												<td>bookValue</td>
												<td>${stockSummary.bookValue}</td>
											</tr>
											<tr>
												<td>sharesShort</td>
												<td><span><fmt:formatNumber value="${stockSummary.sharesShort}" type="number" /></span></td>
											</tr>
											<tr>
												<td>lastFiscalYearEnd</td>
												<td><span><fmt:formatNumber value="${stockSummary.lastFiscalYearEnd}" type="number" /></span></td>
											</tr>
											<tr>
												<td>heldPercentInstitutions</td>
												<td><fmt:formatNumber type="percent" maxFractionDigits="3" value="${stockSummary.heldPercentInstitutions }" /></td>
											</tr>
											<tr>
												<td>netIncomeToCommon</td>
												<td><span><fmt:formatNumber value="${stockSummary.netIncomeToCommon}" type="number" /></span></td>
											</tr>
											<tr>
												<td>trailingEps</td>
												<td>${stockSummary.trailingEps}</td>
											</tr>
											<tr>
												<td>SandP52WeekChange</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.sandP52WeekChange}" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="box">

							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-striped table-hover no-margin">
										<tbody>
											<tr>
												<td>askSize</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.askSize}" /></td>
											</tr>
											<tr>
												<td>shortRatio</td>
												<td><span><fmt:formatNumber value="${stockSummary.shortRatio}" type="number" /></span></td>
											</tr>
											<tr>
												<td>floatShares</td>
												<td><span><fmt:formatNumber value="${stockSummary.floatShares}" type="number" /></span></td>
											</tr>
											<tr>
												<td>earningsQuarterlyGrowth</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.earningsQuarterlyGrowth}" /></td>
											</tr>
											<tr>
												<td>forwardPE</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.forwardPE}" /></td>
											</tr>
											<tr>
												<td>sharesShortPriorMonth</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.sharesShortPriorMonth}" /></td>
											</tr>
											<tr>
												<td>averageDailyVolume3Month</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.averageDailyVolume3Month}" /></td>
											</tr>
											<tr>
												<td>exchange</td>
												<td>${stockSummary.exchange}</td>
											</tr>
											<tr>
												<td>regularMarketChangePercent</td>
												<td><fmt:formatNumber type="percent" maxFractionDigits="3" value="${stockSummary.regularMarketChangePercent}" /></td>
											</tr>
											<tr>
												<td>regularMarketVolume</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.regularMarketVolume}" /></td>
											</tr>
											<tr>
												<td>symbol</td>
												<td>${stockSummary.symbol}</td>
											</tr>
											<tr>
												<td>netPercentInsiderShares</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.netPercentInsiderShares}" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>




					<div class="col-md-3">
						<div class="box">

							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-striped table-hover no-margin">
										<tbody>
											<tr>
												<td>averageVolume10days</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.averageVolume10days}" /></td>
											</tr>
											<tr>
												<td>netInfoShares</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.netInfoShares}" /></td>
											</tr>
											<tr>
												<td>buyInfoShares</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.buyInfoShares}" /></td>
											</tr>
											<tr>
												<td>sellInfoShares</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.sellInfoShares}" /></td>
											</tr>
											<tr>
												<td>ebitdaMargins</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.ebitdaMargins}" /></td>
											</tr>
											<tr>
												<td>profitMargins</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.profitMargins}" /></td>
											</tr>
											<tr>
												<td>grossMargins</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.grossMargins}" /></td>
											</tr>
											<tr>
												<td>operatingCashflow</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.operatingCashflow}" /></td>
											</tr>
											<tr>
												<td>revenueGrowth</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.revenueGrowth}" /></td>
											</tr>
											<tr>
												<td>operatingMargins</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.operatingMargins}" /></td>
											</tr>
											<tr>
												<td>ebitda</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.ebitda}" /></td>
											</tr>
											<tr>
												<td>grossProfits</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.grossProfits}" /></td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-3">
						<div class="box">
							<div class="box-body">
								<div class="table-responsive">
									<table class="table table-striped table-hover no-margin">
										<tbody>
											<tr>
												<td>freeCashflow</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.freeCashflow}" /></td>
											</tr>
											<tr>
												<td>currentPrice</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.currentPrice}" /></td>
											</tr>
											<tr>
												<td>earningsGrowth</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.earningsGrowth}" /></td>
											</tr>
											<tr>
												<td>totalCash</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.totalCash}" /></td>
											</tr>
											<tr>
												<td>totalDebt</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.totalDebt}" /></td>
											</tr>
											<tr>
												<td>totalRevenue</td>
												<td><fmt:formatNumber type="number" value="${stockSummary.totalRevenue}" /></td>
											</tr>
											<tr>
												<td>regularMarketPreviousClose</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.regularMarketPreviousClose}" /></td>
											</tr>
											<tr>
												<td>regularMarketOpen</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.regularMarketOpen}" /></td>
											</tr>
											<tr>
												<td>twoHundredDayAverage</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.twoHundredDayAverage}" /></td>
											</tr>
											<tr>
												<td>trailingAnnualDividendYield</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.trailingAnnualDividendYield}" /></td>
											</tr>
											<tr>
												<td>fiftyDayAverage</td>
												<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${stockSummary.fiftyDayAverage}" /></td>
											</tr>



										</tbody>
									</table>
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
		 &copy; 2021 <a href="https://www.multipurposethemes.com/">Multipurpose Themes</a>. All Rights Reserved.
	</footer>	
	 <aside class="control-sidebar">
	  	<jsp:include page="/resources/dash/include/control-sidebar.jsp" />  
	 </aside>
	<div class="control-sidebar-bg"></div>
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




</body>          
</html>