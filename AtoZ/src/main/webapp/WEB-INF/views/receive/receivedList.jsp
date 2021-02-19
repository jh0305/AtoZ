<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<div class="card-header">
				<div class="row" id="search-compl-div">
					
				</div>
			</div>
			<!-- /card-head -->
			<div class="card-body">
				<div class="table-responsive" style="max-height:500px;height:500px;">
					<table class="table card-table table-vcenter text-nowrap datatable">
						<thead>
							<tr>
								<th class="w-1"></th>
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
								<th class="text-right" style="text-align:right">실입고수량</th>
								<th class="text-center">납기일</th>
								<th class="text-center">요청일</th>
							<c:if test="${mode eq 'WH' }">
								<th class="text-center">담당자</th>
							</c:if>
								<th class="text-center">입고일</th>
							</tr>
						</thead>
						<tbody id="receive-compl-tbody">
						</tbody>
					</table>
				</div>
				<!-- /table-responsive -->
			</div>
			<!-- /card-body -->
			<div class="card-footer" style="background:white;">
				<div id="compl-pag" style="text-align: left;">
					
				</div>
			</div>
