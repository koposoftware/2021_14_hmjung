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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
	<script>
	modelUsage = '${modelUsage}'
	
	
	$(document).ready(function() {	
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}
		
		$(".unixtime").each(function() {
			cval = $(this).text()
			cvalList = cval.split("~")
			beginTime = moment.unix(cvalList[0]).format('YYYY/MM/DD')
			endTime = moment.unix(cvalList[1]).format('YYYY/MM/DD')
			val = String(beginTime) + "~" + String(endTime)
			$(this).text(val)
		})
		
		$(".detailbox").each(function(){
			$(this).hide()
		})		
				
		$(".init .init-btn").trigger("click")
		
		
		
		$("#delete-confirm").click(function(){
			password = $("#user_password").val()
			no = $("#hidden_no").val()
			
			$.ajax({type : 'get',
      		url : "${pageContext.request.contextPath}/ajax/ai/deleteModel.json",
      		data : {
      			no : no,
      			password : password	      			
      		},
      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
      		datatype : 'json',
      		success : function(result) {	      				      			
      			if(result["result"] == "success"){
      				console.log("삭제 완료")
      				$(".index_" + no).remove() 				
      			}else{
      				mayAlarm(result["msg"])	      				
      			}		
      		},
      		error : function() {
      			console.log("error")
      			}
			})		
		})			
	
	
	})
	
	
	
	function detail(modelName){
		$(".model-tr").each(function(){
			$(this).css("background-color" , "white");
		})		
		$("#box_" + modelName).css("background-color" , "#D8D8D8")
		
		$(".detailbox").each(function(){
			$(this).hide()
		}) 
		$("#detail_" + modelName).show()		
	}
	
	function deleteModel(no){
		$("#hidden_no").val(no)
		$("#delete").trigger("click")				
	}
	
	
	
	

	
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
					<div class="col-12">
						<div class="box">
							<div class="box-header">
																
								<c:forEach items="${ modelList }" var="model" varStatus="loop">								
									<div class="detailbox index_${model.no }" id="detail_${model.modelName }">									 
									<h3>모델 이름 : ${model.modelName }</h3>
									<h5><span class="unixtime">${model.startUnixTime}~${model.endUnixTime}</span></h5>
									<hr>
									<div class="row">										
										<div class="col-md-4 text-center box-title align-items-start flex-column">
											 <h4>모델 학습 데이터 추론 결과</h4>
											<img alt="" src="${ pageContext.request.contextPath }/resources/greencamel_api/${model.symbol }/${model.modelName }/train_result.png">
										</div>
										<div class="col-md-4 text-center box-title align-items-start flex-column">
										<h4>모델 검증 데이터 추론 결과</h4>
 											<img alt="" src="${ pageContext.request.contextPath }/resources/greencamel_api/${model.symbol }/${model.modelName }/test_result.png">
										</div>
										<div class="col-md-4 text-center box-title align-items-start flex-column">
										 <h4>학습 손실 로그</h4> 
											<img alt="" src="${ pageContext.request.contextPath }/resources/greencamel_api/${model.symbol }/${model.modelName }/loss_result.png">											
										</div>																				
									</div>
									
									<div class="row mb-30">
										<div class="col-12 col-lg-4 text-center">
										  <h5 class="p-15 mb-0"><strong>검증 데이터 비율:</strong><fmt:formatNumber type="number" maxFractionDigits="2" minFractionDigits="2" value="${1 - model.trainRatio }"/></h5>
										  <h5 class="p-15 mb-0"><strong>스텝 사이즈:</strong> ${model.lb }일</h5>
  										  <h5 class="p-15 mb-0"><strong>최종 학습 손실 값:</strong><fmt:formatNumber type="number" maxFractionDigits="5" minFractionDigits="5" value="${model.lastLoss }"/></h5>										  
										</div>
										<div class="col-12 col-lg-4 text-center">
										  <h5 class="p-15 mb-0"><strong>학습 수행 횟수(epoch):</strong>${model.trainEpoch } </h5>
										  <h5 class="p-15 mb-0"><strong>노드 개수(LSTM):</strong> ${model.layerNode }</h5>
										  <h5 class="p-15 mb-0"><strong>최종 검증 손실 값:</strong><fmt:formatNumber type="number" maxFractionDigits="5" minFractionDigits="5" value="${model.lastValLoss }"/></h5>										  										  
										</div>
										<div class="col-12 col-lg-4 text-center">
										  <h5 class="p-15 mb-0"><strong>옵티마이저:</strong> ${model.trainingOptimizer }</h5>
										  <h5 class="p-15 mb-0"><strong>손실함수:</strong><span> ${model.trainingLossFunc }</span></h5>
										</div>
									  </div>
									  
									  <c:if test="${model.flag eq 'true' }">
									  	<span class="badge badge-pill badge-success">현재 배포중</span>
									  </c:if>
									  <c:if test="${model.flag ne 'true' }">
									  	<form method="post">
									  	<input type="text" hidden="true" name="symbol"  value="${model.symbol }" >
									  	<input type="text" hidden="true" name="modelName"  value="${model.modelName }" >
									  	<button type="submit" class="waves-effect waves-light btn btn-outline btn-success mb-5">이 모델 배포 하기</button>									  	
									  	</form>
									  </c:if>																												
									</div>																	
								</c:forEach>																
							</div>
							<div class="box-body py-0">							
								<div class="table-responsive">
									<table class="table no-border">
										<thead>
											<tr class="text-start">
												<th style="min-width: 200px">모델 이름</th>
												<th style="min-width: 150px">학습 데이터 기간</th>
												<th style="min-width: 90px">최종 손실 값</th>
												<th class="text-end" style="min-width: 150px">상세정보/삭제	</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ modelList }" var="model" varStatus="loop">
											<c:if test="${model.flag eq 'true' }">
												<tr class="model-tr init index_${model.no }" id="box_${model.modelName }">
												<td><a href="#" class="text-dark fw-600 hover-primary fs-16">${model.modelName }</a>
												<c:if test="${model.flag eq 'true' }">
													<span class="badge badge-success">현재 배포중</span>	
												</c:if>												
												</td>												
												<td><span class="d-block unixtime">${model.startUnixTime}~${model.endUnixTime}</span></td>
												<td>
													<div class="d-flex flex-column">
														<div class="d-flex align-items-center justify-content-between text-center">															
															<fmt:formatNumber type="number" maxFractionDigits="5" minFractionDigits="5" value="${model.lastLoss }"/>																														
														</div>														
													</div>
												</td>
												<td class="text-end"><a href="#" class="waves-effect waves-light btn btn-success-light btn-circle init-btn" onclick="detail('${model.modelName}')">
														<span class="icon-Settings-1 fs-18"><span class="path1"></span><span class="path2"></span></span>
													</a> 
													<a href="#" class="waves-effect waves-light btn btn-danger-light btn-circle" onclick="deleteModel('${model.no}')">
														<span class="icon-Trash1 fs-18"><span class="path1"></span><span class="path2"></span></span>
													</a></td>																										
											</tr>
											</c:if>
											
											<c:if test="${model.flag ne 'true' }">
												<tr class="model-tr index_${model.no }" id="box_${model.modelName }">
												<td class="modelname-td">
												<a href="#" class="text-dark fw-600 hover-primary fs-16">${model.modelName }</a>
												<c:if test="${model.flag eq 'true' }">
													<span class="badge badge-success" id="using-now">현재 배포중</span>	
												</c:if>												
												</td>												
												<td><span class="d-block unixtime">${model.startUnixTime}~${model.endUnixTime}</span></td>
												<td>
													<div class="d-flex flex-column">
														<div class="d-flex align-items-center justify-content-between text-center">															
															<fmt:formatNumber type="number" maxFractionDigits="5" minFractionDigits="5" value="${model.lastLoss }"/>																														
														</div>														
													</div>
												</td>
												<td class="text-end"><a href="#" class="waves-effect waves-light btn btn-success-light btn-circle init-btn" onclick="detail('${model.modelName}')">
														<span class="icon-Settings-1 fs-18"><span class="path1"></span><span class="path2"></span></span>
													</a> 
													<a href="#" class="waves-effect waves-light btn btn-danger-light btn-circle" onclick="deleteModel('${model.no}')">
														<span class="icon-Trash1 fs-18"><span class="path1"></span><span class="path2"></span></span>
													</a></td>																										
											</tr>
											</c:if>																																															
						<button hidden="true"  id="delete" class="waves-effect waves-light btn btn-success mb-5" data-bs-toggle="modal" data-bs-target="#modal-center2">삭제</button>
											
											</c:forEach>																						
										</tbody>
									</table>
								</div>
							</div>
						</div>
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

		
	<div class="modal center-modal fade" id="modal-center2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">모델을 삭제 하시겠습니까?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
					<input hidden="true" type="text" name="no" id="hidden_no">
					<div class="modal-body">
						<p>관리자 비밀번호를 입력해주세요</p>
						<input name="password" type="password" id="user_password">
					</div>
					<div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
						<button type="button" id="delete-confirm"  data-bs-dismiss="modal" class="btn btn-primary float-end">확인</button>
					</div>
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
	<script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>
	




</body>          
</html>