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

<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">	  
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">



<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>

<style>
.chatDirect{
  position: fixed;
  bottom: 0;
  right: 0;
  width: 300px;
  border: 1px solid gray;
  background-color:white;
}

</style>

<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/dash/js/includeUtil/sidebar.js"></script>
<script>



    myid = '${userVO.id}'
    openDirect('${userVO.id}')


	tiermap = {		
		"BRONZE" : "브론즈",
		"SILVER" : "실버",
		"GOLD" : "골드",
		"CHALLENGER" : "챌린저"			
	}
	
	
	mytier = tiermap['${leagueAccountVO.tier}']
	
	
	$(document).ready(function() {	
		let fullMsg = '${msg}'
		// 자바스크립트 여기
		if (fullMsg != null && fullMsg != "") {
			myAlarm(fullMsg)
		}
		
		$("#my-tier").text(mytier)
		
		$(".ago").each(function(){
			time = timeago($(this).text())
			$(this).text(time)
		})
		
		$('.check-msg').click(function(){
			console.log($(this).attr("id"))
			no =  parseInt ($(this).attr("id").split("_")[1])
			console.log("no : " + no)
			checkMsg( no)
		})

	})
	
	
	function timeago(date) {
		var t = new Date(date);
		var seconds = Math.floor((new Date() - t.getTime()) / 1000);
		if(seconds>86400) return t.toISOString().substring(0, 10);
		if(seconds>3600) return Math.floor(seconds/3600)+"시간전";
		if(seconds>60) return Math.floor(seconds/60)+"분전";
		return "방금";
	}
	
	
	function checkMsg( no){
		$.ajax({type : 'get',
      		url : "${pageContext.request.contextPath }/ajax/message/checkMessage.json",
      		data : {no : no
      		},
      		contentType : "application/x-www-form-urlencoded;charset=ISO-8859-15",
      		datatype : 'json',
      		success : function(result) {	      			
      			console.log(result)
      			$("#msgbox_" + String(no) ).hide()
      		},
      		error : function() {
      			console.log("error")
      			}
			})
			
		}

	
</script>

</head>


<body class="theme-success" style="background-color: white;">



	<header class="header-light">
		<jsp:include page="/resources/home/include/header.jsp" />
	</header>
	
	<aside>
		<jsp:include page="/resources/dash/include/sidebar.jsp" />
	</aside>	

	<section class="content row" style="background-color: #f5f5f5;">
		
		<div class="col-md-2" style="display: none" id="mySidebar2" style="left: 0;">		
			<button onclick="w3_close()" class="w3-bar-item w3-large">Close &times;</button>
		</div>

		<div class="container col-md-10">
			<div class="row">
				<div class="box bg-hexagons-white ">
					<div class="box-body">
						<div class="row">
							<div class="col-md-3 col-12">
								<div class="text-center">
									<h1 class="text-bold">${leagueAccountVO.id}</h1>
								</div>
							</div>
							<div class="col-md-3 col-12">
								<div class="text-center">
									<h1 class="text-bold">
										$<span class="count">${leagueAccountVO.balance}</span>
									</h1>
									<hr class="w-50 my-5 mx-auto b-3 border-primary">
									<h5 class="mt-10">잔액</h5>
								</div>
							</div>
							<div class="col-md-3 col-12">
								<div class="text-center">
									<h1 class="text-bold">
										<span class="count">${fn:length(leagueFollowList)}</span>명
									</h1>
									<hr class="w-50 my-5 mx-auto b-3 border-primary">
									<h5 class="mt-10">구독자</h5>
								</div>
							</div>
							<div class="col-md-3 col-12">
								<div class="text-center">
									<h1 class="text-bold">
										<span class="count">${totalstockCounts}</span>개
									</h1>
									<hr class="w-50 my-5 mx-auto b-3 border-primary">
									<h5 class="mt-10">보유 주</h5>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-12">

					<div class="box">

						<div class="box-body">
							<strong>구독자</strong>

							<div class="table-responsive">
								<table id="example5" class="table table-hover">
									<thead>
										<tr>
											<th>티어</th>
											<th>아이디</th>
											<th>잔액</th>
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
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<!-- /.box-body -->
					</div>

				</div>

				<div class="col-lg-6 col-12">
					<div class="box">
						<div class="box-header with-border ui-sortable-handle">
							<h4 class="box-title">메시지 함</h4>
							<ul class="box-controls pull-right">
								<li><a class="box-btn-close" href="#"></a></li>
								<li><a class="box-btn-slide" href="#"></a></li>
								<li><a class="box-btn-fullscreen" href="#"></a></li>
							</ul>
						</div>
						<div class="box-body p-10">
							<ul class="todo-list">
								<c:forEach items="${ messageList }" var="messageVO" varStatus="loop">
									<li class="b-1 p-0 mb-15" id="msgbox_${messageVO.no}">
										<div class="position-relative p-20">
											<!-- drag handle -->
											<div class="handle handle2"></div>
											<!-- checkbox -->

											<label for="basic_checkbox_19" class="mb-0 h-15"></label>
											<!-- todo text -->
											<span class="fs-18">${messageVO.fromId }</span>
											<!-- General tools such as edit or delete-->
											<div class="pull-right text-dark">
												<a id="msg_${messageVO.no }" class="check-msg">
													<em class="ago ms-15">${messageVO.time }</em> <i class="fa fa-trash-o ms-15"></i>
												</a>
											</div>
											<div class="mt-5">${messageVO.content }</div>

										</div>
									</li>
								</c:forEach>
							</ul>




						</div>
					</div>
				</div>



			</div>



		</div>
	</section>



	<footer class="footer_three" style="background-color: white;">
		<jsp:include page="/resources/home/include/footer.jsp" />
	</footer>


	<!-- Vendor JS -->
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/vendors.min.js"></script> --%>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.resize.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.pie.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/Flot/jquery.flot.categories.js"></script>

	<!-- Crypto Admin App -->
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/template.js"></script> --%>

	<script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/jquery-toast-plugin-master/src/jquery.toast.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/notification.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/datatable/datatables.min.js"></script>
	<%-- <script src="${ pageContext.request.contextPath }/resources/dash/js/pages/data-table.js"></script> --%>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/countdown/countdown.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>
	<!-- Corenav Master JavaScript -->
	<script src="${ pageContext.request.contextPath }/resources/home/corenav-master/coreNavigation-1.1.3.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/home/js/nav.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>

	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>

	<script>
	
        $('.count').each(function () {
			$(this).prop('Counter',0).animate({
				Counter: $(this).text()
			}, {
				duration: 4000,
				easing: 'swing',
				step: function (now) {
					$(this).text(Math.ceil(now));
				}
			});
		}); 
        
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
    	 	$('.dataTables_length').hide()
    	})
        
    </script>


</body>
</html>