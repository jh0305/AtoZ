<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">엑셀 품목 등록</strong>
</div>

<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-body" style="text-align:center;">
		<form id="fileForm1" enctype="multipart/form-data">
			<input type="file" class="form-control" id="excelItemFile1" style="display:inline; width:70%;" accept=".xlsx, .xls"/>
			<input type="button" class="btn btn-white" id="addItemExcelFile1" onclick="addItemExcel1();" value="제출">
		</form>
	</div>
</div>
<div style="text-align:right; margin-right:2%; margin-top:3%;">
	<input type="button" class="btn btn-white" onclick="location.href='<%=request.getContextPath() %>/CO/item/excelFormDown2';" value="양식다운로드"/>
	<input type="button" class="btn btn-white" onclick="closeDial($('#dialog9'));" value="취소"/>
</div>
<script>
function checkFileType(filePath) {
	var fileFormat = filePath.split(".");
	
	if (fileFormat.indexOf("xls")>-1||fileFormat.indexOf("xlsx")>-1) {
		return true;
	} else {
		return false;
	}
}

function addItemExcel1() {
	var file = $('#excelItemFile1').val();
	if (file == "" || file==null) {
		alert("파일을 첨부해주세요.");
		return;
	} else if(!checkFileType(file)){
		alert("엑셀파일만 업로드 가능합니다.");
		return;
	}
	
	if(confirm("저장하시겠습니까?")){
		var form = $('#fileForm1')[0];
		var data = new FormData(form);
		data.append("multi",document.getElementById('excelItemFile1').files[0]);
		$.ajax({
			enctype: 'multipart/form-data',
			type: 'post',
			url : '<%=request.getContextPath()%>/CO/item/excelStandardInsert',
			processData : false,
			contentType : false,
			data : data,
			success : function (res) {
				alert(res);
				if(res=="완료되었습니다."){
					history.go(0);
				}
			}
		});
	}else{
		return;
	}
}
</script>