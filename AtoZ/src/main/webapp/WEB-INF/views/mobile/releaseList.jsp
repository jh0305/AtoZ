<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/qr.css" />
  
	<div class="content" style="height:80%;">
	    
		<div class="row">
			<div class="btn btn-dark" style="width:80%;height:40px;margin:0 auto;">
				<h1 style="margin:auto;">출고예정목록</h1>
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
			   				<th class="text-center" style="position: sticky;top:0;"> </th>
			   				<th class="text-right" style="position: sticky;top:0;">출고번호</th>
			   				<th class="text-left"style="position: sticky;top:0;width: 40%;">목적지</th>
			   				<th class="text-center"style="position: sticky;top:0;">출고일</th>
			   				<th class="text-center"style="position: sticky;top:0;">상태</th>
			   			</tr>
		   			</thead>
		   			
		   			<tbody id="releaseList">
		   				<c:forEach items="${dataList }" var="list" varStatus="status">
		   					<tr onclick="goRelease('${list.RLS_NO }');">
		   						<td class="text-right">${list.RN }</td>
		   						<td class="text-right" style="text-align: right;padding-right: 10px;">${list.RLS_NO }</td>
		   						<td class="text-left" style="padding-left: 10px;">${list.CL_NAME }</td>
		   						<td class="text-center">${list.PLAN_YMD }</td>
		   						<td class="text-center">${list.CM_NAME }</td>
		   					</tr>
		   				</c:forEach>
		   			</tbody>
		   			
		   		</table>
	   		</div>
	   	</div>
	</div><!-- /content -->
	
</div> <!-- /page -->
<form role="releaseForm" action="m.releaseForm" method="post">
	<input type="hidden" name="rlsNo" value="">
</form>
<script>
function goRelease(targetNo) {
	var form = $('form[role="releaseForm"]');
	$('form[role="releaseForm"] input[type="hidden"]').val(targetNo);
	
	form.submit();
}
</script>
