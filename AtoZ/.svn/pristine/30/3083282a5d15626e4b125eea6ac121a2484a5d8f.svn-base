<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.inputrow {
	width: 70px;
	text-align: center;
	font-size: 0.9em;
}

.inputdate {
	width: 115px;
	font-size: 0.9em;
}

.editbtns {
	padding-left: 88%;
}

.custom-select-form, .custom-search-form {
	width: 93px;
	font-size: 0.9em;
	margin-top: 10px;
	margin-bottom: 10px
}
</style>

<div style="padding : 0px 10px;">
	<div class="page-header d-print-none" style="margin-left: 10px;">
		<div class="row align-items-center">
			<div class="col" style="padding: 0px;">
				<h2 class="page-title">재고 목록</h2>
			</div>
		</div>
	</div>
	<div class="row row-deck row-cards">
		<div class="card" style="width: 99%;margin: auto;min-height:800px;">
			<div class="row" style="margin-top: 20px;padding-left: 2px;">
				<div class="col-5">
				<div class="card" style="margin: 0px; min-height:700px;">
					<div class="table-responsive" id="dynamic-table" style="min-height:680px;">						
					<!-- handlebars 재고 목록 들어올 자리  -->
					</div>
					<div id="list_paging"></div>
				</div>
				</div>
				<div class="col-7">
				<div class="card" style="margin:0px;">
					<div id="stock_detail"></div>				
					<div id="paging"></div>					
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="detail_history_form" class="dialogDiv">
	<%@ include file="stock_history_form.jsp"%>
</div>
<%@ include file="wh_stock_list_js.jsp"%>
<%@ include file="/WEB-INF/views/common/popupDial_js.jsp" %>
