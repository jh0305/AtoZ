<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style>
	.listPageMaker > ul{
		margin: 0px;
	}
	tr[name="paymentRequest-tr"]:hover{
		background-color: #F8F9FC; 
	}
	tr[name="paymentRequest-tr"]{
		cursor: pointer;
	}
	tr[name="paymentResult-tr"]:hover{
		background-color: #F8F9FC; 
	}
	tr[name="paymentResult-tr"]{
		cursor: pointer;
	}
</style>

<div style=" padding: 0px 15px; ">
	<!-- 콘텐츠 헤더 -->
	<div class="page-header d-print-none">
		<div class="row align-items-center">
			<div class="col">
				<h2 class="page-title">결제 관리</h2>
			</div>
		</div>
	</div>
	<!-- /page-header -->

	<div class="card col-12" style=" height: 823px; ">
		<ul class="nav nav-tabs" data-bs-toggle="tabs">
			<li class="nav-item"><a href="#tabs-req-ex1" onclick="asyncSearch_go(1, 'CO/payment/paymentRequestList', targets);" class="nav-link active" data-bs-toggle="tab">결제필요</a></li>
			<li class="nav-item"><a href="#tabs-plan-ex1" onclick="asyncSearch_go(1, 'CO/payment/paymentResultList', targets2);" class="nav-link" data-bs-toggle="tab">결제완료</a></li>
		</ul>
		<div class="card-body" style="padding: 10px 20px 0px 20px;">
			<div class="tab-content">
				<div class="tab-pane active show" id="tabs-req-ex1">
					<div id="paymentRequest-search-div" style="margin-bottom: 10px;">
					
					</div>
					<div class="table-responsive" style="max-height: 500px; margin: 0px;">
						<table class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th class="text-center">결제번호</th>
									<th class="text-center">결제일자</th>
									<th class="text-center">청구센터</th>
									<th class="text-center">결제내용</th>
									<th class="text-center">결제금액</th>
									<th class="text-center">결제상태</th>
								</tr>
							</thead>
							<tbody id="paymentRequest-tbody">
								
							</tbody>
						</table>
					</div>
					<!-- /card-body -->
					<div class="card-footer d-flex align-items-center" style="padding: 0px 0px; background: white;">
						<div style="margin: 15px 0px;" class="listPageMaker" id="paymentRequestListPageMaker">
							
						</div>
					</div>
				</div>
				
				<!-- 청구 완료 -->
				<div class="tab-pane" id="tabs-plan-ex1">
					<div id="paymentResult-search-div" style="margin-bottom: 10px;">
					
					</div>
					<div class="table-responsive" style="max-height: 500px; margin: 0px;">
						<table class="table card-table table-vcenter text-nowrap datatable">
							<thead>
								<tr>
									<th class="text-center">결제번호</th>
									<th class="text-center">결제일자</th>
									<th class="text-center">청구센터</th>
									<th class="text-center">결제내용</th>
									<th class="text-center">결제금액</th>
									<th class="text-center">결제상태</th>
								</tr>
							</thead>
							<tbody id="paymentResult-tbody">
								
							</tbody>
						</table>
					</div>
					<!-- /card-body -->
					<div class="card-footer d-flex align-items-center" style="padding: 0px 0px; background: white;">
						<div style="margin: 15px 0px;" class="listPageMaker" id="paymentResultListPageMaker">
							
						</div>
					</div>
				</div>
				<!-- /tabs-plan -->
			</div>
		</div>
	</div>
</div>

<div id="whSearch" class="dialogDiv" title="물류센터검색" style="padding: 10px 10px 10px 10px;">
	<%@ include file="whSearch.jsp"%>
</div>
<div id="confirm" class="dialogDiv" title="결제확인" style="padding: 10px 10px 10px 10px; overflow: hidden;">
	<%@ include file="confirm.jsp"%>
</div>

<%@ include file="main_js.jsp" %>
<%@ include file="/WEB-INF/views/common/popupDial_js.jsp"%>
