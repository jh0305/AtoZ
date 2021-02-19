<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.detail_tr:hover, .list-cls:hover{
		background : #e8f0fc;
	}
	
</style>

<script id="list-template" type="text/x-handlebars-template">
<div class="d-flex">
	<span style="font-weight: bold; line-height: 4;padding-left:20px;">현재 재고 현황</span>
	<div class="text-muted" style="padding-left: 45%;">
		<div class="ms-2 d-inline-block">
			<select class="form-select custom-select-form" id="searchType">
				<option value=""
					{{#ifeq pageMaker.searchMap.search.searchType ''}} selected {{/ifeq}}>검색조건</option>
				<option value="item_no"
					{{#ifeq pageMaker.searchMap.search.searchType 'item_no'}} selected {{/ifeq}}>품목코드</option>
				<option value="cl_name"
					{{#ifeq pageMaker.searchMap.search.searchType 'cl_name'}} selected {{/ifeq}}>기업명</option>
			</select>
		</div>
	</div>
	<div class="text-muted">
		<div class="ms-2 d-inline-block">
			<input type="text"
				class="form-control form-control-md custom-search-form" id="keyword">
		</div>
		<button class="btn btn-white btn-icon" aria-label="Button"
			style="display: inline; position: relative; top: -2px; height: 33px;"
			onclick="search_go('{{pageMaker.searchMap.url}}')">
			<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
				height="24" viewBox="0 0 24 24" stroke-width="2"
				stroke="currentColor" fill="none" stroke-linecap="round"
				stroke-linejoin="round">
				<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
				<circle cx="10" cy="10" r="7"></circle>
				<line x1="21" y1="21" x2="15" y2="15"></line>
			</svg>
		</button>
	</div>
</div>
<table class="table card-table table-vcenter text-nowrap datatable">
	<thead>
		<tr style="text-align: center;" >
			<th class="w-1">No.</th>
			<th>품목코드</th>
			<th>품목명</th>
			<th>규격</th>
			<th>수량</th>
			<th>기업명</th>
		</tr>
	</thead>
	<tbody>
		{{#isEmpty stockList}}
			<tr><td></td><td>자료가 없습니다..</td></tr>
		{{else}}
			{{#each stockList}} 
			<tr style="text-align: center;" class="list-cls" onclick="stockDetail(this);">
				<td><input type="hidden" value="wh_code" name="wh_code"><span
					class="text-muted">{{rownum }}</span></td>
				<td>{{item_no }}</td> 
				<td style="text-align:left;">{{prettifyName item_name }}</td>
				<td>{{std_name }}</td>
				<td>{{inv_qty }}</td>
				<td>{{cl_name}}</td>
			</tr>
			{{/each}}
		{{/isEmpty}}
	</tbody>
</table>
</script>
<script id="stock-template" type="text/x-handlebars-template">
<div class="table-responsive" style="min-height:680px;">
	<div class="d-flex">
		<span style="font-weight: bold;line-height:4;padding-left: 20px;">상세 재고 현황</span>
		<div class="ms-auto text-muted">
			<div class="ms-2 d-inline-block" style="position: relative;left: -10%;">
				<select class="form-select custom-select-form" onchange="javascript:choose_order(this);" id="chooseType">
					<option value="" {{#ifeq pageMaker.searchMap.search.searchType ''}} selected {{/ifeq}}>정렬조건</option>
					<option value="in_ymd" {{#ifeq pageMaker.searchMap.search.searchType 'in_ymd'}} selected {{/ifeq}}>입고일</option>
					<option value="inv_loc" {{#ifeq pageMaker.searchMap.search.searchType 'inv_loc'}} selected {{/ifeq}}>적재위치(오름차순)</option>
					<option value="inv_loc_desc" {{#ifeq pageMaker.searchMap.search.searchType 'inv_loc_desc'}} selected {{/ifeq}}>적재위치(내림차순)</option>
				</select>
			</div>
		</div>
	</div>
	<table class="table card-table table-vcenter text-nowrap datatable">
		<thead>
			<tr style="text-align:center;">
				<th class="w-1">No.</th>
				<th>재고번호
				</th>
				<th>품목코드</th>
				<th>품목명</th>
				<th>규격</th>
				<th>적재위치</th>
				<th>입고일</th>
				<th>입고담당자</th>
			</tr>
		</thead>
		<tbody>
			{{#isEmpty stockList}}
			<tr><td></td><td>자료가 없습니다..</td></tr>
			{{else}}
				{{#each stockList}}
				<tr style="text-align:center;" class="detail_tr" onclick="javascript:history_go(this);">
					<td><span class="text-muted">{{rownum}}</span></td>
					<td><span class="text-muted">{{inv_no}}</span></td>
					<td>{{item_no}}</td>
					<td>{{prettifyName item_name}}</td>
					<td>{{std_name}}</td>
					<td>{{inv_loc}}</td>
					<td><span class="text-muted">{{prettifyDate in_ymd}}</span></td>
					<td>{{reg_name}}</td>
				</tr>
				{{/each}}
			{{/isEmpty}}
		</tbody>
	</table>
</div>
</script>
<script id="history-stock-template" type="text/x-handlebars-template">
<div class="table-responsive">
	<div class="d-flex">
		<span style="font-weight:bold;line-height:4;padding-left:8px;">[품목 번호 : {{item_no}}] {{item_name}} {{std_name}}  </span>		
	</div>
	<table class="table card-table table-vcenter text-nowrap datatable">
		<thead>
			<tr style="text-align:center;">
				<th class="w-1">NO.</th>
				<th style="width: 12%;">유형</th>
				<th>작업일자</th>
				<th>실수량(ctn)</th>
				<th>이전수량(ctn)</th>
				<th>변동수량(ctn)</th>
				<th>위치</th>
				<th>담당자</th>
			</tr>
		</thead>
		<tbody>
			{{#isEmpty stockList}}
			<tr><td></td><td></td><td>자료가 없습니다..</td></tr>
			{{else}}
				{{#each stockList}}
				<tr style="text-align:center;" >
					<td>{{rownum}}</td>
					<td><span class="text-muted">{{type}}</span></td>
					<td>{{real_date}}</td>
					<td>{{real_qty}}</td>
					<td>{{req_qty}}</td>
					<td>{{prettifyNumber cng_qty}}</span></td>
					<td>{{inv_loc}}</span></td>
					<td>{{reg_name}}</span></td>
				</tr>
				{{/each}}
			{{/isEmpty}}
		</tbody>
	</table>
</div>
</script>
<script id="pagination" type="text/x-handlebars-template"> 
<div class="card-footer"text-align:right;">
	<ul class="pagination" style="display: inline-flex;">
		<li class="page-item {{#unless pageMaker.prev}} disabled {{/unless}}">
			<a class="page-link"
			href="javascript:searchList_go({{ getPageMnsOne pageMaker.startPage }},'{{pageMaker.searchMap.url }}');"
			tabindex="-1" aria-disabled="true"> <svg
					xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
					height="24" viewBox="0 0 24 24" stroke-width="2"
					stroke="currentColor" fill="none" stroke-linecap="round"
					stroke-linejoin="round">
					<path stroke="none" d="M0 0h24v24H0z" fill="none" />
					<polyline points="15 6 9 12 15 18" /></svg>
		</a>
		</li> 
		{{#getIt pageMaker}}
		<li class="page-item {{#ifeq ../pageMaker.searchMap.page this }} active {{/ifeq}}">
			<a class="page-link" href="javascript:searchList_go({{this }},'{{../pageMaker.searchMap.url }}');">{{this}}</a>
		</li> 
		{{/getIt}}
		<li class="page-item {{#unless pageMaker.next }} disabled {{/unless}}">
			<a class="page-link"
			href="javascript:searchList_go({{getPagePlusOneNum pageMaker.endPage}},'{{pageMaker.searchMap.url }}');">
				<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24"
					height="24" viewBox="0 0 24 24" stroke-width="2"
					stroke="currentColor" fill="none" stroke-linecap="round"
					stroke-linejoin="round">
					<path stroke="none" d="M0 0h24v24H0z" fill="none" />
					<polyline points="9 6 15 12 9 18" />
				</svg>
			</a>
		</li>
	</ul>
	<form id="jobForm">
		<input type="hidden" name="page" value="{{pageMaker.searchMap.page }}" />
		<input type="hidden" name="perPage" value="{{pageMaker.searchMap.perPage }}" />
	</form>
</div>
</script>
<script>

	window.addEventListener('load',stockList());
	
	var item_no = "";
	var current_page = "1";
	var inv_no = "";
	
	function stockList(){
		$.ajax({
			url : "${pageContext.request.contextPath}/stock/stockList",
			success: function(data){
				var param = data;
				param["isList"] = true;
				var source = $('#list-template').html();
				var template = Handlebars.compile(source);				
				$('#dynamic-table').empty();
				$('#dynamic-table').html(template(data));
				var psource = $('#pagination').html();
				var ptemplate = Handlebars.compile(psource);
				$('#list_paging').empty();
				$('#list_paging').html(ptemplate(param));				
				item_no = $('.list-cls:first');
				stockDetail(item_no);
			}	
		});
	}

	function stockDetail(object){
		//item_no = $(object).text();
		item_no = $(object).children('td:nth-child(2)').text(); //아이템 번호
		$.ajax({
			url : "${pageContext.request.contextPath}/stock/stockDetail",
			data : {"item_no" : item_no, "page": 1},
			success : function(data){
				var source = $('#stock-template').html();
				var template = Handlebars.compile(source);				
				$('#stock_detail').empty();
				$('#stock_detail').html(template(data));
				var psource = $('#pagination').html();
				var ptemplate = Handlebars.compile(psource);
				$('#paging').empty();				
				$('#paging').html(ptemplate(data));				
			}
		});		
	}

	function choose_order(object){
		var orderType = $(object).val();
		$.ajax({
			url : "${pageContext.request.contextPath}/stock/stockDetail",
			data : {"item_no" : item_no, "searchType" : orderType, "page" : 1},
			success : function(data){
				var source = $('#stock-template').html();
				var template = Handlebars.compile(source);				
				$('#stock_detail').empty();
				$('#stock_detail').html(template(data));
				var psource = $('#pagination').html();
				var ptemplate = Handlebars.compile(psource);
				$('#paging').empty();				
				$('#paging').html(ptemplate(data));				
			}
		});
	}
	
	function search_go(url) {
		var data = {
			searchType : $("#searchType").val(),
			keyword : $("#keyword").val()
		}
		searchList_go(1, url , data);
	}
	
	function searchList_go(page, url, data){
		current_page = page;
		if(page<1) return;
		if(data == null){ // 페이징 버튼 눌렀을때
			var jobForm = document.getElementById("jobForm");
			$(jobForm).find("input[name='page']").val(page);
			var formData = $(jobForm).serialize();
			formData += "&item_no="+item_no;
			var searchType = $('#searchType').val();
			var keyword = $('#keyword').val();
			var chooseType = $('#chooseType').val();
			
			if(url=='/stock/stockDetail'){ //페이징이 상세에서 한 경우
				formData += "&searchType="+chooseType;
			}else{
				if(searchType){
					formData += "&searchType="+searchType;
				}
				if(keyword){
					formData += "&keyword="+keyword;
				}	
			}			
			if(url =='/stock/stockHistory'){
				formData += "&inv_no="+inv_no;
			}
			$.ajax({
				url : "<%=request.getContextPath()%>"+url,
				data : formData,
				success : function(res){
					if(res.pageMaker.searchMap.url=='/stock/stockDetail'){
						source = $('#stock-template').html();
						psource = $('#pagination').html();
						template = Handlebars.compile(source);
						ptemplate = Handlebars.compile(psource);
						$('#stock_detail').empty();
						$('#stock_detail').html(template(res));
						$('#paging').empty();						
						$('#paging').html(ptemplate(res));						
					}else if(res.pageMaker.searchMap.url=='/stock/stockHistory'){
						var result = res;
						result.item_no = res.stockList[0].item_no;
						result.item_name = res.stockList[0].item_name;
						result.std_name = res.stockList[0].std_name;
						source = $('#history-stock-template').html();
						psource = $('#pagination').html();
						template = Handlebars.compile(source);
						ptemplate = Handlebars.compile(psource);
						$('#his_dynamic_table').empty();
						$('#his_dynamic_table').html(template(result));				
						$('#his_list_paging').empty();
						$('#his_list_paging').html(ptemplate(res));
					}else{
						var source = $('#list-template').html();
						var psource = $('#pagination').html();
						var template = Handlebars.compile(source);
						var ptemplate = Handlebars.compile(psource);						
						$('#dynamic-table').empty();
						$('#dynamic-table').html(template(res));
						$('#list_paging').empty();
						$('#list_paging').html(ptemplate(res));							
					}
				}
			});
		} else {
			data.page = page;			
			data.item_no = item_no;
			$.ajax({
				url : "<%=request.getContextPath()%>"+url,
				data : data,
				success : function(res){
					if(res.pageMaker.searchMap.url=='/stock/stockDetail'){
						source = $('#stock-template').html();
						psource = $('#pagination').html();
						template = Handlebars.compile(source);
						ptemplate = Handlebars.compile(psource);						
						$('#stock_detail').empty();
						$('#stock_detail').html(template(res));
						$('#paging').empty();						
						$('#paging').html(ptemplate(res));					
					}else if(res.pageMaker.searchMap.url=='/stock/stockHistory'){
						var result = res;
						result.item_no = res.stockList[0].item_no;
						result.item_name = res.stockList[0].item_name;
						result.std_name = res.stockList[0].std_name;
						source = $('#history-stock-template').html();
						psource = $('#pagination').html();
						template = Handlebars.compile(source);
						ptemplate = Handlebars.compile(psource);
						$('#his_dynamic_table').empty();
						$('#his_dynamic_table').html(template(result));				
						$('#his_list_paging').empty();
						$('#his_list_paging').html(ptemplate(res));
					}else{
						var source = $('#list-template').html();
						var psource = $('#pagination').html();
						var template = Handlebars.compile(source);
						var ptemplate = Handlebars.compile(psource);						
						$('#dynamic-table').empty();
						$('#dynamic-table').html(template(res));
						$('#list_paging').empty();
						$('#list_paging').html(ptemplate(res));							
					}
				}
			})
		}
		
	}
	
	// 상세 재고 이력 팝업 띄우는 함수
	function history_go(object){ 
		inv_no = $(object).children('td:nth-child(2)').text(); //재고 번호
		openDial($('#detail_history_form'),1000,800);
		var source = $('#history-stock-template').html();
		var psource = $('#pagination').html();
		var template = Handlebars.compile(source);
		var ptemplate = Handlebars.compile(psource);
		$.ajax({
			url : "${pageContext.request.contextPath}/stock/stockHistory",
			data : {"inv_no" : inv_no},
			success : function(res){
				var result = res;
				result.item_no = res.stockList[0].item_no;
				result.item_name = res.stockList[0].item_name;
				result.std_name = res.stockList[0].std_name;
				$('#his_dynamic_table').empty();
				$('#his_dynamic_table').html(template(result));				
				$('#his_list_paging').empty();
				$('#his_list_paging').html(ptemplate(res));
			}
		});
		
	};
	
	Handlebars.registerHelper({
		"getIt" : function(pageMaker, block){
			var start = pageMaker.startPage;
			var end = pageMaker.endPage;
			var code = "";
			for(i= start ; i<=end; ++i){
				code += block.fn(i);
			}
			return code;
		},
		"ifeq" : function(object, target, options){
			return (object == target) ? options.fn(this) : options.inverse(this);
		},
		"getPagePlusOneNum" : function(pageNum){
			return pageNum + 1; 
		},
		"getPageMnsOne" : function(pageNum){
			return pageNum - 1;
		},
		"isEmpty" : function(object, options){
			return (object.length == 0) ? options.fn(this) : options.inverse(this);
		},
		"prettifyDate" : function(object){
			if(!object){
			return "-";
		}
			var year = object.substr(0,4);
			var month = object.substr(4,2);
			var date = object.substr(6,2);
			return year + "-" + month + "-" + date;
		},
		"prettifyName" : function(object){
			var rename = object;
			if(object.length > 10){
				rename = object.substr(0,10) + "...";
			} 
			return rename;
		},
		"prettifyNumber" : function(object){
			if(object > 0) {
				return '+' + object;
			}
			return object;
		}
	});
</script>