<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.form-check-input {
	cursor: pointer;
}

.list_tr:hover {
	background: rgb(241, 244, 249);
}

.list_tr {
	cursor: pointer;
}

.w-1000-table-col-5 th, td{
	width: 200px;
}
</style>

<div class="col-12">

	<div class="page-header d-print-none" style="margin-left: 10px;">
		<div class="row align-items-center">
			<div class="col">
				<h2 class="page-title">발주 현황 조회</h2>
			</div>
		</div>
	</div>

	<div class="card text-center" style="margin: 0px 10px; padding: 10px; height: 876px;">
		<div class="row" style="margin-bottom: 5px;">
			<div class="col-12">
				<div class="row">
					<div class="col-4">
						<div class="col-12">
							<div class="row" style="padding: 0px 0px 0px 10px;">
								<div class="col-1" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px; font-size: 12px;">발주일자</div>
								<div class="col-5" style="display: inline-block;">
									<div class="input-icon">
										<input onchange="goOrderListSearch();ymd_check(this);" id="req_ymd" type="date" value="" class="form-control" style="font-size: 12px;" max="9999-12-31" placeholder="Select a date">
									</div>
								</div>
								<div class="col-1" style="line-height: 36px;">~</div>
								<div class="col-5" style="display: inline-block;">
									<div class="input-icon">
										<input onchange="goOrderListSearch();ymd_check(this);" id="req_ymd_after" type="date" value="" class="form-control" style="font-size: 12px;" max="9999-12-31" placeholder="Select a date">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="col-12">
							<div class="row" style="padding: 0px 0px 0px 0px;">
								<div class="col-1" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px; font-size: 12px;">납기일자</div>
								<div class="col-5" style="display: inline-block;">
									<div class="input-icon">
										<input onchange="goOrderListSearch();ymd_check(this);" id="deli_ymd" type="date" value="" style="font-size: 12px;" class="form-control" max="9999-12-31" placeholder="Select a date">
									</div>
								</div>
								<div class="col-1" style="line-height: 36px;">~</div>
								<div class="col-5" style="display: inline-block;">
									<div class="input-icon">
										<input onchange="goOrderListSearch();ymd_check(this);" id="deli_ymd_after" type="date" value="" style="font-size: 12px;" class="form-control" max="9999-12-31" placeholder="Select a date">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-2">
						<div class="col-12">
							<div class="row" style="padding: 0px; margin-bottom: 5px;">
								<div class="col-3" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px; font-size: 12px">담당자명</div>
								<div class="col-9" style="height: 36px; display: inline-block;">
									<div class="col-12" style="padding: 0px 0px;">
										<div class="row" style="margin: 0px 0px 5px 0px;">
											<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12">
												<div class="col-12">
													<input onchange="goOrderListSearch();" name="ord_mngr" value="" type="text" class="form-control" placeholder="담장자 이름을 입력하세요." style="font-size: 12px; border-radius: 3px;">
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-2">
						<div class="col-12">
							<div class="row" style="padding: 0px 10px 0px 0px;">
								<div class="col-3" name="in_wh_name_div" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px; font-size: 12px;">입고창고</div>
								<div class="col-9" style="height: 36px; display: inline-block; padding: 0px;">
									<input type="hidden" class="form-control" name="list_wh_code" onchange="goOrderListSearch();"> 
									<input type="text"   class="form-control" name="list_wh_name" readonly placeholder="창고 검색" onclick="open_whSearch(this);" style="font-size: 12px; background-color: white; border-radius: 3px;">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 리스트 테이블 -->
		<div class="col-12" style="min-width: 1248px;">
			<div class="col-12 card">
				<div class="table-responsive" style="margin-bottom: 0px; max-height: 625px;">
					<table class="table table-vcenter card-table">
						<thead class="list_thead">
							<tr>
								<th class="col-md-2" style="width: 0.1%; padding: 8px 8px 8px 16px;"><input onclick="goCheck(this);" id="main_check" class="form-check-input m-0 align-middle" type="checkbox"
									aria-label="Select invoice"></th>
								<th class="col-md-2 text-center">발주일자</th>
								<th class="col-md-2 text-center">담당자</th>
								<th class="col-md-2 text-center">입고창고</th>
								<th class="col-md-2 text-center">납기일자</th>
								<th class="col-md-2 text-center">진행상태</th>
							</tr>
						</thead>
						<tbody id="list_tbody">
							<c:forEach items="${orderList}" var="order">
								<tr class="list_tr" onclick="open_modify_dialog(this);">
									<td onclick="event.cancelBubble=true"><input type="hidden" name="ord_no" value="${order.ord_no}" /><input onclick="goCheckCnt();" name="checkReq"
										class="form-check-input m-0 align-middle" type="checkbox" aria-label="Select invoice"></td>
									<td name="" class=" text-center">${fn:substring(order.req_ymd,0,4) }-${fn:substring(order.req_ymd,4,6) }-${fn:substring(order.req_ymd,6,8) }</td>
									<td name="" class=" text-center">${order.ord_mngr}</td>
									<td style="display: none;">${order.wh_code}</td>
									<td name="" class=" text-center">${order.wh_name}</td>
									<td name="" class=" text-center">${fn:substring(order.deli_ymd,0,4) }-${fn:substring(order.deli_ymd,4,6) }-${fn:substring(order.deli_ymd,6,8) }</td>
									<c:set var="sts_code" value="${order.sts_code}" />
									<c:choose>
										<c:when test="${sts_code eq 'PR001'}">
											<td name="${sts_code}" class="text-center">요청</td>
										</c:when>
										<c:when test="${sts_code eq 'PR002'}">
											<td name="${sts_code}" class="text-center">수락</td>
										</c:when>
										<c:when test="${sts_code eq 'PR003'}">
											<td name="${sts_code}" class="text-center">입고대기</td>
										</c:when>
										<c:otherwise>
											<td name="${sts_code}" class="text-center">입고완료</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<div class="row" style="text-align: right; padding: 9px; height: 30px;">
			<button onclick="openDial($('#registOrder'), 1024, 725);today_ymd();getRegistForm();"
				style="position: absolute; text-align: right; width: 50px; height: 35px; margin-right: 10px; bottom: 10px; right: 60px;" class="btn">등록</button>
			<button onclick="removeOrder();" style="bottom: 10px; position: absolute; text-align: right; width: 50px; height: 35px; float: right; right: 10px;" class="btn">취소</button>
		</div>
	</div>
</div>

<div id="registOrder" class="dialogDiv" title="신규발주등록" style="padding: 10px 10px 10px 10px;">
	<%@ include file="regist.jsp"%>
</div>

<div id="order_modify_dialog" class="dialogDiv" title="발주상세정보" style="padding: 10px 10px 10px 10px; overflow: hidden;">
	<%@ include file="modify.jsp"%>
</div>

<div id="itemSearchDialog" class="dialogDiv" title="품목검색" style="padding: 10px 10px 10px 10px;">
	<%@ include file="itemSearch.jsp"%>
</div>

<div id="whSearch" class="dialogDiv" title="창고검색" style="padding: 10px 10px 10px 10px;">
	<%@ include file="whSearch.jsp"%>
</div>

<%@ include file="/WEB-INF/views/order/list_js.jsp"%>
<%@ include file="/WEB-INF/views/common/popupDial_js.jsp"%>
