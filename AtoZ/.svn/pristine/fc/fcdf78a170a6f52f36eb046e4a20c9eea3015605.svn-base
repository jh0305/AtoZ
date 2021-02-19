<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-flags.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-payments.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-vendors.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/demo.min.css" rel="stylesheet" />

  <link href="<%=request.getContextPath()%>/resources/css/jquery-ui.min.css" rel="stylesheet" />

  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/selectize/dist/css/selectize.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/flatpickr.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/nouislider/distribute/nouislider.min.css" rel="stylesheet" />
<title>Insert title here</title>
</head>
<body>
<div class="container-tight py-6" style="position:absolute; top: 15%; left:37.5%;">
	<div class="text-center mb-4" >
		<img src="<%=request.getContextPath() %>/resources/images/AZ.png" height="70">
	</div>
	<div class="card card-md">	
		<div class="card-body">
			<h2 class="card-title text-center mb-4">비밀번호 재설정</h2>
			<div class="mb-3">
				<label class="form-label">비밀번호</label>
				<input type="password" class="form-control" id="cl_pwd" placeholder="영어 대소문자,숫자 ,특수문자 8-16자리">
				<div class="cl_pwd regex"></div>
			</div>
			<div class="mb-3">
				<label class="form-label">비밀번호 확인</label>
				<input type="password" class="form-control" id="cl_pwd_confirm" placeholder="영어 대소문자,숫자 ,특수문자 8-16자리" >
				<div class="cl_pwd2 regex"></div>
			</div>
			<div class="form-footer">
				<input type="button" class="btn btn-light" onclick="changePwd();" value="비밀번호 변경" style="width:100%;"/>
			</div>
		</div>
	</div>
	<form role="form" class="card card-md" method="post" action="<%=request.getContextPath()%>/serviceUse/changePwd">
		<%
			if(session.getAttribute("id")==null||session.getAttribute("id").equals("")){
		%>
 				<script> 
   					alert("정상적인 경로를 이용해주세요.");
 					window.location.href="<%=request.getContextPath()%>/serviceUse/loginForm"; 
 				</script> 
		<%
			} else {
		%>
				<input type="hidden" name="cl_id" id="cl_id" value="${id }"/>		
		<%
			}
// 			session.invalidate();
		%>
		<input type="hidden" name="cl_pwd" id="cl_pwd1"/>
	</form>
	<div style="text-align:right;">
		<a href="javascript:window.location.href='<%=request.getContextPath()%>/serviceUse/loginForm';">로그인 페이지 가기</a>
	</div>
</div>

</body>
<script src="<%=request.getContextPath()%>/resources/js/common.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/selectize/dist/js/standalone/selectize.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/flatpickr.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/plugins/rangePlugin.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/nouislider/distribute/nouislider.min.js"></script>
<!-- Tabler Core -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/tabler.min.js"></script>
<script>
function changePwd(){
	if($('#cl_pwd').val().trim()=="" || $('#cl_pwd_confirm').val().trim()==""){
		alert("비밀번호 / 비밀번호 확인을 입력해주세요.");
		return;
	}else if($('#cl_pwd').val().trim() != $('#cl_pwd_confirm').val().trim()){
		alert("비밀번호가 서로 일치하지 않습니다.");
		return;
	}else {
		$('#cl_pwd1').attr("value",SHA256($('#cl_pwd').val().trim()));
	}
	var form=$('form[role="form"]');
	form.submit();
}
//비밀번호 유효성검사
$("#cl_pwd").on("keyup",function(){
	var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,16}$/;
	var result = regex.exec($("#cl_pwd").val())
       
	if(result != null){
		$(".cl_pwd.regex").html("");
	}else{
		$(".cl_pwd.regex").html("조건에 맞게 입력해주세요.");
		$(".cl_pwd.regex").css("color","red")
	}
});
</script>
</html>