<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		    <div class="container-xl" style="width:900px; height:400px;">
		    	<!-- 콘텐츠 헤더 -->
					<div class="page-header d-print-none">
						<div class="row align-items-center">	
							<div class="col">
								<h2 class="page-title">
									입고 예정 재고 정보
								</h2>
							</div>
						</div>
					</div>
					<div class="card col-12">
						<div class="card-header">
							<div class="col-12" style="height:25px;line-height: 200%;">
								&nbsp;발주번호&nbsp; : &nbsp;<span id="spanForOrd">123213</span>&nbsp;│&nbsp;
								기업명&nbsp; : &nbsp;<span id="spanForCo">코카콜라</span>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive" style="max-height:380px;">
								<table class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th class="text-center">재고번호</th>
											<th class="text-left">품 목 명</th>
											<th style="text-align:right;">수량</th>
											<th class="text-center">품목그룹</th>
											<th class="text-center">회전율등급</th>
											<th class="text-center">취급유형</th>
											<th class="text-center">적재예정위치</th>
										</tr>
									</thead>
									<tbody id="stockListBody">
										<tr>
											<td class="text-center">10</td>
											<td class="text-center">취급 품목 유형</td>
											<td class="text-center">사용중</td>
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
					<div class="row" style="margin-top : 2%; ">
						<div class="col-6" style="margin-left : auto; text-align: right;">
							<input type="button" class="btn btn-white" id="strBtn" data-ord="" onclick="getStrategy(this);" value="적재위치 배정">
							<input type="button" class="btn btn-white" id="pubBtn" onclick="publishQr();" value="QR발행 및 인쇄">
							<input type="button" class="btn btn-white" onclick="closeDial($('#dialog1'));" value="닫기">
						</div>
					</div>
			    </div>
