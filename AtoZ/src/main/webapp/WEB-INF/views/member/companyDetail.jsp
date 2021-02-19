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
	<strong style="font-size:1.2rem;">기업회원 상세보기</strong>
</div>

<div class="card">
	<div class="card-body">
		<div class="row">
			<div class="col-4"><strong>회원 아이디</strong></div>
			<div class="col-8" id="c_id"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>기업명</strong></div>
			<div class="col-8" id="c_name"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>대표자명</strong></div>
			<div class="col-8" id="c_ceo"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>사업자등록번호</strong></div>
			<div class="col-8" id="c_regno"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>이메일</strong></div>
			<div class="col-8" id="c_email"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>전화번호</strong></div>
			<div class="col-8" id="c_tel"></div>
		</div>
		<hr/>
		<div id="commapspace" class="row">
			<div class="col-4"><strong>주소</strong></div>
			<div class="col-8" style="margin-bottom:3%;" id="c_addr"></div>
		</div>
	</div>
</div>

<div style="margin-top:2%; margin-left:5%;">
<%-- <c:if test="${loginUser.cl_id eq client.cl_id }"> --%>
<!-- 	<input type="button" class="btn btn-white" id="modifyBtn" value="수정"/> -->
<!-- 	<input type="button" class="btn btn-white" id="removeBtn" style="margin:0% 2% 0% 2%;" value="삭제"/> -->
<%-- </c:if> --%>
<input type="button" class="btn btn-white" id="cancelBtn" value="취소" onclick="closeDial($('#dialog1'))"/>
</div>
<script>
function closeComDetail() {
	$('#commap').remove();
}
</script>