<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">쪽지 보내기</strong>
</div>

<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-header">
		<div class="col-3" style="width:40%;">
			<strong>사업자등록번호</strong>
		</div>
		<div class="col-8" style="display:inherit;">
			<input type="text" class="form-control" style="width:60%;"  id="rc_regno">
			<a href="javascript:checkRcRegno();" class="btn btn-white btn-icon" aria-label="Button">
				<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
					<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
					<circle cx="10" cy="10" r="7"></circle>
					<line x1="21" y1="21" x2="15" y2="15"></line>
				</svg>
			</a>
		</div>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-12">내용</div>
		</div>
		<textarea rows="10" cols="70" id="SendContent" disabled="disabled"></textarea>
	</div>
</div>

<div style="margin-top:2%; margin-left:5%;">
<input type="button" class="btn btn-white" id="sendBtn" onclick="sendMessage();" value="전송"/>
<input type="button" class="btn btn-white" id="cancelBtn" onclick="closeSendMessage();" value="닫기"/>
</div>
<script>
function checkRcRegno() {
	var cl_regno = $('#rc_regno').val().trim();
	$.ajax({
		url : "<%=request.getContextPath()%>/WHCO/message/chkRcRegno",
		data : {cl_regno : cl_regno},
		type : 'post',
		success : function (res) {
			if(res==""){
				alert("등록된 사업자번호가 없습니다.");
				return;
			}else {
				if((confirm(res+"에게 쪽지를 보내시겠습니까?"))==true) {
					$('#rc_regno').prop('disabled',true);
					$('#SendContent').prop('disabled',false);
				}else {
					return;
				}
			}
		}
	});
}
function sendMessage() {
	var cl_regno = $('#rc_regno').val().trim();
	var content = $('#SendContent').val().trim();
	$.ajax({
		url : "<%=request.getContextPath()%>/WHCO/message/sendMessage",
		data : {cl_regno : cl_regno, content : content},
		type : 'post',
		success : function(res) {
			alert("쪽지를 전송하였습니다.");
			closeSendMessage();
		}
	});
}
function closeSendMessage(){
	$('#rc_regno').prop('disabled',false);
	$('#SendContent').prop('disabled',true);
	closeDial($('#newMessagedialog'));
}
window.onload=function(){
	$('#rc_regno').mask('000-00-00000',{placeholder: "___-__-_____('-' 빼고 입력)"});
}
</script>