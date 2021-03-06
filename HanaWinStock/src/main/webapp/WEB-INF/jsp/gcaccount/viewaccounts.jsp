<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<title>HanaWinStock</title>
<!-- Vendors Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">

<!-- Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>


<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">	  
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">


<link href="${ pageContext.request.contextPath }/resources/dash/css/mycss/stackedCards.css" rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/highlight.js/9.9.0/highlight.min.js"></script>
<script>hljs.initHighlightingOnLoad();</script>


<style>
*, *:before, *:after {
	box-sizing: border-box;
}

body {
	color: #444;
}

html {
	height: 100%;
}

body {
	font-family: "Roboto", sans-serif;
	width: 100%;
	height: 100%;
	min-height: 100%;
	margin: 0px;
	padding: 0px;
	background-color: #eee;
	background-color: #fff;
}

.stacked-cards h2 {
	text-align: center;
	position: relative;
	top: -20px;
}

.intro {
	max-width: 600px;
	margin: 20px auto;
	text-align: center;
}

.container-fuild {
	max-width: 100%;
	margin: 0 auto;
}



.divider {
	max-width: 500px;
	margin: 25px auto;
	background-color: #ccc;
	height: 2px;
	width: 100%;
}

.stacked-cards {
	padding-top: 40px;
	padding-bottom: 15px;
}

.stacked-cards-fanOut {
	padding-bottom: 40px;
}

.li {
	height: 80%;
}

.source {
	margin: 25px auto;
}

.header {
	margin: 0px auto;
	padding: 25px 5px;
	background-color: #fff;
}

.header img {
	display: block;
	margin: 0 auto;
	max-width: 1000px;
	height: auto;
}
</style>



<script>
tiermap = {		
		"BRONZE" : "?????????",
		"SILVER" : "??????",
		"GOLD" : "??????",
		"CHALLENGER" : "?????????"			
	}
mytier = tiermap['${leagueAccountVO.tier}']


	leagueAccountInfo = JSON.parse('${leagueAccountInfo}')

	$(document).ready(function() {
		$("#my-tier").text(mytier)
		let fullMsg = '${msg}'
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}

		// ?????????????????? ??????
		$(".goto-htc").click(function() {
			index = this.id.split("_")[1]
			console.log("selected index : " + index)
			current_bal = $("#balance_" + index).val()
			current_nick = $("#nick_" + index).html()
			current_regDate = $("#regDate_" + index).html()
			current_gcaNumber = $("#gcaNumber_" + index).html()
			console.log(current_bal)
			console.log(current_gcaNumber)
			console.log(current_regDate)
			$("#form-nick").val(current_nick)
			$("#form-balance").val(current_bal)
			$("#form-gcaNumber").val(current_gcaNumber)
			$("#form-regDate").val(current_regDate)
			console.log($("#form-regDate").val())
		})				
	$('#start_account').click(function(){
		location.href = "${pageContext.request.contextPath}/account/contract"
		})				
	})
		

	
	
	
	
	
	
	
	
	
</script>

</head>
<body class="theme-success" style="background-color:white;">
	<header class="header-light">
		<jsp:include page="/resources/home/include/header.jsp" />
	</header>
	
	
	<%-- 
	<aside class="main-sidebar">
		<jsp:include page="/resources/dash/include/sidebar.jsp" />
	</aside> --%>
	<!-- Content Wrapper. Contains page content -->



