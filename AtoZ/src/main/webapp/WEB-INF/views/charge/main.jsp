<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
body {
	overflow: hidden;
}

.listPageMaker>ul {
	margin: 0px;
}

tr[name="chargeResult-tr"]:hover {
	background-color: #F8F9FC;
}

tr[name="chargeResult-tr"] {
	cursor: pointer;
}
</style>

<div class="" style="padding-left: 0px; padding-right: 0px; margin-right: 15px; margin-left: 15px;">
	<!-- 콘텐츠 헤더 -->
	<div class="page-header d-print-none">
		<div class="row align-items-center">
			<div class="col">
				<h2 class="page-title">청구 관리</h2>
			</div>
		</div>
	</div>
	<!-- /page-header -->

	<div class="card col-12" style="height: 824px;">
		<ul class="nav nav-tabs" data-bs-toggle="tabs">
			<li class="nav-item"><a href="#tabs-req-ex1" onclick="asyncSearch_go(1, '/WH/charge/chargeRequestList', targets);" class="nav-link active" data-bs-toggle="tab">청구필요</a></li>
			<li class="nav-item"><a href="#tabs-plan-ex1" onclick="asyncSearch_go(1, '/WH/charge/chargeResultList', targets2);" class="nav-link" data-bs-toggle="tab">청구완료</a></li>
		</ul>
		<div class="card-body" style="padding: 10px 20px 0px 20px;">
			<div class="tab-content">

				<!-- 청구 필요 탭 내용 -->
				<div class="tab-pane active show" id="tabs-req-ex1">
					<div id="chargeRequest-search-div" style="margin-bottom: 10px;"></div>
					<div class="table-responsive" style="margin: 0px;">
						<table class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th class="text-center">입고번호</th>
									<th class="text-center">입고일자</th>
									<th class="text-center">입고품목</th>
									<th class="text-center">입고수량</th>
									<th class="text-center">기업이름</th>
									<th class="text-center">작업비용</th>
								</tr>
							</thead>
							<tbody id="chargeRequest-tbody">

							</tbody>
						</table>
					</div>
					<!-- /card-body -->
					<div class="card-footer d-flex align-items-center" style="padding: 0px 0px; background: white;">
						<div class="listPageMaker" id="chargeRequestListPageMaker"></div>
						<div style="margin-top: 10px; display: inline-block; text-align: right;" class="ms-auto col-6">
							<input style="margin-bottom: 10px;" type="button" class="btn btn-light" onclick="insertCharge(this);" value="청구">
						</div>
					</div>
				</div>

				<!-- 청구 완료 탭 내용 -->
				<div class="tab-pane" id="tabs-plan-ex1">
					<div id="chargeResult-search-div" style="margin-bottom: 10px;"></div>
					<div class="table-responsive" style="margin: 0px;">
						<table class="table card-table table-vcenter text-nowrap datatable text-center">
							<thead>
								<tr>
									<th>청구번호</th>
									<th>청구일자</th>
									<th>결제기업</th>
									<th>청구내용</th>
									<th>청구금액</th>
									<th>청구상태</th>
								</tr>
							</thead>
							<tbody id="chargeResult-tbody">

							</tbody>
						</table>
					</div>
					<!-- /card-body -->
					<div class="card-footer d-flex align-items-center" style="padding: 0px 0px; background: white;">
						<div style="margin: 15px 0px;" class="listPageMaker" id="chargeResultListPageMaker"></div>
					</div>
				</div>
				<!-- /tabs-plan -->
			</div>
		</div>
	</div>
</div>

<div id="coSearch" class="dialogDiv" title="기업검색" style="padding: 10px 10px 10px 10px;">
	<%@ include file="coSearch.jsp"%>
</div>
<div id="confirm" class="dialogDiv" title="비용청구" style="padding: 10px 10px 10px 10px;">
	<%@ include file="confirm.jsp"%>
</div>
<div id="detail" class="dialogDiv" title="청구내역" style="padding: 10px 10px 10px 10px;">
	<%@ include file="detail.jsp"%>
</div>

<%@ include file="main_js.jsp"%>
<%@ include file="/WEB-INF/views/common/popupDial_js.jsp"%>
