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
	
	<style>
.loading {
  position: fixed;
  z-index: 999;
  height: 2em;
  width: 2em;
  overflow: show;
  margin: auto;
  top: 0;
  left: 0;
  bottom: 0;
  right: 0;
}

/* Transparent Overlay */
.loading:before {
  content: '';
  display: block;
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0,0,0,0.3);
}

/* :not(:required) hides these rules from IE9 and below */
.loading:not(:required) {
  /* hide "loading..." text */
  font: 0/0 a;
  color: transparent;
  text-shadow: none;
  background-color: transparent;
  border: 0;
}

.loading:not(:required):after {
  content: '';
  display: block;
  font-size: 10px;
  width: 1em;
  height: 1em;
  margin-top: -0.5em;
  -webkit-animation: spinner 1500ms infinite linear;
  -moz-animation: spinner 1500ms infinite linear;
  -ms-animation: spinner 1500ms infinite linear;
  -o-animation: spinner 1500ms infinite linear;
  animation: spinner 1500ms infinite linear;
  border-radius: 0.5em;
  -webkit-box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.5) -1.5em 0 0 0, rgba(0, 0, 0, 0.5) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
  box-shadow: rgba(0, 0, 0, 0.75) 1.5em 0 0 0, rgba(0, 0, 0, 0.75) 1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) 0 1.5em 0 0, rgba(0, 0, 0, 0.75) -1.1em 1.1em 0 0, rgba(0, 0, 0, 0.75) -1.5em 0 0 0, rgba(0, 0, 0, 0.75) -1.1em -1.1em 0 0, rgba(0, 0, 0, 0.75) 0 -1.5em 0 0, rgba(0, 0, 0, 0.75) 1.1em -1.1em 0 0;
}

/* Animation */

@-webkit-keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-moz-keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@-o-keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}
@keyframes spinner {
  0% {
    -webkit-transform: rotate(0deg);
    -moz-transform: rotate(0deg);
    -ms-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(360deg);
    -moz-transform: rotate(360deg);
    -ms-transform: rotate(360deg);
    -o-transform: rotate(360deg);
    transform: rotate(360deg);
  }
}


.center {
  margin: auto;
  width: 50%;
}
	</style>	
	<script>
	temp = function() {
		  setTimeout(
		    function() {
		    	$("#formbox :input").prop("disabled", true);
				myAlarm("success:success:학습이 완료 되었습니다.");
		    }, 5000);
		}
	
	
	$(document).ready(function() {	
		$(".loading").hide()
		
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}
		
		$("#cancel-btn").click(function(){
			location.href = "${ pageContext.request.contextPath }"
		})
					
		
		$("#train-btn").click(function(){									
			symbol = $("#symbol").val()
			model_name = $("#model_name").val()
			train_ratio = $("#train_ratio").val()
			lb = $("#lb").val()
			date_time = $("#datetime").val()
			unix_time = new Date(date_time).getTime() / 1000
			training_optimizer = $("#training_optimizer").val()
			layer_node = $("#layer_node").val()
			train_epoch = $("#train_epoch").val()
			if($("#mae").is(":checked") == true  ){
				training_loss = "mae"
			}else{
				training_loss = "mse"
			}
			$("#formbox :input").prop("disabled", true);
			
			$("#cancel-btn").hide()
			$("#train-btn").hide()
			
			sending_data = {
				"symbol" : symbol,
				"model_name" : model_name,
				"train_ratio" : train_ratio,
				"lb" : lb,
				"unix_time" : unix_time,
				"training_optimizer" :training_optimizer,
				"training_loss" : training_loss,
				"layer_node" : layer_node,
				"train_epoch" : train_epoch
				
			}
			console.log(sending_data)
			$(".loading").show()
			
			$.ajax({type : 'get',
	      		url : "http://192.168.82.186:8000/createModel",
	      		data : sending_data,
	      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
	      		datatype : 'json',
	      		success : function(result) {	      			
	      			console.log("one real time success")
	      			console.log(result)
	      			
	      			$(".loading").hide()
	      			myAlarm("success:success:학습이 완료 되었습니다.");
	      		},
	      		error : function() {
	      			console.log("error")
	      			}
				})
			
			
			
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

					

				
					<h3>AI 모델 생성</h3>
					<div class="loading">Loading&#8230;</div>
						<!-- Basic Forms -->
						<div class="box my-15" id="formbox">
							<div class="box-header with-border">
								<h4 class="user-social">학습 파라미터 설정</h4>
							</div>
							<!-- /.box-header -->
							<div class="box-body">
								<div class="row">
									<div class="col-12">
										<div class="form-group row">
											<label for="example-text-input" class="col-sm-2 col-form-label">종목 코드</label>
											<div class="col-sm-10">
												<input class="form-control" type="text" id="symbol">
											</div>
										</div>
										<div class="form-group row">
											<label for="example-url-input" class="col-sm-2 col-form-label">모델 이름</label>
											<div class="col-sm-10">
												<input class="form-control" type="text" id="model_name">
											</div>
										</div>
										<div class="form-group row">
											<label for="example-search-input" class="col-sm-2 col-form-label">학습/검증 데이터 비율</label>
											<div class="col-sm-10">
												<input class="form-control" type="number" name="number" id="train_ratio">
											</div>
										</div>
										<div class="form-group row">
											<label for="example-search-input" class="col-sm-2 col-form-label">학습 수행 횟수</label>
											<div class="col-sm-10">
												<input class="form-control" type="number" name="number" id="train_epoch">
											</div>
										</div>
										<div class="form-group row">
											<label for="example-search-input" class="col-sm-2 col-form-label">스텝 사이즈</label>
											<div class="col-sm-10">
												<input class="form-control" type="number" name="number" id="lb">
											</div>
										</div>
										<div class="form-group row">
											<label for="example-search-input" class="col-sm-2 col-form-label">노드 개수</label>
											<div class="col-sm-10">
												<input class="form-control" type="number" name="number" id="layer_node">
											</div>
										</div>											
										<div class="form-group row">
											<label for="example-date-input" class="col-sm-2 col-form-label">학습 시작 날짜</label>
											<div class="col-sm-10">
												<input class="form-control" type="date" value="2011-08-19" id="datetime">
											</div>
										</div>
										<div class="form-group row">
											<label for="example-text-input" class="col-sm-2 col-form-label">옵티아이저</label>
											<div class="col-sm-10">
												<input class="form-control" type="text" id="training_optimizer">
											</div>
										</div>
										
										<div class="form-group row">
											<label for="example-text-input" class="col-sm-2 col-form-label">손실 함수</label>
											<div class="col-sm-10 mt-5">
												<div class="demo-radio-button">
													<input name="group4" type="radio" id="mse" class="form-control radio-col-primary" checked="">
													<label for="radio_7">MSE</label>
													<input name="group4" type="radio" id="mae" class=" col-form-label radio-col-success">
													<label for="radio_9">MAE</label>
												</div>							
											</div>
										</div>
										<div class="box-footer">
											<button type="button" class="btn btn-danger" id="cancel-btn">취소</button>
											<button type="button" class="btn btn-success pull-right" id="train-btn">학습</button>
										</div>




									</div>
									<!-- /.col -->
								</div>
								<!-- /.row -->
							</div>
							<!-- /.box-body -->
						</div>
						<!-- /.box -->
			
						<div class="row my-15"></div>



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