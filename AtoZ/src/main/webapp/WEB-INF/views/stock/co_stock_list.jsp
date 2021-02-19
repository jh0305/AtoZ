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

<div class="col-12" style="padding: 0px 15px;">
	<div class="row row-deck row-cards">		
		<div class="card" style="height: 850px;margin:0px;min-height:400px;">
			<div class="card-header">
				<h2 class="card-title">
					<strong>재고목록</strong>
				</h2>
			</div>
			<div class="row" style="margin-top: 20px;padding-left: 2px;">
				<div class="col-7">
				<div class="card" style="margin: 0px;min-height:400px;">
					<div class="table-responsive" id="dynamic-table">						
					<!-- handlebars 재고 목록 들어올 자리  -->
					</div>
					<div id="list_paging"></div>
				</div>
				</div>
				<div class="col-5">
				<div class="card" style="margin:0px;">
					<div id="stock_detail"></div>				
					<div id="paging"></div>					
				</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="co_stock_list_js.jsp"%>

