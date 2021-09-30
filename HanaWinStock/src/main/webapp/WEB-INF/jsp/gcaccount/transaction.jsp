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
    <title>GreenCamel</title>
	<!-- Vendors Style-->
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">
	  
	<!-- Style-->  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">	
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">	  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>
		
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	
	<style>
	.chatDirect {
		position: fixed;
		bottom: 0;
		right: 0;
		width: 300px;
		border: 1px solid gray;
		background-color: white;
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
		
		$('.btn-warning').click(function(){
			location.href = "${ pageContext.request.contextPath }/account/transaction/1"
		})
		
		$('.btn-success').click(function(){
			location.href = "${ pageContext.request.contextPath }/account/transaction/1?type=S"
		})
		
		$('.btn-danger').click(function(){
			location.href = "${ pageContext.request.contextPath }/account/transaction/1?type=B"
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
			<!-- Main content -->
				<div class="row">
				
				<div class="box">
					<div class="box-header">
						<h4 class="box-title">거래내역</h4>
					</div>
						<div class="box-body no-padding">
							<!-- Nav tabs -->
						
							<!-- Tab panes -->
							<div class="tab-content">
								<div id="navpills-1" class="tab-pane active">
																		
									<div class="btn-group p-20">
									  <button type="button" class="btn" style="background-color:#f5f5f5;">전부</button>
									  <button type="button" class="btn btn-primary">매도</button>
									  <button type="button" class="btn btn-danger">매수</button>
									</div>
								
									<div class="row">
									<div class="table-responsive">
									  <table class="table table-hover no-margin">
										  <thead>
											<tr>
											  <th scope="col">시간</th>
											  <th scope="col">종목</th>
											  <th scope="col">개수</th>
											  <th scope="col">거래 가격</th>
											  <th scope="col">잔액</th>
											  <th scope="col">매수/매도</th>
											</tr>
										  </thead>
										  <tbody>
										  <c:forEach items="${ showingLogs }" var="accountStockLog" varStatus="loop">
										  <tr>
												<td> ${accountStockLog.time} </td>
												<td>${accountStockLog.symbol }</td>
												<td> ${accountStockLog.counts } </td>
												<td> <fmt:formatNumber value = "${accountStockLog.momentPrice}" type = "currency" currencySymbol="$"/></td>
												<td><fmt:formatNumber value = "${accountStockLog.postBalance}" type = "currency" currencySymbol="$" /> </td>	
												<c:if test="${accountStockLog.action eq 'S'}">
													<td class="text-success">매도</td>
												</c:if>
												<c:if test="${accountStockLog.action eq 'B'}">
													<td class="text-danger">매수</td>
												</c:if>
										 </tr>									  
										  </c:forEach>										
										</tbody>
										</table>
										</div>
										</div>
										<div class="row">
										<div class="col-md-1">
										<c:if test="${currentPage ne  1}">
											<a href="${ pageContext.request.contextPath }/account/transaction/${currentPage-1}">이전 페이지</a> 
										</c:if>
										</div>
										<div class="text-center col-md-10">
										<c:forEach begin="1" end="${pageCounts}" varStatus="loop">
											
											<c:if test="${loop.index eq  currentPage}">
												<a class="col-md-1" style="color:red;" href="${ pageContext.request.contextPath }/account/transaction/${loop.index}">${loop.index }</a>   
											</c:if>
											<c:if test="${loop.index ne  currentPage}">
												<a class="col-md-1" href="${ pageContext.request.contextPath }/account/transaction/${loop.index}">${loop.index }</a>   
											</c:if>											
										</c:forEach>		
										</div>
										<div class="col-md-1">
										<c:if test="${currentPage ne  pageCounts &&  pageCounts > 0 }">
											<a href="${ pageContext.request.contextPath }/account/transaction/${currentPage+1}">다음 페이지</a>
										</c:if>
										</div>
										
									</div>
								</div>
							
							</div>																	
						</div>
						<!-- /.box-body -->
					  </div>
				
				
				</div>
				</div>
			</section>
	
	<footer class="footer_three" style="background-color:white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>
	 
	<div class="control-sidebar-bg"></div>
	<!-- Vendor JS -->
	<script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.resize.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.pie.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.categories.js"></script>

	<!-- Crypto Admin App -->
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script> --%>

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