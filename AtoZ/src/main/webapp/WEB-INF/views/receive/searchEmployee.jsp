<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		    <div class="container-xl" style="width:500px; height:600px;">
		    	<!-- 콘텐츠 헤더 -->
					<div class="page-header d-print-none">
						<div class="row align-items-center">	
							<div class="col">
								<h2 class="page-title">
									담당 직원 검색
								</h2>
							</div>
						</div>
					</div>
					<div class="card col-12">
						<div class="card-header" id="employeeSearch">
							
						</div>
						<div class="card-body">
							<div class="table-responsive" style="max-height:380px;">
								<table class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th class="text-center">직원 ID</th>
											<th class="text-center">직 원 명</th>
											<th class="text-center">담당업무</th>
										</tr>
									</thead>
									<tbody id="employeeBody">
										
									</tbody>
								</table>
							</div>
							<!-- /table-responsive -->
						</div>
						<!-- card-body -->
						<div class="card-footer" id="employeePage" style="background:white;text-align: right;">
							
						</div>
					</div>
					<!-- /card col-12 -->
					<div class="row" style="margin-top : 10px;">
						<div class="col-2">
							<input type="button" class="btn btn-white" onclick="closeDial($('#dialog3'));" value="취소">
						</div>
					</div>
					
		    </div>
