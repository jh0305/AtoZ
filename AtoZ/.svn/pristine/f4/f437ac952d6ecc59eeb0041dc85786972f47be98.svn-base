<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.caroimg{	
	height : 300px;
}
</style>

<div class="container-xl">
	<div class="row row-deck row-cards">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">
					<strong>고객간 계약 현황</strong>
				</h2>
			</div>
			<div class="card-body border-bottom py-3">
				<div class="d-flex">
					<div class="ms-auto text-muted" style="padding-left: 65%;">
						Search :
						<div class="ms-2 d-inline-block">
							<select class="form-select">
								<option value="1">기업명</option>
								<option value="2">물류센터명</option>
								<option value="3">계약상태</option>
							</select>
						</div>
					</div>
					<div class="ms-auto text-muted">
						<div class="ms-2 d-inline-block">
							<input type="text" class="form-control form-control-md"
								aria-label="Search invoice">
						</div>
					</div>
				</div>
			</div>
			<div class="table-responsive">
				<table class="table card-table table-vcenter text-nowrap datatable">
					<thead>
						<tr>
							<th class="w-1"><input
								class="form-check-input m-0 align-middle" type="checkbox"
								aria-label="Select all invoices"></th>
							<th class="w-1">No. <svg xmlns="http://www.w3.org/2000/svg"
									class="icon icon-sm text-dark icon-thick" width="24"
									height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="6 15 12 9 18 15"></polyline></svg>
							</th>
							<th>기업명</th>
							<th>대표자명</th>
							<th>물류센터명</th>
							<th>대표자명</th>
							<th>계약기간</th>							
							<th>계약상태</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="form-check-input m-0 align-middle"
								type="checkbox" aria-label="Select invoice"> <input
								type="hidden" value="wh_code" name="wh_code"></td>
							<td><span class="text-muted">001</span></td>
							<td><a href="#" data-bs-toggle="modal"
								data-bs-target="#modal-report">두리화장품</a></td>
							<td>손영호</td>
							<td><a href="#" data-bs-toggle="modal"
								data-bs-target="#modal-report1">(주)남서물류터미널</a></td>
							<td>김대옹</td>
							<td>2년</td>
							<td>승인대기</td>
						</tr>
						<tr>
							<td><input class="form-check-input m-0 align-middle"
								type="checkbox" aria-label="Select invoice"> <input
								type="hidden" value="wh_code" name="wh_code"></td>
							<td><span class="text-muted">001</span></td>
							<td><a href="#" data-bs-toggle="modal"
								data-bs-target="#modal-report">두리화장품</a></td>
							<td>손영호</td>
							<td><a href="#" data-bs-toggle="modal"
								data-bs-target="#modal-report1">SLS덕평물류센터2</a></td>
							<td>최송영</td>
							<td>2년</td>
							<td>승인대기</td>
						</tr>
						<tr>
							<td><input class="form-check-input m-0 align-middle"
								type="checkbox" aria-label="Select invoice"> <input
								type="hidden" value="wh_code" name="wh_code"></td>
							<td><span class="text-muted">002</span></td>
							<td><a href="#" data-bs-toggle="modal"
								data-bs-target="#modal-report">두리화장품</a></td>
							<td>손영호</td>
							<td><a href="#" data-bs-toggle="modal"
								data-bs-target="#modal-report1">SLS덕평물류센터1</a></td>
							<td>김대옹</td>
							<td>2년</td>
							<td>계약</td>
						</tr>						
					</tbody>
				</table>
			</div>
			<div class="card-footer d-flex align-items-center">
				<p class="m-0 text-muted">
					Showing <span>1</span> to <span>8</span> of <span>16</span> entries
				</p>
				<ul class="pagination m-0 ms-auto">
					<li class="page-item disabled"><a class="page-link" href="#" tabindex="-1" aria-disabled="true"> <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
					<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
					<polyline points="15 6 9 12 15 18"></polyline></svg> prev
					</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">4</a></li>
					<li class="page-item"><a class="page-link" href="#">5</a></li>
					<li class="page-item"><a class="page-link" href="#"> next
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
					<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
					<polyline points="9 6 15 12 9 18"></polyline></svg>
					</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="modal modal-blur fade show" id="modal-report" tabindex="-1"
	style="display: none; padding-right: 16px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog modal-lg modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">00기업</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="mb-3">
								<label class="form-label">대표자명</label> <input type="text"
									class="form-control" value="000" readonly>
							</div>
						</div>						
						<div class="col-lg-12">
							<div class="mb-3">
								<label class="form-label">주소</label> <input type="text"
									class="form-control" value="00도 00시 000" readonly>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="mb-3">
								<label class="form-label">사업자등록번호</label> <input type="text"
									class="form-control" value="000-0000-0000" readonly>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="mb-3">
								<label class="form-label">희망계약기간 (년)</label> 
								<input type="text" class="form-control" value="0" readonly>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="mb-3">
								<label class="form-label">희망계약면적 (m2)</label> 
								<input type="text" class="form-control" value="0000" readonly>
							</div>
						</div>
					</div>
				</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
<div class="modal modal-blur fade show" id="modal-report1" tabindex="-1"
	style="display: none; padding-right: 16px;" aria-modal="true"
	role="dialog">
	<div class="modal-dialog modal-lg modal-dialog-centered"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">00물류센터</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<div class="mb-3">
					<div id="carousel-controls" class="carousel slide"
						data-bs-ride="carousel">
						<div class="carousel-inner" style="padding-left: 20%;">
							<div class="carousel-item">
								<img class="d-block w-80 caroimg" alt=""
									src="<%=request.getContextPath()%>/resources/images/temp.jpg">
							</div>
							<div class="carousel-item active">
								<img class="d-block w-80 caroimg" alt=""
									src="<%=request.getContextPath()%>/resources/images/temp.jpg">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-controls"
							role="button" data-bs-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Previous</span>
						</a> <a class="carousel-control-next" href="#carousel-controls"
							role="button" data-bs-slide="next"> <span
							class="carousel-control-next-icon" aria-hidden="true"></span> <span
							class="visually-hidden">Next</span>
						</a>
					</div>
				</div>
				<div class="modal-body">
					<div class="row">
						<div class="col-lg-6">
							<div class="mb-3">
								<label class="form-label">대표자명</label> <input type="text"
									class="form-control" value="000" readonly>
							</div>
						</div>
						<div class="col-lg-6">
							<div class="mb-3">
								<label class="form-label">총면적</label> <input type="text"
									class="form-control" value="0000" readonly>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="mb-3">
								<label class="form-label">주소</label> <input type="text"
									class="form-control" value="00도 00시 000" readonly>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="mb-3">
								<label class="form-label">사업자등록번호</label> <input type="text"
									class="form-control" value="000-0000-0000" readonly>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-light" data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
 	/* function openmodal(){
 		var whmodal = document.getElementById('modal-report');
 		whmodal.style.display="block";
 	} */
 </script>   
