<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/qr.css" />
  
	<div class="content" style="height:80%;">
	    
		<div class="row">
			<div class="btn btn-dark" style="width:80%;height:40px;margin:0 auto;">
				<h1 style="margin:auto;">입고품목목록</h1>
			</div>
		</div>
		
		<div class="col-10" style="text-align: right; margin:5px auto 0 auto;">
		</div>
		
		<!-- /row Qr -->
	   	<div class="row" id="tableRow" style="height:100%;">
	   		<div class="card col-12 table-responsive" style="margin:0 auto;max-height:100%;">
		   		<table class="table card-table table-vcenter text-nowrap datatable">
		   			<thead>
		   				<tr>
			   				<th class="text-right" style="position: sticky;top:0;text-align: right;width: 15%;">임시번호</th>
			   				<th class="text-left"style="position: sticky;top:0;width: 30%;">품목명</th>
			   				<th class="text-center"style="position: sticky;top:0;">랙 이름</th>
			   				<th class="text-center"style="position: sticky;top:0;">입고량</th>
			   			</tr>
		   			</thead>
		   			
		   			<tbody id="receiveList">
		   				<c:forEach items="${dataList }" var="list" varStatus="status">
		   					<tr onclick="goReceive('${list.INV_LOC }', '${list.RACKNAME }');">
		   						<td class="text-right" data-sts="${list.STS_CODE }" style="text-align: right;padding-right: 10px;">${list.INV_NO }</td>
		   						<td class="text-left" style="padding-left: 10px;">${list.ITEM }</td>
		   						<td class="text-center">${list.RACKNAME }</td>
		   						<td class="text-center">${list.QTY }</td>
		   					</tr>
		   				</c:forEach>
		   			</tbody>
		   		</table>
	   		</div>
	   	</div>
	</div><!-- /content -->
	
</div> <!-- /page -->
<form role="receiveForm" action="m.receiveForm" method="post">
	<input type="hidden" id="ord" name="ordNo" value="${ordNo }">
	<input type="hidden" name="invLoc" value="">
	<input type="hidden" name="rackName" value="">
</form>
<script>
window.onload = function(){
	if ($('#receiveList').text().trim() == ""){
		var ordNo = $('#ord').val();
		
		location.href = "m.receiveList?ordNo="+ordNo;
		
// 		$.ajax({
// 			uri : 'm.receive2',
// 			type : 'post',
// 			data : { ordNo : ordNo },
// 			success : function(res){
// 				alert(res);
<%-- 				location.href = "<%=request.getContextPath()%>/m.receiveList"; --%>
// 			}
// 		});
	}
}
function goReceive(invLoc, rackName) {
	var form = $('form[role="receiveForm"]');
	$('form[role="receiveForm"] input[name="invLoc"]').val(invLoc);
	$('form[role="receiveForm"] input[name="rackName"]').val(rackName);
	
	form.submit();
}
</script>
