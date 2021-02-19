<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Dashboard</title>
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



  <style>
    .container-xl {
      max-width: 1620px;
    }

    .mingu * {
      transition: all 1s;
    }


    body {
      font-family: "Lato", sans-serif;
    }

    .sidenav {
      height: 100vh;
      width: 0;
      right: 0;
      position: fixed;
      top: 57px;
      padding-bottom: 56px;
      z-index: -1;
      background-color: white;
      overflow-x: hidden;
      transition: 0.5s;
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


    @media screen and (max-height: 450px) {
      .sidenav {
        padding-top: 15px;
      }

      .sidenav a {
        font-size: 18px;
      }
    }
  </style>

  <script>
    var flag = false;

    function openNav() {
      if (flag) {
        document.getElementById("mySidenav").style.width = "0px";

        flag = false;
      } else {

        document.getElementById("mySidenav").style.width = "250px";
        flag = true;
      }



    }
  </script>
</head>
<body class="antialiased sidebar-closed sidebar-collapse">
	<div class="page">
	    <header class="navbar navbar-expand-md navbar-light d-print-none">
        <div class="container-xl">
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-menu">
            <span class="navbar-toggler-icon"></span>
          </button>
          <h1 class="navbar-brand navbar-brand-autodark d-none-navbar-horizontal pe-0 pe-md-3">
            <a href=".">
              AtoZ
            </a>
          </h1>
          <div class="navbar-nav flex-row order-md-last">
            
            <div class="nav-item" style="">
				<ul class="quick-menu" style="height:48px; display: flex; list-style: none; padding: 0px; margin: 0px;">
		          <li style="margin:0px 5px; ">
		            <div style="line-height: 48px;">042-222-8202</div>
		          </li>
		          <li style="margin:0px 5px;">
		            <div style="line-height: 48px;">
		            	<button style="height: 32px;" class="btn btn-dark open-modal" data-page="contactus" title="상담요청">계약요청</button>
		            </div>
		          </li>
		          <li style="margin:0px 5px;">
		          	<div style="line-height: 48px;">
			            <button style="height: 32px;" class="btn btn-dark open-modal" data-page="demo" title="데모체험">회원가입</button>
		          	</div>
		          </li>
		          <li style="margin:0px 5px;">
		          	<div style="line-height: 48px;">
			            <button style="height: 32px;" class="btn btn-dark open-modal" data-page="demo" title="데모체험">로그인</button>
		          	</div>
		          </li>
		        </ul>
            </div>

          </div>
        </div>
      </header>
      