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

    <title>하나윈스톡</title>
    <link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">
	<!-- Vendors Style-->
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">
	  
	<!-- Style-->  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">
	
	
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>	
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
	



	
    <script>
    $(document).ready(function() {
    	
        var owl = $('.servicesCarosal');
                
        //console.log(owl);

        if (owl.length) { 
            owl.owlCarousel({

            });
        }
    	let fullMsg = '${msg}'
         	if (fullMsg != null && fullMsg != "") {
         		myAlarm(fullMsg)
         	}
    });

    
 
     </script> 
  </head>

<body class="theme-success">
	
	<header class="header-light">
		<jsp:include page="/resources/home/include/header.jsp" />
	</header>


    
    <section class="py-lg-80 py-30"  data-overlay="7" style="background-image: url(${ pageContext.request.contextPath }/resources/images/front-end-img/banners/hanabuilding.png); background-size:cover; height:900px;">
		<div class="container">
			<div class="row h-p100 align-items-center">
				<div class="col-lg-6 col-12">
					<div class="mt-80">
		
						<h1 class="box-title text-white mb-20 fw-600 fs-60">다이나믹 주식 라이프</h1>
						<h1 class="box-title text-white mb-20 fw-600 fs-60">HANA WINSTOCK</h1>
						<h4 class="text-white-80 fw-300 mb-30">계좌 구독을 통해서 새로운 금융 친구를 사겨보세요 </h4>
						<div class="input-group">
							<input type="text" class="form-control" placeholder="각종 통계 자료와 주가 예측 가눙을 제공해줍니다.">
							<div class="input-group-append">
								<button class="btn btn-primary" type="submit">종목 검색</button> 
							</div>
						</div>
					</div>	
				</div>
				<div class="col-lg-6 col-12">					
					<div class="text-center">
						<div class="owl-carousel owl-theme owl-btn-1 banner-slide" data-nav-arrow="false" data-nav-dots="false" data-items="1" data-md-items="1" data-sm-items="1" data-xs-items="1" data-xx-items="1">
							<div class="item">
								<img src="${ pageContext.request.contextPath }/resources/images/front-end-img/b-1.png" class="img-fluid" alt="" />
							</div>
							<div class="item">
								<img src="${ pageContext.request.contextPath }/resources/images/front-end-img/b-2.png" class="img-fluid" alt="" />
							</div>
							<div class="item">
								<img src="${ pageContext.request.contextPath }/resources/images/front-end-img/b-3.png" class="img-fluid" alt="" />
							</div>
						</div>						
					</div>
				</div>
			</div>	
		
		
		</div>
	</section>
	
	
	<footer class="footer_three" style="background-color:white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>
	
	
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	

	<!-- Corenav Master JavaScript -->
    <script src="${ pageContext.request.contextPath }/resources/home/corenav-master/coreNavigation-1.1.3.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/home/js/nav.js"></script>

		<!-- Vendor JS -->
	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>		
	<!-- CryptoCurrency front end -->
	
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>	

    
    
    
</body>
</html>