<!-- 	<div class="content-wrapper" style="background-color:#f5f5f5;" >
		<div class="container-full" style="background-color:#f5f5f5;"> -->

			<!-- Main content -->
			<section class="py-lg-80 py-30" style="background-color:#f5f5f5;">
				<div class="container">
				<div class="row">
					<div class="col-md-4">						

						<div class="row">
							<c:if test="${empty leagueAccountVO }">

								<div class="box-footer mt-10">
									<form action="${ pageContext.request.contextPath }/account/createLeagueAcc" method="post">
										<button type="submit" id="start_league" class="waves-effect waves-light btn btn-danger btn-lg">?????? ????????????</button>
									</form>
								</div>
							</c:if>
							<c:if test="${not empty leagueAccountVO }">
								<div class="col-md-12">
								<div class="box box-widget widget-user">
									<div class="box-body box-profile">
										<h3 class="widget-user-username text-black">${viewId }</h3>
										<%-- <h6 class="widget-user-desc text-white">${userVO.userType }</h6> --%>
										<img class="rounded img-fluid mx-auto d-block max-w-150" src="${ pageContext.request.contextPath }/resources/images/tier/${leagueAccountVO.tier}.png">
										<h4 class="text-center">
											<strong id="my-tier"></strong>
										</h4>
									</div>

									<div class="box-footer">
										<div class="row mb-15">
											<div class="col-sm-4 text-center">
												<div class="description-block">
													<h5 class="description-header">????????? ???</h5>
													<span class="description-text">${fn:length(leagueFollowList)}</span>???
												</div>

											</div>
											<!-- /.col -->
											<div class="col-sm-4 be-1 bs-1 text-center">
												<div class="description-block">
													<h5 class="description-header">?????? ??????</h5>
													<span class="description-text"><fmt:formatNumber value="${leagueAccountVO.followPrice }" type="currency" currencySymbol="$" /></span>
												</div>

											</div>
											<!-- /.col -->
											<div class="col-sm-4 text-center">
												<div class="description-block">
													<h5 class="description-header">??????</h5>
													<span class="description-text"><fmt:formatNumber value="${leagueAccountVO.balance}" type="currency" currencySymbol="$" /></span>
												</div>
											</div>
											<!-- /.col -->
										</div>
										<!-- /.row -->
										<div class="row mb-30 bt-1">
											<h5 class="p-15 mb-0">
												<strong>?????? ??????:</strong>
												<fmt:parseDate value="${leagueAccountVO.regDate }" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss" />
												<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDate}" />
											</h5>
											<h5 class="p-15 mb-0">
												<strong>?????? ?????? ??????:</strong> ${totalStockCounts }???

											</h5>

										</div>
										<div class="row mb-30">
											<div class="clearfix">
												<button type="submit" id="start_league" class="waves-effect waves-light btn btn-primary mb-5" data-bs-toggle="modal" data-bs-target="#modal-center2">?????? ??????</button>
											</div>
										</div>
									</div>
								</div>
							</div>
							</c:if>
						</div>
					</div>

					<div class="col-md-8">
						
						<div class="row">
							<c:if test="${fn:length(list) eq 0}">
								<div class="box-footer mt-10">

									<button type="submit" id="start_account" class="waves-effect waves-light btn btn-danger btn-lg">?????? ?????? ??????</button>

								</div>
							</c:if>

							<div class="container-fixed stacked-cards stacked-cards-slide">
								<ul>
									<c:forEach items="${ list }" var="accountVO" varStatus="loop">
										<li class="col-lg-12"><c:choose>
												<c:when test="${(loop.count % 3) == 2 }">
													<div class="box-inverse bg-gradient-success">
														<div class="box-body text-center">
															<h5 class="text-uppercase text-muted">
																<span id="nick_${loop.count }">${accountVO.nick }</span>&nbsp;
															</h5>

															<br>
															<p class="price" style="font-size: xxx-large;">
																<sup>$</sup>
																<fmt:formatNumber value="${accountVO.balance}" type="number" />
																<span>&nbsp;</span> <input value="${accountVO.balance }" id="balance_${loop.count }" hidden="true">
															</p>
															<hr>
															<p>
																<strong>??????:&nbsp;</strong><span id="gcaNumber_${loop.count }">${accountVO.gcaNumber }</span>
															</p>

															<p>
																<strong>?????? ??????:&nbsp;</strong><span id="regDate_${loop.count }">
																<fmt:parseDate value="${accountVO.regDate }" var="parsedDate" pattern="yyyy-MM-dd"/>
																<fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDate}" />																
																</span>
																
															</p>
															<br> <br>
															<button id="listindex_${loop.count }" type="button" style="background-color: transparent; border-color: white;" class="btn btn-primary goto-htc" data-bs-toggle="modal" data-bs-target="#modal-center">?????? ??????</button>
														</div>
													</div>
												</c:when>
												<c:when test="${(loop.count % 3) == 0 }">

													<div class="box-inverse bg-gradient-danger">
														<div class="box-body text-center">
															<h5 class="text-uppercase text-muted">
																<span id="nick_${loop.count }">${accountVO.nick }</span>&nbsp;
															</h5>

															<br>
															<p class="price" style="font-size: xxx-large;">
																<sup>$</sup>
																<fmt:formatNumber value="${accountVO.balance}" type="number" />
																<span>&nbsp;</span> <input value="${accountVO.balance }" id="balance_${loop.count }" hidden="true">
															</p>
															<hr>
															<p>
																<strong>??????:&nbsp;</strong><span id="gcaNumber_${loop.count }">${accountVO.gcaNumber }</span>
															</p>

															<p>
																<strong>?????? ??????:&nbsp;</strong><span id="regDate_${loop.count }">${accountVO.regDate }</span>
															</p>
															<br> <br>
															<button id="listindex_${loop.count }" type="button" style="background-color: transparent; border-color: white;" class="btn btn-primary goto-htc" data-bs-toggle="modal" data-bs-target="#modal-center">?????? ??????</button>
														</div>
													</div>
												</c:when>
												<c:when test="${(loop.count % 3) == 1 }">
													<div class="box-inverse bg-gradient-primary">
														<div class="box-body text-center">
															<h5 class="text-uppercase text-muted">
																<span id="nick_${loop.count }">${accountVO.nick }</span>&nbsp;
															</h5>
															<br>
															<p class="price" style="font-size: xxx-large;">
																<sup>$</sup>
																<fmt:formatNumber value="${accountVO.balance}" type="number" />
																<span>&nbsp;</span> <input value="${accountVO.balance }" id="balance_${loop.count }" hidden="true">
															</p>
															<hr>
															<p>
																<strong>??????:&nbsp;</strong><span id="gcaNumber_${loop.count }">${accountVO.gcaNumber }</span>
															</p>
															<p>
																<strong>?????? ??????:&nbsp;</strong><span id="regDate_${loop.count }">${accountVO.regDate }</span>
															</p>
															<br>
															<br>
															<button id="listindex_${loop.count }" type="button" style="background-color: transparent; border-color: white;" class="btn btn-primary goto-htc" data-bs-toggle="modal" data-bs-target="#modal-center">?????? ??????</button>
														</div>
													</div>
												</c:when>
											</c:choose></li>
									</c:forEach>

								</ul>
							</div>
						</div>

					</div>

				</div>

