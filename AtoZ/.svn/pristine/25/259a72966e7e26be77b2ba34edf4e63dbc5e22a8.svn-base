<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/x-handlebars-template"  id="chargeRequest-search-div-template">
<div class="d-flex">
    <div class="text-muted" style="">
        <span style="line-height: 40px;">기업검색 :</span>
    </div>
    <div class="text-muted" style="margin-right: 8px;">
        <div style="padding: 6px 0px;" class="ms-2 d-inline-block">
            <input name="request_co_code" type="hidden">
            <input name="request_co_name" value="{{search.keyword}}" style="height:28px; background: white;" disabled="disabled" type="text"
                class="form-control form-control-md" aria-label="Search invoice">
        </div>
    </div>
    <div id="searchBox" class="" style="padding:6px 0px; height:25px; width:35px; display: inline-block;">
        <div onclick="coSearchOpen(this);" name="request_click" class="text-center" style="width: 35px; display: inline-block;">
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

<script type="text/x-handlebars-template"  id="chargeRequest-tbody-template">
{{#each dataList}}
    <tr name="chargeRequest-tr" class="text-center">
        <td name="co_code" style="display:none;">{{co_code}}</td>
        <td name="ord_no" >{{ord_no}}</td>
        <td>{{makeYMD in_ymd}}</td>
        <td>{{makeItemName item_name item_qty}}</td>
        <td name="in_qty">{{in_qty}}EA</td>
        <td>{{co_name}}</td>
        <td>{{numberFormat in_chrg}}원</td>
    <tr>
{{/each}}
</script>
	
<script type="text/x-handlebars-template"  id="chargeResult-search-div-template">
<div class="d-flex">
    <div class="text-muted" style="">
        <span style="line-height: 40px;">기업검색 :</span>
    </div>
    <div class="text-muted" style="margin-right: 8px;">
        <div style="padding: 6px 0px;" class="ms-2 d-inline-block">
            <input name="result_co_code" type="hidden">
            <input name="result_co_name" value="{{dataList.co_name}}" style="height:28px; background: white;" disabled="disabled" type="text"
                class="form-control form-control-md" aria-label="Search invoice">
        </div>
    </div>
    <div name="searchBox" style="padding:6px 0px; height:25px; width:35px; display: inline-block;">
        <div onclick="coSearchOpen(this);" name="result_click" class="text-center" style="width: 35px; display: inline-block;">
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

<script type="text/x-handlebars-template"  id="chargeResult-tbody-template">
{{#each dataList}}
    <tr name="chargeResult-tr" onclick="chargeDetail(this);">
        <td name="co_code" style="display:none;">{{co_code}}</td>
        <td name="pay_no" class="text-center">{{pay_no}}</td>
        <td name="pay_ymd" class="text-center">{{makeYMD pay_ymd}}</td>
        <td name="co_name" class="text-center">{{co_name}}</td>
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
				str = "청구"
			}else if(sts_code == "PY002"){
				str = "결제완료"
			}
			return str;
		}
		
	});
	
	var targets = {
			pagination : '#chargeRequestListPageMaker',
			table_div : '#chargeRequest-tbody',
			table_template : '#chargeRequest-tbody-template',
			search_div : '#chargeRequest-search-div',
			search_template : '#chargeRequest-search-div-template'
	};
	asyncSearch_go(1, "WH/charge/chargeRequestList", targets);
	
	function search_chargeRequestList_go(th){
		
		var co_code = $('input[name="'+th+'"]').val();
		
		var data = {
			keyword : co_code
		};
		asyncSearch_go(1, "WH/charge/chargeRequestList", targets, data);
	}
	
	var targets2 = {
			pagination : '#chargeResultListPageMaker',
			table_div : '#chargeResult-tbody',
			table_template : '#chargeResult-tbody-template',
			search_div : '#chargeResult-search-div',
			search_template : '#chargeResult-search-div-template'
	};
	asyncSearch_go(1, "WH/charge/chargeResultList", targets2);
	
	function search_chargeResultList_go(){
		var tdiv = $('#search-plan-div');
		
		var co_code = $(tdiv).find('input[name="co_code"]').val();
		var data = {
			keyword : co_code
		};
		asyncSearch_go(1, "WH/charge/chargeResultList", targets2, data);
	}
</script>

<script>
	function coSearchOpen(th){
		var th = $(th).attr("name");
		
		if(th == "request_click"){
			search_co_code = $("input[name='request_co_code']");
			search_co_name = $("input[name='request_co_name']");
		}
		
		if(th == "result_click"){
			search_co_code = $("input[name='result_co_code']");
			search_co_name = $("input[name='result_co_code']");
		}
		
		openDial($('#coSearch'), 450, 600);
	}
	
	// 청구버튼 클릭 ->
	function insertCharge(th){
		
		//청구 리스트 
		var lists;
		lists = $("#chargeRequest-tbody").children("tr[name='chargeRequest-tr']").toArray();
		
		// 기업 지정 여부 검증
		if(lists.length > 0){
			
			var cnt = 0;
			
			for(list of lists){
				
				if( cnt == 0 ){
					before = $(list).find("td[name='co_code']").text();
				}
				
				var after = $(list).find("td[name='co_code']").text();
				
				//기업 미지정
				if( before != after ){
					alert("기업을 지정하지 않았습니다.");
					return;
				}
				
				before = $(list).find("td[name='co_code']").text();
				cnt = 1;
			}
		}else{
			alert("데이터가 없습니다.");
			return;
		}
		
		// 청구 기업 정보 -> 확인창 오픈 
		confirmLoad(before);
	}
</script>

<script>

	// tr 클릭 -> 청구내역 팝업 오픈
	function chargeDetail(th){
		
		// 클릭 청구 번호
		var pay_no;
		
		pay_no = $(th).find("td[name='pay_no']").text();
		
		// detail form data 가져오기 
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/charge/chargeDetail",
			data : {
				"pay_no" : pay_no
			},
			type : "post",
			success : function(res){
				
				// 핸들바스에 데이터 구성
				var template = Handlebars.compile($('#detail-tbody-template').html());
				var html = template(res);
				
				// html 생성
				$('#detail_tbody').html(html);
				
				// 토탈 작업비용
				var total_charge = 0;
				
				for(re of res){
					total_charge += parseInt(re.in_chrg);
				}
				
				var code = "<tr><th></th><th></th><th></th><th></th><th></th><th>합: "+total_charge+"원</th></tr>";
				$('#detail_tbody').append(code);
				
				
				//tr 클릭 -> 청구내역 팝업 오픈
				
				//가져온 데이터 사이즈
				var size;
				size = res.length;
				
				// 팝업 오픈
				openDial($('#detail'), 700, 130 + (size * 37) );
			},
			error : function(req){
				alert("에러 : " + req.status);
			}
		});
	}
</script>

<%@ include file="/WEB-INF/views/common/asyPagination.jsp" %>