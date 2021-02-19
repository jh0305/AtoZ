<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=5.0,minimum-scale=1.0,shrink-to-fit=no">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<meta http-equiv="pragma" content="no-cache">
<meta name="robots" content="index,follow">
<meta name="author" content="codecalm.net">

<title>AtoZ</title>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/homepage.css" type="">
</head>
<body>
	<div class="page">
		<header class="header js-header">
			<div class="container">
				<div class="d-flex align-items-center position-relative">
					<a href="/" class="logo"> <img src="<%=request.getContextPath()%>/resources/images/AZ.png" alt="Tabler UI Kit" title="">

					</a> <a class="header-menu-btn"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
							<line x1="3" y1="12" x2="21" y2="12"></line>
							<line x1="3" y1="6" x2="21" y2="6"></line>
							<line x1="3" y1="18" x2="21" y2="18"></line></svg>
					</a>
					<nav class="ml-auto header-nav d-md-block d-none">

						<a href="<%=request.getContextPath()%>/serviceUse/registForm" rel="nofollow" style="color: gray">이 용 신 청</a> <a href="<%=request.getContextPath()%>/serviceUse/loginForm" rel="nofollow" style="color: gray">로 그 인</a>

					</nav>
				</div>
			</div>
		</header>

		<header class="header header-sticky js-header">
			<div class="container">
				<div class="d-flex align-items-center position-relative">
					<a href="/" class="logo header-sticky"> <img src="/img/tabler.svg" alt="AtoZ logo" title="">

						<div>AtoZ</div>

					</a> <a class="header-menu-btn"> <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-menu">
							<line x1="3" y1="12" x2="21" y2="12"></line>
							<line x1="3" y1="6" x2="21" y2="6"></line>
							<line x1="3" y1="18" x2="21" y2="18"></line></svg>
					</a>
					<nav class="ml-auto header-nav d-none d-md-block">

						<a href="https://preview.tabler.io" rel="nofollow">Demo</a> <a href="https://github.com/tabler/tabler" rel="nofollow">Source code</a> <a href="/emails" rel="nofollow">Tabler Email</a>


					</nav>
				</div>
			</div>
		</header>

		<main class="main">
		<section class="welcome welcome-blue text-white" aria-label="Page header" style="background: url('<%=request.getContextPath()%>/resources/images/header.jpg') no-repeat center/cover">
			<div class="container">
				<div class="row align-items-center justify-content-between">
					<div class="col-lg-6 text-center text-lg-left pr-lg-5" style="padding: 0px;">
						<h1 class="welcome-title">쉽게 사용하고 즉시 확인하세요!</h1>
						<p class="welcome-description">기업에 필요한 모든 기능을 제공하는 100% 웹기반 WMS</p>
					</div>
					<div class="col-lg-5 pt-6 pt-lg-0">
						<div class="welcome-image welcome-image-2">

							<div class="device device-macbook-pro device-spacegray">
								<div class="device-frame">
									<picture>
									<source srcset="<%=request.getContextPath()%>/resources/images/dashboard-preview.png" type="image/webp">
									<source srcset="<%=request.getContextPath()%>/resources/images/dashboard-preview.png" type="image/png">
									<img src="<%=request.getContextPath()%>/resources/images/dashboard-preview.png" alt="ming" class="preview-image img-responsive"> </picture>
								</div>
								<div class="device-stripe"></div>
								<div class="device-header"></div>
								<div class="device-sensors"></div>
								<div class="device-btns"></div>
								<div class="device-power"></div>
							</div>
							<div style="top: 20%; right: 3%" class="image-label image-label-right d-none d-xxl-block">
								<span>Look great in every browser</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="section" aria-label="Base features">
			<div class="container">
				<h2 class="h3 section-title text-center mb-6">AtoZ는 잘 설계된 수많은 구성 요소와 기능을 제공합니다.</h2>

				<div class="row align-items-center justify-content-center">
					<div class="col-10 col-md-5 pr-md-5 mb-5 mb-md-0">
						<picture>
						<source srcset="<%=request.getContextPath()%>/resources/images/m-dashboard-preview.png" type="image/webp">
						<source srcset="<%=request.getContextPath()%>/resources/images/m-dashboard-preview.png" type="image/jpeg">
						<img src="<%=request.getContextPath()%>/resources/images/m-dashboard-preview.png" alt="" class="img-responsive"> </picture>
					</div>
					<div class="col">

						<div class="row">

							<div class="col-12 mb-5 d-flex">
								<div class="icon icon-gray mr-2">
									<svg style="margin: 20px 0px; color: #343641" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										
										<rect x="5" y="3" width="14" height="18" rx="1" />
										
										<circle cx="12" cy="17" r="1" /></svg>
								</div>
								<div>
									<h3 class="h5">모바일 시스템</h3>
									<p class="text-muted m-0">모바일 검품/재고관리 시스템은 편리한 이동성을 가지며, 통합된 솔루션으로 물류창고와 매장, 기업 본사간의 효과적인 상품 관리 솔루션 입니다.️</p>
								</div>
							</div>

							<div class="col-12 mb-5 d-flex">
								<div class="icon icon-gray mr-2">
									<svg style="margin: 20px 0px; color: #343641" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										
										<rect x="3" y="4" width="18" height="12" rx="1" />
										
										<line x1="7" y1="20" x2="17" y2="20" />
										
										<line x1="9" y1="16" x2="9" y2="20" />
										
										<line x1="15" y1="16" x2="15" y2="20" /></svg>
								</div>
								<div>
									<h3 class="h5">사용자 인터페이스</h3>
									<p class="text-muted m-0">편리한 웹 인터페이스를 제공하여 누구나 쉽게 사용 가능하며, 통합된 솔루션으로 물류창고, 기업, 지점간의 효과적인 물류유통 관리 솔루션 입니다.️</p>
								</div>
							</div>

							<div class="col-12 mb-5 d-flex">
								<div class="icon icon-gray mr-2">
									<svg style="margin: 20px 0px; color: #343641" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none" />
										
										<rect x="3" y="4" width="18" height="8" rx="3" />
										
										<rect x="3" y="12" width="18" height="8" rx="3" />
										
										<line x1="7" y1="8" x2="7" y2="8.01" />
										
										<line x1="7" y1="16" x2="7" y2="16.01" /></svg>
								</div>
								<div>
									<h3 class="h5">프로세스</h3>
									<p class="text-muted m-0">물류유통 관리 시스템은 운영 관리에 편리한 기능을 제공 하며, 효과적인 운영 관리 솔루션 입니다.</p>
								</div>
							</div>

						</div>
					</div>
				</div>

				<!--<div class="mb-xl-4 text-center text-lg-left">-->
				<!--<a href="#" class="btn btn-white">See all features</a>-->
				<!--</div>-->
			</div>
		</section>

		<section class="section text-center bg-light" aria-label="Ben Chestnut quote" style="padding: 0px; background-color: #F7FAFC;">
			<!-- 			<div class="row"> -->
			<!-- 				<div style="margin: auto;"> -->
			<!-- 					<div class="col-md-6 pr-md-7" style="display: inline-block; margin: 0px 40px;"> -->
			<!-- 						<h3 class="h4 mb-1">최근 업데이트</h3> -->

			<!-- 						<ul class="list" style="list-style: none;"> -->
			<!-- 							<li><a href="/customer-service-email.html" title="Best practices connected with customer service" class="text-inherit">모바일 WMS 기능 추가</a></li> -->
			<!-- 							<li><a href="/html-email-best-practices.html" title="10 most important things which you should keep in mind by coding HTML emails" class="text-inherit">히스토리 확인 기능 추가</a></li> -->
			<!-- 							<li><a href="/reset-password-good-practise.html" title="What should be included in reset password email" class="text-inherit"> 웹 디자인 반응형 기능 업데이트 </a></li> -->
			<!-- 							<li><a href="/user-invitation-email.html" title="What an email with user’s invitation should include" class="text-inherit">물류센터 계약 기능 삭제</a></li> -->
			<!-- 						</ul> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->

			<div class="container">
				<div style="padding-bottom: 15px;">
					<blockquote>
						<div>
							<img style="width: 70px; height: 50px; margin: 20px;" src="<%=request.getContextPath()%>/resources/images/AZ.png" alt="" class="avatar">
							<p>“더 나은 서비스를 제공하기 위해 문의 내용을 반영 및 수정했습니다. 사용에 불편함을 겪으시는 고객께서는 문의 부탁드립니다.”</p>
						</div>
						<cite><strong>TEAM SOLOGI</strong>, CEO of <strong>SungBo Jang</strong></cite>
					</blockquote>
				</div>
			</div>
		</section>

		</main>

		<footer class="footer" style="height: 70px;">
			<div class="container">
				<div class="row text-center text-lg-left">
					<div class="col-lg-6" style="line-height: 70px;">© 2021 TEAM SOLOGI</div>
				</div>
			</div>
		</footer>

	</div>
	<script src="<%=request.getContextPath()%>/resources/js/tabler-1568447964.min.js" async></script>
</body>
</html>