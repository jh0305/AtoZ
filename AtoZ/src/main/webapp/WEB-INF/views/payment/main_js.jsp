<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/x-handlebars-template" id="paymentRequest-search-div-template">
<div class="d-flex">
    <div class="text-muted" style="">
        <span style="line-height: 40px;">물류센터검색 :</span>
    </div>
    <div class="text-muted" style="margin-right: 8px;">
        <div style="padding: 6px 0px;" class="ms-2 d-inline-block">
            <input name="request_wh_code" type="hidden" >
            <input name="request_wh_name" class="form-control form-control-md" value="{{charge_wh_name}}" style="height:28px; background: white;" disabled="disabled" type="text"
                  aria-label="Search invoice">
        </div>
    </div>
    <div id="searchBox" style="padding:6px 0px; height:25px; width:35px; display: inline-block;">
        <div onclick="whSearchOpen(this);" name="request_click" class="text-center" style="width: 35px; display: inline-block;">
            <div style="border: 1px solid #D1D4D7; border-radius: 3px; background-color: #F3F6FA; cursor: pointer;">
                <svg style="margin: 3px 0px;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                    viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                    stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                    <circle cx="10" cy="10" r="7"></circle>
                    <line x1="21" y1="21" x2="15" y2="15"></line>
                </svg>
            </div>
        </div>
    </div>
</div>
</script>

