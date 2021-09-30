<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
#headLogo{
-moz-transform:scale(0.75);
-webkit-transform:scale(0.75);
transform:scale(0.75);
}

</style> 

<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>
<script>

</script>
<c:if test="${not empty  userVO}">
	<c:if test="${userVO.userType eq 1}">
		<c:if test="${not empty  leagueAccountVO}">
			<a type="button" data-bs-toggle="modal" data-bs-target="#modal-left">
				<i class="fa fa-user-o" aria-hidden="true"></i>구독
			</a>
		</c:if>
	</c:if>
</c:if>

<nav class="nav-white bg-white">


	<div class="nav-header" style="max-height:62px;"> <a href="${ pageContext.request.contextPath }/" style="margin-top:0px; padding-top:0px; padding-bottom:20px;" class="brand"> 
	<img id="headLogo" src="${ pageContext.request.contextPath }/resources/images/gc_transparent2.png" alt="" /></a>								
		
	</div>
	
	<ul class="menu">
	<%-- 	<c:if test="${not empty leagueAccountVO }">
			<li id="sidebar-toggle" class="btn-group nav-item"><a href="#" class="waves-effect waves-light nav-link push-btn btn-primary-light" data-toggle="push-menu" role="button"> <i data-feather="align-left"></i></a></li>					
		</c:if> --%>
		
		
		
		<li class="dropdown"><a href="#">계좌 페이지</a>
			<ul class="dropdown-menu">
				<li><a href="${ pageContext.request.contextPath }/account/search"><i class="ti-arrow-circle-right me-10"></i>계좌 검색</a></li>
				<li><a href="${pageContext.request.contextPath}/account/contract"><i class="ti-arrow-circle-right me-10"></i>계좌 생성</a></li>
				<li><a href="${pageContext.request.contextPath}/account/signin"><i class="ti-arrow-circle-right me-10"></i>계좌 선텍</a></li>
				<li><a href="${ pageContext.request.contextPath }/account/transaction/1"><i class="ti-arrow-circle-right me-10"></i>내 거래내역</a></li>
				<li><a href="${ pageContext.request.contextPath }/account/portfolio"><i class="ti-arrow-circle-right me-10"></i>내 포트폴리오</a></li>
				<li><a href="${ pageContext.request.contextPath }/account/channel"><i class="ti-arrow-circle-right me-10"></i>내 채널</a></li>
			</ul></li>
			
		<li class="dropdown"><a href="#">주식 서비스</a>
			<ul class="dropdown-menu">
				<li><a href="${pageContext.request.contextPath}/account/hts"><i class="ti-arrow-circle-right me-10"></i>웹트레이딩</a></li>
				<li><a href="${ pageContext.request.contextPath }/stockinfo/search"><i class="ti-arrow-circle-right me-10"></i>주식 검색</a></li>
			</ul>
		</li>
		<c:if test="${not empty userVO }">
			<c:if test="${userVO.userType eq 2 }">
				<li class="dropdown"><a href="#">광고 서비스</a>
				<ul class="dropdown-menu">
					<li><a href="${ pageContext.request.contextPath }/account/advertise/valid"><i class="ti-arrow-circle-right me-10"></i>광고주 인증 요청</a></li>
					<li><a href="${ pageContext.request.contextPath }/account/advertise/requestad"><i class="ti-arrow-circle-right me-10"></i>광고 요청</a></li>	
				</ul>
				</li>
			</c:if>			
		</c:if>
		<c:if test="${not empty userVO }">
			<c:if test="${userVO.userType eq 3 }">
				<li class="dropdown"><a href="#">관리자 페이지</a>
			<ul class="dropdown-menu">
				<li><a href="${ pageContext.request.contextPath }/account/advertise/checkvalid"><i class="ti-arrow-circle-right me-10"></i>광고주 검증</a></li>
				<li><a href="${ pageContext.request.contextPath }/account/advertise/requestadcheck"><i class="ti-arrow-circle-right me-10"></i>광고 요청 검증</a></li>	
				<li><a href="${ pageContext.request.contextPath }/artificial/createModel"><i class="ti-arrow-circle-right me-10"></i>AI 학습</a></li>	
				<li><a href="${ pageContext.request.contextPath }/artificial/manageModel"><i class="ti-arrow-circle-right me-10"></i>AI 보드</a></li>	
			</ul></li>
			</c:if>			
		</c:if>
		
		<c:if test="${not empty userVO }">
		<li><a href="${pageContext.request.contextPath}/signout">로그아웃</a></li>
		<li><a href="${pageContext.request.contextPath}/modifyinfo">회원정보 수정</a></li>
		</c:if>
		
	</ul>
	<ul class="attributes">
	<c:if test="${ empty userVO }">
			<li class="d-md-block d-none"><a href="${pageContext.request.contextPath}/signin" class="px-10 pt-15 pb-10"><div class="btn btn-outline btn-primary py-5">로그인</div></a></li>
			<li class="d-md-block d-none"><a href="${pageContext.request.contextPath}/signcontract" class="px-10 pt-15 pb-10"><div class="btn btn-primary py-5">회원가입</div></a></li>	
	</c:if>
	<c:if test="${not empty userVO }">
		<c:if test="${userVO.userType eq 1 }">
			<li class="d-md-block d-none"><a href="${pageContext.request.contextPath}/account/hts" class="px-10 pt-15 pb-10"><div class="btn btn-primary py-5">웹 트레이딩 시작</div></a></li>	
		</c:if>
	</c:if>
		
	</ul>	
</nav>

