<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		    <div class="container-xl" style="width:1000px; height:500px;">
		    	<!-- 콘텐츠 헤더 -->
					<div class="page-header d-print-none">
						<div class="row align-items-center">	
							<div class="col">
								<h2 class="page-title">
									입고 담당자 배정
								</h2>
							</div>
						</div>
					</div>
					<div class="card col-12">
						<div class="card-header">
							<div class="col-12" style="height:25px;line-height: 200%;">
								<div class="row">
									&nbsp;&nbsp;&nbsp;담당자 :&nbsp; <input type="text" id="inputMngr" onclick="openEmployeeList()" readonly class="form-control" style="width:100px;height:25px;">
								</div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive" style="max-height:400px;height:400px;">
								<table class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th class="text-center">발주번호</th>
											<th class="text-center">기 업 명</th>
											<th class="text-center">품 목 명</th>
											<th class="text-center">수량</th>
											<th class="text-center">납 기 일</th>
											<th class="text-center">요 청 일</th>
											<th class="text-center">담 당 자</th>
										</tr>
									</thead>
									<tbody id="managerBody">
									
									</tbody>
								</table>
							</div>
							<!-- /table-responsive -->
						</div>
						<!-- card-body -->
					</div>
					<!-- /card col-12 -->
					<div class="row" style="margin-top : 10px;">
						<div class="col-10" style="text-align: right;margin-left : auto;">
							<input type="button" class="btn btn-white" onclick="modifyMngr();" value="저장">
							<input type="button" class="btn btn-white" onclick="closeDial($('#dialog1'));" value="취소">
						</div>
					</div>
					
		    </div>
		
	
	
	