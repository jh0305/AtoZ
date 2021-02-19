<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	hr{
		margin:1rem 0;
	}
</style>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">규격수정</strong>
</div>
<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-body">
		<div class="row">
			<div class="col-4"><strong>규격코드</strong></div>
			<div class="col-4" style="margin-top:0%;"><input type="text" class="form-control" name="std_code" id="Mstd_code" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>규격명</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_name" id="Mstd_name"/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>가로규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_width" id="Mstd_width" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?]/g, &#39;&#39;);" placeholder="숫자만 입력해주세요."/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>세로규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_lngth" id="Mstd_lngth" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z]!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?/g, &#39;&#39;);" placeholder="숫자만 입력해주세요."/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>높이규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_height" id="Mstd_height" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?]/g, &#39;&#39;);" placeholder="숫자만 입력해주세요."/></div>
		</div>
	</div>
</div>
<input type="hidden" id="Mstd_no"/>
<div style="margin-top:2%; margin-left:5%;">
<input type="button" class="btn btn-white" onclick="modifyStd()" value="수정"/>
<input type="button" class="btn btn-white" id="cancelStandardBtn" onclick="closeDial($('#dialog6'));" value="취소"/>
</div>
<script>
function modifyStd() {
	var std_name=$('#Mstd_name').val().trim();
	var std_width=$('#Mstd_width').val().trim();
	var std_lngth=$('#Mstd_lngth').val().trim();
	var std_height=$('#Mstd_height').val().trim();
	var std_no=$('#Mstd_no').val().trim();
	if (std_name==""||std_name==null) {
		alert("규격명을 입력해주세요.");
		return;
	}
	if (std_width==""||std_width==null) {
		alert("가로규격을 입력해주세요.");
		return;
	}
	if (std_lngth==""||std_lngth==null) {
		alert("세로규격을 입력해주세요.");
		return;
	}
	if (std_height==""||std_height==null) {
		alert("높이규격을 입력해주세요.");
		return;
	}
	$.ajax({
		url : "<%=request.getContextPath()%>/CO/item/modifyStandard",
		data : {std_name : std_name, std_width : std_width, std_lngth : std_lngth, std_height : std_height, std_no : std_no},
		type : 'POST',
		success : function (res) {
			alert("수정이 완료되었습니다.");
			closeDial($('#dialog6'));
			closeDial($('#dialog3'));
			openStandardList();
		}
	});
}
</script>