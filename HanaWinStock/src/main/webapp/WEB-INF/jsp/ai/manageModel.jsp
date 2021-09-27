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
    <title>GreenCamel</title>
	<!-- Vendors Style-->
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">
	  
	<!-- Style-->  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script>
	modelUsage = '${modelUsage}'
		
	
	$(document).ready(function() {	
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}		
		$(".eachsymbol").click(function(){
			symbol = $(this).attr("id")
			location.href = "${pageContext.request.contextPath}/artificial/eachSymbolModel/" + symbol
		})
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
				<div class="row mb-30">
					<div class="col-md-4">
					<div class="app-menu">
						<div class="search-bx mx-5">
							<form>
								<div class="input-group">
									<input type="search" class="form-control" placeholder="종목 검색" aria-label="Search" aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn" type="submit" id="button-addon3">
											<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
										</button>
									</div>
								</div>
							</form>
						</div>
						</div>
					</div>
				</div>
			
				<div class="row">
								
				
				
				<div class="col-lg-12 col-12">
				<div class="row ico-filter" data-ref="ico-filter">
				<c:forEach items="${ modelUsage }" var="map" varStatus="loop">					
					<div class="col-12 col-md-6 col-lg-4 mix realestate sponsored eachsymbol" id="${map.symbol }">
						<div class="box box-body bg-hexagons-white pull-up">
						  <div class="media align-items-center p-0">
							<div class="text-center">
				<!-- 			  <a href="#"><i class="cc XRP me-5" title="XRP"></i></a> -->
							<c:if test="${not empty map.path }">
							  <img alt="" class="avatar"  src="${map.path }">
							  </c:if>
							</div>
							<div>
							  <h3 class="no-margin text-bold">${map.symbol }</h3>
							  <span>${map.sector }</span>
							</div>
						  </div>
						  <div class="flexbox align-items-center mt-25">
							<div>
							</div>
							<div class="text-end">
							<c:if test="${map.regularmarketchangepercent  >= 0 }">
								<p class="no-margin fw-600"><span class="text-primary">${map.regularmarketchangepercent }%</span></p>
							</c:if>
							<c:if test="${map.regularmarketchangepercent  < 0 }">
								<p class="no-margin fw-600"><span class="text-danger">${map.regularmarketchangepercent }%</span></p>
							</c:if>
							  
							  <c:if test="${not empty map.usecounts }">
							  	<p class="no-margin">${map.usecounts }명 오늘 사용</p>
							  </c:if>
							   <c:if test="${empty map.usecounts }">
							  	<p class="no-margin">0명 오늘 사용</p>
							  </c:if>							  							  
							</div>
						  </div>
						</div>			
					  </div>					
				</c:forEach>
					
					
					<div class="col-12 col-md-6 col-lg-4 mix realestate sponsored">
						<div class="box box-body bg-hexagons-white pull-up">
						  <div class="media align-items-center p-0">
							<div class="text-center">
							  <a href="#"><i class="cc XRP me-5" title="XRP"></i></a>
							</div>
							<div>
							  <h3 class="no-margin text-bold">Ripple</h3>
							  <span>Real Estate</span>
							</div>
						  </div>
						  <div class="flexbox align-items-center mt-25">
							<div>
							  <p class="no-margin fw-600"><span class="text-primary">$25.000</span> / $30.000</p>
							  <p class="no-margin">Sponsored</p>
							</div>
							<div class="text-end">
							  <p class="no-margin fw-600"><span class="text-primary">84%</span></p>
							  <p class="no-margin">9d left</p>
							</div>
						  </div>
						</div>			
					  </div>
								
				</div>
				<nav>
				  <ul class="pagination justify-content-center">
					<li class="page-item disabled">
					  <a class="page-link" href="#">
						<span class="ion-ios-arrow-thin-left"></span>
					  </a>
					</li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item">
					  <a class="page-link" href="#">
						<span class="ion-ios-arrow-thin-right"></span>
					  </a>
					</li>
				  </ul>
				</nav>
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