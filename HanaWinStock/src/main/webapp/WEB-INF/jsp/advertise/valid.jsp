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
	
	
	
		
	
	<style>
	#main-div{
		margin:auto;
	}
	
	</style>
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script>
	symbols = eval('${symbols}')
	
	
	$(document).ready(function() {	
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}
	
	})
	
	
	function validCheck(){
		let check = true;
		$(".content input").each(function(){
			if($(this).val() == "" ){
				console.log($(this));
				check = false;
				$(this).focus()
				myAlarm("warning:Error:모든 항목을 장성 해주세요.")
				return false;
			}			
		})	 
		if(check){
			fileName = $('#file').val()
			
		 	var fileExt = fileName.split('.').pop();
			console.log(fileExt)
			if ( !["pdf", "txt" , "doc", "excel" , "hwp"].includes(fileExt)   ){
				check = false;
				myAlarm("warning:Error:pdf, text, doc, excel , hwp 형태인 파일을 첨부 해주세요.")
			}  			
			
		}
		if(check){
			if(!symbols.includes($("#reqSymbol").val())   ){
				check = false;
				myAlarm("warning:Error:존재 하지 않은 회사 종목 입니다.")
			}
			
		}
		
		
		return check;
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
		<section class="content" style="background-color:#f5f5f5;">
			<div class="container">

			
				
				<div class="row">			  
				<div class="col-lg-8 col-12" id="main-div">
					  <div class="box">
						<div class="box-header with-border">
						  <h4 class="box-title">광고 권한 인증</h4>
						</div>
						<!-- /.box-header -->
						<form class="form" method="post" enctype="multipart/form-data" onsubmit="return validCheck()">
							<div class="box-body">
								<h4 class="box-title text-info mb-0"><i class="ti-user me-15"></i> 개인 정보</h4>
								<hr class="my-15">
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">이름</label>
									  <input type="text" name="firstName" class="form-control" placeholder="이름">
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">성</label>
									  <input type="text" name="lastName" class="form-control" placeholder="성">
									</div>
								  </div>
								</div>
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">이메일</label>
									  <input type="email"  name="email" class="form-control" placeholder="이메일">
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">전화번호</label>
									  <input type="text" name="phone" class="form-control" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="전화번호 xxx-xxx-xxxx">
									</div>
								  </div>
								</div>
								<h4 class="box-title text-info mb-0 mt-20"><i class="ti-save me-15"></i> 필수 정보</h4>
								<hr class="my-15">
								<div class="form-group">
								  <label class="form-label">회사명</label>
								  <input id="reqSymbol" type="text" name="advertiseSymbol" class="form-control" placeholder="종목 코드로 작성 ex. AAPL">
								</div>
								<div class="row">
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">사업자등록번호</label>
									  <input type="text" name="companyRegNumber" class="form-control" pattern="\d{3}-\d{2}-\d{5}" placeholder="사업자등록번호 xxx-xx-xxxxx">
									</div>
								  </div>
								  <div class="col-md-6">
									<div class="form-group">
									  <label class="form-label">예산</label>
									  <select name="budget" class="form-select">
										<option>5000$ 미만</option>
										<option>5000$ - 10000$</option>
										<option>10000$ - 20000$</option>
										<option>20000$ 이상</option>
									  </select>
									</div>
								  </div>
								</div>
								<div class="form-group">
								  <label class="form-label">인증 파일 첨부</label>
								  <label class="file">
									<input type="file" name="file" id="file">
								  </label>
								</div>
								<div class="form-group">
								  <label class="form-label">비고</label>
								  <textarea name="note" rows="5" class="form-control" placeholder="비고"></textarea>
								</div>
							</div>
							<!-- /.box-body -->
							<div class="box-footer">
								<button type="button" class="btn btn-warning me-1">
								  <i class="ti-trash"></i> 취소
								</button>
								<button type="submit" class="btn btn-primary">
								  <i class="ti-save-alt"></i> 인증
								</button>
							</div>  
						</form>
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