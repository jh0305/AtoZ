<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	 td[name="d_co_code"]{
	 	display: none;
	 }
</style>

<div class="col-12" style="margin-bottom: 15px;">
	<div class="card">
		<div class="table-responsive" style="margin-bottom: 0px;">
			<table class="table table-vcenter card-table text-center">
				<thead>
					<tr>
						<th class="col-md-2">입고번호</th>
						<th class="col-md-2">입고일자</th>
						<th class="col-md-2">입고품목</th>
						<th class="col-md-2">입고수량</th>
						<th class="col-md-2">발주기업</th>
						<th class="col-md-2">작업비용</th>
					</tr>
				</thead>
				<tbody id="detail_tbody">

				</tbody>
			</table>
		</div>
	</div>
</div>

<script type="text/x-handlebars-template" id="detail-tbody-template">
{{#each .}}
    <tr name="detail-tr">
        <td name="d_co_code"  >{{co_code}}</td>
        <td name="d_ord_no"   >{{ord_no}}</td>
        <td name="d_in_ymd"   >{{makeYMD in_ymd}}</td>
        <td name="d_content"  >{{makeItemName item_name item_qty}}</td>
        <td name="d_in_qty"   >{{in_qty}}EA</td>
        <td name="d_co_name"  >{{co_name}}</td>
        <td name="d_in_chrg"  >{{numberFormat in_chrg}}원</td>
    <tr>
{{/each}}
</script>