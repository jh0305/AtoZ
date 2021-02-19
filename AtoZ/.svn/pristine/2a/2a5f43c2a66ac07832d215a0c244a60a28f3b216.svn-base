<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		    <div class="container-xl" style="width:900px; height:400px;">
		    	<!-- 콘텐츠 헤더 -->
					<div class="page-header d-print-none">
						<div class="row align-items-center">	
							<div class="col">
								<h2 class="page-title">
									입고 품목 목록
								</h2>
							</div>
						</div>
					</div>
					<div class="card col-12">
						<div class="card-header">
							<div class="col-12" style="height:25px;line-height: 200%;">
								&nbsp;발주번호&nbsp; : &nbsp;<span id="spanForOrd">123213</span>&nbsp;│&nbsp;
								<c:if test="${mode eq 'WH' }">
									기업명
								</c:if>
								<c:if test="${mode eq 'CO' }">
									물류센터명
								</c:if>
								&nbsp; : &nbsp;<span id="spanForCo">코카콜라</span>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive" style="max-height:330px;height:330px;">
								<table class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th class="text-center">번호</th>
											<th class="text-left" style="text-align: left">품 목 명</th>
											<th class="text-left" style="text-align: left">규 격 명</th>
											<th class="text-right"style="text-align: right;">수량</th>
											<th class="text-right"style="text-align: right;">실입고수량</th>
											<th class="text-center">품목그룹</th>
											<th class="text-center">품목구분</th>
										</tr>
									</thead>
									<tbody id="itemListBody">
										<tr>
											<td class="text-center">10</td>
											<td class="text-center">취급 품목 유형</td>
											<td class="text-center">사용중</td>
											<td class="text-center">사용중</td>
											<td class="text-center">사용중</td>
											<td class="text-center">사용중</td>
										</tr>
										<tr>
											<td class="text-center">20</td>
											<td class="text-center">품목 그룹</td>
											<td class="text-center">사용중</td>
											<td class="text-center">사용중</td>
											<td class="text-center">사용중</td>
											<td class="text-center">사용중</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- /table-responsive -->
						</div>
						<!-- card-body -->
					</div>
					<!-- /card col-12 -->
					<div class="row" style="margin-top : 10px;">
						<div class="col-2" style="margin-left:auto; text-align: right;">
							<input type="button" class="btn btn-white" onclick="closeDial($('#dialog2'));" value="닫기">
						</div>
					</div>
					
		    </div>
