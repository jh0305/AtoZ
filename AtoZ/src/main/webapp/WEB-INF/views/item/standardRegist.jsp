<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	hr{
		margin:1rem 0;
	}
</style>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">규격 정보 등록</strong>
</div>
<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-body">
		<div class="row">
			<div class="col-4"><strong>규격코드</strong></div>
			<div class="col-4" style="margin-top:0%;"><input type="text" class="form-control" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣ]/g, &#39;&#39;)" name="std_code" id="Rstd_code"/></div>
			<div class="col-2"><input type="button" value="중복확인" class="btn btn-white btn-icon" onclick="checkduple();"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>규격명</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_name" id="Rstd_name" readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>가로규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_width" id="Rstd_width" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?]/g, &#39;&#39;);" placeholder="숫자만 입력해주세요." readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>세로규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_lngth" id="Rstd_lngth" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z]!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?/g, &#39;&#39;);" placeholder="숫자만 입력해주세요." readonly/></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-4"><strong>높이규격(cm)</strong></div>
			<div class="col-8"><input type="text" class="form-control" name="std_height" id="Rstd_height" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎ가-힣ㅏ-ㅣa-zA-Z!@#$%^&*()_+=\-\[\]\{\}:\'\;\,\.\/\<\>\?]/g, &#39;&#39;);" placeholder="숫자만 입력해주세요." readonly/></div>
		</div>
	</div>
</div>

<div style="margin-top:2%; margin-left:5%;">
<input type="button" class="btn btn-white" id="registStandardBtn" onclick="registstandard()" value="저장"/>
<input type="button" class="btn btn-white" id="cancelStandardBtn" onclick="closeRegistStandard();" value="취소"/>
</div>
<script>
function checkduple() {
	var std_code = $('#Rstd_code').val().trim();
	if(std_code==""||std_code==null) {
		alert("규격코드를 입력해주세요.");
		return;
	}
	$.ajax({
		url : "<%=request.getContextPath()%>/CO/item/chkStdCode",
		type : 'get',
		data : {std_code:std_code},
		success : function(res) {
			if(res==""|| res==null){
				if(confirm(std_code + " 코드로 사용하시겠습니까?") == true) {
					$('input[id="Rstd_code"]').prop("readonly",true);
					$('input[id="Rstd_name"]').prop("readonly",false);
					$('input[id="Rstd_width"]').prop("readonly",false);
					$('input[id="Rstd_lngth"]').prop("readonly",false);
					$('input[id="Rstd_height"]').prop("readonly",false);
				}else {
					return;
				}
			}else {
				alert("이미 사용중인 코드명입니다.");
				return;
			}
		}
	});
}
function registstandard() {
	var std_code=$('#Rstd_code').val().trim();
	var std_name=$('#Rstd_name').val().trim();
	var std_width=$('#Rstd_width').val().trim();
	var std_lngth=$('#Rstd_lngth').val().trim();
	var std_height=$('#Rstd_height').val().trim();
	if(std_code==null||std_code==""){
		alert("코드를 입력해주세요.");
		return;
	}
	if(std_name==null||std_name==""){
		alert("규격명을 입력해주세요.");
		return;
	}
	if(std_width==null||std_width==""){
		alert("가로규격을 입력해주세요.");
		return;
	}
	if(std_lngth==null||std_lngth==""){
		alert("세로규격을 입력해주세요.");
		return;
	}
	if(std_height==null||std_height==""){
		alert("높이규격을 입력해주세요.");
		return;
	}
	
	$.ajax({
		url : '<%=request.getContextPath()%>/CO/item/registStandard',
		data : {std_code : std_code, std_name : std_name , std_width : std_width, std_lngth : std_lngth, std_height : std_height},
		type : 'post',
		success : function(res) {
			alert("규격등록이 완료되었습니다.");
			closeRegistStandard();
			closeDial($('#dialog3'));
			openStandardList();
		}
	});
}

function closeRegistStandard() {
	$('input[id="Rstd_code"]').prop("readonly",false);
	$('input[id="Rstd_name"]').prop("readonly",true);
	$('input[id="Rstd_width"]').prop("readonly",true);
	$('input[id="Rstd_lngth"]').prop("readonly",true);
	$('input[id="Rstd_height"]').prop("readonly",true);
	closeDial($('#dialog4'));
}
</script>