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
	<strong style="font-size:1.2rem;">받은 쪽지 보기</strong>
</div>

<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-header">
		<div style="width:20%; display:inline-block;"><strong>보낸 사람</strong></div>
		<div style="width:30%; display:inline-block;" id="Rsd_name"></div>
		<div style="width:20%;display:inline-block;"><strong>보낸 날짜</strong></div>
		<div style="width:30%; display:inline-block;" id="Rwrt_ymd"></div>
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-12">내용</div>
		</div>
		<textarea rows="10" cols="70" disabled="disabled" id="Rcontent"></textarea>
	</div>
</div>
<input type="hidden" id="receiveMsgNo">
<div style="margin-top:2%; margin-left:5%;">
<input type="button" class="btn btn-white" onclick="removeReceiveMsg();" value="삭제"/>
<input type="button" class="btn btn-white" id="cancelBtn" onclick="closeReceiveMessageDetail();" value="닫기"/>
</div>
<script>
function removeReceiveMsg() {
	var msg_no = $('#receiveMsgNo').val().trim();
	$.ajax({
		url : "<%=request.getContextPath()%>/WHCO/message/removeReceiveMessage",
		data : {msg_no : msg_no},
		type : 'post',
		success : function(res) {
			alert("쪽지가 삭제되었습니다.")
			initialReceiveSearch();
			closeDial($('#receiveMsgDetaildialog'));
		}
	});
}
function closeReceiveMessageDetail() {
	initialReceiveSearch();
	closeDial($('#receiveMsgDetaildialog'));
}
</script>