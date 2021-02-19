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
					<strong>재고목록</strong>
				</h2>
			</div>
			<div class="card-body border-bottom py-3">
				<div class="d-flex">
					<div class="ms-auto text-muted" style="padding-left: 65%;">
						Search :
						<div class="ms-2 d-inline-block">
							<select class="form-select">
								<option value="0">검색조건</option>
								<option value="1">품목코드</option>
								<option value="2">품목명</option>
								<option value="3">바코드</option>
								<option value="4">물류센터명</option>
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
							<th>품목코드</th>
							<th>품목명</th>
							<th>규격</th>								
							<th>수량</th>								
							<th>바코드</th>							
							<th>물류센터명</th>							
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input class="form-check-input m-0 align-middle"
								type="checkbox" aria-label="Select invoice"> <input
								type="hidden" value="wh_code" name="wh_code"></td>
							<td><span class="text-muted">123</span></td>
							<td><a href="#" data-bs-toggle="modal"
								data-bs-target="#modal-team">C-001-001</a></td>
							<td>울트라로션</td>
							<td>150ml</td>							
							<td>120</td>							
							<td>90000012345</td>							
							<td>(주)남서물류터미널</td>							
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
<div class="modal modal-blur fade show" id="modal-team" tabindex="-1" style="display: none; padding-right: 16px;" aria-modal="true" role="dialog">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title">재고이력</h3>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
          	<div class="card">
			  <div class="card-header">
			    <h3 class="card-title">C-001-001 재고이력</h3>
			  </div>
			  <div class="card-body">
			    <ul class="list list-timeline">
			      <li>
			        <div class="list-timeline-icon bg-twitter"><!-- SVG icon code -->
			        </div>
			        <div class="list-timeline-content">
			          <div class="list-timeline-time">10 hrs ago</div>
			          <p class="list-timeline-title">입고</p>
			          <p class="text-muted">(주)남서물류터미널</p>
			        </div>
			      </li>
			      <li>
			        <div class="list-timeline-icon bg-red"><!-- SVG icon code -->
			        </div>
			        <div class="list-timeline-content">
			          <div class="list-timeline-time">2 hrs ago</div>
			          <p class="list-timeline-title">+3 New Products were added!</p>
			          <p class="text-muted">Congratulations!</p>
			        </div>
			      </li>
			      <li>
			        <div class="list-timeline-icon bg-success"><!-- SVG icon code -->
			        </div>
			        <div class="list-timeline-content">
			          <div class="list-timeline-time">1 day ago</div>
			          <p class="list-timeline-title">Database backup completed!</p>
			          <p class="text-muted">Download the <a href="#">latest backup</a>.</p>
			        </div>
			      </li>
			      <li>
			        <div class="list-timeline-icon bg-facebook"><!-- SVG icon code -->
			        </div>
			        <div class="list-timeline-content">
			          <div class="list-timeline-time">1 day ago</div>
			          <p class="list-timeline-title">+290 Page Likes</p>
			          <p class="text-muted">This is great, keep it up!</p>
			        </div>
			      </li>
			      <li>
			        <div class="list-timeline-icon bg-teal"><!-- SVG icon code -->
			        </div>
			        <div class="list-timeline-content">
			          <div class="list-timeline-time">2 days ago</div>
			          <p class="list-timeline-title">+3 Friend Requests</p>
			          <div class="avatar-list mt-3">
			            <span class="avatar" style="background-image: url(...)">
			              <span class="badge bg-success"></span></span>
			            <span class="avatar">
			              <span class="badge bg-success"></span>JL</span>
			            <span class="avatar" style="background-image: url(...)">
			              <span class="badge bg-success"></span></span>
			          </div>
			        </div>
			      </li>
			      <li>
			        <div class="list-timeline-icon bg-yellow"><!-- SVG icon code -->
			        </div>
			        <div class="list-timeline-content">
			          <div class="list-timeline-time">3 days ago</div>
			          <p class="list-timeline-title">+2 New photos</p>
			          <div class="mt-3">
			            <div class="row g-2">
			              <div class="col-6">
			                <div class="media media-2x1 rounded">
			                  <a class="media-content" style="background-image: url(...)"></a>
			                </div>
			              </div>
			              <div class="col-6">
			                <div class="media media-2x1 rounded">
			                  <a class="media-content" style="background-image: url(...)"></a>
			                </div>
			              </div>
			            </div>
			          </div>
			        </div>
			      </li>
			      <li>
			        <div class="list-timeline-icon"><!-- SVG icon code -->
			        </div>
			        <div class="list-timeline-content">
			          <div class="list-timeline-time">2 weeks ago</div>
			          <p class="list-timeline-title">System updated to v2.02</p>
			          <p class="text-muted">Check the complete changelog at the <a href="#">activity
			              page</a>.</p>
			        </div>
			      </li>
			    </ul>
			  </div>
			</div>              
          </div>
          <div class="modal-footer">
            <button type="button" class="btn me-auto" data-bs-dismiss="modal">Close</button>
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
