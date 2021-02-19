<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="card" style="padding:5px; min-height: 540px;">
<div class="card-header">
			<h3>출고창고</h3>
					<input disabled id="inWH" name="wh_code" type="hidden" class="form-control" style="background-color:white; border-radius: 3px;">
					<input disabled id="whname" name="wh_name" type="text" class="form-control" style="background-color:white; border-radius: 3px; width:23%;">
					<button type="reset" class="btn btn-white btn-icon" style="display: inline; height:36px;" onclick="openDial($('#dialog4'),600,700);">
					<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
						height="24" viewBox="0 0 24 24" stroke-width="2"
						stroke="currentColor" fill="none" stroke-linecap="round"
						stroke-linejoin="round">
						  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
						  <circle cx="10" cy="10" r="7"></circle>
						  <line x1="21" y1="21" x2="15" y2="15"></line>
					  </svg>
				</button>
			<h3 style="margin-left: 6%;">출고요청일자</h3>
			<div class="row g-2" style=" width: 280px;">
							<div class="col-5">
                              <select id="plan_y" name="plan_ymd" class="form-select">
                                <option value="">년</option>
                                <option value="2021" selected>2021년</option>
                              </select>
                            </div>
                            <div class="col-3">
                              <select id="plan_m" name="plan_ymd" class="form-select">
                                <option value="">월</option>
                                <option value="01">1월</option>
                                <option value="02" selected>2월</option>
                                <option value="03">3월</option>
                                <option value="04">4월</option>
                                <option value="05">5월</option>
                                <option value="06">6월</option>
                                <option value="07">7월</option>
                                <option value="08">8월</option>
                                <option value="09">9월</option>
                                <option value="10">10월</option>
                                <option value="11">11월</option>
                                <option value="12">12월</option>
                              </select>
                            </div>
                            <div class="col-4">
                              <select id="plan_d" name="plan_ymd" class="form-select">
                                <option value="">일</option>
                                <option value="01">1일</option>
                                <option value="02">2일</option>
                                <option value="03">3일</option>
                                <option value="04">4일</option>
                                <option value="05">5일</option>
                                <option value="06">6일</option>
                                <option value="07">7일</option>
                                <option value="08">8일</option>
                                <option value="09">9일</option>
                                <option value="10" selected>10일</option>
                                <option value="11">11일</option>
                                <option value="12">12일</option>
                                <option value="13">13일</option>
                                <option value="14">14일</option>
                                <option value="15">15일</option>
                                <option value="16">16일</option>
                                <option value="17">17일</option>
                                <option value="18">18일</option>
                                <option value="19">19일</option>
                                <option value="20">20일</option>
                                <option value="21">21일</option>
                                <option value="22">22일</option>
                                <option value="23">23일</option>
                                <option value="24">24일</option>
                                <option value="25">25일</option>
                                <option value="26">26일</option>
                                <option value="27">27일</option>
                                <option value="28">28일</option>
                                <option value="29">29일</option>
                                <option value="30">30일</option>
                                <option value="31">31일</option>
                              </select>
                            </div>
                          </div>
			</div>
	<div class="col-12 card-body" style="padding: 0px 8px; min-height:330px; overflow-y:auto;  ">
			<div class="table-responsive" style="margin-bottom: 0px;">
				<table class="table table-vcenter card-table">
					<thead class="">
						<tr>
							<th style="width: 0.1%; padding: 8px 8px 8px 16px;"><svg onclick="addOrderItemRow(this);" class="icon_Plus myIcon" style="color: #dedede; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon"
									width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
									<path stroke="none" d="M0 0h24v24H0z" fill="none" />
									<line x1="12" y1="5" x2="12" y2="19" />
									<line x1="5" y1="12" x2="19" y2="12" /></svg></th>
							<th class="col-1 text-center">품목코드</th>
							<th class="col-1 text-center">품목명</th>
							<th class="col-1 text-center">규격</th>
							<th class="col-1 text-center">재고수량(BOX)</th>
							<th class="col-1 text-center">출고수량(BOX)</th>
						</tr>
					</thead>
					<tbody id="myTbody2">
						<tr class="item-tr item_false">
							<td><svg class="icon_Minus myIcon" style="color: #dedede; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><line x1="5" y1="12" x2="19" y2="12"></line></svg></td>
							<td name="item_no" class="item-code2 text-center" id="recode"><div class="col-12 text-center"><div onclick="goFindElement2(this);openItemSearch2(this);" style="border: 1px solid #D1D4D7; border-radius:3px; background-color:#F3F6FA; cursor: pointer;"><svg style="margin: 7px 0px;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"></path><circle cx="10" cy="10" r="7"></circle><line x1="21" y1="21" x2="15" y2="15"></line></svg></div></div></td>
							<td class="item-name2 text-center" id="rename"></td>
							<td class="item-std2 text-center"></td>
							<td class="item-ea2 text-center" id="stqty"></td>
							<td class="item-qty2 text-center"><input class="planqty form-control" type="text" id="planQty" name="plan_qty"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	<div class="card-footer" style="background-color:white; height: 50px;">
		<div style="display:inline-block; float: right;">
			<button type="button" onclick="goRegistOrder2();" class="btn">등록</button>
			<button type="button" onclick="closeDial($('#dialog3'));" class="btn">닫기</button>
		</div>
	</div>
