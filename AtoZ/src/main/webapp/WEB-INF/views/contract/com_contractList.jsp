<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cnt" value="0"/>
<style> 
.caroimg{	
	height : 300px;
}
.tabtn{
	border : none;
}
</style>

<div class="container-xl">
	<div class="row row-deck row-cards">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">
					<strong>계약현황</strong>
				</h2>
			</div>
			<div class="card-body border-bottom py-3">
				<div class="d-flex">
					<div class="ms-auto text-muted" style="padding-left: 70%;">
						<div class="ms-2 d-inline-block">
							<select class="form-select" id="searchType">
								<option value="" ${searchMap.get('searchType') eq '' ? 'selected' : ''}>검색조건</option>
								<option value="cl_name" ${searchMap.get('searchType') eq 'cl_name' ? 'selected' : ''}>기업명</option>
							</select>
						</div>
					</div>
					<div>
						<div class="ms-2 d-inline-block">
							<input class="form-control" type="text" name="keyword" placeholder="검색어를 입력하세요." id="keyword" value="${searchMap.get('keyword') }"/>
						</div>
						<button class="btn btn-white btn-icon" aria-label="Button" style="display:inline;position:relative;top:-2px;" onclick="search_go()">
						<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
							<circle cx="10" cy="10" r="7"></circle>
							<line x1="21" y1="21" x2="15" y2="15"></line>
						</svg>
					</button>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<button class="btn tabtn" onclick="javascript:getList('',this);" id="btn1" >전체</button>
				<button class="btn tabtn" onclick="javascript:getReqList(this);" id="btn2" >대기</button>
				<button class="btn tabtn" onclick="javascript:getList('CR002',this);" id="btn3" >계약</button>
				<button class="btn tabtn" onclick="javascript:getList('CR003',this);" id="btn4" >만료</button>
			 	<div id="dynamic_table"></div>
			 	<div id="pagingdiv"></div>
		</div>
		</div>
	</div>
</div>
<div id="company">
</div>
<div id="contract" class="dialogDiv"></div>

<%@ include file="com_contract_js.jsp" %>
<%@ include file="contract_detail.jsp" %>
<script>

</script>
