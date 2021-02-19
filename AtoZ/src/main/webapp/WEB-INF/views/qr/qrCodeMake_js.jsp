<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
#back{width:100%;position:absolute;z-index:-1;}
#qrDiv{width:100%;position:absolute;z-index:-2;}
</style>
<div id="back"></div>
<form id="printJS-form" style="">
	<div id="qrDiv" style="">
	</div>
</form>
<script>
function qrCodeMake(data){
	var url = "<%=request.getContextPath()%>/WH/qr/qrCodeMake";
	
	$.each(data, function(item){
		var cnt = parseInt(data[item].invQty);
		for(var i = 0; i < cnt; i++){
			$("<div/>",{
				"style":"display:inline-block;",
				"html":"<div style='width:250px;height:280px;display:inline-block;'><p style='text-align:center;'>" + data[item].invNo + "<br>품목명 : " + data[item].invName +"</p><img src='" + url + "?text=" + data[item].invNo + "' width='250px' height='250px'/></div>"
			}).appendTo("#qrDiv");
		}
	});
	
	printJS('printJS-form', 'html');
	document.querySelector('#qrDiv').innerHTML = "";
}
</script>