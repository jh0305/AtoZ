<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
	//저장 버튼 클릭시 수정 및 업데이트 
	function modifyOrder(){
		
		var arr = [];
		
		var trs = $("#modify_tbody").children();
		for(tr of trs){
			var data = {};
			data.item_no = $(tr).find('td[name="item_code"]').text();
			data.qty = $(tr).find('input.item_ea_value').val();
			
			arr.push(data);
			
			var ea = $(tr).find(".item_ea_value").val();
			if (ea == 0){
				alert("발주 수량을 입력하지 않은 데이터가 있습니다.");
				return;
			}
		}
		
		var form = {
			modify_ord_no  : pick_modify_ord_no,
			modify_req_ymd  : $("#order_modify_dialog").find("#modify_req_ymd").val(),
			modify_ord_mngr : $("#order_modify_dialog").find("#modify_ord_mngr").val(),
			modify_wh_code  : $("#order_modify_dialog").find('input[name="modify_wh_code"]').val(),
			modify_deli_ymd : $("#order_modify_dialog").find("#modify_deli_ymd").val(),
			itemArr : JSON.stringify(arr)
		};
		
		if(arr.length == 0 ||
			form.modify_req_ymd  == "" ||	
			form.modify_ord_mngr == "" ||	
			form.modify_wh_code  == "" ||	
			form.modify_deli_ymd == ""){
			alert("입력하지 않은 데이터가 있습니다.");
			return;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/CO/order/modify",
			data : JSON.stringify(form),
			type : "POST",
			contentType : "application/json;charset=utf-8",
			success : function(res){
				location.reload();
				alert("변경 내용을 저장했습니다.");
			},
			error : function(req) {
				alert("에러 : " + req.status);
			}
		});
		
	}
</script>