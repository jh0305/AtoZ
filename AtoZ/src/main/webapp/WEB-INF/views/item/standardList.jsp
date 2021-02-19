<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.markdown>table thead th, .table thead th{
	    text-transform: lowercase;
}
</style>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">규격 정보 목록</strong>
</div>

<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-header" style="display:inline-block;" id="standard-search-div">
		
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table card-table table-vcenter text-nowrap datatable">
				<thead>
					<tr>
						<th class="text-center">규격코드</th>
						<th class="text-center">규격명</th>
						<th class="text-center">가로규격(cm)</th>
						<th class="text-center">세로규격(cm)</th>
						<th class="text-center">높이규격(cm)</th>
					</tr>
				</thead>
				<tbody id="standard-list-tbody">
				
				</tbody>
			</table>
		</div>
	</div>
	<div class="card-footer" style="background-color:white;">
		<div id="standard-page" style="float:left;"></div>
		<div style="float:right;">
		<input type="button" class="btn btn-white" id="registStandarBtn" onclick="openDial($('#dialog4'),500,600)" value="신규"/>
		<input type="button" class="btn btn-white" id="registStandarBtn" onclick="openDial($('#dialog9'),500,300);" value="Excel등록"/>
		<input type="button" class="btn btn-white" id="cancelStandarBtn" onclick="closeDial($('#dialog3'));closeStandardList();" value="취소"/>
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/common/asyPagination.jsp" %>
<script type="text/x-handlebars-template" id="standard-search-template">
<select class="form-select" style="display:inline-block; width:30%;" id="SsearchType">
	<option value="" {{selected search.SsearchType ""}}>검색구분</option>
	<option value="std_code" {{selected search.SsearchType "std_code"}}>규격코드</option>
	<option value="std_name" {{selected search.SsearchType "std_name"}}>규격명</option>
</select>
<input type="text" id="Skeyword" value="{{search.Skeyword}}" class="form-control" placeholder="Search for…" style="width:30%; display:inline-block;">
<a href="javascript:search_standard()" class="btn btn-white btn-icon" aria-label="Button">
	<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
		<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
		<circle cx="10" cy="10" r="7"></circle>
		<line x1="21" y1="21" x2="15" y2="15"></line>
	</svg>
</a>
</script>
<script type="text/x-handlebars-template" id="standard-list-template">
	{{#each dataList}}
		<tr class="clickabletr" onclick="openStandard({{std_no}})">
			<td class="text-center">{{std_code}}</td>
			<td class="text-center">{{std_name}}</td>
			<td class="text-center">{{std_width}}</td>
			<td class="text-center">{{std_lngth}}</td>
			<td class="text-center">{{std_height}}</td>
		</tr>
	{{/each}}
</script>

<script>
var targets = {
	pagination : '#standard-page',
	table_div : '#standard-list-tbody',
	table_template : '#standard-list-template',
	search_div : '#standard-search-div',
	search_template : '#standard-search-template'
};


Handlebars.registerHelper({
	"selected" : function(SsearchType, type){
		var str = "";
		if (SsearchType == type) {
			str = "selected";
		}
		return str;
	}
});

function search_standard() {
	var tdiv = $('#standard-search-div');
	var SsearchType = $('#SsearchType').val().trim();
	var Skeyword = $('#Skeyword').val().trim();
	var data = {
			SsearchType : SsearchType,
			Skeyword : Skeyword
	};
	asyncSearch_go(1,"CO/item/standardList", targets, data);
}
function openStandard(std_no){
	$.ajax({
		url : '<%=request.getContextPath()%>/CO/item/standardDetail',
		data : {std_no : std_no},
		type : 'POST',
		success : function(res) {
			$('#Dstd_code').val(res.std_code);
			$('#Dstd_name').val(res.std_name);
			$('#Dstd_width').val(res.std_width);
			$('#Dstd_lngth').val(res.std_lngth);
			$('#Dstd_height').val(res.std_height);
			$('#Dstd_no').val(res.std_no);
			$('#Mstd_code').val(res.std_code);
			$('#Mstd_name').val(res.std_name);
			$('#Mstd_width').val(res.std_width);
			$('#Mstd_lngth').val(res.std_lngth);
			$('#Mstd_height').val(res.std_height);
			$('#Mstd_no').val(res.std_no);
		}
	});
	$('input[id="Dstd_code"]').prop("readonly",true);
	$('input[id="Dstd_name"]').prop("readonly",true);
	$('input[id="Dstd_width"]').prop("readonly",true);
	$('input[id="Dstd_lngth"]').prop("readonly",true);
	$('input[id="Dstd_height"]').prop("readonly",true);
	openDial($('#dialog5'),500,600)
}

</script>