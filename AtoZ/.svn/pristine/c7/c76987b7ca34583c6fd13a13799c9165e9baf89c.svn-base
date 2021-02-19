<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">쪽지함</strong>
</div>

<div class="col-12">
	<!-- Cards with tabs component -->
	<div class="card-tabs ">
	<!-- Cards navigation -->
	<ul class="nav nav-tabs">
		<li class="nav-item"><a href="#tab-top-re" onclick="initialSendSearch();" class="nav-link active" data-bs-toggle="tab">받은 쪽지함</a></li>
		<li class="nav-item"><a href="#tab-top-se" onclick="initialReceiveSearch();" class="nav-link" data-bs-toggle="tab">보낸 쪽지함</a></li>
	</ul>
		<div class="tab-content">
			<!-- Content of card #1 -->
			<div id="tab-top-re" class="card tab-pane show active">
				<div class="card-header"  id="receiveMessage-search-div">
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table card-table table-vcenter text-nowrap datatable" style="table-layout: fixed;">
							<thead>
								<tr>
									<th style="text-align:left; width:150px;">보낸 기업</th>
									<th style="text-align:left; width:200px;">내용</th>
									<th class="text-center">발송일자</th>
									<th class="text-center">상태</th>
								</tr>
							</thead>
							<tbody id="receiveMessage-list-tbody">
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer" style="background-color : white; text-align:right;">
					<div class="row">
						<div class="col-6" id="receiveMessage-page" style="text-align:left;"></div>
						<div style="float:right;" class="col-6">
							<input type="button" class="btn btn-white" id="sendBtn" onclick="openDial($('#newMessagedialog'),600,550)" value="쪽지 보내기"/>
							<input type="button" class="btn btn-white" id="cancelBtn" onclick="closeMessage();" value="취소"/>
						</div>
					</div>
				</div>
			</div>
			<!-- Content of card #2 -->
			<div id="tab-top-se" class="card tab-pane">
				<div class="card-header" id="sendMessage-search-div"></div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table card-table table-vcenter text-nowrap datatable" style="table-layout: fixed;">
							<thead>
								<tr>
									<th style="text-align:left;  width:150px;">받는 기업</th>
									<th style="text-align:left;  width:250px;">내용</th>
									<th class="text-center">발송일자</th>
								</tr>
							</thead>
							<tbody id="sendMessage-list-tbody">
							</tbody>
						</table>
					</div>
				</div>
				<div class="card-footer" style="background-color : white; text-align:right;">
					<div class="row">
						<div id="sendMessage-page" style="text-align:left;" class="col-6"></div>
						<div style="float:right;" class="col-6">
							<input type="button" class="btn btn-white" id="sendBtn" onclick="openDial($('#newMessagedialog'),600,550)" value="쪽지 보내기"/>
							<input type="button" class="btn btn-white" id="cancelBtn" onclick="closeMessage();" value="취소"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/asyPagination.jsp" %>
<script type="text/x-handlebars-template" id="receiveMessage-search-template">
<select class="form-select" style="display:inline-block; width:30%;" id="MsearchType">
	<option value="" {{selected search.searchType ""}}>검색구분</option>
	<option value="content" {{selected search.searchType "content"}}>내용</option>
</select>
<input type="text" id="Mkeyword" value="{{search.keyword}}" class="form-control" placeholder="Search for…" style="width:30%; display:inline-block;">
<a href="javascript:search_receivemessage()" class="btn btn-white btn-icon" aria-label="Button">
	<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
		<circle cx="10" cy="10" r="7"></circle>
		<line x1="21" y1="21" x2="15" y2="15"></line>
	</svg>
