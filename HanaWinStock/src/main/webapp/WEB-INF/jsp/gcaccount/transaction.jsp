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
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script>
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
				
				<div class="box">
						<div class="box-body no-padding">
							<!-- Nav tabs -->
							<ul class="nav nav-fill nav-pills margin-bottom margin-top-10">
								<li class="nav-item bt-2 border-warning"> <a href="#navpills-1" class="nav-link active no-radius" data-bs-toggle="tab" aria-expanded="false">거래 내역</a> </li>
								<li class="nav-item bt-2 border-primary"> <a href="#navpills-2" class="nav-link no-radius" data-bs-toggle="tab" aria-expanded="false">스탑-리밋</a> </li>
							</ul>	
							<!-- Tab panes -->
							<div class="tab-content">
								<div id="navpills-1" class="tab-pane active">
																		
									<div class="btn-group p-20">
									  <button type="button" class="btn btn-warning">전부</button>
									  <button type="button" class="btn btn-success">매도</button>
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
								<div id="navpills-2" class="tab-pane">
									<div class="table-responsive">
									  <table class="table table-hover">
										  <thead>
											<tr>
											  <th scope="col">Time</th>
											  <th scope="col">Offer Id</th>
											  <th scope="col">Amount</th>
											  <th scope="col">Price</th>
											  <th scope="col">Total Value</th>
											  <th scope="col">Buy/Sell</th>
											  <th scope="col">Edit</th>
											  <th scope="col">Delete</th>
											</tr>
										  </thead>
										  <tbody>
											<tr>
												<td>Wed Oct 16 2019 09:56:03</td>
												<td class="">14374</td>
												<td class="">0.1</td>
												<td class="">8500</td>
												<td class="">850</td>
												<td class="text-danger">Sell</td>
												<td>
													<button class="btn btn-success-light btn-sm">Modify</button>
												</td>
												<td>
													<button class="btn btn-danger-light btn-sm">Delete</button>
												</td>
											</tr>
											<tr>
												<td>Wed Oct 16 2019 09:48:47</td>
												<td class="">14366</td>
												<td class="">0.01</td>
												<td class="">6500</td>
												<td class="">65</td>
												<td class="text-success">Buy</td>
												<td>
													<button class="btn btn-success-light btn-sm">Modify</button>
												</td>
												<td>
													<button class="btn btn-danger-light btn-sm">Delete</button>
												</td>
											</tr>
											<tr>
												<td>Wed Oct 16 2019 08:11:23</td>
												<td class="">14263</td>
												<td class="">0.0001</td>
												<td class="">7500</td>
												<td class="">0.75</td>
												<td class="text-success">Buy</td>
												<td>
													<button class="btn btn-success-light btn-sm">Modify</button>
												</td>
												<td>
													<button class="btn btn-danger-light btn-sm">Delete</button>
												</td>
											</tr>
											<tr>
												<td>Tue Oct 15 2019 06:38:03</td>
												<td class="">12714</td>
												<td class="">0.0009</td>
												<td class="">7000</td>
												<td class="">6.3</td>
												<td class="text-success">Buy</td>
												<td>
													<button class="btn btn-success-light btn-sm">Modify</button>
												</td>
												<td>
													<button class="btn btn-danger-light btn-sm">Delete</button>
												</td>
											</tr>
											<tr>
												<td>Mon Oct 14 2019 14:39:54</td>
												<td class="">11758</td>
												<td class="">0.001</td>
												<td class="">172</td>
												<td class="">0.17200000000000001</td>
												<td class="text-danger">Sell</td>
												<td>
													<button class="btn btn-success-light btn-sm">Modify</button>
												</td>
												<td>
													<button class="btn btn-danger-light btn-sm">Delete</button>
												</td>
											</tr>
										</tbody>
										</table>
									</div>
																													
							</div>
							</div>																	
						</div>
						<!-- /.box-body -->
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