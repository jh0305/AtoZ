<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="searchMap" value="${pageMaker.searchMap }"/>
<div class="container-xl" style="width:500px; height:600px;">
				<!-- 콘텐츠 헤더 -->
					<div class="page-header d-print-none">
						<div class="row align-items-center">	
							<div class="col">
								<h2 class="page-title">
									담당 직원 검색
								</h2>
							</div>
						</div>
					</div>
					<div class="card col-12">
						<div class="card-header" id="employeeSearch">
							<div class="card-header">
								<select class="form-select" id="emSearchType" style="display:inline-block; width:32%; display:inline; height:33px;">
									<option value="" ${searchMap.get('searchType') eq '' ? 'selected' : '' }>검색 구분</option>
									<option value="emp_name" ${searchMap.get('searchType') eq 'emp_name' ? 'selected' : '' }>직원 이름</option>
									<option value="emp_id" ${searchMap.get('searchType') eq 'emp_id' ? 'selected' : '' }>직원 아이디</option>
								</select>
								<input type="text" class="form-control" id="emKeyword" value="${searchMap.get('keyword') }" placeholder="Search for…" style="width:32%; display:inline;height:33px;">
								<button class="btn btn-white btn-icon" aria-label="Button" style="display:inline;height:33px;" onclick="search_EmployeeGo()">
									<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
										<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
										<circle cx="10" cy="10" r="7"></circle>
										<line x1="21" y1="21" x2="15" y2="15"></line>
									</svg>
								</button>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive" style="max-height:380px;">
								<table class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th class="text-center">직원 ID</th>
											<th class="text-center">직 원 명</th>
											<th class="text-center">담당업무</th>
										</tr>
									</thead>
									<tbody id="employeeBody">
										
									</tbody>
								</table>
							</div>
<!-- 							table-responsive -->
						</div>
<!-- 						card-body -->
						<div class="card-footer" id="employeePage" style="background:white;text-align: right;">
							<div class="row" style="float:right;">
								<div class="col-2" >
									<input type="button" class="btn btn-white"  value="닫기" onclick="closeDial($('#dialog2'))">
								</div>
							</div>
						</div>
					</div>
<!-- 					card col-12 -->
					
		    </div>
		    
<script>
function search_EmployeeGo(){
	var data = {
			searchType : $("#emSearchType").val(),
			keyword : $("#emKeyword").val()
	}
	searchList_go(1,'${searchMap.url}',data);
}
</script>		    