</a>
</script>
<script type="text/x-handlebars-template" id="receiveMessage-list-template">
	{{#each dataList}}
		<tr class="clickabletr" onclick="openReceiveMessageDetail({{msg_no}});">
			<td style="text-align:left; overflow:hidden; text-overflow:ellipsis; white-space: nowrap;">{{sd_name}}</td>
			<td style="text-align:left; overflow:hidden; text-overflow:ellipsis; white-space: nowrap;">{{removebr content}}</td>
			<td class="text-center">{{dateformat wrt_ymd}}</td>
			<td class="text-center">{{status read_yn}}</td>
		</tr>
	{{/each}}
</script>
<script type="text/x-handlebars-template" id="sendMessage-search-template">
<select class="form-select" style="display:inline-block; width:30%;" id="YsearchType">
	<option value="" {{selected search.searchType ""}}>검색구분</option>
	<option value="content" {{selected search.searchType "content"}}>내용</option>
</select>
<input type="text" id="Ykeyword" value="{{search.keyword}}" class="form-control" placeholder="Search for…" style="width:30%; display:inline-block;">
<a href="javascript:search_sendmessage()" class="btn btn-white btn-icon" aria-label="Button">
	<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
		<circle cx="10" cy="10" r="7"></circle>
		<line x1="21" y1="21" x2="15" y2="15"></line>
	</svg>
</a>
</script>
<script type="text/x-handlebars-template" id="sendMessage-list-template">
	{{#each dataList}}
		<tr class="clickabletr" onclick="openSendMessageDetail({{msg_no}});">
			<td style="text-align:left; overflow:hidden; text-overflow:ellipsis; white-space: nowrap;">{{rc_name}}</td>
			<td style="text-align:left; overflow:hidden; text-overflow:ellipsis; white-space: nowrap;">{{removebr content}}</td>
			<td class="text-center">{{dateformat wrt_ymd}}</td>
		</tr>
	{{/each}}
</script>
<script>
var targetsA = {
		pagination : '#receiveMessage-page',
		table_div : '#receiveMessage-list-tbody',
		table_template : '#receiveMessage-list-template',
		search_div : '#receiveMessage-search-div',
		search_template : '#receiveMessage-search-template'
};
function search_receivemessage() {
	var tdiv = $('#receiveMessage-search-div');
	var searchType = $('#MsearchType').val().trim();
	var keyword = $('#Mkeyword').val().trim();
	var dataA = {
			searchType : searchType,
			keyword : keyword
	};
	asyncSearch_go(1,"WHCO/message/receiveMessageList", targetsA, dataA);	
}

var targetsB = {
		pagination : '#sendMessage-page',
		table_div : '#sendMessage-list-tbody',
		table_template : '#sendMessage-list-template',
		search_div : '#sendMessage-search-div',
		search_template : '#sendMessage-search-template'
};
function search_sendmessage() {
	var tdiv = $('#receiveMessage-search-div');
	var searchType = $('#YsearchType').val().trim();
	var keyword = $('#Ykeyword').val().trim();
	var dataB = {
			searchType : searchType,
			keyword : keyword
	};
	asyncSearch_go(1,"WHCO/message/sendMessageList", targetsB, dataB);	
}

function closeMessage() {
	$('#sendMessage-page').find('input[name="searchType"]').val("");
	$('#sendMessage-page').find('input[name="keyword"]').val("");
	$('#receiveMessage-page').find('input[name="searchType"]').val("");
	$('#receiveMessage-page').find('input[name="keyword"]').val("");
	closeDial($('#msgdialog'));
}

function initialReceiveSearch() {
	$('#MsearchType').val("");
	$('#Mkeyword').val("");
	var data = {
			searchType : "",
			keyword : ""
	}
	asyncSearch_go(1,"WHCO/message/receiveMessageList", targetsA, data);
}
function initialSendSearch() {
	$('#YsearchType').val("");
	$('#Ykeyword').val("");
	var data = {
			searchType : "",
			keyword : ""
	}
	asyncSearch_go(1,"WHCO/message/sendMessageList", targetsB, data);
}

function openMessage() {
	initialReceiveSearch();
	initialSendSearch();
	openDial($('#msgdialog'),700,800,true,function(){
		closeMessage();
	});
}
Handlebars.registerHelper({
	"selected" : function(SsearchType, type){
		var str = "";
		if (SsearchType == type) {
			str = "selected";
		}
		return str;
	}
});

Handlebars.registerHelper({
	'status' : function(read_yn){
		if(read_yn == 0) {
			return "미확인";
		}else {
			return "확인";
		}
	}
});

Handlebars.registerHelper({
	'dateformat' : function(wrt_ymd){
		var year=wrt_ymd.substring(0,4);
		var month=wrt_ymd.substring(4,6);
		var day=wrt_ymd.substring(6,8);
		return year+"-"+month+"-"+day;
	}
});
Handlebars.registerHelper({
	'removebr' : function(content){
		var content = content.replace(/<br>/gi,"");
		return content;
	}
});

function openSendMessageDetail(msg_no) {
	$.ajax({
		url : "<%=request.getContextPath()%>/WHCO/message/sendMessageDetail",
		data : {msg_no : msg_no},
		type : 'post',
		success : function(res) {
			var year = res.wrt_ymd.substring(0,4);
			var month = res.wrt_ymd.substring(4,6);
			var day = res.wrt_ymd.substring(6,8);
			var date = year+"-"+month+"-"+day;
			$('#Ssd_name').html(res.rc_name);
			$('#Swrt_ymd').html(date);
			$('#Scontent').val(res.content);
			$('#sendMsgNo').val(res.msg_no);
		}
	});
	openDial($('#sendMsgDetaildialog'),600,550);
}
function openReceiveMessageDetail(msg_no) {
	$.ajax({
		url : "<%=request.getContextPath()%>/WHCO/message/receiveMessageDetail",
		data : {msg_no : msg_no},
		type : 'post',
		success : function(res) {
			var year = res.wrt_ymd.substring(0,4);
			var month = res.wrt_ymd.substring(4,6);
			var day = res.wrt_ymd.substring(6,8);
			var date = year+"-"+month+"-"+day;
			$('#Rsd_name').html(res.sd_name);
			$('#Rwrt_ymd').html(date);
			$('#Rcontent').val(res.content);
			$('#receiveMsgNo').val(res.msg_no);
		}
	});
	openDial($('#receiveMsgDetaildialog'),600,550,true,function(){
		closeReceiveMessageDetail();
	});
}
</script>