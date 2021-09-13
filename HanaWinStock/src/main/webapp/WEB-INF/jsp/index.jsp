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
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/vendors_css.css">
	  
	<!-- Style-->  
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/home/css/skin_color.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/vendors_css.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/style.css">
	<link rel="stylesheet" href="${ pageContext.request.contextPath }/resources/dash/css/skin_color.css">
	<script type="text/javascript" src="${ pageContext.request.contextPath }/resources/js/jquery-3.6.0.min.js"></script>	
    <script>
     $(document).ready(function() {     	
     	let fullMsg = '${msg}'
     	if (fullMsg != null && fullMsg != "") {
     		myAlarm(fullMsg)
     	}
     })
     </script> 
  </head>

<body class="theme-warning bg-dark-body"> <!-- bg-dark-body -->
	
	<header>
		<jsp:include page="/resources/home/include/header.jsp" />
	</header>


	<div id="particles-js" class="overflow-hidden z-0"></div>
	
	<section class="h-100vh position-relative z-1" data-overlay="5"> <!-- data-overlay="5" -->
		<div class="container h-p100">
			<div class="row h-p100 align-items-center">
				<div class="col-lg-6 col-12">
					<div class="mt-80">
						<h1 class="box-title text-white mb-20 fw-500 fs-50">Real Time 투자</h1>
						<h4 class="text-white-80 fw-300 mb-30">실시간으로 주가 데이터와 AI 솔루션으로 손쉬운 금융 라이프 제공</h4>
						<div class="d-flex gap-3 justify-content-start">
							<c:if test="${ empty userVO }">
								<a href="#" class="btn btn-primary">시작하기</a>
								<a href="${pageContext.request.contextPath}/signin" class="btn btn-outline btn-primary text-white">로그인</a>
							</c:if>
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
	
	<section class="pt-50 pb-100 bg-dark-body overflow-xh" data-aos="fade-up">
		<div class="container">			
			<div class="row justify-content-center">
				<div class="col-lg-5 col-12 mb-50">
					<h1 class="mb-15 text-white text-center">What is Crypto Coin?</h1>	
					<hr class="w-100 bg-primary">
				</div>
			</div>
			<div class="row mt-30 align-items-center">
				<div class="col-lg-6 col-12">
					<p class="text-white fs-18 mb-50">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.</p>
					<p class="text-white-50 fs-16 mb-50">If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. </p>
					<div class="row">
						<div class="col-6">
							<ul class="text-white-50 fs-16 list list-unstyled mb-30">
								<li> <i class="fa fa-arrow-right"></i> Easy to use</li>
								<li> <i class="fa fa-arrow-right"></i> free support </li>
								<li> <i class="fa fa-arrow-right"></i> Awesome sliders </li>
							</ul>
						</div>
						<div class="col-6">
							<ul class="text-white-50 fs-16 list list-unstyled mb-30">
								<li> <i class="fa fa-arrow-right"></i> Email Design</li>
								<li> <i class="fa fa-arrow-right"></i> Easy to Customize pages</li>
								<li> <i class="fa fa-arrow-right"></i> Powerful Performance</li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-12 d-lg-block d-none">
					<div class="browserMockup browserMockup--perspectiveRight ms-70 position-relative">
						<div class="browserMockup__addressBar">
							<span class="browserMockup__button"></span>
							<span class="browserMockup__button"></span>
							<span class="browserMockup__button"></span>
							<span class="browserMockup__addressInput"></span>
						</div>
						<span class="homeScreenshot  homeScreenshot--mmo" style="background-position-y: 0px;"></span>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="py-20 bt-1 border-dark bg-dark-body" data-aos="fade-up">
		<div class="container">			
			<div class="row">
				<div class="col-12">
					<div class="owl-carousel owl-theme owl-btn-1" data-nav-arrow="false" data-nav-dots="false" data-items="10" data-md-items="8" data-sm-items="6" data-xs-items="4" data-xx-items="3">
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-1.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-2.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-3.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-4.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-5.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-6.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-7.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-8.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-9.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-10.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-11.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-12.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-13.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-14.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-15.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-16.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-17.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-18.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-19.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
						<div class="item"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/unilogo/uni-20.png" class="img-fluid my-15 rounded box-shadowed pull-up" alt="" ></div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<section class="pt-50 pb-100 bg-dark-body overflow-xh" data-aos="fade-up">
		<div class="container">		
			<div class="row mt-30 align-items-center">
				<div class="col-lg-6 col-12 d-lg-block d-none">
					<div class="browserMockup browserMockup--perspectiveLeft me-70 position-relative">
						<div class="browserMockup__addressBar">
							<span class="browserMockup__button"></span>
							<span class="browserMockup__button"></span>
							<span class="browserMockup__button"></span>
							<span class="browserMockup__addressInput"></span>
						</div>
						<span class="homeScreenshot  homeScreenshot--gcs" style="background-position-y: 0px;"></span>
					</div>
				</div>
				<div class="col-lg-6 col-12">
					<h1 class="mb-25 text-white">We Bring together Marketplaces & Finance</h1>
					<hr class="w-100 bg-primary ms-0">
					<p class="text-white fs-18 mb-50">The ultimate goal of CryptoCoin is to be the all-in-one solution and offer a wide array of services from market to finance.</p>
					<p class="text-white-50 fs-16 mb-50">Our clients – both corporate and private ones – will access all the services they need from a single platform. Blockchain technology gives us the chance to make your finances grow faster and give better returns.</p>
				</div>
			</div>
		</div>
	</section>
	
	<section class="py-100 bg-img countnm-bx" data-aos="fade-up" style="background-image: url(${ pageContext.request.contextPath }/resources/images/front-end-img/map.png); background-position: top center;">
		<div class="container">			
			<div class="row justify-content-center">
				<div class="col-lg-7 col-12 mb-50">
					<h1 class="mb-15 text-white text-center">Run Your ICO from Anywhere</h1>	
					<hr class="w-100 bg-primary">
					<p class="text-white text-center fs-18 mb-50">Internet access has been declared a human right by United States, its start-up culture is booming and its citizens and businesses have been able to enjoy the use of many streamlined digital public services.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<div class="text-center mb-30 mb-lg-0">
						<div class="w-80 h-80 l-h-100 rounded-circle b-1 border-white text-center mx-auto">
							<span class="text-primary fs-40 icon-User"><span class="path1"></span><span class="path2"></span></span>
						</div>
						<h1 class="my-10 text-white fw-300">$<span class="countnm">50</span></h1>
						<div class="text-uppercase text-white">billion USD — excepted revenue of coins by 2020</div>
					</div>
				</div>	
				<div class="col-lg-3 col-md-6 col-12">
					<div class="text-center mb-30 mb-lg-0">
						<div class="w-80 h-80 l-h-100 rounded-circle b-1 border-white text-center mx-auto">
							<span class="text-primary fs-40 icon-Book"></span>
						</div>
						<h1 class="my-10 text-white fw-300"><span class="countnm">100</span>+</h1>
						<div class="text-uppercase text-white">million potential clients worldwide</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<div class="text-center mb-30 mb-lg-0">
						<div class="w-80 h-80 l-h-100 rounded-circle b-1 border-white text-center mx-auto">
							<span class="text-primary fs-40 icon-Group"><span class="path1"></span><span class="path2"></span></span>
						</div>
						<h1 class="my-10 text-white fw-300"><span class="countnm">10</span>%</h1>
						<div class="text-uppercase text-white">no borders for international payments</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<div class="text-center mb-30 mb-lg-0">
						<div class="w-80 h-80 l-h-100 rounded-circle b-1 border-white text-center mx-auto">
							<span class="text-primary fs-40 icon-Globe"><span class="path1"></span><span class="path2"></span></span>
						</div>
						<h1 class="my-10 text-white fw-300"><span class="countnm">20</span>x</h1>
						<div class="text-uppercase text-white">faster transaction speed</div>
					</div>
				</div>			
			</div>
		</div>
	</section>
	
	<section class="py-50 bg-dark-body" data-aos="fade-up">
		<div class="container">			
			<div class="row justify-content-center">
				<div class="col-lg-5 col-12 mb-50">
					<h1 class="mb-15 text-white text-center">Mining with top 8 cryptocurrency start mining</h1>	
					<hr class="w-100 bg-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
						  <div class="tradingview-widget-container__widget"></div>
						  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/BTCUSD/?exchange=BITSTAMP" rel="noopener" target="_blank"><span class="blue-text">BTCUSD Rates</span></a> by TradingView</div>
						  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
						  {
						  "symbol": "BITSTAMP:BTCUSD",
						  "width": "100%",
						  "colorTheme": "dark",
						  "isTransparent": true,
						  "locale": "in"
						}
						  </script>
						</div>
						<!-- TradingView Widget END -->
					</div>			
				</div>
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
						  <div class="tradingview-widget-container__widget"></div>
						  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/ETHUSD/?exchange=BITSTAMP" rel="noopener" target="_blank"><span class="blue-text">ETHUSD Rates</span></a> by TradingView</div>
						  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
						  {
						  "symbol": "BITSTAMP:ETHUSD",
						  "width": "100%",
						  "colorTheme": "dark",
						  "isTransparent": true,
						  "locale": "in"
						}
						  </script>
						</div>
						<!-- TradingView Widget END -->
					</div>			
				</div>								 	
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
						  <div class="tradingview-widget-container__widget"></div>
						  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/LTCUSDT/?exchange=BINANCE" rel="noopener" target="_blank"><span class="blue-text">LTCUSDT Rates</span></a> by TradingView</div>
						  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
						  {
						  "symbol": "BINANCE:LTCUSDT",
						  "width": "100%",
						  "colorTheme": "dark",
						  "isTransparent": true,
						  "locale": "in"
						}
						  </script>
						</div>
						<!-- TradingView Widget END -->
					</div>			
				</div>
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
						  <div class="tradingview-widget-container__widget"></div>
						  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/XRPUSDT/?exchange=BINANCE" rel="noopener" target="_blank"><span class="blue-text">XRPUSDT Rates</span></a> by TradingView</div>
						  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
						  {
						  "symbol": "BINANCE:XRPUSDT",
						  "width": "100%",
						  "colorTheme": "dark",
						  "isTransparent": true,
						  "locale": "in"
						}
						  </script>
						</div>
						<!-- TradingView Widget END -->
					</div>			
				</div>
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
						  <div class="tradingview-widget-container__widget"></div>
						  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/XBTUSD/?exchange=BITMEX" rel="noopener" target="_blank"><span class="blue-text">XBTUSD Rates</span></a> by TradingView</div>
						  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
						  {
						  "symbol": "BITMEX:XBTUSD",
						  "width": "100%",
						  "colorTheme": "dark",
						  "isTransparent": true,
						  "locale": "in"
						}
						  </script>
						</div>
						<!-- TradingView Widget END -->
					</div>			
				</div>
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
						  <div class="tradingview-widget-container__widget"></div>
						  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/DOTUSD/?exchange=KRAKEN" rel="noopener" target="_blank"><span class="blue-text">DOTUSD Rates</span></a> by TradingView</div>
						  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
						  {
						  "symbol": "KRAKEN:DOTUSD",
						  "width": "100%",
						  "colorTheme": "dark",
						  "isTransparent": true,
						  "locale": "in"
						}
						  </script>
						</div>
						<!-- TradingView Widget END -->
					</div>			
				</div>
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
						<div class="tradingview-widget-container">
						  <div class="tradingview-widget-container__widget"></div>
						  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/DOGEUSD/?exchange=BITTREX" rel="noopener" target="_blank"><span class="blue-text">DOGEUSD Rates</span></a> by TradingView</div>
						  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
						  {
						  "symbol": "BITTREX:DOGEUSD",
						  "width": "100%",
						  "colorTheme": "dark",
						  "isTransparent": true,
						  "locale": "in"
						}
						  </script>
						</div>
						<!-- TradingView Widget END -->
					</div>			
				</div>
				<div class="col-12 col-md-6 col-xl-3">
					<div class="box bg-dark box-body pull-up">
						<!-- TradingView Widget BEGIN -->
							<div class="tradingview-widget-container">
							  <div class="tradingview-widget-container__widget"></div>
							  <div class="tradingview-widget-copyright"><a href="https://in.tradingview.com/symbols/XRPUSD/?exchange=BITFINEX" rel="noopener" target="_blank"><span class="blue-text">XRPUSD Rates</span></a> by TradingView</div>
							  <script type="text/javascript" src="https://s3.tradingview.com/external-embedding/embed-widget-single-quote.js" async>
							  {
							  "symbol": "BITFINEX:XRPUSD",
							  "width": "100%",
							  "colorTheme": "dark",
							  "isTransparent": true,
							  "locale": "in"
							}
							  </script>
							</div>
							<!-- TradingView Widget END -->
					</div>			
				</div>
			</div>
		</div>
	</section>
	
	<section class="py-50 bg-dark-body" data-aos="fade-up">
		<div class="container">			
			<div class="row justify-content-center">
				<div class="col-lg-5 col-12 mb-50">
					<h1 class="mb-15 text-white text-center">Why Crypto Currency Our most popular features</h1>	
					<hr class="w-100 bg-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-xl-3 col-md-6 col-12">
					<a href="#" class="box bg-dark-body">
						<div class="box-body">
							<span class="text-primary fs-24"><i class="fa fa-money"></i></span>
							<div class="fw-600 fs-18 mb-2 mt-5 text-white">Safe Browsing</div>
							<div class="text-white-50 fs-16">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<a href="#" class="box bg-dark-body">
						<div class="box-body">
							<span class="text-primary fs-24"><i class="fa fa-share"></i></span>
							<div class="fw-600 fs-18 mb-2 mt-5 text-white">Pro Dashboard </div>
							<div class="text-white-50 fs-16">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<a href="#" class="box bg-dark-body">
						<div class="box-body">
							<span class="text-primary fs-24"><i class="fa fa-weixin"></i></span>
							<div class="fw-600 fs-18 mb-2 mt-5 text-white">Speed Mining</div>
							<div class="text-white-50 fs-16">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</div>
						</div>
					</a>
				</div>
				<div class="col-xl-3 col-md-6 col-12">
					<a href="#" class="box bg-dark-body">
						<div class="box-body">
							<span class="text-primary fs-24"><i class="fa fa-thumbs-up"></i></span>
							<div class="fw-600 fs-18 mb-2 mt-5 text-white">Easy Wallet</div>
							<div class="text-white-50 fs-16">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</section>
	
	<section class="py-50" data-aos="fade-up" data-overlay="5">
		<div class="container">			
			<div class="row justify-content-center">
				<div class="col-lg-5 col-12 mb-50">
					<h1 class="mb-15 text-white text-center">How to Buy Our Tokens</h1>	
					<hr class="w-100 bg-primary">
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-12">
					<div class="table-responsive">
						<table class="table table-striped no-border text-white">
							<tbody>
								<tr class="bg-dark3">
									<td class="text-white-50">Start:</td>
									<td class="text-white">January 1, 2020, Monday, 11:00 AM (GMT)</td>
								</tr>
								<tr>
									<td class="text-white-50">Hard cap:</td>
									<td class="text-white">$5m</td>
								</tr>
								<tr class="bg-dark3">
									<td class="text-white-50">Soft cap:</td>
									<td class="text-white">$55m</td>
								</tr>
								<tr>
									<td class="text-white-50">Token:</td>
									<td class="text-white">STMX</td>
								</tr>
								<tr class="bg-dark3">
									<td class="text-white-50">Exchange rate:</td>
									<td class="text-white">1 ETH = 300 STMX</td>
								</tr>
								<tr class="bb-1 border-dark">
									<td class="text-white-50">Project protocol:</td>
									<td class="text-white">ERC20</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-6 col-12">
					<div class="pay-bx px-30">
						<h4 class="text-white mb-30">Payment Methods</h4>
						<div class="d-flex gap-3 mb-50">
							<a href="#" class="btn btn-dark btn-outline"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/logo-visa.png" class="max-w-50" alt="" /></a>
							<a href="#" class="btn btn-dark btn-outline"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/logo-mastercard.png" class="max-w-50" alt="" /></a>
							<a href="#" class="btn btn-dark btn-outline"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/logo-bitcoin.png" class="max-w-50" alt="" /></a>
							<a href="#" class="btn btn-dark btn-outline"><img src="${ pageContext.request.contextPath }/resources/images/front-end-img/logo-ethereum.png" class="max-w-50" alt="" /></a>
						</div>
						<h4 class="text-white mb-20">Token Contract Address</h4>						
						<p class="text-white-50 fs-18 mb-20">15xg5x5xbxbxbxb66bdx6b5xb6x6b6</p>
						<p class="text-white-50 fs-18">The following address is for the STMX token contract. It is NOT a deposit address. Do NOT send tokens to it. To deposit, use the Deposit form in the <a href="#" class="text-primary">Tokensale platform.</a></p>
					</div>
				</div>
				<div class="col-12 text-center">
					<a href="#" class="btn btn-primary mt-30">Buy Tokens</a>
				</div>
			</div>
		</div>
	</section>
	
	<footer class="footer_three">
		<div class="footer-top pt-50 bg-dark3">
            <div class="container">
                <div class="row">
					<div class="col-lg-3 col-12">
                        <div class="widget">
                            <h4 class="footer-title text-white">About</h4>
							<hr class="bg-primary mb-10 mt-0 d-inline-block mx-auto w-60">
							<p class="text-capitalize mb-20">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis exercitation ullamco laboris<br><br>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum.</p>
                        </div>
                    </div>											
					<div class="col-lg-3 col-12">
						<div class="widget">
							<h4 class="footer-title text-white">Contact Info</h4>
							<hr class="bg-primary mb-10 mt-0 d-inline-block mx-auto w-60">
							<ul class="list list-unstyled mb-30">
								<li> <i class="fa fa-map-marker"></i> 123, Lorem Ipsum, Dummy City,<br>FL-12345 USA</li>
								<li> <i class="fa fa-phone"></i> <span>+(1) 123-878-1649 </span><br><span>+(1) 123-878-1649 </span></li>
								<li> <i class="fa fa-envelope"></i> <span>hello@multipurposethemes.com </span><br><span>support@multipurposethemes.com </span></li>
							</ul>
						</div>
					</div>					
					<div class="col-12 col-lg-3">
                        <div class="widget footer_widget clearfix">
                            <h4 class="footer-title text-white">Our Gallery</h4>
							<hr class="bg-primary mb-10 mt-0 d-inline-block mx-auto w-60">
                            <ul class="list-unstyled">
								<li><a href="#">Home</a></li>
								<li><a href="#">Instant Buy & Sell</a></li>
								<li><a href="#">Trade</a></li>
								<li><a href="#">Pages</a></li>
								<li><a href="#">Blog</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
                        </div>
                    </div>
					<div class="col-lg-3 col-12">
                        <div class="widget">
                            <h4 class="footer-title text-white">Accept Card Payments</h4>
							<hr class="bg-primary mb-10 mt-0 d-inline-block mx-auto w-60">
							<ul class="payment-icon list-unstyled d-flex gap-items-1">
								<li class="ps-0">
									<a href="javascript:;"><i class="fa fa-cc-amex" aria-hidden="true"></i></a>
								</li>
								<li>
									<a href="javascript:;"><i class="fa fa-cc-visa" aria-hidden="true"></i></a>
								</li>
								<li>
									<a href="javascript:;"><i class="fa fa-credit-card-alt" aria-hidden="true"></i></a>
								</li>
								<li>
									<a href="javascript:;"><i class="fa fa-cc-mastercard" aria-hidden="true"></i></a>
								</li>
								<li>
									<a href="javascript:;"><i class="fa fa-cc-paypal" aria-hidden="true"></i></a>
								</li>
							</ul>
                            <h4 class="footer-title mt-20 text-white">Newsletter</h4>
							<hr class="bg-primary mb-4 mt-0 d-inline-block mx-auto w-60">
                            <div class="mb-20">
								<form class="" action="" method="post">
									<div class="input-group">
										<input name="email" required="required" class="form-control" placeholder="Your Email Address" type="email">
										<button name="submit" value="Submit" type="submit" class="btn btn-primary"> <i class="fa fa-envelope"></i> </button>
									</div>
								</form>
							</div>
                        </div>
                    </div>
                </div>				
            </div>
        </div>		
		<div class="footer-bottom bg-dark3">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-6 col-12 text-md-start text-center"> © 2021 <span class="text-white"> Multipurpose Themes</span>  All Rights Reserved.</div>
					<div class="col-md-6 mt-md-0 mt-20">
						<div class="social-icons">
							<ul class="list-unstyled d-flex gap-items-1 justify-content-md-end justify-content-center">
								<li><a href="#" class="waves-effect waves-circle btn btn-social-icon btn-circle btn-facebook"><i class="fa fa-facebook"></i></a></li>
								<li><a href="#" class="waves-effect waves-circle btn btn-social-icon btn-circle btn-twitter"><i class="fa fa-twitter"></i></a></li>
								<li><a href="#" class="waves-effect waves-circle btn btn-social-icon btn-circle btn-linkedin"><i class="fa fa-linkedin"></i></a></li>
								<li><a href="#" class="waves-effect waves-circle btn btn-social-icon btn-circle btn-youtube"><i class="fa fa-youtube"></i></a></li>
							</ul>
						</div>
					</div>
                </div>
            </div>
        </div>
	</footer>
	
	
	<!-- Vendor JS -->
	<script src="${ pageContext.request.contextPath }/resources/home/js/vendors.min.js"></script>	
	
	
	<!-- Corenav Master JavaScript -->
    <script src="${ pageContext.request.contextPath }/resources/home/corenav-master/coreNavigation-1.1.3.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/home/js/nav.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/OwlCarousel2/dist/owl.carousel.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/bootstrap-select/dist/js/bootstrap-select.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/home/js/particles.js"></script>
	<script src="${ pageContext.request.contextPath }/resources/home/js/app.js"></script>	
	<!-- CryptoCurrency front end -->
	<script src="${ pageContext.request.contextPath }/resources/home/js/template.js"></script>	
	<script src="${ pageContext.request.contextPath }/resources/dash/js/pages/chat-popup.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/assets/icons/feather-icons/feather.min.js"></script>	
    <script src="${ pageContext.request.contextPath }/resources/assets/vendor_components/sweetalert/sweetalert.min.js"></script>
    <script src="${ pageContext.request.contextPath }/resources/js/sweet-alert.js"></script>		 
</body>
</html>