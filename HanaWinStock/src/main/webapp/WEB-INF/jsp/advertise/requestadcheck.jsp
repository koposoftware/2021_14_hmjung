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
    <title>GreenCamel</title>
	<!-- Vendors Style-->
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">
	  
	<!-- Style-->  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">	
	
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">	  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">	
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>	

<script type="text/javascript">

	function timeago(date) {
		var t = new Date(date);
		var seconds = Math.floor((new Date() - t.getTime()) / 1000);
		if(seconds>86400) return t.toISOString().substring(0, 10);
		if(seconds>3600) return Math.floor(seconds/3600)+"시간전";
		if(seconds>60) return Math.floor(seconds/60)+"분전";
		return "방금";
	}
	
		
	function calcTimeAgo(){
		$('.timeago').each(function(){
			val =  timeago($(this).attr('title'));
			$(this).text(val)			
		})		
	}
	
	
 	$(document).ready(function() {
		let fullMsg = '${msg}'
		// 자바스크립트 여기
 		if (fullMsg != null && fullMsg != "") {
			 myAlarm(fullMsg)
		 } 
		calcTimeAgo()
		
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
				<div class="row">
				
				<div class="col-12">
					  <div class="box">
						<div class="box-header with-border">
						  <h4 class="box-title">광고 요청 목록</h4>
						  <ul class="box-controls pull-right">
							<li><a class="box-btn-close" href="#"></a></li>
							<li><a class="box-btn-slide" href="#"></a></li>	
							<li><a class="box-btn-fullscreen" href="#"></a></li>
						  </ul>
						</div>
						<div class="box-body">
							<div class="table-responsive">
								<table class="table table-bordered no-margin">
								  <thead>					
									<tr>
									  <th>번호</th>
									  <th>아이디</th>
									  <th>시간</th>
									  <th>주식 종목</th>
									  <th>진행 상태</th>
									</tr>
								  </thead>
								  <tbody>
								   <c:forEach items="${ list }" var="request" varStatus="loop">
									<tr>
									  <td>
										<a href="${ pageContext.request.contextPath }/account/advertise/adcheck/each/${request.no }" class="hover-primary">
										  ${request.no }
										</a>
									  </td>
									  <td>${request.id }</td>
									  <td>
										<time class="timeago" datetime="${request.time }" title="${request.time }"></time>										
									  </td>
									  	<td>${request.advertiseSymbol }</td>
									  <c:if test="${request.status eq  'WAIT'}">
									  	<td><span class="label label-warning">확인 안됨</span>
									  	<span style="float:right"><a href="${ pageContext.request.contextPath }/account/advertise/adcheck/each/${request.no }"> 조회<i class="mdi mdi-arrow-right"></i> </a> </span>
									  	</td>									  	
									  </c:if>
								    <c:if test="${request.status eq  'APPROVE'}">									 
									  <td><span class="label label-success">승인</span>
									  <span style="float:right"><a href="${ pageContext.request.contextPath }/account/advertise/adcheck/each/${request.no }"> 조회<i class="mdi mdi-arrow-right"></i> </a> </span>
									  </td>								  										  
									  </c:if>
									   <c:if test="${request.status eq  'DISPROVE'}">									 
									  <td><span class="label label-danger">비승인</span>
									  <span style="float:right"><a href="${ pageContext.request.contextPath }/account/advertise/adcheck/each/${request.no }"> 조회<i class="mdi mdi-arrow-right"></i> </a> </span>									  
									  </td>
									  </c:if>
									</tr>
									</c:forEach>									
								  </tbody>
								</table>
							</div>
						</div>
						<!-- /.box-body -->
					  </div>
					  <!-- /.box -->  
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