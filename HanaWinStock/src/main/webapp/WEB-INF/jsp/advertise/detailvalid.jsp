<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
<script>
	$(document).ready(function() {
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}
		
		$("#approve").click(function(){
			$("#id_id").val("${advertiseMemberRequestVO.id}")
			$("#id_status").val("APPROVE")
			$("#submitform").trigger("click")
		})
		
		$("#disprove").click(function(){
			$("#id_id").val("${advertiseMemberRequestVO.id}")
			$("#id_status").val("DISPROVE")
			$("#submitform").trigger("click")
		})
		
		$('#goback').click(function(){
			location.href = "${pageContext.request.contextPath}/account/advertise/checkvalid"
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
					<h4>인증 상세 정보</h4>
					<div class="row">
						<div class="col-12">
							<div class="box">
								<h3 class="ms-20"> 아이디 : ${advertiseMemberRequestVO.id }</h3>
								<div class="row">
									<div class="col-lg-6 col-12">
										<div class="box">
											<div class="box-header with-border">
												<h4 class="box-title">회사 정보</h4>
											</div>
											<div class="box-body">
												<div class="table-responsive">
													<table class="table table-striped table-hover no-margin">
														<tbody>
															<tr>
																<td>회사 종목 코드</td>
																<td><a href="#">${advertiseMemberRequestVO.advertiseSymbol }</a></td>
															</tr>
															<tr>
																<td>사업자 등록번호</td>
																<td><a href="#">${advertiseMemberRequestVO.companyRegNumber }</a></td>
															</tr>
															<tr>
																<td>예산</td>
																<td>${advertiseMemberRequestVO.budget }</td>
															</tr>
															<tr>
																<td>요청 결과 상태</td>
																 <c:if test="${advertiseMemberRequestVO.status eq  'WAIT'}">
																	<td><span class="badge badge-warning">확인 되지 않음</span></td> 
																 </c:if>
																 <c:if test="${advertiseMemberRequestVO.status eq  'APPROVE'}">
																	<td><span class="badge badge-success">승인</span></td> 
																 </c:if>
																  <c:if test="${advertiseMemberRequestVO.status eq  'DISPROVE'}">
																	<td><span class="badge badge-danger">비승인</span></td> 
																 </c:if>
																
															</tr>
															<tr>
																<td>첨부파일</td>
																<td><form method="get" action="${ pageContext.request.contextPath }/ajax/filedown/downloadFile">
																			<input hidden="true" name="serverPath" value="${ advertiseMemberRequestVO.filePath}">
																		<button class="waves-effect waves-light btn btn-outline btn-dark mb-5" type="submit">다운로드</button>
																</form></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4 col-12">
										<div class="box">
											<div class="box-header with-border">
												<h4 class="box-title">개인 정보</h4>
											</div>
											<div class="box-body">
												<div class="table-responsive">
													<table class="table table-striped table-hover no-margin">
														<tbody>
															<tr>
																<td>이름</td>
																<td><span class="text-success">${ advertiseMemberRequestVO.lastName } ${ advertiseMemberRequestVO.firstName }</span></td>
															</tr>
															<tr>
																<td>이메일</td>
																<td><span class="text-success">${ advertiseMemberRequestVO.email}</span></td>
															</tr>
															<tr>
																<td>전화번호</td>
																<td><span class="text-success">${ advertiseMemberRequestVO.phone}</span></td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
								

								<!-- /.box-body -->
								<div class="box-footer">
									<div class="col-12">
										<div class="box bg-primary">
											<div class="box-body">
												<h4 class="mt-0">비고</h4>
											</div>
										</div>
									</div>
									<div class="col-12">
										<div class="box">
											<div class="box-body">
												<div>
													<div class="row justify-content-between">
														<div class="col-md-auto">
															<h5>${advertiseMemberRequestVO.note }</h5>
														</div>
														<div class="col-md-auto">
															<h5 class="text-end">${advertiseMemberRequestVO.time }</h5>
														</div>
													</div>
													<div class="text-end mt-30">
													
													<button style="float:left;" class="waves-effect waves-light btn btn-default btn-flat mb-5" id="goback">뒤로 가기</button>
													<form method="post">
														<input hidden="true" type="text" id="id_status" name="status"/>
														<input hidden="true" type="text" id="id_id" name="id"/>
														<c:if test="${advertiseMemberRequestVO.status ne  'DISPROVE'}">
															<button class="waves-effect waves-light btn btn-outline btn-danger mb-5" id="disprove" type="button">비승인</button>		
														</c:if>
														<c:if test="${advertiseMemberRequestVO.status ne  'APPROVE'}">
															<button class="waves-effect waves-light btn btn-outline btn-success mb-5" id="approve" type="button">승인</button>													
														</c:if>																																									
														<button hidden="true" id="submitform" type="submit"></button>
													</form>														
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- /.box-footer-->
							</div>
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