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
          <img src="<%=request.getContextPath() %>/resources/images/AZ.png" height="70" alt="">
        </div>
		<div class="col-12">
			<!-- Cards with tabs component -->
			<div class="card-tabs ">
				<!-- Cards navigation -->
				<ul class="nav nav-tabs">
					<li class="nav-item"><a href="#tab-top-1" class="nav-link active" data-bs-toggle="tab">아이디 찾기</a></li>
					<li class="nav-item"><a href="#tab-top-2" class="nav-link" data-bs-toggle="tab">비밀번호 찾기</a></li>
				</ul>
				<div class="tab-content">
					<!-- Content of card #1 -->
					<div id="tab-top-1" class="card tab-pane show active">
						<div class="card-body" style="padding: 4% 20% 6% 20%;"
						>
							<h2 class="card-title text-center mb-4">아이디를 잊어버리셨나요?</h2>
							<div class="mb-3">
								<label class="form-label">사업자등록번호</label>
								<div class="row">
									<input type="text" class="form-control" id="cl_regno" name="cl_regno">
								</div>
							</div>
							<div class="form-footer">
								<a href="javascript:findId()" class="btn btn-primary w-100">
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="10" cy="10" r="7" /><path d="M21 21l-6 -6" /><line x1="10" y1="13" x2="10" y2="13.01" /><path d="M10 10a1.5 1.5 0 1 0 -1.14 -2.474" /></svg>
									아이디 찾기
								</a>
							</div>
						</div>
					</div>
					<!-- Content of card #2 -->
					<div id="tab-top-2" class="card tab-pane">
						<div class="card-body">
							<h2 class="card-title text-center mb-4">비밀번호를 잊어버리셨나요?</h2>
							<div class="mb-3">
								<div class="row">
									<label class="form-label" style="width:50%;">아이디</label>
									<label class="form-label" style="width:50%;">사업자등록번호</label>
									<input type="text" class="form-control" id="cl_id1" placeholder="Enter id" style="width:45%;">
									<input type="text" class="form-control" id="cl_regno1" style="width:50%; margin-left:5%;">
								</div>
							</div>
							<div class="mb-3">
							</div>
							<div class="mb-3">
								<div class="row">
									<label class="form-label">이메일</label>
									<input type="text" class="form-control" style="width:30%;" id="cl_email1" placeholder="Enter email">&nbsp;@&nbsp;
									<input type="text" class="form-control" style="width:40%;" id="cl_addr1" placeholder="Enter address">
									<a href="javascript:sendEmail()" class="btn btn-primary" style="width:20%; margin-left:4%;">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><rect x="3" y="5" width="18" height="14" rx="2" /><polyline points="3 7 12 13 21 7" /></svg>
										발송
									</a>
								</div>
							</div>
							<div class="mb-3">
								<div class="row">
									<label class="form-label">인증번호</label>
									<input type="text" class="form-control" id="cn" name="cn" placeholder="Enter Certification Number" style="width:75%;" readonly>
									<a href="javascript:changePassword();" class="btn btn-primary" style="width:20%; margin-left:4%;">
										<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M5 12l5 5l10 -10" /></svg>
										확인
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div style="text-align:right;">
				<a href="javascript:window.location.href='<%=request.getContextPath()%>/serviceUse/loginForm';">로그인 페이지 가기</a>
			</div>
		</div>
            
	</div>

</body>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.mask.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/selectize/dist/js/standalone/selectize.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/flatpickr.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/plugins/rangePlugin.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/nouislider/distribute/nouislider.min.js"></script>
<!-- Tabler Core -->
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/tabler.min.js"></script>
<script>
window.onload=function(){
	$('#cl_regno').mask('000-00-00000',{placeholder: "___-__-_____('-' 빼고 입력)"});
	$('#cl_regno1').mask('000-00-00000',{placeholder: "___-__-_____('-' 빼고 입력)"});
}
function findId() {
	var cl_regno = $("#cl_regno").val();
	$.ajax({
		url : "<%=request.getContextPath()%>/serviceUse/findId?cl_regno="+cl_regno,
		type: "get",
		success : function(res) {
			if(res==null||res==""){
				alert("사업자 등록번호를 다시 확인해주세요.");
				$("#cl_regno").val("");
			}else{
				alert("아이디는 " + res + " 입니다.");
			}
		}
	});
}
function sendEmail() {
	var cl_id = $("#cl_id1").val().trim();
	var cl_regno = $("#cl_regno1").val().trim();
	var cl_email = $("#cl_email1").val().trim()+"@"+$("#cl_addr1").val().trim();
	if (cl_id=="" || cl_regno=="" || $('#cl_email1').val().trim()=="" || $('#cl_addr1').val().trim()==""){
		alert("모든 정보를 정확히 입력해주세요.");
		return;
	}else{
		alert("메일을 전송합니다.")
	}
	
	$.ajax({
		url : "<%=request.getContextPath()%>/serviceUse/findPwd?id="+cl_id+"&cl_regno="+cl_regno+"&cl_email="+cl_email,
		type : "get",
		success : function(res) {
			alert(res);
			if(res=="이메일 전송에 성공하였습니다."){
				$("#cl_id1").prop("readonly",true);
				$("#cl_regno1").prop("readonly",true);
				$("#cl_email1").prop("readonly",true);
				$("#cl_addr1").prop("readonly",true);
				$("#cn").prop("readonly",false);
			}
		}
	});
}

function changePassword() {
	var cn = $("#cn").val().trim();
	var cl_id = $("#cl_id1").val().trim();
	if(cn==""){
		
		return;
	}
	$.ajax({
		url : "<%=request.getContextPath()%>/serviceUse/confirmCode",
		type : "post",
		data : {cn : cn, id:cl_id},
		success : function(res) {
			if(res){
				window.location.href="<%=request.getContextPath()%>/serviceUse/newPassword";
			}else{
				alert("인증번호를 다시 확인해주세요.");
				return;
			}
		}
	});
}
</script>
</html>