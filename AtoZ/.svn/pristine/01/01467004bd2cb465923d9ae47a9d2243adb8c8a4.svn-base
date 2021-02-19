<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.r-table th, td{
		width: 200px;
	}
</style>

<div class="row" style="margin: 0px; padding: 0px;">
	<div class="col-6" style="margin: 0px; padding: 0px; display: inline-block;">
		<div class="row" style="padding: 0px 10px; margin-bottom: 10px;">
			<div class="col-12" style="padding: 0px;">
				<div class="row" style="padding: 0px 10px;">
					<div class="col-2" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px;">발주일자</div>
					<div class="col-10" style="display: inline-block;">
						<div class="input-icon">
							<input readonly style="background: white;" onchange="" id="modify_req_ymd" type="date" value="" class="form-control" placeholder="Select a date">
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" style="padding: 0px; margin: 0px 0px 10px 0px;">
			<div class="col-12" style="padding: 0px;">
				<div class="row" style="padding: 0px 10px;">
					<div class="col-2" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px;">담당자</div>
					<div class="col-10" style="display: inline-block; padding: 0px;">
						<div class="row" style="margin: 0px;">
							<div class="col-12 input-icon" style="">
								<input readonly id="modify_ord_mngr" name="ord_mngr" type="text" class="form-control" placeholder="name" style="background-color: white;">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-6" style="margin: 0px; padding: 0px; display: inline-block;">
		<div class="row" style="padding: 0px 10px; margin-bottom: 10px;">
			<div class="col-12" style="padding: 0px;">
				<div class="row" style="padding: 0px 10px; margin-bottom: 10px;">
					<div class="col-2" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px;">입고창고</div>

					<div class="col-10" style="padding: 0px; height: 36px; display: inline-block;">
						<div class="col-12" style="padding: 0px 0px;">
							<div class="row" style="margin: 0px 0px 5px 0px;">
								<div style="display: inline-block; height: 36px; padding: 0px 0px 0px 0px;" class="col-12">
									<div class="col-12">
										<input disabled id="" name="modify_wh_code" type="text" class="form-control" style="color: black; background-color: white; border-radius: 3px;">
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div class="row" style="padding: 0px 10px;">
					<div class="col-2" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px;">납기일자</div>
					<div class="col-10" style="padding: 0px; display: inline-block;">
						<div class="input-icon">
							<input readonly style="background: white;" onchange="" id="modify_deli_ymd" type="date" value="" class="form-control" placeholder="Select a date">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="col-12" style="">
	<div class="card">
		<div class="r-table table-responsive" style="margin-bottom: 0px;">
			<table class="table table-vcenter card-table">
				<thead style="display: block;">
					<tr class="text-center">
						<th class="col-md-2">품목코드</th>
						<th class="col-md-2">품목명</th>
						<th class="col-md-2">거래처코드</th>
						<th class="col-md-2">거래처명</th>
						<th class="col-md-2">규격</th>
						<th class="col-md-2">수량(BOX)</th>
					</tr>
				</thead>
				<tbody id="modify_tbody" style="display: block; overflow: auto; max-height: 449px;">

				</tbody>
			</table>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/order/modify_js.jsp"%>
