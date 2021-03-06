<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	hr{
		margin:1rem 0;
	}
</style>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">규격 정보</strong>
</div>
<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-body">
		<div class="row">
			<div class="col-4"><strong>규격코드</strong></div>
			<div class="col-4" style="margin-top:0%;"><input type="text" class="form-control" name="std_code" id="Dstd_code" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>규격명</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_name" id="Dstd_name" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>가로규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_width" id="Dstd_width" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?]/g, &#39;&#39;);" placeholder="숫자만 입력해주세요." readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>세로규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_lngth" id="Dstd_lngth" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z]!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?/g, &#39;&#39;);" placeholder="숫자만 입력해주세요." readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>높이규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_height" id="Dstd_height" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?]/g, &#39;&#39;);" placeholder="숫자만 입력해주세요." readonly/></div>
		</div>
	</div>
</div>
<input type="hidden" id="Dstd_no">
<div style="margin-top:2%; margin-right:2%; text-align:right;">
<input type="button" class="btn btn-white" id="useStandardBtn" onclick="useStandard()" value="사용"/>
<input type="button" class="btn btn-white" onclick="modifyStdForm()" value="수정"/>
<input type="button" class="btn btn-white" onclick="deleteStandard()" value="삭제"/>
<input type="button" class="btn btn-white" onclick="closeDial($('#dialog5'));" value="취소"/>
</div>
<script>
function useStandard() {
	$('#Istd_name').val($('#Dstd_name').val());
	$('#std_name').val($('#Dstd_name').val());
	closeDial($('#dialog3'));
	closeDial($('#dialog5'));
}
function modifyStdForm() {
	closeDial($('#dialog5'));
	openDial($('#dialog6'),500,600);
}
function deleteStandard() {
	var std_no = $('#Dstd_no').val().trim();
	$.ajax({
		url : '<%=request.getContextPath()%>/CO/item/removeStandard',
		data : {std_no : std_no},
		type : 'post',
		success : function(res) {
			alert("삭제가 완료되었습니다.");
			closeDial($('#dialog5'));
			closeDial($('#dialog3'));
			openStandardList();
		}
	});
}
</script>