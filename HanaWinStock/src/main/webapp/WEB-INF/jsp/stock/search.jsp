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
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">	  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">
	
			
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>
	
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
	
	$(document).ready(function() {	
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}
		
		$(".eachsymbol").click(function(){			
			location.href = "${ pageContext.request.contextPath }/stockinfo/stock/" + $(this).attr("id")
		})
		
		$("#button-addon3").click(function(){
			location.href = "${ pageContext.request.contextPath }/stockinfo/stock/" +  $("#search-key").val()
		})
		
	})
	</script>	
	
</head>
<body class="theme-success" style="background-color:white;">
	<header class="header-light">
		<jsp:include page="/resources/home/include/header.jsp" />
	</header>
	
	<aside>
		<jsp:include page="/resources/dash/include/sidebar.jsp" />
	</aside>
		<section class="content" style="background-color:#f5f5f5;">
			<div class="container">
				<div class="row mb-30">
					<div class="col-md-4">
					<div class="app-menu">
						<div class="search-bx mx-5">
							<form>
								<div class="input-group">
									<input id="search-key" type="search" class="form-control" placeholder="종목 검색" aria-label="Search" aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn" type="button" id="button-addon3">
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
					<div class="row ico-filter" data-ref="ico-filter">
						<c:forEach items="${ stockSummaryList }" var="stock" varStatus="loop">
							<div class="col-12 col-md-6 col-lg-4 mix realestate sponsored eachsymbol" id="${stock.symbol }">
						<div class="box box-body bg-hexagons-white pull-up">
						  <div class="media align-items-center p-0">
							<div class="text-center">
				<!-- 			  <a href="#"><i class="cc XRP me-5" title="XRP"></i></a> -->
							  <img alt="" class="avatar"  src="${ pageContext.request.contextPath }/resources/images/stocklogos/${stock.symbol }.png">
							</div>
							<div>
							  <h3 class="no-margin text-bold">${stock.symbol }</h3>							  
							</div>
						  </div>
						  <div class="flexbox align-items-center mt-25">
							<div>
							</div>
							<div class="text-end">
							<c:if test="${stock.regularMarketChangePercent  >= 0 }">
								<p class="no-margin fw-600"><span class="text-primary">전일비 :
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${stock.regularMarketChangePercent}" />
								</span></p>
							</c:if>
							<c:if test="${stock.regularMarketChangePercent  < 0 }">
								<p class="no-margin fw-600"><span class="text-danger">전일비 :
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${stock.regularMarketChangePercent}" /></span></p>
							</c:if>
							  	<p class="no-margin">거래량 : 
							  	<fmt:formatNumber type="number" maxFractionDigits="0" value="${stock.regularMarketVolume}" /></p>
							  	<p class="no-margin">요청 크기 : <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${stock.askSize}" /></span>
							  	</p>
							  	<p class="no-margin">입찰 크기 : <span><fmt:formatNumber type="number" maxFractionDigits="0" value="${stock.bidSize}" /></span>
							  	</p>
							 						  							  
							</div>
						  </div>
						</div>			
					  </div>	
						
						</c:forEach>											
					</div>				
				</div>
				
			
			
			
				</div>
			</section>

	
		<footer class="footer_three" style="background-color:white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>
	<div class="control-sidebar-bg"></div>
	
	
  	<div class="modal modal-fill fade" data-backdrop="false" id="modal-fill" tabindex="-1">
	  <div class="modal-dialog">
		<div class="modal-content">
		  <div class="modal-header">
			<h5 class="modal-title">종목 검색</h5>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		  </div>
		  <form method="post">
		  <div class="modal-body">						
				<input name="symbol-code" class="bootstrap-tagsinput bg-transparent" type="text" id="symbol-code">							
			<br><br><br><br><br><br>
		  </div>
		  <div class="modal-footer">
			<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
			<button type="submit" class="btn btn-primary float-end">검색</button>
		  </div>
		  </form>		
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

	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>

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