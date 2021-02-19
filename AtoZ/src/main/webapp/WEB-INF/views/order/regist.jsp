<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="row text-center" style="margin-bottom: 5px;">
	<div class="col-12">
		<div class="row">
			<div class="col-3">
				<div class="row" style="padding-left: 10px;">
					<div class="col-3" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px;">발주일자</div>
					<div class="col-9" style="display: inline-block; padding: 0px 0px 0px 5px;">
						<div class="input-icon">
							<input readonly name="ordr_req_ymd" type="date" class="form-control" style="background: white;" max="9999-12-31" placeholder="Select a date">
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="row" style="padding-left: 10px;">
					<div class="col-3" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px;">납기일자</div>
					<div class="col-9" style="padding: 0px; display: inline-block;">
						<div class="input-icon">
							<input type="date" class="form-control" name="ordr_deli_ymd" value="" max="9999-12-31" onchange="ymd_fmt_check();" placeholder="Select a date">
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="row" style="padding-left: 10px;">
					<div class="col-3" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px;">담당자명</div>
					<div class="col-9" style="display: inline-block; padding: 0px;">
						<div class="row" style="margin: 0px;">
							<div class="col-12 input-icon" style="padding: 0px 0px 0px 10px;">
								<input id="input_mgr" name="ord_mngr" type="text" class="form-control" placeholder="이름 입력" maxlength="9" style="background-color: white;">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-3">
				<div class="row" style="padding: 0px 10px; margin-bottom: 10px;">
					<div class="col-3" name="in_wh_name_div" style="padding: 0px; display: inline-block; height: 36px; line-height: 36px;">입고창고</div>
					<div class="col-9" style="padding: 0px; height: 36px; display: inline-block;">
						<div class="col-12" style="padding: 0px 0px;">
							<div class="row" style="margin: 0px 0px 5px 0px;">
								<div class="col-12" style="display: inline-block; height: 36px; padding: 0px 10px 0px 0px;">
									<div class="col-12" style="padding-left: 10px;">
										<input type="hidden" name="regist_wh_code">
										<input type="text"   name="regist_wh_name" class="form-control" readonly placeholder="창고 검색" onclick="open_whSearch(this); goClear();" style="background-color: white; border-radius: 3px;">
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="col-12" style="">
	<div class="card">
		<div class="table-responsive" style="margin-bottom: 0px;">
			<table class="table table-vcenter card-table">
				<thead class="" style=" display: block; ">
					<tr class="text-center" id="regist-th-tr">
						<th style="width: 0.1%; padding: 8px 8px 8px 16px;"><svg onclick="addOrderItemRow(this);" class="icon_Plus myIcon" style="color: #dedede; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24"
								viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none" />
									<line x1="12" y1="5" x2="12" y2="19" />
									<line x1="5" y1="12" x2="19" y2="12" /></svg></th>
						<th class="col-md-2">품목코드</th>
						<th class="col-md-2">품목명</th>
						<th class="col-md-2 ">거래처코드</th>
						<th class="col-md-2 ">거래처명</th>
						<th class="col-md-2 ">규격</th>
						<th class="col-md-2 ">수량(BOX)</th>
					</tr>
				</thead>
				<tbody id="myTbody" style=" overflow: auto; height: 529px; display: block; ">
					<tr class="item-tr item_false text-center"><td><svg class="icon_Minus myIcon" style="color: rgb(222, 222, 222); cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="5" y1="12" x2="19" y2="12"></line></svg></td><td name="item_code" class="item-code col-md-2"><div class="col-12 text-center"><div onclick="goFindElement(this);openItemSearch(this);" style="border: 1px solid #D1D4D7; border-radius:3px; background-color:#F3F6FA; cursor: pointer;"><svg style="margin: 7px 0px;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg></div></div></td><td name="item_name" class="item-name col-md-2"></td><td name="cprt_code" class="cprt-code col-md-2"></td><td name="cprt_name" class="cprt-name col-md-2"></td><td name="item_std" class="item-std col-md-2"></td><td name="item_ea" class="item-ea" style="width:17%"><input value="0" style="padding: 3px 0px; text-align:center; margin:auto; width:50%;" maxlength="3" type="text" class="item_ea_value form-control"></td></tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<button type="button" onclick="goRegistOrder();" style="margin-top: 10px; float: right;" class="btn">등록</button>

