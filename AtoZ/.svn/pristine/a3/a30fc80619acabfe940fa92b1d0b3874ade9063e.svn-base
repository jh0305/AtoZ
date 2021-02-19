	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
.inputrow{	
	width : 70px;
	text-align : center;
	font-size : 0.9em;
}
.inputdate{
	width: 115px;
    font-size: 0.9em;
}
.editbtns{
	padding-left : 90%;
}
</style>

<div class="container-xl">
	<div class="row row-deck row-cards">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">
					<strong>입고처리</strong>
				</h2>
			</div>
			<div class="card-body border-bottom py-3">
				<div class="d-flex">
					<div class="ms-auto text-muted" style="padding-left: 65%;">
						Search :
						<div class="ms-2 d-inline-block">
							<select class="form-select">
								<option value="1">품목코드</option>
								<option value="2">발주번호</option>
								<option value="3">바코드</option>
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
							<th class="w-1">발주번호 <svg xmlns="http://www.w3.org/2000/svg"
									class="icon icon-sm text-dark icon-thick" width="24"
									height="24" viewBox="0 0 24 24" stroke-width="2"
									stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
									<polyline points="6 15 12 9 18 15"></polyline></svg>
							</th>
							<th>품목코드</th>
							<th>적재위치</th>
							<th>실입고일</th>								
							<th>실입고수량</th>							
							<th>입고담당자</th>							
							<th>상태</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="form-check-input m-0 align-middle"
								type="checkbox" aria-label="Select invoice"> <input
								type="hidden" value="wh_code" name="wh_code"></td>
							<td><span class="text-muted">123</span></td>
							<td>C-001-001</td>
							<td><input type="text" class="inputrow" value="B-01-02"></td>							
							<td><input type="date" class="inputdate" value="2021-01-05"></td>
							<td><input type="text" class="inputrow" value="50"></td>
							<td><input type="text" class="inputrow" value="홍반장"></td>
							<td><!-- <input type="text" class="inputrow" value="입하대기"> --> 
							<select>
								<option value="1">입고대기</option>
								<option value="2">입고</option>								
							</select></td>
						</tr>
						<tr>
							<td><input class="form-check-input m-0 align-middle"
								type="checkbox" aria-label="Select invoice"> <input
								type="hidden" value="wh_code" name="wh_code"></td>
							<td><span class="text-muted">125</span></td>
							<td>D-001-001</td>						
							<td><input type="text" class="inputrow" value="D-01-02"></td>							
							<td><input type="date" class="inputdate" value="2021-01-05"></td>
							<td><input type="text" class="inputrow" value="300"></td>
							<td><input type="text" class="inputrow" value="고길동"></td>
							<td><!-- <input type="text" class="inputrow" value="입하대기"> --> 
							<select>
								<option value="1">입고대기</option>
								<option value="2" selected>입고</option>								
							</select></td>
						</tr>								
					</tbody>
				</table>
			</div>
			<div class="card-footer editbtns">
				<button type="button" class="btn btn-success">수정/등록</button> 
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
<script>
 	/* function openmodal(){
 		var whmodal = document.getElementById('modal-report');
 		whmodal.style.display="block";
 	} */
 </script>   