</div>
			</section>
<!-- 		</div>
	</div>
 -->


	<footer class="footer_three" style="background-color:white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>>
<%-- 	<aside class="control-sidebar">
		<jsp:include page="/resources/dash/include/control-sidebar.jsp" />
	</aside> --%>




	<!-- Modal -->
	<div class="modal center-modal fade" id="modal-center" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">???????????? ??????</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				?????? ??????????????? ??????????????????.
				<form method="post">
					<input name="nick" hidden="true" id="form-nick"> <input name="balance" hidden="true" id="form-balance"> <input name="gcaNumber" hidden="true" id="form-gcaNumber"> <input name="regDate" hidden="true" id="form-regDate"> <br> <br> <input name="gcaPassword" type="password" id="form-password">
					<div class="modal-body"></div>
					<div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">??????</button>
						<button type="submit" class="btn btn-primary float-end">??????</button>
					</div>
				</form>
			</div>
		</div>
	</div>



	<div class="modal center-modal fade" id="modal-center2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">?????? ?????? ?????????</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form method="post" action="${pageContext.request.contextPath}/account/leagueSignin">
					<div class="modal-body">
						<p>?????? ??????????????? ??????????????????</p>
						<input class="form-control" style="width:50%; background-color:#f5f5f5;" name="password" type="password" id="user_password">
					</div>
					<div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">??????</button>
						<button type="submit" class="btn btn-primary float-end">??????</button>
					</div>
				</form>
			</div>

		</div>
	</div>



	<div class="control-sidebar-bg"></div>
	<!-- Vendor JS -->
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script> --%>
 	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.resize.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.pie.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.categories.js"></script>



	<!-- Crypto Admin App -->
<%-- 	<script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script> --%>

	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>

 
	<script src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/stackedCards.min.js"></script>		
	
	
	
	
	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>	
	<!-- Corenav Master JavaScript -->
    <script src="${ pageContext.request.contextPath }/resources/home/corenav-master/coreNavigation-1.1.3.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/home/js/nav.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	
	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>	
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	<script>
		var stackedCardSlide = new stackedCards({
		 	selector: '.stacked-cards-slide',
		 	layout: "slide",
		 	transformOrigin: "center",
		 });

		stackedCardSlide.init();
	</script>
</body>
</html>