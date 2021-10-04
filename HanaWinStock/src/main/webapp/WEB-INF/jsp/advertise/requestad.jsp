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
		
	<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
	<script type='text/javascript' src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.1.60/inputmask/jquery.inputmask.js"></script>
	
	<script>
	stockNameMap =  '${stockNameMap}'					
	stockNameMap  = JSON.parse(stockNameMap)
	
	
	stockSummaryList = '${stockSummaryList}'
	stockSummaryList = JSON.parse(stockSummaryList)	
	clickedSymbol  = null
	$(document).ready(function() {	
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)			
		}
		
		
		$('.eachSymbol').each(function(){
			csymbol = $(this).attr("id");
			console.log(csymbol)
			
			$("#" +csymbol+ ' .stocklongname').text(   stockNameMap[csymbol ]["longName"]  );
			console.log(stockNameMap[ csymbol  ]["sector"]  )
			$("#" +csymbol+ ' .mkprice').text("$"  + stockSummaryList[ csymbol  ]["currentPrice"]  );
			$("#" +csymbol+ ' .sector').text(stockNameMap[ csymbol  ]["sector"]  );
			$("#" +csymbol+ ' .website').text(stockNameMap[ csymbol ]['website']  );
			$("#" +csymbol+ ' .webAtag').attr( "href"  ,   stockNameMap[ csymbol ]['website']  );
		})
		
		$("#form-section").hide();
		
		$(".eachSymbol").click(function(){
			clickedSymbol = $(this).attr("id")
			
			$("#symbol-title").text($(this).attr("id"));
			
/* 			$("#hidden-title").val($(this).attr("id"));			
 */			
			$("#form-section").show();
			
		})
		
		$("a[href='#previous']").text("이전")
		$("a[href='#next']").text("다음")
		$("a[href='#finish']").text("제출")
		$("a[href='#finish']").click(function(){
			$(".frequency_radio").each(function() {
				if($(this).is(':checked')){
					cval = $(this).val()
					$('#hidden_freq').val( cval )
				
				}			
			})
			
			$("#submitbtn").trigger("click")
		})
		
		
	
		
		
		
	})
	
	
	
	function validCheck(){
		console.log("checking")
		let check = true;
		$("#hidden-title").val(clickedSymbol )
		range = $("#reservation").val().split(" - ")
		start = range[0]		
		end = range[1]
		$('#hidden-endDate').val(end)
		$('#hidden-startDate').val(start)
		
		$("#form-section input").each(function(){
			if($(this).val() == "" ){
				console.log($(this));
				check = false;
				$(this).focus()
				myAlarm("warning:Error:모든 항목을 장성 해주세요.")
				return false;
			}			
		})	 
		if(check){
			fileName = $('#formFile').val()
			
		 	var fileExt = fileName.split('.').pop();
			console.log(fileExt)
			if ( !["mp3", "mp4" , "mov" , "wmv" ].includes(fileExt)   ){
				check = false;
				myAlarm("warning:Error:mp3, mp4 , mov , wmv 형태인 파일을 첨부 해주세요.")
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
					<h3 class="subtitle">종목을 선택 해주세요.</h3>
					<c:forEach items="${ list }" var="advertise" varStatus="loop">
						<div class="col-12 col-md-6 col-lg-3 eachSymbol" id='${advertise.advertiseSymbol }'>
							<div class="box box-body bg-hexagons-white pull-up">
								<div class="media align-items-center p-0">
									<div>
										<h3 class="no-margin text-bold">${advertise.advertiseSymbol }</h3>
										<span class="stocklongname"></span>
									</div>
								</div>
								<div class="flexbox align-items-center mt-25">
									<div>
										<p class="no-margin fw-600">
											<span class="text-danger mkprice"></span>
										</p>
										<p class="no-margin">
											<span class="sector"></span>
										</p>
										<p class="no-margin">
											<a class="webAtag" href="">
												<span class="text-primary website"></span>
											</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
				<section class="content" id="form-section">
					<div class="col-lg-8 col-12" id="main-div">
						<div class="row">
							<div class="box">
								<div class="box-header with-border">
									<h4 class="box-title" id="symbol-title"></h4>
								</div>
																
								<div class="box-body wizard-content">
									<form method="post" class="tab-wizard" enctype="multipart/form-data" onsubmit="return validCheck()">
										<input hidden="true" type="text" name="advertiseSymbol" id="hidden-title">
										<input hidden="true" type="text" name="endDate" id="hidden-endDate">
										<input hidden="true" type="text" name="startDate" id="hidden-startDate">
										<button type="submit" id="submitbtn" hidden="true"></button>
										<!-- Step 1 -->
										<h6>광고 설정</h6>
										<section>
											<div class="row">
												<div class="col-md-8">
													<label for="formFile" class="form-label">광고 동영상 파일 업로드</label> <input class="form-control" name="file" type="file" id="formFile">
												</div>
											</div>
											<div class="row mt-3">
												<div class="col-md-8">
													<label class="form-label">기간</label>

													<input class="form-control" id="days-count" name="days-count" placeholder="일 수 입력"  type="number"  maxlength="25">
												</div>
											</div>
											<div class="row mt-3">
												<div class="col-md-12">
													<div class="form-group">
														<label class="form-label">빈도수 설정</label>
														<div class="demo-radio-button">
															<input name="group1" name="frequency_radio" class="frequency_radio"  value=0.5 type="radio" id="radio_1" checked />
															<label for="radio_1">30분</label>
															<input name="group1" name="frequency_radio" class="frequency_radio" value=1 type="radio" id="radio_2" /> 
															<label for="radio_2">1시간</label> 
															<input name="group1" name="frequency_radio" class="frequency_radio" value=2 type="radio" class="with-gap" id="radio_3" />
															<label for="radio_3">2시간</label> 
															<input name="group1" name="frequency_radio" class="frequency_radio" value=3 type="radio" id="radio_4" class="with-gap" />
															<label for="radio_4">3시간</label>
															
														<input hidden="true" name="frequency" value=0.5 id="hidden_freq">
														</div>
													</div>
												</div>
											</div>


										</section>
										<!-- Step 2 -->
										<!-- Step 3 -->
										<h6>결제 설정</h6>
										<section>
											<div class="row">
												<div class="col-md-6">
													
													<div class="form-group">
														<label for="int234" class="form-label">Card Number :</label> <input type="text" class="form-control" id="int234" placeholder="" value="23124567854356">
													</div>

													<div class="form-group">
														<div class="row">
															<div class="col-4">
																<label for="intType1" class="form-label">만료 월 :</label> <select class="form-select" id="intType1" data-placeholder="Exp Month" name="intType1">
																	<option value="">Select</option>
																	<option value="01">01</option>
																	<option value="02">02</option>
																	<option value="03">03</option>
																	<option value="04" selected="">04</option>
																	<option value="05">05</option>
																	<option value="06">06</option>
																	<option value="07">07</option>
																	<option value="08">08</option>
																	<option value="09">09</option>
																	<option value="10">10</option>
																	<option value="11">11</option>
																	<option value="12">12</option>
																</select>
															</div>
															<div class="col-4">
																<label for="intType1" class="form-label">만료 연도 :</label> <select class="form-select" id="intType12" data-placeholder="Exp Year" name="intType12">
																	<option value="">Select</option>
																	<option value="2018">2018</option>
																	<option value="2019">2019</option>
																	<option value="2020">2020</option>
																	<option value="2021" selected="">2021</option>
																	<option value="2022">2022</option>
																	<option value="2023">2023</option>
																	<option value="2024">2024</option>
																</select>
															</div>
															<div class="col-4">
																<label for="intType1" class="form-label">CVV :</label> <input type="number" class="form-control" name="billing_card_cvv" placeholder="" value="450">
															</div>
														</div>

													</div>
													
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<label for="int123" class="form-label">카드 주인 이름 :</label> <input type="text" class="form-control" id="int123">
													</div>

													
													
												</div>
											</div>
										</section>
										<!-- Step 4 -->
										<h6>제출</h6>
										<section>
											<div class="row">
												<div class="col-12">
													<div class="form-group">
														<label for="decisions1" class="form-label">비고</label>
														<textarea name="note" id="decisions1" rows="4" class="form-control"></textarea>
													</div>
													<div class="form-group">
														<div class="c-inputs-stacked">
															<input type="checkbox" id="checkbox_1"> <label for="checkbox_1" class="d-block">이용약관에 명시된 조건을 읽었으며 이에 동의함을 나타내려면 여기를 클릭하십시오.</label>
														</div>
													</div>
												</div>
											</div>
										</section>
									</form>
								</div>
								<!-- /.box-body -->
							</div>
						</div>
					</div>
				</section>
	</div>
			</section>
	
	<footer class="footer_three" style="background-color:white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>
	<div class="control-sidebar-bg"></div>
	
		<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>	
	<!-- Corenav Master JavaScript -->
    <script src="${ pageContext.request.contextPath }/resources/home/corenav-master/coreNavigation-1.1.3.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/home/js/nav.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	
	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>	
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>

<%-- 	<script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script>
 --%>	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>	
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-tagsinput/dist/bootstrap-tagsinput.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/select2/dist/js/select2.full.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/moment/min/moment.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-daterangepicker/daterangepicker.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_plugins/timepicker/bootstrap-timepicker.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_plugins/iCheck/icheck.min.js"></script>
	
	<!-- Crypto Admin App -->
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script> --%>
	
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/pages/advanced-form-element.js"></script> --%>

	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-steps-master/build/jquery.steps.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-validation-1.17.0/dist/jquery.validate.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/steps.js"></script>
	
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-colorpicker/dist/js/bootstrap-colorpicker.min.js"></script>
		

	

</body>          
</html>