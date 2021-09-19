<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style>

#winstockLogo{
	-moz-transform:scale(0.5);
	-webkit-transform:scale(0.5);
	transform:scale(0.5);
}
</style>

<script src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>


<%-- 	<div class="nav-header"> <a href="${ pageContext.request.contextPath }/" style="padding:10px;" class="brand"> <img id="headLogo" src="${ pageContext.request.contextPath }/resources/images/gc_transparent2.png" alt="" /></a>						
 --%>

	<div class="d-flex align-items-center logo-box justify-content-start">
		<!-- Logo -->
		<div class="align-items-center">
		<a href="${ pageContext.request.contextPath }/" class="logo" class="align-items-center"> <!-- logo-->
				<span class="light-logo w-150" style="margin-left:10%;"><img src="${ pageContext.request.contextPath }/resources/images/gc_transparent2.png" alt="logo"></span>
		</a>
		</div>
	</div>
	<!-- Header Navbar -->
	<nav class="navbar navbar-static-top">
		<!-- Sidebar toggle button-->
		<div class="app-menu">
			<ul class="header-megamenu nav">
				<li id="sidebar-toggle" class="btn-group nav-item"><a href="#" class="waves-effect waves-light nav-link push-btn btn-primary-light" data-toggle="push-menu" role="button"> <i data-feather="align-left"></i>
				</a></li>
				<li class="btn-group nav-item d-none d-xl-inline-block"><a href="contact_app_chat.html" class="waves-effect waves-light nav-link svg-bt-icon btn-primary-light" title="Chat"> <i data-feather="message-circle"></i>
				</a></li>
				<li class="btn-group nav-item d-none d-xl-inline-block"><a href="mailbox.html" class="waves-effect waves-light nav-link svg-bt-icon btn-primary-light" title="Mailbox"> <i data-feather="at-sign"></i>
				</a></li>
				<li class="btn-group nav-item d-none d-xl-inline-block"><a href="extra_taskboard.html" class="waves-effect waves-light nav-link svg-bt-icon btn-primary-light" title="Taskboard"> <i data-feather="clipboard"></i>
				</a></li>
			</ul>
		</div>

		<div class="navbar-custom-menu r-side">
			<ul class="nav navbar-nav">
				<li class="btn-group d-lg-inline-flex d-none">
					<div class="app-menu">
						<div class="search-bx mx-5">
							<form>
								<div class="input-group">
									<input type="search" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn" type="submit" id="button-addon3">
											<i data-feather="search"></i>
										</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</li>
				<li class="btn-group nav-item d-lg-inline-flex d-none"><a href="#" data-provide="fullscreen" class="waves-effect waves-light nav-link full-screen btn-primary-light" title="Full Screen"> <i data-feather="maximize"></i>
				</a></li>
				<!-- Notifications -->
				<li class="dropdown notifications-menu"><a href="#" class="waves-effect waves-light dropdown-toggle btn-primary-light" data-bs-toggle="dropdown" title="Notifications"> <i data-feather="bell"></i>
				</a>
					<ul class="dropdown-menu animated bounceIn">

						<li class="header">
							<div class="p-20">
								<div class="flexbox">
									<div>
										<h4 class="mb-0 mt-0">Notifications</h4>
									</div>
									<div>
										<a href="#" class="text-danger">Clear All</a>
									</div>
								</div>
							</div>
						</li>

						<li>
							<!-- inner menu: contains the actual data -->
							<ul class="menu sm-scrol">
								<li><a href="#"> <i class="fa fa-users text-info"></i> Curabitur id eros quis nunc suscipit blandit.
								</a></li>
								<li><a href="#"> <i class="fa fa-warning text-warning"></i> Duis malesuada justo eu sapien elementum, in semper diam posuere.
								</a></li>
								<li><a href="#"> <i class="fa fa-users text-danger"></i> Donec at nisi sit amet tortor commodo porttitor pretium a erat.
								</a></li>
								<li><a href="#"> <i class="fa fa-shopping-cart text-success"></i> In gravida mauris et nisi
								</a></li>
								<li><a href="#"> <i class="fa fa-user text-danger"></i> Praesent eu lacus in libero dictum fermentum.
								</a></li>
								<li><a href="#"> <i class="fa fa-user text-primary"></i> Nunc fringilla lorem
								</a></li>
								<li><a href="#"> <i class="fa fa-user text-success"></i> Nullam euismod dolor ut quam interdum, at scelerisque ipsum imperdiet.
								</a></li>
							</ul>
						</li>
						<li class="footer"><a href="#">View all</a></li>
					</ul></li>

				<!-- User Account-->
				<li class="dropdown user user-menu"><a href="#" class="waves-effect waves-light dropdown-toggle btn-primary-light" data-bs-toggle="dropdown" title="User"> <i data-feather="user"></i>
				</a>
					<ul class="dropdown-menu animated flipInX">
						<li class="user-body"><a class="dropdown-item" href="#"><i class="ti-user text-muted me-2"></i> Profile</a> <a class="dropdown-item" href="#"><i class="ti-wallet text-muted me-2"></i> My Wallet</a> <a class="dropdown-item" href="#"><i class="ti-settings text-muted me-2"></i> Settings</a>
							<div class="dropdown-divider"></div> <a class="dropdown-item" href="#"><i class="ti-lock text-muted me-2"></i> Logout</a></li>
					</ul></li>

				<!-- Control Sidebar Toggle Button -->
				<li><a href="#" data-toggle="control-sidebar" title="Setting" class="waves-effect waves-light btn-primary-light"> <i data-feather="settings"></i>
				</a></li>

			</ul>
		</div>
	</nav>
