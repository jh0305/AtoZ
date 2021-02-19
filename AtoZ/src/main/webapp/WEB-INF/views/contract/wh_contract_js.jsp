<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script id="contract-template" type="text/x-handlebars-template">
	<table class="table card-table table-vcenter text-nowrap datatable">
		<thead>
			<tr style="width:15%; text-align:center;">
				<th style="width: 10%;">계약번호	</th>
				<th>기업명</th>
				<th>계약시작일</th>
				<th>계약종료일</th>
				<th>계약총면적(㎡) [평]</th>
				<th>계약상태</th>
				<th>계약요청일</th>
			</tr>
		</thead>
		<tbody>
			{{#unless crList}}
				<tr>
					<td></td>
					<td></td>
					<td>
			 		자료가 없습니다.	
					</td>
				</tr>
			{{/unless}}
			{{#each crList}}
			<tr class="whtr" style="width:15%; text-align:center;" onclick="detailAjax($('#contract'),700,700,this);">
				<td style="width: 10%;">{{cc_no}}<input type="hidden" value="{{cl_code }}" name="clcodes"></td>
				<td><a href="javascript:;" onclick="event.stopPropagation();coWhsDetailAjax($('#dialog'),700,600,this);">{{cl_name}}</a></td>
				<td><span class="text-muted" name="addr">{{prettifyDate cr_ymd}}</span></td>
				<td><span class="text-muted" name="typenames">{{prettifyDate exp_ymd}}
				</span></td>
				<td><span class="text-muted">{{cr_area}} [ {{getPyeong cr_area}} ]</span></td>
				<td><span class="text-muted" name="td_cm_name">{{cm_name}}</span></td>
				<td><span class="text-muted">{{req_date}}</span></td>
			</tr>
			{{/each}}
		</tbody>
	</table>	
</script>
<script id="request-template" type="text/x-handlebars-template">
	<table class="table card-table table-vcenter text-nowrap datatable">
		<thead>
			<tr style="width:15%; text-align:center;">
				<th style="width: 10%;text-align: center;">계약요청번호	</th>
				<th>기업명</th>
				<th>계약요청총면적(㎡)</th>
				<th>계약상태</th>
				<th>희망계약기간</th>
				<th>요청등록일</th>
			</tr>
		</thead>
		<tbody>
			{{#unless crList}}
				<tr>
					<td></td>
					<td></td>
					<td>
			 		요청된 계약이 없습니다.	
					</td>
				</tr>
			{{/unless}}
			{{#each crList}}
			<tr class="whtr" style="width:15%; text-align:center;" onclick="detailAjax($('#contract'),700,700,this);">
				<td style="width:10%;">{{cc_no}}<input type="hidden" value="{{co_code }}" name="clcodes"></td>
				<td><a href="javascript:;" onclick="event.stopPropagation();coWhsDetailAjax($('#dialog'),700,600,this);">{{cl_name}}</a></td>
				<td><span class="text-muted" name="crarea">{{cr_area}}</span></td>
				<td><span class="text-muted" name="statusname">{{cm_name}}</span></td>
				<td><span class="text-muted">{{pre_priod}}&nbsp;년</span></td>
				<td><span class="text-muted">{{reg_date}}</span></td>
			</tr>
			{{/each}}
		</tbody>
	</table>	
</script>
<script id="pagination" type="text/x-handlebars-template"> 
	<div class="card-footer" style="background-color:white;">
		<ul class="pagination "> 
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
	var whichCmCode;

	window.addEventListener('onload', getList('',$('#btn1')));
	
	function setSearchReset(){
		$('#searchType').val('');
		$('#keyword').val('');
	}
	
	function getList(cm_code, object){
		setSearchReset();
		whichCmCode = cm_code;
		$('.tabtn').css("background",'none');
		$(object).css("background","#f2f5f7");
		$.ajax({
			url : "<%=request.getContextPath()%>/contract/tabList",
			data : {"cm_code" : cm_code},
			success : function(data){
				let btn = $('.tabtn');			
				var source = $('#contract-template').html();
				var psource = $('#pagination').html();
				var template = Handlebars.compile(source);
				var ptemplate = Handlebars.compile(psource);
				$('.pagination').empty();
				$('#dynamic_table').empty();
				$('#dynamic_table').html(template(data));
				$('#pagingdiv').empty();
				$('#pagingdiv').html(ptemplate(data));
			}
		});	
	}

	function getReqList(object){
		setSearchReset();
		whichCmCode = 'CR001';
		$('.tabtn').css("background",'none');
		$(object).css("background","#f2f5f7");
		$.ajax({
			url : "${pageContext.request.contextPath}/contract/getReqList",
			success : function(data){
				source = $('#request-template').html();
				template = Handlebars.compile(source);
				psource = $('#pagination').html();
				ptemplate = Handlebars.compile(psource);
				$('.pagination').empty();
				$('#dynamic_table').empty();
				$('#dynamic_table').html(template(data));
				$('#pagingdiv').empty();
				$('#pagingdiv').html(ptemplate(data));
			}
		});
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
		"isRequest" : function(cmcode, options){
			return (cmcode == 'CR001') ? options.fn(this) : options.inverse(this);
		},
		"getPyeong" : function(object){			
			return Math.round(object * 0.3025*100)/100;
		}
	});
	
	function searchList_go(page, url, data){
		if(page<1) return;
		if(data == null){
			var jobForm = document.getElementById("jobForm");
			$(jobForm).find("input[name='page']").val(page);
			var formData = $(jobForm).serialize();
			<%-- $(".content").load("<%=request.getContextPath()%>"+url, formData); --%>
			$.ajax({
				url : "<%=request.getContextPath()%>"+url,
				data : formData,
				success : function(data){					
					source = $('#contract-template').html();
					psource = $('#pagination').html();
					template = Handlebars.compile(source);
					ptemplate = Handlebars.compile(psource); 
					$('.pagination').empty();
					$('#dynamic_table').empty();
					$('#dynamic_table').html(template(data));
					$('#pagingdiv').empty();
					$('#pagingdiv').html(ptemplate(data));
				}
			});
		} else {
			data.page = page;
			<%-- $(".content").load("<%=request.getContextPath()%>"+url, data); --%>
			$.ajax({
				url : "<%=request.getContextPath()%>"+url,
				data : data,
				success : function(data){
					source = $('#contract-template').html(	);
					psource = $('#pagination').html();
					template = Handlebars.compile(source);
					ptemplate = Handlebars.compile(psource);
					$('.pagination').empty();
					$('#dynamic_table').empty();
					$('#dynamic_table').html(template(data));
					$('#pagingdiv').empty();
					$('#pagingdiv').html(ptemplate(data));
				}
			})
		}
		
	}
	
	function search_go(){
		var data = {};
		if (!whichCmCode) {
			data = {
					searchType : $("#searchType").val(),
					keyword : $("#keyword").val()
			}
		}else{
			data = {
				searchType : $("#searchType").val(),
				keyword : $("#keyword").val(),
				cm_code : whichCmCode 
			}			
		} 
		searchList_go(1,'/contract/tabList',data);
	}
 </script>   