<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <!-- sidebar-->        
    <div class="modal modal-left fade" id="modal-left" tabindex="-1">
	  <div class="modal-dialog" style="width:25%">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">구독</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
<%-- 				<table class="table table-bordered table-striped no-margin">
					<thead>
						<tr>
							<th>#</th>
							<th>#</th>
							<th>#</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${not empty followerLeagueList}">
							<c:forEach items="${ followerLeagueList}" var="follower" varStatus="loop">
								<tr class="subscribedPerson">
									<td><a href="#" class="avatar avatar-small" onclick="openForm('${follower.id}' ,'${userVO.id }' )"></a>
									<img width="5px;" src="${ pageContext.request.contextPath }/resources/images/tier/${follower.tier }.png" alt="..."> 									
									</td>
									<td>${follower.id }</td>
									<td>
										<c:if test="${follower.loggedIn eq 'true'}">
											<small style="color: green; font-size: xx-small;">로그인중</small>
										</c:if>
										<c:if test="${follower.loggedIn ne 'true'}">
											<small style="color: red; font-size: xx-small;">로그아웃됨</small>
										</c:if>
									</td>																	
								</tr>					
							</c:forEach>
						</c:if>

					</tbody>


				</table> --%>

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
					
				<%-- 	<c:if test="${not empty followerLeagueList}">
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
					</c:if> --%>

				
			</div>
			<div class="modal-footer modal-footer-uniform">
				<button type="button" class="btn btn-danger" data-bs-dismiss="modal" id="close-sidebar" >Close</button>
			</div>
		</div>
	</div>
	</div>