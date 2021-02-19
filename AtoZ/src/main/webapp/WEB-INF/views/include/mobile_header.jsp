<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
<!--   <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" /> -->
  <meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=0;"/>
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  
  <title>AtoZ</title>
  
  <!-- CSS files -->
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-flags.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-payments.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-vendors.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/demo.min.css" rel="stylesheet" />

  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/selectize/dist/css/selectize.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/flatpickr.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/nouislider/distribute/nouislider.min.css" rel="stylesheet" />


  <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
  <link href="<%=request.getContextPath()%>/resources/css/mobile.css" rel="stylesheet" />
  
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styles.css" />
  <script src="https://rawgit.com/sitepoint-editors/jsqrcode/master/src/qr_packed.js"></script>
  
</head>
<style>
	.page{
		min-height: 0vh;
	}
</style>
<body class="antialiased sidebar-closed sidebar-collapse">
	<div class="page" style="height:100%; overflow-y: auto;overflow-x: hidden;">
		<aside class="navbar navbar-vertical navbar-expand-lg navbar-light">
	      <div class="container-fluid">
	        <h1 class="navbar-brand navbar-brand-autodark" style="margin-left: 45%;">
	          <a href="m.main">
	            AtoZ
	          </a>
	        </h1>
	        <div class="navbar-nav flex-row d-lg-none">
	          <div class="nav-item dropdown">
	            <a href="#" class="nav-link d-flex lh-1 text-reset p-0" data-bs-toggle="dropdown"
	              aria-label="Open user menu">
	              <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="28" height="28" viewBox="0 0 24 24"
	                stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
	                <path stroke="none" d="M0 0h24v24H0z" fill="none" />
	                <circle cx="12" cy="7" r="4" />
	                <path d="M6 21v-2a4 4 0 0 1 4 -4h4a4 4 0 0 1 4 4v2" /></svg>
		            <div style="margin-left: 5px;">
		            	<div style="font-size: 8px;">${loginUser.emp_job}</div>
		            	<div class="mt-1 small text-muted" style="font-size: 6px;">${loginUser.emp_name}</div>
		            </div>
	            </a>
	            <div class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
	              <a href="#" class="dropdown-item">Profile</a>
	              <a href="m.logout" class="dropdown-item">Logout</a>
	            </div>
	          </div>
	        </div>
	      </div>
	    </aside>
	