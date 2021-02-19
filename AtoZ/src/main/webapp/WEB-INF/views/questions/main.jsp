<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
th {
	width: 8.33%;
}

tr[name="qna-tr"]:hover {
	background-color: #F8F9FC;
}
</style>

<div id="qna-search-div" style="margin-bottom: 10px;"></div>

<div class="table-responsive" style="max-height: 400px; margin: 0px;">
	<table class="table card-table table-vcenter text-nowrap datatable">
		<thead>
			<tr class="text-center">
				<th class="col-md-1">번호</th>
				<th class="col-md-6">제목</th>
				<th class="col-md-2">등록자</th>
				<th class="col-md-2">등록일</th>
				<th class="col-md-1">조회수</th>
			</tr>
		</thead>
		<tbody id="qna-tbody-div">
			<tr class="nth-child-1 first-child" onclick="openDial($('#detail'), 800, 1000);">
	            <td>373</td>
	            <td class="tdleft" style="text-align:left;">&nbsp;<a href="javascript:goBoard('/qna','10','','view','1','1788','','');">재직자교육관련문의드립니다.</a></td>
	            <td style="font-size:14px">김****</td>
	            <td>2021/01/29</td>
	            <td class="last">0</td>
	          </tr>
		</tbody>
	</table>
</div>

<div style="margin: 15px 0px;" class="listPageMaker" id="qna-pagemaker"></div>
<input type="button" class="btn btn-white" value="글쓰기" style="float: right;" onclick="goRegist(this);">

<script type="text/x-handlebars-template" id="qna-search-temp">
<div class="d-flex">
    <div class="text-muted" style="">
        <span style="line-height: 40px;">검색 :</span>
    </div>
    <div class="text-muted" style="margin-right: 8px;">
        <div style="padding: 6px 0px;" class="ms-2 d-inline-block">
            <input name="search_keyword" style="height: 28px; background: white;" type="text"
                class="form-control form-control-md">
        </div>
    </div>
    <div style="padding: 6px 0px; height: 25px; width: 35px; display: inline-block;">
        <div onclick="" class="text-center" style="width: 35px; display: inline-block;">
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

<script type="text/x-handlebars-template" id="qna-tbody-temp">
{{#each dataList}}
	<tr class="text-center {{qna-child-no}} {{first-child}}">
		<td>{{board_no}}</td>
		<td class="tdleft" style="text-align: left;">&nbsp;
			<a href="javascript:goBoard('/qna','10','','view','1','1768','','');">
				{{content}}<font size="1" face="Tahoma, 돋움" color="#666666">[{{reply_cnt}}]</font>
	`		</a>
		</td>
		<td style="font-size: 14px">{{write_name}}</td>
		<td>{{write_ymd}}</td>
		<td class="last">{{hit_cnt}}</td>
	</tr>
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
			pagination : '#qna-pagemaker',
			table_div : '#qna-tbody-div',
			table_template : '#qna-tbody-temp',
			search_div : '#qna-search-div',
			search_template : 'qna-search-temp'
	};
	//asyncSearch_go(1, "", targets);
	
	function search_chargeRequestList_go(){
		var tdiv = $('#search-plan-div');
		
		var co_code = $(tdiv).find('input[name="co_code"]').val();
		var data = {
			co_code : co_code
		};
		asyncSearch_go(1, "", targets, data);
	}
</script>

<script>
	function openQuestions() {
		openDial($('#questionsDialog'), 800, 600);
	}
</script>

<div id="regist" class="dialogDiv" title="글쓰기" style="padding: 10px 10px 10px 10px;">
	<%@ include file="regist.jsp"%>
</div>
<!-- <div id="detail" class="dialogDiv" title="글내용" style="max-height: 963px; padding: 10px 10px 10px 10px;"> -->
<%-- 	<%@ include file="detail.jsp"%> --%>
<!-- </div> -->
<!-- <div id="modify" class="dialogDiv" title="글수정" style="max-height: 963px; padding: 10px 10px 10px 10px;"> -->
<%-- 	<%@ include file="modify.jsp"%> --%>
<!-- </div> -->
<!-- <div id="password" class="dialogDiv" title="본인확인" style="max-height: 963px; padding: 0px 60px;"> -->
<%-- 	<%@ include file="password.jsp"%> --%>
<!-- </div> -->

<%@ include file="/WEB-INF/views/common/asyPagination.jsp"%>