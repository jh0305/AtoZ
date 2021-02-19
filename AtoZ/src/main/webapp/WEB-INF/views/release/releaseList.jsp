<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="searchMap" value="${pageMaker.searchMap }"/>
	<div style="padding: 0px 15px;">
		<h3 class="card-title">출고내역리스트</h3>
		<div class="card">
			<div class="card-header">
				<select class="form-select" id="searchType" style="display:inline-block; width:10%; display:inline;">
					<option value="" ${searchMap.get('searchType') eq '' ? 'selected' : '' }>검색 구분</option>
					<option value="dst_name" ${searchMap.get('searchType') eq 'dst_name' ? 'selected' : '' }>도착지점명</option>
					<option value="emp_name" ${searchMap.get('searchType') eq 'emp_name' ? 'selected' : '' }>출고담당자</option>
				</select>
				<input type="text" class="form-control" id="keyword" value="${searchMap.get('keyword') }" placeholder="Search for…" style="width:13%; display:inline;">
				<button class="btn btn-white btn-icon" aria-label="Button" style="display:inline;" onclick="search_CompleteReleaseGo()">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
						<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
						<circle cx="10" cy="10" r="7"></circle>
						<line x1="21" y1="21" x2="15" y2="15"></line>
					</svg>
				</button>
			</div>
			
			<div class="card-body" style="min-height: 795px;">
				<!-- form -->
				<div class="table-responsive">
					<table class="table card-table table-vcenter text-nowrap datatable" style="table-layout: fixed;">
						<thead>
							<tr>
								<th class="text-center" style="width:150px;">출고번호</th>
								<th style="text-align:left;">물류센터명</th>
								<th style="text-align:left;">도착지점명</th>
								<th style="text-align:left;">출고담당자</th>
								<th style="text-align:right;">총 출고수량</th>
								<th class="text-center">출고일자</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="release" items="${releaselist }" varStatus="status">
								<tr class="clickabletr" onclick="CompleteReleaseDetail('${release.rls_no}','${release.emp_name }')">
									<td class="text-center">${release.rls_no }</td>
									<td style="text-align:left;">${release.wh_name }</td>
									<td style="text-align:left;">${release.dst_name }</td>
									<td style="text-align:left;">${release.emp_name }</td>
									<td style="text-align:right;">${release.all_rls_qty }</td>
									<td class="text-center">${fn:substring(release.rls_ymd,0,4) }-${fn:substring(release.rls_ymd,4,6) }-${fn:substring(release.rls_ymd,6,8) }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /form -->
			</div>
			<div class="card-footer" style="background-color:white;">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
			</div>
		</div>
	</div>
	<div id="CompleteReleaseDetail" class="dialogDiv" title="출고내역 상세보기">
		<%@ include file="/WEB-INF/views/release/CompleteReleaseDetail.jsp" %>
	</div>
<script>
function search_CompleteReleaseGo(){
	var data = {
			searchType : $("#searchType").val(),
			keyword : $("#keyword").val()
	}
	searchList_go(1,'${searchMap.url}',data);
}
function CompleteReleaseDetail(rls_no,emp_name) {
	$('#rls_no').html(rls_no);
	$('#manager').html(emp_name);
	$.ajax({
		url:'<%=request.getContextPath()%>/WC/release/completeReleaseDetail',
		type : 'post',
		data : {rls_no : rls_no},
		success : function(res) {
			printData(res,$('#rlsitem-list-tbody'),$('#rlsitem-list-template'));
			openDial($('#CompleteReleaseDetail'),700,500);
		}
	});
}
</script>