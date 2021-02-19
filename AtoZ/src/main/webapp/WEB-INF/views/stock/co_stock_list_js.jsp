<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.list-cls:hover{
		background : #e8f0fc;
		cursor : pointer;
	}
</style>
    
<script id="list-template" type="text/x-handlebars-template">
<div class="d-flex">
	<span style="font-weight: bold; line-height: 4;padding-left:20px;">현재 재고 현황</span>
	<div class="text-muted" style="padding-left: 60%;">
		<div class="ms-2 d-inline-block">
			<select class="form-select custom-select-form" id="searchType">
				<option value=""
					{{#ifeq pageMaker.searchMap.searchType ''}}'selected'{{/ifeq}}>검색조건</option>
				<option value="item_no"
					{{#ifeq pageMaker.searchMap.searchType 'item_no'}}'selected'{{/ifeq}}>품목번호</option>
				<option value="item_name"
					{{#ifeq pageMaker.searchMap.searchType 'item_name'}}'selected'{{/ifeq}}>품목명</option>
				<option value="cl_name"
					{{#ifeq pageMaker.searchMap.searchType 'cl_name'}}'selected'{{/ifeq}}>물류센터명</option>
			</select>
		</div>
	</div>
	<div class="text-muted">
		<div class="ms-2 d-inline-block">
			<input type="text" class="form-control form-control-md custom-search-form" id="keyword">
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
		<tr style="text-align: center;">
			<th class="w-1">No.</th>
			<th>품목번호</th>
			<th style="text-align:left;width: 25%;">품목명</th>
			<th style="text-align:left;">규격</th>
			<th>수량(ctn)</th>	
			<th style="text-align:left;">물류센터명</th>
		</tr>
	</thead>
	<tbody>
		{{#isEmpty stockList}}
		<tr>
			<td></td>
			<td>자료가 없습니다.</td>
		</tr>
		{{else}}
			{{#each stockList}} 
			<tr style="text-align: center;" class="list-cls" onclick="stockDetail(this);">
				<td><span class="text-muted">{{rownum }}</span></td>
				<td>{{item_no }}</td> 
				<td style="text-align:left;">{{prettifyName item_name }}</td>
				<td style="text-align:left;">{{std_name }}</td>
				<td style="text-align:right;">{{inv_qty }}</td>
				<td style="text-align:left;"><input type="hidden" value="{{wh_code}}" name="wh_code">{{prettifyName cl_name}}</td>
			</tr>
			{{/each}}
		{{/isEmpty}}
		
	</tbody>
</table>	
</script>
<script id="history-template" type="text/x-handlebars-template">
<div class="table-responsive">
	<div class="d-flex">
		<span style="font-weight:bold;line-height:4;padding-left:8px;">상세 재고 이력 (품목 번호 : {{item_no}}) </span>
		<div class="text-muted" style="padding-left: 36%;">
			<div class="ms-2 d-inline-block" style="position: relative;left: 95%;">
				<select class="form-select custom-select-form" onchange="javascript:choose_order(this);">
					<option value="" {{#ifeq pageMaker.searchMap.search.searchType ''}} selected {{/ifeq}}>정렬조건</option>
					<option value="real_date" {{#ifeq pageMaker.searchMap.search.searchType 'real_date' }} selected {{/ifeq}}>입출고일</option>
					<option value="type" {{#ifeq pageMaker.searchMap.search.searchType 'type' }} selected {{/ifeq}}>유형(입고-출고)</option>
					<option value="type_desc" {{#ifeq pageMaker.searchMap.search.searchType 'type_desc' }} selected {{/ifeq}}>유형(출고-입고)</option>
				</select>
			</div>
		</div>
	</div>
	<table class="table card-table table-vcenter text-nowrap datatable">
		<thead>
			<tr style="text-align:center;">
				<th class="w-1">NO.</th>
				<th style="width: 12%;">유형</th>
				<th>실입출고일자</th>
				<th>실수량(ctn)</th>
				<th>이전수량(ctn)</th>
				<th>변동수량(ctn)</th>
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
					<td>{{prettifyDate real_date}}</td>
					{{#isChoolgo type}}
					<td style="text-align:right;">-</td>
					<td style="text-align:right;">-</td>
					{{else}}
					<td style="text-align:right;">{{real_qty}}</td>
					<td style="text-align:right;">{{req_qty}}</td>
					{{/isChoolgo}}
					<td style="text-align:right;">{{cng_qty}}</span></td>
				</tr>
				{{/each}}
				<tr style="text-align:center;">
					<td></td>
					<td></td>
					<th>합계 :</th>
					<th style="text-align:right;">{{totalCnt}}</th>
					<td></td>
					<td></td>
				</tr>
			{{/isEmpty}}
		</tbody>
	</table>
</div>
</script>
<script id="pagination" type="text/x-handlebars-template"> 
	<div class="card-footer" text-align:right;">
		<ul class="pagination" style="display:inline-flex;"> 
			<li class="page-item {{#unless pageMaker.prev}} disabled {{/unless}}">
				<a class="page-link" href="javascript:searchList_go({{ getPageMnsOne pageMaker.startPage }},'{{pageMaker.searchMap.url }}');" tabindex="-1" aria-disabled="true">
				<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="15 6 9 12 15 18" /></svg>
				</a>
			</li>
			
			{{#getIt pageMaker}}
				<li class="page-item {{#ifeq ../pageMaker.searchMap.page this }} active {{/ifeq}}">
				<a class="page-link" href="javascript:searchList_go({{this }},'{{../pageMaker.searchMap.url }}');">{{this}}</a></li>
			{{/getIt}}
			
			<li class="page-item {{#unless pageMaker.next }} disabled {{/unless}}">
				<a class="page-link" href="javascript:searchList_go({{getPagePlusOneNum pageMaker.endPage}},'{{pageMaker.searchMap.url }}');">
				<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="9 6 15 12 9 18" /></svg>
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

	window.addEventListener('onload',stockList());
	
	var item_no = "";
	var current_page = 1;
	var wh_code = "";
	
	function stockList(){
		$.ajax({
			url : "${pageContext.request.contextPath}/stock/coStockList",
			success: function(data){
				var source = $('#list-template').html();
				var template = Handlebars.compile(source);				
				$('#dynamic-table').html(template(data));
				var psource = $('#pagination').html();
				var ptemplate = Handlebars.compile(psource);
				$('#list_paging').html(ptemplate(data));				
				first_tr = $('.list-cls:first');				
				stockDetail(first_tr);
			}	
		});
	}

	function stockDetail(object){
		item_no = $(object).find('td:nth-child(2)').text();
		if(!item_no){
			return false;
		}
		wh_code = $(object).find('input[name=wh_code]').val();
		$.ajax({
			url : "${pageContext.request.contextPath}/stock/coDetailList",
			data : {"item_no" : item_no, "page": 1, "wh_code" : wh_code},
			success : function(data){
				var res = data;
				res["item_no"] = item_no;
				var source = $('#history-template').html();
				var template = Handlebars.compile(source);				
				$('#stock_detail').html(template(res));
				var psource = $('#pagination').html();
				var ptemplate = Handlebars.compile(psource);
				$('#paging').html(ptemplate(data));				
			}
		});		
	}

	function choose_order(object){
		var orderType = $(object).val();
		$.ajax({
			url : "${pageContext.request.contextPath}/stock/coDetailList",
			data : {"item_no" : item_no, "searchType" : orderType, "page" : 1, "wh_code" : wh_code},
			success : function(data){
				var param = data;
				param["item_no"] = item_no;
				var source = $('#history-template').html();
				var template = Handlebars.compile(source);				
				$('#stock_detail').html(template(param));
				var psource = $('#pagination').html();
				var ptemplate = Handlebars.compile(psource);
				$('#paging').html(ptemplate(data));				
			}
		});
	}
	
	function search_go(url) {
		var data = {
			searchType : $("#searchType").val(),
			keyword : $("#keyword").val()
		}
		searchList_go(1, url, data);
	}
	
	function searchList_go(page, url, data){
		current_page = page;
		if(page<1) return;
		if(data == null){
			var jobForm = document.getElementById("jobForm");
			$(jobForm).find("input[name='page']").val(page);
			var formData = $(jobForm).serialize();
			formData += "&item_no="+item_no;
			$.ajax({
				url : "<%=request.getContextPath()%>"+url,
				data : formData,
				success : function(res){
					if(res.pageMaker.searchMap.url=='/stock/coDetailList'){
						source = $('#stock-template').html();
						psource = $('#pagination').html();
						template = Handlebars.compile(source);
						ptemplate = Handlebars.compile(psource);						
						$('#stock_detail').empty();
						$('#stock_detail').html(template(res));
						$('#paging').empty();						
						$('#paging').html(ptemplate(res));							
					}else{
						source = $('#list-template').html();
						psource = $('#pagination').html();
						template = Handlebars.compile(source);
						ptemplate = Handlebars.compile(psource);						
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
			<%-- $(".content").load("<%=request.getContextPath()%>"+url, data); --%>
			$.ajax({
				url : "<%=request.getContextPath()%>"+url,
				data : data,
				success : function(res){
					if(res.pageMaker.searchMap.url=='/stock/coDetailList'){ // 기업 재고 상세 목록
						source = $('#stock-template').html();
						psource = $('#pagination').html();
						template = Handlebars.compile(source);
						ptemplate = Handlebars.compile(psource);	
						$('#stock_detail').empty();
						$('#stock_detail').html(template(res));
						$('#paging').empty();						
						$('#paging').html(ptemplate(res));						
					}else{ //기업 재고 목록						
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
		}
		
	}
	
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
		"isExist": function(object, options){
			if(object){
				return options.fn(this);
			}else{
				return options.inverse(this);
			}
		},
		"prettifyName" : function(object){
			var rename = object;
			if(object.length > 10){
				rename = object.substr(0,10) + "...";
			} 
			return rename;
		},
		"isChoolgo" : function(object,options){
			if(object == '출고'){
				return options.fn(this)
			}else{
				return options.inverse(this);
			}
		}
	});
</script>
