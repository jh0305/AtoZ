<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		    <div class="container-xl">
		    	<!-- 콘텐츠 헤더 -->
					<div class="page-header d-print-none">
						<div class="row align-items-center">	
							<div class="col">
								<h2 class="page-title">
									피킹 목록
								</h2>
							</div>
						</div>
					</div>
					<div class="card col-12">
						<div class="card-header">
								출고번호&nbsp; : &nbsp;<span id="spanForOrd">123213</span>&nbsp;│&nbsp;
								담당자&nbsp; : &nbsp;<span id="spanForMngr">심민규
						</div>
						<div class="card-body">
							<div class="table-responsive" style="max-height:380px;">
								<table class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th class="text-center">번호</th>
											<th class="text-left" style="text-align: left;">기 업 명</th>
											<th class="text-left" style="text-align: left;">품 목 명</th>
											<th class="text-left" style="text-align: left;">규 격 명</th>
											<th class="text-right" style="text-align: right;">수량</th>
											<th class="text-center">재고위치</th>
											<th class="text-center">상태</th>
										</tr>
									</thead>
									<tbody id="pickingListTbody">
									</tbody>
								</table>
							</div>
							<!-- /table-responsive -->
						</div>
						<!-- card-body -->
					</div>
					<!-- /card col-12 -->
					<div class="row" style="margin-top : 10px;text-align: right;">
						<div class="col-6" style="margin-left : auto; text-align: right;">
							<input type="button" class="btn btn-white" id="strBtn" onclick="registPicking(this);" value="피킹재고할당">
							<input type="button" class="btn btn-white" onclick="closeDial($('#dialog1'));" value="취소">
						</div>
					</div>
					
		    </div>
