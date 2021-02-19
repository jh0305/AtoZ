<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="col-12" style="margin-bottom: 10px;">
	<div class="card">
		<div class="table-responsive" style="margin-bottom: 0px;">
			<table class="table table-vcenter card-table text-center">
				<thead>
					<tr>
						<th class="col-md-2">발주번호</th>
						<th class="col-md-2">입고일자</th>
						<th class="col-md-2">입고품목</th>
						<th class="col-md-2">입고수량</th>
						<th class="col-md-2">물류센터</th>
						<th class="col-md-2">작업비용</th>
					</tr>
				</thead>
				<div>
					<tbody id="payment_confirm_tbody">
							
					</tbody>
				</div>
			</table>
		</div>
	</div>
</div>

<div id="confirm_btn_box">
	<input type="hidden" name="confirm_pay_no">
	<input style="float: right;" type="button" class="btn btn-light" onclick="payment(this);" value="결제">
</div>

<script type="text/x-handlebars-template" id="payment-confirm-tbody-template">
{{#each .}}
    <tr name="payment-confirm-tr" class="text-center">
        <td name="ord_no">{{ord_no}}</td>
        <td name="in_ymd">{{makeYMD in_ymd}}</td>
        <td name="in_item">{{makeItemName item_name item_qty}}</td>
        <td name="in_qty">{{in_qty}}EA</td>
        <td name="wh_name">{{wh_name}}</td>
        <td name="in_chrg">{{numberFormat in_chrg}}원</td>
    <tr>
{{/each}}
</script>

<script>
	function payment(th){
		var pay_no = $(th).siblings("input[name='confirm_pay_no']").val();
		
		if(!confirm("결제번호 " + pay_no + "번을 결제합니다.")){
			return;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/CO/payment/goPayment",
			data : {
				"pay_no" : pay_no
			},
			type : "post",
			success : function(res){
				
				alert("결제가 완료되었습니다.");
				
				location.reload();
				
			},
			error : function(req){
				alert("에러 : " + req.status);
			}
		});
	}
</script>