</div>
<div id="dialog4" class="dialogDiv" title="물류센터 조회">
	<%@ include file="whSearch.jsp" %>
</div>
<script>
function wareList(){
	$.ajax({
		url:'<%=request.getContextPath()%>/WH/release/getWareList',
		cache : false,
		async:false,
		dataType:"json",
		type:'get',
		success:function(data){
			var dataList = data.dataList;
			var source =$('#ware-list-template').html();
 			var template = Handlebars.compile(source);
 			$('#whInfo_tbody').html(template(dataList));
		},
	})
}
</script>

<script>
	$('#myTbody2').on("keyup", ".planqty", function(){
// 		if(Number($(this).parents('.item-tr').find('td:nth-child(5)').text()) < Number($(this).val())){
		if(Number($(this).parent().prev().text()) < Number($(this).val())){
			$(this).val('');
			alert("잘못된 수량입니다. 다시입력해주세요.");
			return;
		}	
	})
	
	

	function goOrderDataCheck(){
		if($('#inWH').val() == "" ||
		   $('.item-code2').text() == "" ||
		   $('#planQty').val() == ""){
			alert("입력하지 않은 데이터가 있습니다.");
			return false;
		}else{
			return true;
		}	
	};
	
	
	
	// 등록 버튼 클릭시, 인서트
	function goRegistOrder2(){
		
		if(goOrderDataCheck() != true){return;};
		
		var item_tr = $("#myTbody2").children(".item_true");
		
		// tbody의 모든 tr 안에 있는 품목코드,수량 td 값을 담는다.
		var rlsItemArray = [];
		
		$.each(item_tr, function(i){
			var data = {
				item_no : $(item_tr[i]).find(".item-code2").text(),
				plan_qty : $(item_tr[i]).find("#planQty").val()
	 		};
			rlsItemArray.push(data);
		});
		
		var form = {
			wh_code  : $('#inWH').val(),
			plan_ymd : $('#plan_y').val()+$('#plan_m').val()+$('#plan_d').val(),
			rlsItemArray: rlsItemArray
		};		
		var formj = JSON.stringify(form);
		
		$.ajax({
			url : "<%=request.getContextPath()%>/CO/release/releaseRequest",
			data : formj, 	
			datatype :'json',
			type : 'post',			
			success : function(res) {
				location.reload();
				alert("등록 완료");
			},
			error : function(req) {
				alert("상태 : " + req.status);
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
	mySvg += '<div onclick="goFindElement2(this);openItemSearch2(this);" style="border: 1px solid #D1D4D7; border-radius:3px; background-color:#F3F6FA; cursor: pointer;">'
	mySvg += '<svg style="margin: 7px 0px;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">'
	mySvg += '<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>'
	mySvg += '<circle cx="10" cy="10" r="7"></circle>'
	mySvg += '<line x1="21" y1="21" x2="15" y2="15"></line></svg></div></div>'
    
	var cnt = 1;
	// + 버튼을 누르면 액션, 행을 추가 한다.
    function addOrderItemRow(th){
		var tbody = $(th).parents('table').find('tbody');
		cnt++;
	    	$(tbody).append($(  			
	    			'<tr class="item-tr item_false">'
	    				+ '<td ><svg class="icon_Minus myIcon" style="color: #dedede; cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="5" y1="12" x2="19" y2="12" /></svg></td>'
	    				+ '<td name="item_no" class="item-code2 text-center">' + mySvg + '</td>'
	    				+ '<td class="item-name2 text-center" id="rename"></td>'
	    				+ '<td class="item-std2 text-center"></td>'
	    				+ '<td class="item-ea2 text-center" id="stqty"></td>'
	    				+ '<td class="item-std2 text-center"><input class="planqty form-control" id="planQty" type="text" name="plan_qty"></td>'
	   				+ "</tr>"
			));
// 		}
    };
	
	// - 버튼을 누르면 액션, 행을 삭제 한다.
	$("body").on("click", ".icon_Minus", function(){ 
    	$(this).parent().parent().remove();
    });
    
	//기타
    function goClear(){
    	$("#wh_tbody").empty();	
    };
    
	// 돋보기 버튼을 클릭하면 액션, 품목검색 다이어그램 오픈. 
	var openItemSearch_tbody2 = null;
    function openItemSearch2(th){
    	openItemSearch_tbody2 = $(th).parents('tbody');
    	
    	openDial($('#itemSearchDialog2'), 700, 600, false);
    }
</script>