<script type="text/x-handlebars-template" id="paymentRequest-tbody-template">
{{#each dataList}}
    <tr class="text-center" name="paymentRequest-tr" onclick="openConfirmDialog(this);">
        <td style="display:none;" name="wh_code">{{wh_code}}</td>
        <td name="pay_no">{{pay_no}}</td>
        <td name="pay_ymd">{{makeYMD pay_ymd}}</td>
        <td name="charge_wh_name">{{charge_wh_name}}</td>
        <td name="content">{{content}}</td>
        <td name="pay_chg">{{numberFormat pay_chg}}원</td>
        <td name="sts_code">{{stsFormat sts_code}}</td>
    <tr>
{{/each}}
</script>

<script type="text/x-handlebars-template" id="paymentResult-search-div-template">
<div class="d-flex">
    <div class="text-muted" style="">
        <span style="line-height: 40px;">물류센터검색 :</span>
    </div>
    <div class="text-muted" style="margin-right: 8px;">
        <div style="padding: 6px 0px;" class="ms-2 d-inline-block">
            <input name="result_wh_code" type="hidden">
            <input name="result_wh_name" value="{{charge_wh_name}}" style="height:28px; background: white;" disabled="disabled" type="text"
                class="form-control form-control-md" aria-label="Search invoice">
        </div>
    </div>
    <div id="searchBox" style="padding:6px 0px; height:25px; width:35px; display: inline-block;">
        <div onclick="whSearchOpen(this);" name="result_click" class="text-center" style="width: 35px; display: inline-block;">
            <div style="border: 1px solid #D1D4D7; border-radius: 3px; background-color: #F3F6FA; cursor: pointer;">
                <svg style="margin: 3px 0px;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
                    viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
                    stroke-linejoin="round">
                    <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                    <circle cx="10" cy="10" r="7"></circle>
                    <line x1="21" y1="21" x2="15" y2="15"></line>
                </svg>
            </div>
        </div>
    </div>
</div>
</script>

<script type="text/x-handlebars-template" id="paymentResult-tbody-template">
{{#each dataList}}
    <tr name="paymentResult-tr" onclick="openDetailDialog(this);">
        <td name="wh_code" style="display:none;" >{{wh_code}}</td>
        <td name="pay_no" class="text-center">{{pay_no}}</td>
        <td name="pay_ymd" class="text-center">{{makeYMD pay_ymd}}</td>
        <td name="charge_wh_name" class="text-center">{{charge_wh_name}}</td>
        <td name="content" class="text-center">{{content}}</td>
        <td name="pay_chg" class="text-center">{{numberFormat pay_chg}}원</td>
        <td name="sts_code" class="text-center">{{stsFormat sts_code}}</td>
    <tr>
{{/each}}
</script>

<script>
	Handlebars.registerHelper({
		"makeItemName":function(item_name, item_qty){
			var str = "";
			
			if(item_qty > 1){
				str = item_name + " 외 " + (item_qty-1) + "건";  
			} else {
				str = item_name;
			}
			return str;
		},
		"numberFormat" : function(in_chrg){
			var str = "";
			var toStr = in_chrg + "";
			for(var i=0; i < toStr.length; i++){
				if(((toStr.length -1) - i ) % 3 == 0 && i != toStr.length-1){
					str += toStr.charAt(i) + ",";
				} else {
					str += toStr.charAt(i);
				}
			}
			return str;
		},
		"makeYMD" : function(in_ymd){
			var str = "";
			var toStr = in_ymd + "";
			for(var i=0; i < toStr.length; i++){
				if(((toStr.length -1) - i ) % 2 == 0 && i != toStr.length-1 && i > toStr.length-6){
					str += toStr.charAt(i) + "-";
				} else {
					str += toStr.charAt(i);
				}
			}
			return str;
		},
		"stsFormat" : function(sts_code){
			var str = "";
			if(sts_code == "PY000"){
				str = "미결제"
			}else if(sts_code == "PY001"){
				str = "미결제"
			}else if(sts_code == "PY002"){
				str = "결제완료"
			}
			return str;
		}
		
	});
</script>

<script>
var targets = {
		pagination : '#paymentRequestListPageMaker',
		table_div : '#paymentRequest-tbody',
		table_template : '#paymentRequest-tbody-template',
		search_div : '#paymentRequest-search-div',
		search_template : '#paymentRequest-search-div-template'
};
asyncSearch_go(1, "CO/payment/paymentRequestList", targets);

function search_paymentRequestList_go(){
	var tdiv = $('#search-plan-div');
	
	var co_code = $(tdiv).find('input[name="co_name"]').val();
	var data = {
		co_code : co_code
	};
	
	asyncSearch_go(1, "CO/payment/paymentRequestList", targets, data);
	
	return true
}

var targets2 = {
		pagination : '#paymentResultListPageMaker',
		table_div : '#paymentResult-tbody',
		table_template : '#paymentResult-tbody-template',
		search_div : '#paymentResult-search-div',
		search_template : '#paymentResult-search-div-template'
};
asyncSearch_go(1, "CO/payment/paymentResultList", targets2);

function search_paymentResultList_go(){
	var tdiv = $('#search-plan-div');
	
	var co_code = $(tdiv).find('input[name="co_name"]').val();
	var data = {
		co_code : co_code
	};
	
	asyncSearch_go(1, "CO/payment/paymentResultList", targets2, data);
	
	return true
}
</script>


<script>
	function whSearchOpen(th){
		var th = $(th).attr("name");
		
		if(th == "request_click"){
			search_wh_code = $("input[name='request_wh_code']");
			search_wh_name = $("input[name='request_wh_name']");
		}
		
		if(th == "result_click"){
			search_wh_code = $("input[name='result_wh_code']");
			search_wh_name = $("input[name='result_wh_code']");
		}
		
		openDial($('#whSearch'), 450, 600);
	}
	function openConfirmDialog(th){
		var pay_no = $(th).find("td[name='pay_no']").text();
		
		$("#confirm_btn_box").css("display", "block");
		
		getConfirmDialogForm(pay_no);		
	}
	function openDetailDialog(th){
		var pay_no = $(th).find("td[name='pay_no']").text();
		
		$("#confirm_btn_box").css("display", "none");
		
		getConfirmDialogForm(pay_no);		
	}
</script>

<script>
	function getConfirmDialogForm(pay_no, th){
		$.ajax({
			url : "<%=request.getContextPath()%>/CO/payment/paymentConfirm",
			data : {
				"pay_no" : pay_no
			},
			type : "post",
			success : function(res){
				
				var template = Handlebars.compile($('#payment-confirm-tbody-template').html());
				var html = template(res);
				$('#payment_confirm_tbody').html(html);
				
				var total_charge = 0;
				
				if(res.length > 0){
					for(re of res){
						total_charge += parseInt(re.in_chrg);
					}
					
					var code = "<tr><th></th><th></th><th></th><th></th><th></th><th>합: "+total_charge+"원</th></tr>";
					
					$("#detail_tbody").append(code);
					$("input[name='confirm_pay_no']").val(pay_no);
				}
				
				var size = res.length;
				openDial($('#confirm'), 800, 135 + 37*size);
			},
			error : function(req){
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

<%@ include file="/WEB-INF/views/common/asyPagination.jsp"%>