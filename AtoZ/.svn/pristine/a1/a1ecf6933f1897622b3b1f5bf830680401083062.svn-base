<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="content" style="height:80%;">
	    
		<div class="row">
			<div class="btn btn-dark" style="width:80%;height:40px;margin:0 auto;">
				<h1 style="margin:auto;">피킹 목록</h1>
			</div>
		</div>
	   	<div class="row" id="tableRow" style="height:80%;">
	   		<div class="card col-12 table-responsive" style="margin:0 auto;max-height:90%;padding:0px; ">
		   		<table class="table card-table table-vcenter text-nowrap datatable">
		   			<thead>
		   				<tr>
							<th class="text-center">No.</th>
							<th class="text-center">번 호</th>
							<th class="text-center">기 업 명</th>
							<th class="text-center">목 적 지</th>
			   			</tr>
		   			</thead>
		   			
		   			<tbody>
		   				<c:forEach var="rel" items="${relList }" varStatus="status">
		   					<tr class="clickableTr" onclick="openItemList('${rel.rls_no}','${rel.emp_name }');">
								<td>${status.index +1}</td>
								<td class="text-center" name="rls_no_td">${rel.rls_no }</td>
								<td class="text-center" name="co_name_td">${rel.co_name }</td>
								<td class="text-center">${rel.dst_addr }</td>
							</tr>
		   				</c:forEach>
		   			</tbody>
		   		</table>
	   		</div>
	   	</div>
	</div><!-- /content -->
	
</div> <!-- /page -->


<script>
	function openItemList(rls_no){
		location.href="m.pickingItemList?rls_no="+rls_no;
	}
</script>



    

       









