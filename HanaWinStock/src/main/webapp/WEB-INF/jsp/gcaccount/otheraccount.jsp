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
<title>하나윈스톡</title>
<!-- Vendors Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">

<!-- Style-->
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>



<script>

tiermap = {		
		"BRONZE" : "브론즈",
		"SILVER" : "실버",
		"GOLD" : "골드",
		"CHALLENGER" : "챌린저"			
	}
	mytier = tiermap['${otherleagueAccountVO.tier}']
	fromId = '${userVO.id}'
	toId = '${viewId }'
	$(document).ready(function() {	
		$("#my-tier").text(mytier)
		
		fullMsg  = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}
		//view-portfolio view-transaction
		
		$("#view-portfolio").click(function() {
			location.href = "${pageContext.request.contextPath}/account/viewother/portfolio/" + '${viewId}'			
			
		})
		
		$("#view-transaction").click(function(){
			location.href = "${pageContext.request.contextPath}/account/viewother/transaction/" + '${viewId}' + "/1"			
		})
		
		$('#msg-send').click(function(){
			msg = $("#msg-content").val()
			sendMsg( msg , toId , fromId)
			$("#msg-content").val("")
		})		
	})
	

		

	function sendMsg( content , toId , fromId){
		$.ajax({type : 'get',
      		url : "${pageContext.request.contextPath }/ajax/message/sendMessage.json",
      		data : {content : content,
      				toId : toId,
      				fromId : fromId
      		},
      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
      		datatype : 'json',
      		success : function(result) {	      			
      			console.log(result)
      			myAlarm("success:success:메시지를 전송 했습니다.")
      		},
      		error : function() {
      			console.log("error")
      			}
			})
			
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
					<div class="content-header">
							<div class="d-flex align-items-center">
								<div class="me-auto">
									<h4 class="page-title">투자 대회</h4>
									<div class="d-inline-block align-items-center">
										<nav>
											<ol class="breadcrumb">
												<li class="breadcrumb-item"><a href="#">
														<i class="mdi mdi-home-outline"></i>
													</a></li>
												<li class="breadcrumb-item" aria-current="page">검색</li>
												<li class="breadcrumb-item active" aria-current="page">대회 계좌</li>
											</ol>
										</nav>
									</div>
								</div>
							</div>
						</div>
					<div class="col-md-4">
						<div class="row">
							<div class="col-md-12">
								<div class="box box-widget widget-user">
									<div class="box-body box-profile">
										<h3 class="widget-user-username text-black">${viewId }</h3>
										<%-- <h6 class="widget-user-desc text-white">${userVO.userType }</h6> --%>
										<img class="rounded img-fluid mx-auto d-block max-w-150" src="${ pageContext.request.contextPath }/resources/images/tier/${otherleagueAccountVO.tier}.png">
										<h4 class="text-center"><strong id="my-tier"></strong></h4>
									</div>

									<div class="box-footer">
										<div class="row mb-15">
											<div class="col-sm-4 text-center">
												<div class="description-block">
													<h5 class="description-header">구독자 수</h5>
													<span class="description-text">${fn:length(otherleagueFollowList)}</span>명
												</div>

											</div>
											<!-- /.col -->
											<div class="col-sm-4 be-1 bs-1 text-center">
												<div class="description-block">
													<h5 class="description-header">구독 가격</h5>
													<span class="description-text"><fmt:formatNumber value="${otherleagueAccountVO.followPrice }" type="currency" currencySymbol="$" /></span>
												</div>

											</div>
											<!-- /.col -->
											<div class="col-sm-4 text-center">
												<div class="description-block">
													<h5 class="description-header">잔액</h5>
													<span class="description-text"><fmt:formatNumber value="${otherleagueAccountVO.balance}" type="currency" currencySymbol="$" /></span>
												</div>
											</div>
											<!-- /.col -->
										</div>
										<!-- /.row -->
										<div class="row mb-30 bt-1">
											<!-- <h4 class="title w-p100 mt-10 mb-0 p-20 text-primary">리그 정보</h4> -->
										
											<h5 class="p-15 mb-0">
												<strong>시작 날짜:</strong>											
													<fmt:parseDate value="${otherleagueAccountVO.regDate}" var="parsedDate" pattern="yyyy-MM-dd HH:mm:ss"/><fmt:formatDate pattern="yyyy-MM-dd" value="${parsedDate}" />
											</h5>
											<h5 class="p-15 mb-0">
												<strong>주식 보유 개수:</strong> ${othertotalStockCounts }개

											</h5>
									<%-- 		<h5 class="p-15 mb-0">
												<strong>구독 정보:</strong> ${fn:length(otherleagueFollowList) } 명

											</h5> --%>
										</div>
										<div class="row mb-30">
											<div class="clearfix">
												<c:if test="${viewId ne userVO.id }">
													<c:if test="${subscribed eq 'true' }">
														<button type="button" id="refresh_league" class="waves-effect waves-light btn btn-danger mb-5" data-bs-toggle="modal" data-bs-target="#modal-center">구독 취소</button>
													</c:if>
													<c:if test="${subscribed eq 'false' }">
														<button type="button" id="start_league" class="waves-effect waves-light btn btn-success mb-5" data-bs-toggle="modal" data-bs-target="#modal-center2">구독</button>
													</c:if>
												</c:if>
											</div>
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>

					<div class="col-md-7">
						<c:if test="${subscribed eq 'true' }">
						<button type="button" class="waves-effect waves-light btn btn-outline btn-primary btn-lg mb-20" id="view-portfolio">포트폴리오 조회</button>
						<button type="button" class="waves-effect waves-light btn btn-outline btn-primary btn-lg mb-20" id="view-transaction">트랜잭션 조회</button>
						</c:if>
						
						<c:if test="${viewId ne userVO.id }">
							<div class="box">
								<div class="box-header with-border">
									<h4 class="box-title">메시지 보내기</h4>
								</div>
								<!-- /.box-header -->
								<div class="box-body">
									<div class="row">
										<div class="col-12">
											<div class="form-group row">

												<div class="col-sm-10">
													<textarea id="msg-content" class="form-control" placeholder="메시지 보내기"></textarea>
												</div>
											</div>
											<div class="form-group row">
												<div style="float: right;">
													<button type="button" id="msg-send" class="btn btn-primary">전송</button>
												</div>
											</div>
										</div>
										<!-- /.col -->
									</div>
									<!-- /.row -->
								</div>
							</div>
						</c:if>
						<!-- /.box-body -->
						<div class="box">
							<div class="box-body">
								<div class="table-responsive">
									<table id="example5" class="table table-hover">
										<thead>
											<tr>
												<th>티어</th>
												<th>아이디</th>
												<th>잔액</th>
												<th>구독비</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${ followerAccountList }" var="follower" varStatus="loop">
												<tr>

													<td class="w-60"><a class="avatar avatar-lg" href="#">
															<img src="${ pageContext.request.contextPath }/resources/images/tier/${follower.tier }.png" alt="...">
														</a></td>
													<td class="w-300">
														<p class="mb-0">
															<a href="${ pageContext.request.contextPath }/account/viewother/account/${follower.id }">
																<strong>${follower.id }</strong>
															</a>
															
														</p>
														<p class="mb-0"></p>
													</td>
													<td><fmt:formatNumber value="${follower.balance }" type="currency" currencySymbol="$" /></td>
													<td><fmt:formatNumber value="${follower.followPrice }" type="currency" currencySymbol="$" /></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<!-- /.box-body -->
						</div>


					</div>
				</div>
			</section>
		</div>
	</div>
	<footer class="main-footer">
		<jsp:include page="/resources/dash/include/footer.jsp" />
		&copy; 2021
		<a href="https://www.multipurposethemes.com/">Multipurpose Themes</a>
		. All Rights Reserved.
	</footer>
	<aside class="control-sidebar">
		<jsp:include page="/resources/dash/include/control-sidebar.jsp" />
	</aside>
	<div class="control-sidebar-bg"></div>
	
	
	
	<div class="modal center-modal fade" id="modal-center2" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">결제 설정</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form method="post" action="${pageContext.request.contextPath}/account/subscribe">
					<div class="modal-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label for="int123" class="form-label">카드 주인 이름 :</label>
									<input type="text" class="form-control" id="int123">
								</div>
								<div class="form-group">
									<label for="int234" class="form-label">카드 번호 :</label>
									<input type="text" class="form-control" id="int234" placeholder="" value="23124567854356">
								</div>
								
								<div class="form-group">
									<div class="row">
										<div class="col-4">
											<label for="intType1" class="form-label">만료일 :</label>
											<select class="form-select" id="intType1" data-placeholder="Exp Month" name="intType1">
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
											<label for="intType1" class="form-label">만료 연도 :</label>
											<select class="form-select" id="intType12" data-placeholder="Exp Year" name="intType12">
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
											<label for="intType1" class="form-label">CVV :</label>										
											<input type="number" class="form-control" name="billing_card_cvv" placeholder="" value="450" >
										</div>
									</div>
								</div>								
							</div>							
						</div>
						<label class="form-label">계정 비밀번호</label>
						<input name="password" class="form-control" type="password" id="user_password">
						<input hidden="true" name="viewId" class="bootstrap-tagsinput bg-transparent" type="text" id="viewId" value="${viewId}">
					</div>
					<div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary float-end">구독</button>
					</div>
				</form>
			</div>

		</div>
	</div>
	
	<div class="modal center-modal fade" id="modal-center" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">정말로 구독을 취소 하겠습니까?</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<form method="post" action="${pageContext.request.contextPath}/account/unsubscribe">
					<div class="modal-body">
					<label class="form-label">계정 비밀번호</label>
					<input name="password" class="form-control" type="password">
					<input hidden="true" name="viewId" class="bootstrap-tagsinput bg-transparent" type="text" value="${viewId}">			
					</div>
					<div class="modal-footer modal-footer-uniform">
						<button type="button" class="btn btn-danger" data-bs-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-primary float-end">확인</button>
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
	<script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/datatable/datatables.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/data-table.js"></script>
	<script>
	$(document).ready(function() {			
		$("#example5_filter").hide()
		$('th').each(function(){
			$(this).removeClass("sorting")
			$(this).removeClass("sorting_asc")
			$(this).removeAttr("aria-controls")
			$(this).removeAttr("aria-label")
		})
		
		$("#example5_previous").text("이전")
		$("#example5_next").text("다음")
		
	})
	
	
	
	</script>
	

	
</body>
</html>