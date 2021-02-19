<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<Style>
	textarea{
		resize:none;
	}
</Style>
</head>
<body>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">보낸 쪽지 보기</strong>
</div>

<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-header">
		<div style="width:20%; display:inline-block;"><strong>받는 기업</strong></div>
		<div style="width:30%; display:inline-block;" id="Ssd_name"></div>
		<div style="width:20%;display:inline-block;"><strong>보낸 날짜</strong></div>
		<div style="width:30%; display:inline-block;" id="Swrt_ymd"></div>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-12">내용</div>
		</div>
		<textarea rows="10" cols="70" disabled="disabled" id="Scontent"></textarea>
	</div>
</div>
<input type="hidden" id="sendMsgNo">
<div style="margin-top:2%; margin-left:5%;">
<input type="button" class="btn btn-white" onclick="removeSendMsg();" value="삭제"/>
<input type="button" class="btn btn-white" id="cancelBtn" onclick="closeDial($('#sendMsgDetaildialog'));" value="닫기"/>
</div>
<script>
function removeSendMsg() {
	var msg_no = $('#sendMsgNo').val().trim();
	$.ajax({
		url : "<%=request.getContextPath()%>/WHCO/message/removeSendMessage",
		data : {msg_no : msg_no},
		type : 'post',
		success : function(res) {
			alert("쪽지가 삭제되었습니다.")
			initialSendSearch();
			closeDial($('#sendMsgDetaildialog'));
		}
	});
}
</script>