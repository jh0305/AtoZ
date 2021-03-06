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
.whtr{	
	cursor : pointer;
}
.whtr:hover{
	background : #e4e8eb;
}
</style>

<div style="padding : 0px 10px;">
	<div class="page-header d-print-none" style="margin-left: 10px;">
		<div class="row align-items-center">
			<div class="col" style="padding: 0px;">
				<h2 class="page-title">계약현황</h2>
			</div>
		</div>
	</div>
	<div class="row row-deck row-cards">
		<div class="card" style="width: 99%;margin: auto;">			
			<div class="card-body border-bottom" style="padding: 10px 10px 10px 0px;">
				<div class="d-flex">
					<div class="text-muted" style="">
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
						<button class="btn btn-white btn-icon" aria-label="Button"
							style="display: inline; position: relative; top: -2px;"
							onclick="search_go()">
							<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
								height="24" viewBox="0 0 24 24" stroke-width="2"
								stroke="currentColor" fill="none" stroke-linecap="round"
								stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
							<circle cx="10" cy="10" r="7"></circle>
							<line x1="21" y1="21" x2="15" y2="15"></line>
						</svg>
						</button>
					</div>
				</div>
			</div>
			<div class="table-responsive" style="min-height:720px;">
				<button class="btn tabtn" onclick="javascript:getList('',this);" id="btn1" >전체</button>
				<button class="btn tabtn" onclick="javascript:getReqList(this);" id="btn2" >대기</button>
				<button class="btn tabtn" onclick="javascript:getList('CR002',this);" id="btn3" >계약</button>
				<button class="btn tabtn" onclick="javascript:getList('CR003',this);" id="btn4" >만료</button>
				<button class="btn tabtn" onclick="javascript:getList('CR004',this);" id="btn5" >파기</button>
			 	<div id="dynamic_table"></div>
			 	<div id="pagingdiv"></div>
		</div>
		</div>
	</div>
</div>
<div id="company"></div>
<div id="contract" class="dialogDiv"></div>

<%@ include file="contract_detail.jsp" %>
<%@ include file="wh_contract_js.jsp" %>
<div id="dialog1" class="dialogDiv" title="기업회원 상세보기">
<%@ include file="/WEB-INF/views/member/companyDetail.jsp" %>
</div>
<div id="dialog2" class="dialogDiv" title="물류센터 상세보기">
<%@ include file="/WEB-INF/views/member/warehouseDetail.jsp" %>
</div>
