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
	padding-left : 80%;
}
</style>

<div class="container-xl">
	<div class="row row-deck row-cards">
		<div class="card">
			<div class="card-header">
				<h2 class="card-title">
					<strong>재고이력</strong>
				</h2>
			</div>
			<div class="card-body border-bottom py-3">
				<div class="d-flex">
					<div class="ms-2 d-inline-block">
							<select class="form-select">
								<option value="1">정렬기준</option>
								<option value="2">최근작업일</option>
								<option value="3">작업유형</option>
								<option value="4">적재위치</option>
							</select>
					</div>
					<div class="ms-auto text-muted" style="padding-left: 60%;">
						Search :
						<div class="ms-2 d-inline-block">
							<select class="form-select">
								<option value="1">품목코드</option>
								<option value="2">발주번호</option>
								<option value="3">바코드</option>
								<option value="4">기업명</option>
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
							<th>작업일자</th>
							<th>작업유형</th>
							<th>품목코드</th>								
							<th>품목명</th>							
							<th>적재위치</th>							
							<th>바코드</th>							
							<th>현재수량</th>							
							<th>변동수량</th>							
							<th>기업명</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="form-check-input m-0 align-middle"
								type="checkbox" aria-label="Select invoice"> <input
								type="hidden" value="wh_code" name="wh_code"></td>
							<td><span class="text-muted">123</span></td>
							<td>2020-12-29</td>
							<td>입고</td>
							<td>B-002-023</td>							
							<td>울트라스킨</td>
							<td>C-01-01</td>
							<td>90000012345</td>							
							<td>120</td>							
							<td>+50</td>							
							<td>두리화장품</td>							
						</tr>												
					</tbody>
				</table>
			</div>
			<div class="card-footer" style="padding-left:83%;">
				<button type="button" class="btn btn-light">인쇄</button>
				<button type="button" class="btn btn-light">EXCEL</button> 
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
<div class="modal modal-blur fade show" id="modal-team" tabindex="-1" style="display: none; padding-right: 16px;" aria-modal="true" role="dialog">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title">실사결과등록</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">품목명</label>
                <input type="text" class="form-control" value="울트라로션" readonly>
              </div>
            </div>
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">품목코드</label>
                <input type="text" class="form-control" value="B-002-023" readonly>
              </div>
            </div>
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">기존수량</label>
                <input type="text" class="form-control" value="120" readonly>
              </div>
            </div>
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">실사수량</label>
                <input type="text" class="form-control">
              </div>
            </div>
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">변동수량</label>
                <input type="text" class="form-control">
              </div>
            </div>
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">변동사유</label>
                <input type="text" class="form-control">
              </div>
            </div>
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">실사일</label>
                <input type="date" class="form-control">
              </div>
            </div>
            <div class="row mb-3 align-items-end">             
              <div class="col">
                <label class="form-label">기업명</label>
                <input type="text" class="form-control" value="두리화장품">
              </div>
            </div>
            
          </div>
          <div class="modal-footer">
            <button type="button" class="btn me-auto" data-bs-dismiss="modal">Close</button>
            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">결과전송</button>
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
