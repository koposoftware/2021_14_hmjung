<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!-- sidebar-->        
    

<style>

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 20;
  top: 0;
  left: 0;
  background-color: white;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #818181;
  display: block;
  transition: 0.3s;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

</style>

<div id="mySidenav" class="sidenav">
	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	<c:if test="${not empty followerLeagueList}">
		
		<c:forEach items="${ followerLeagueList}" var="follower" varStatus="loop">
			<div class="subscribedPerson">
			<a href="#" onclick="openForm('${follower.id}' ,'${userVO.id }' )"> 		
			<img style="width:30px;" src="${ pageContext.request.contextPath }/resources/images/tier/${follower.tier }.png" alt="...">
					
				${follower.id }
					<c:if test="${follower.loggedIn eq 'true'}">
						<small style="color: green; font-size: xx-small;">로그인중</small>
					</c:if>
					<c:if test="${follower.loggedIn ne 'true'}">
						<small style="color: red; font-size: xx-small;">로그아웃됨</small>
					</c:if>
					
				</a>
			</div>
		</c:forEach>
		
	</c:if>	
</div>


<script>
function openNav() {
	$("#mySidenav").show()
  document.getElementById("mySidenav").style.width = "250px";
}

function closeNav() {
	$("#mySidenav").hide()
  document.getElementById("mySidenav").style.width = "0";
}
</script>

<%--  

    <div class="modal modal-left fade" id="modal-left" tabindex="-1">
	  <div class="modal-dialog" style="width:25%">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">구독</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">

				<c:if test="${not empty followerLeagueList}">
						<c:forEach items="${ followerLeagueList}" var="follower" varStatus="loop">
					<div class="row" class="subscribedPerson">

							<div class="col-md-3">
								<a href="#" class="avatar avatar-small" onclick="openForm('${follower.id}' ,'${userVO.id }' )">
									<img src="${ pageContext.request.contextPath }/resources/images/tier/${follower.tier }.png" alt="...">
								</a>
							</div>
							<div class="col-md-3">${follower.id }</div>
							<div class="col-md-4">
								<c:if test="${follower.loggedIn eq 'true'}">
									<small style="color: green; font-size: xx-small;">로그인중</small>
								</c:if>
								<c:if test="${follower.loggedIn ne 'true'}">
									<small style="color: red; font-size: xx-small;">로그아웃됨</small>
								</c:if>
							</div>
						</div>
					</c:forEach>
					</c:if>
					
					<c:if test="${not empty followerLeagueList}">
						<c:forEach items="${ followerLeagueList}" var="follower" varStatus="loop">
							<c:if test="${loop.index < 5}">
								<li class="subscribedPerson"><a href="#" class="avatar avatar-small" onclick="openForm('${follower.id}' ,'${userVO.id }' )">
										<img src="${ pageContext.request.contextPath }/resources/images/tier/${follower.tier }.png" alt="..."> 
										${follower.id }
										<c:if test="${follower.loggedIn eq 'true'}">
											<small style="color: green; font-size: xx-small;">로그인중</small>
										</c:if>
										<c:if test="${follower.loggedIn ne 'true'}">
											<small style="color: red; font-size: xx-small;">로그아웃됨</small>
										</c:if>
									</a></li>
							</c:if>
						</c:forEach>
					</c:if>

				
			</div>
			<div class="modal-footer modal-footer-uniform">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="close-sidebar" >Close</button>
			</div>
		</div>
	</div>
	</div>
	 --%>
	