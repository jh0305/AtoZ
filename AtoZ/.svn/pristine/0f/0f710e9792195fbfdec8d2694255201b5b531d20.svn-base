<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- c_co_name              -->
<!-- c_receive_cnt          -->
<!-- c_receive_item_cnt     -->
<!-- c_receive_item_qty     -->
<!-- c_receive_total_charge -->

<div style="margin: 0px;">
	<div class="table-responsive" style="max-height: 500px; margin-bottom: 0px;">
		<table class="table table-vcenter text-center" border="0">
			<thead style="border-color: #E5E7E9;">
				<tr>
					<th colspan="3" style="font-size: 14px;">기업이름 : <span id="c_co_name"></span></th>
				</tr>
			</thead>
			<tbody id="modify_tbody">
				<tr>
					<td style="text-align: right;">입고건수 :</td>
					<td style="text-align: right;"><span id="c_receive_cnt"></span> 건</td>
				</tr>
				<tr>
					<td style="text-align: right;">입고품목 :</td>
					<td style="text-align: right;"><span id="c_receive_item_cnt"></span> 개</td>

				</tr>
				<tr>
					<td style="text-align: right;">입고수량 :</td>
					<td style="text-align: right;"><span id="c_receive_item_qty"></span> 개</td>
				</tr>
				<tr>
					<td style="text-align: right;">총 작업비용 :</td>
					<td style="text-align: right;"><span id="c_receive_total_charge"></span> 원</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>
<input style="margin-top: 10px; border-color: #E5E7E9; width: 100%;" type="button" class="btn btn-light" onclick="insertChargeAction();" value="확인">

<script>
	//기업이름, 입고건수, 입고품목, 입고수량, 총 작업비용
	var c_co_name;
	var c_receive_cnt;
	var c_receive_item_cnt;
	var c_receive_item_qty;
	var c_receive_total_charge;

	// 청구 확인창 getData
	function confirmLoad(co_code){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/charge/confirmForm",
			data : {"co_code" : co_code},
			type : "post",
			success : function(res){
				
				
				c_co_name              = res[0].co_name;
				c_receive_cnt          = res[0].receive_count;
				c_receive_item_cnt     = res[0].receive_item_total_count;
				c_receive_item_qty     = res[0].receive_item_total_in_qty;
				c_receive_total_charge = res[0].total_in_chrg.format();
				
				$("#c_co_name").text(c_co_name);
				$("#c_receive_cnt").text(c_receive_cnt);
				$("#c_receive_item_cnt").text(c_receive_item_cnt);
				$("#c_receive_item_qty").text(c_receive_item_qty);
				$("#c_receive_total_charge").text(c_receive_total_charge);
				
				openDial($('#confirm'), 300, 290);
			},
			error : function(req) {
				alert("에러 : " + req.status);
			}
		});
	}
	
	// 청구 확인창 확인 버튼 클릭 -> 결제 테이블 등록
	function insertChargeAction(){
		//작업내용, 결제금액 
		var content;
		var charge;
		
		content = "입고" + c_receive_cnt + "건, " + "입고품목" + c_receive_item_cnt + "건, " + "입고수량" + c_receive_item_qty + "개";
		// , 제거 
		charge = c_receive_total_charge.replace(",","");
		
		// 청구 -> 결제 변환 할 대상
		var in_payment_arr = [];
		
		// 청구 리스트 
		var lists;
		lists = $("#chargeRequest-tbody").children("tr[name='chargeRequest-tr']").toArray();

		for(list of lists){
			// pk번호
			var ord_no;
		
			ord_no = $(list).find("td[name='ord_no']").text();
			
			// 청구 -> 결제 변환 할 대상 담기
			in_payment_arr.push(ord_no);
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/charge/registCharge",
			data : {
				"pay_chg" : charge,
				"content" : content,
				"ord_no_array" : in_payment_arr
			},
			type : "post",
			success : function(res){
				alert("청구가 완료되었습니다.")
				location.reload();
			},
			error : function(req) {
				alert("에러 : " + req.status);
			}
		});
	}
</script>

<script>
//숫자 타입에서 쓸 수 있도록 format() 함수 추가
Number.prototype.format = function(){
    if(this==0) return 0;

    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');

    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

    return n;
};

// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";

    return num.format();
};
</script>