<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
			<div class="card-header">
				<div class="row" id="search-req-div">
					<div class="col-12">
						<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
							기업명&nbsp;&nbsp; <input type="text" style="width:145px; height:25px;" class="form-control">&nbsp;&nbsp;
							품목명&nbsp;&nbsp; <input type="text" style="width:145px; height:25px;" class="form-control">
						</div>
					</div> 
					<div class="col-12">
						<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
							납기일&nbsp;&nbsp; <input type="date" style="width:145px; height:25px;" class="form-control">&nbsp;&nbsp; ~
							&nbsp;&nbsp;<input  style="width:145px; height:25px;" class="form-control" type="date">&nbsp;&nbsp;
							요청일&nbsp;&nbsp; <input style="width:145px; height:25px;" class="form-control" type="date">&nbsp;&nbsp; ~ 
							&nbsp;&nbsp;<input style="width:145px; height:25px;" class="form-control" type="date">
						</div>
					</div> 
				</div>
			</div>
			<!-- /card-head -->
			<div class="card-body">
				<div class="table-responsive" style="max-height:500px;height:500px;">
					<table class="table card-table table-vcenter text-nowrap datatable">
						<thead>
							<tr>
							<c:if test="${mode eq 'WH' }">
								<th class="w-1"><input type="checkbox" id="reqAllCheck" onclick="checkAll('checkReq', this);"></th>
							</c:if>
								<th class="text-center">NO.</th>
								<th class="text-center">번호</th>
							<c:if test="${mode eq 'WH' }">
									<th class="text-left" style="text-align: left">기업명</th>
							</c:if>
							<c:if test="${mode eq 'CO' }">
									<th class="text-left" style="text-align: left">물류센터</th>
							</c:if>
								<th class="text-left" style="text-align: left">품목명</th>
								<th class="text-right" style="text-align:right">수량</th>
								<th class="text-center">납기일</th>
								<th class="text-center">요청일</th>
								<th class="text-center">상태</th>
							</tr>
						</thead>
						<tbody id="receive-req-tbody">
						</tbody>
					</table>
				</div>
			</div>
			<!-- /card-body -->
			<div class="card-footer" style="background:white;">
				<div class="row">
					<div class="col-6" id="req-pag" style="text-align: left;">
								
					</div>
					<div class="col-6" style="text-align: right;">
						<c:if test="${mode eq 'WH' }">
							<input type="button" class="btn btn-light" onclick="decision('PR002');" value="승인">
							<input type="button" class="btn btn-light" onclick="decision('PT002');" value="거절">
						</c:if>
					</div>
				</div>
			</div>