<script>
	function today_ymd(){
		var date = new Date(); 
		var year = date.getFullYear(); 
		var month = new String(date.getMonth()+1); 
		var day = new String(date.getDate()); 

		// 한자리수일 경우 0을 채워준다. 
		if(month.length == 1){ 
		  month = "0" + month; 
		} 
		if(day.length == 1){ 
		  day = "0" + day; 
		} 

		$('input[name="ordr_req_ymd"]').val(year + "-" + month + "-" + day);
	}

	function ymd_fmt_check(){
		 req_ymd = $('input[name="ordr_req_ymd"]').val().replace(/\-/g,'');
		 deli_ymd = $('input[name="ordr_deli_ymd"]').val().replace(/\-/g,'');
		
		if(req_ymd > deli_ymd){
			alert("납기일자는 발주일자 이후의 일자를 선택 해야 합니다.")
			$('input[name="ordr_deli_ymd"]').val("");
			return;
		}
		
		return true;
		
	}
	function goOrderDataCheck(){
		
		if($('input[name="ordr_req_ymd"]').val() == null){
			alert("발주일자를 입력하지 않았습니다.");
			return;
		}
		if($('#input_mgr').val() == ""){
			alert("담당자를 입력하지 않았습니다..");
			return;
		}
		if($('#inWH').val() == ""){
			alert("입고창고를 입력하지 않았습니다.");
			return;
		}
		if($('input[name="ordr_deli_ymd"]').val() == ""){
			alert("납기일자를 입력하지 않았습니다.");
			return;
		}
		
		var items = $("#myTbody").children(".item_true");
		var regex = /^[0-9]/g;
		var regex2 = /^[0-9]/g;
		
		for(item of items){
			if($(item).find(".item_ea_value").val() > 0){
				
			}else if(!regex.test($(item).find(".item_ea_value").val())){
				alert("수량이 입력되지 않았거나, 수량이 이상한 품목이 있습니다.");
				return;
			}else{
				alert("수량이 입력되지 않았거나, 수량이 이상한 품목이 있습니다.");
				return;
			}
			
		}
		
		if(items.length > 0){
			
		}else{
			alert("품목을 선택하지 않았습니다.");
			return;
		}
		
		return true;
		
	};
	
	// 등록 버튼 클릭시, 인서트
	function goRegistOrder(){
		
		if(goOrderDataCheck() != true){return;};
		if(ymd_fmt_check() != true){return;};
		
		var item_tr = $("#myTbody").children(".item_true");
		
		// tbody의 모든 tr 안에 있는 품목코드,수량 td 값을 담는다.
		var itemArray = [];
		
		$.each(item_tr, function(i){
			var data = {
				item_no : $(item_tr[i]).find(".item-code").text(),
				qty : $(item_tr[i]).find(".item_ea_value").val()
	 		};
			itemArray.push(data);
		});
		
		var form = {
			wh_code  : $('input[name="regist_wh_code"]').val(),
			req_ymd  : req_ymd,
			deli_ymd : deli_ymd,
			ord_mngr : $('#input_mgr').val(),
 			itemArray: itemArray
		};		
		var formj = JSON.stringify(form);
		
		$.ajax({
			url : "<%=request.getContextPath()%>/CO/order/registOrder",
			data : formj, 	
			datatype :'json',
			type : 'post',			
			success : function(res) {
				location.reload();
				alert("등록 완료");
			},
			error : function(req) {
				if(req.status == 500){
					alert("입력 오류 및 서버에러 입니다. 관리자에게 문의하세요")
				}else{
					alert("에러 : " + req.status);
				}
			}
		});
	}
	
	// + - 아이콘 이벤트
	$("body").on("mouseover", ".myIcon", function(){
		$(this).css("color", "#646E77");
	});
    $("body").on("mouseleave", ".myIcon", function(){
    	$(this).css("color", "#dedede");
    });
                	    
	var mySvg = "";
	mySvg += '<div class="col-12 text-center">'
	mySvg += '<div onclick="goFindElement(this);openItemSearch(this);" style="border: 1px solid #D1D4D7; border-radius:3px; background-color:#F3F6FA; cursor: pointer;">'
	mySvg += '<svg style="margin: 7px 0px;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">'
	mySvg += '<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
	mySvg += '<circle cx="10" cy="10" r="7"></circle>'
	mySvg += '<line x1="21" y1="21" x2="15" y2="15"></line></svg></div></div>'
                	
	// + 버튼을 누르면 액션, 을 추가 한다.
    function addOrderItemRow(th){
		var tbody = $(th).parents('table').find('tbody');
    	$(tbody).append($(  			
    			'<tr class="item-tr item_false text-center">'
    				+ '<td ><svg class="icon_Minus myIcon" style="color: #dedede; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="5" y1="12" x2="19" y2="12" /></svg></td>'
    				+ '<td name="item_code" class="item-code col-md-2">' + mySvg + '</td>'
    				+ '<td name="item_name" class="item-name col-md-2"></td>'
    				+ '<td name="cprt_code" class="cprt-code col-md-2"></td>'
    				+ '<td name="cprt_name" class="cprt-name col-md-2"></td>'
    				+ '<td name="item_std" class="item-std col-md-2"></td>'
    				+ '<td name="item_ea" class="item-ea" style="width:17%"><input value="0" style="padding: 3px 0px; text-align:center; margin:auto; width:50%;" maxlength=3 type="text" class="item_ea_value form-control"/></td>'
   				+ "</tr>"
		));
    };
	
	// - 버튼을 누르면 액션, 행을 삭제 한다.
	$("body").on("click", ".icon_Minus", function(){ 
    	$(this).closest('tr').remove();
    });
    
	//기타
    function goClear(){
    	$("#wh_tbody").empty();	
    };
    
	// 돋보기 버튼을 클릭하면 액션, 품목검색 다이어그램 오픈. 
	var openItemSearch_tbody = null;
    function openItemSearch(th){
    	openItemSearch_tbody = $(th).parents('tbody');
    	
    	openDial($('#itemSearchDialog'), 1034, 750, true);
    }
</script>
