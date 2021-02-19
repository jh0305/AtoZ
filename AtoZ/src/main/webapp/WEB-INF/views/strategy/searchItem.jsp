<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
		<div class="content">
		    <div class="container-xl" style="width:800px; height:600px;">
		    	<!-- 콘텐츠 헤더 -->
					<div class="page-header d-print-none">
						<div class="row align-items-center">	
							<div class="col">
								<h2 class="page-title">
									품목 검색
								</h2>
							</div>
						</div>
					</div>
					<div class="card col-12">
						<div class="card-header">
							<div class="col-5">
								<div class="input-icon">
					              <input type="text" class="form-control" placeholder="Search…">
					              <span class="input-icon-addon">
					                <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
					                  stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
					                  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
					                  <circle cx="10" cy="10" r="7"></circle>
					                  <line x1="21" y1="21" x2="15" y2="15"></line>
					                </svg>
					              </span>
					            </div>
							</div>
						</div>
						<div class="card-body">
							<div class="table-responsive" style="max-height:380px;">
								<table class="table card-table table-vcenter text-nowrap datatable">
									<thead>
										<tr>
											<th class="text-center">품목코드</th>
											<th class="text-center">품목명</th>
											<th class="text-center">규격</th>
											<th class="text-center">품목그룹</th>
											<th class="text-center">바코드</th>
											<th class="text-center">품목구분</th>
										</tr>
									</thead>
									<tbody>
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
						<div class="col-2">
							<input type="button" class="btn btn-white" value="취소">
						</div>
					</div>
					
		    </div>
		</div>