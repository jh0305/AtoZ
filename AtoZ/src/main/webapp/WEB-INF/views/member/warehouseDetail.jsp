<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
	hr{
		margin: 1rem 0;
	}
	.card{
		margin: 0% 2% 0% 2%;
	}
</style>
</head>
<body>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">물류센터 상세보기</strong>
</div>

<div class="card">
	<div class="card-body">
		<div class="row">
			<div class="col-4"><strong>회원 아이디</strong></div>
			<div class="col-8" id="w_id"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>기업명</strong></div>
			<div class="col-8" id="w_name"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>대표자명</strong></div>
			<div class="col-8" id="w_ceo"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>사업자등록번호</strong></div>
			<div class="col-8" id="w_regno"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>이메일</strong></div>
			<div class="col-8" id="w_email"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>전화번호</strong></div>
			<div class="col-8" id="w_tel"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>면적</strong></div>
			<div class="col-8" id="w_area"></div>
		</div>
		<hr/>
		<div id="waremapspace" class="row">
			<div class="col-4"><strong>주소</strong></div>
			<div class="col-8" style="margin-bottom:3%;" id="w_addr"></div>
		</div>
	</div>
</div>

<div style="margin-top:2%; margin-left:5%;">
<input type="button" class="btn btn-white" id="cancelBtn" value="취소" onclick="closeWareDetail();"/>
</div>
<script>
function closeWareDetail() {
	$('#waremap').remove();
	closeDial($('#dialog2'));
}
</script>