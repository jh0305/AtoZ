<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.pagination{
		display:inline-flex; 
	}
</style>


<script type="text/x-handlebars-template"  id="asyPagenation">
	
	<ul class="pagination">
		<li class="page-item {{#if prev}} {{else}} disabled {{/if}}">
			<a class="page-link" href="javascript:asyncSearch_go({{getPageMnsOne startPage }},'{{searchMap.url}}',{	pagination : '{{targets.pagination}}',
											 	table_div : '{{targets.table_div}}',
											 	table_template : '{{targets.table_template}}',
												search_div : '{{targets.search_div}}',
												search_template : '{{targets.search_template}}'	});" tabindex="-1" aria-disabled="true">
			<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="15 6 9 12 15 18" /></svg>
			</a>
		</li>
	 
		{{#getIt .}}
			<li class="page-item {{#ifeq ../searchMap.page this }} active {{/ifeq}}"><a class="page-link" href="javascript:asyncSearch_go({{this }},'{{../searchMap.url }}',
											{	pagination : '{{../targets.pagination}}',
											 	table_div : '{{../targets.table_div}}',
											 	table_template : '{{../targets.table_template}}',
												search_div : '{{../targets.search_div}}',
												search_template : '{{../targets.search_template}}'	}
																							);">{{this }}</a></li>
		{{/getIt}}
	
		<li class="page-item {{#if next}} {{else}} disabled {{/if}}">
			<a class="page-link" href="javascript:asyncSearch_go({{getPagePlusOneNum endPage }},'{{searchMap.url }}',{	pagination : '{{targets.pagination}}',
											 	table_div : '{{targets.table_div}}',
											 	table_template : '{{targets.table_template}}',
												search_div : '{{targets.search_div}}',
												search_template : '{{targets.search_template}}'	});">
			<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="9 6 15 12 9 18" /></svg>
			</a>
		</li>
	</ul>

	<form class="jobForm">
		<input type="hidden" name="page" value="{{searchMap.page }}" />
		<input type="hidden" name="perPage" value="{{searchMap.perPage }}" />
	
		{{#each searchMap.search}}
			<input type="hidden" name="{{@key }}" value="{{./this }}" />
		{{/each}}
	</form>
	
</script>

<script>
	
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
		"nowPage" : function(page, pageNum){
			var str = "";
			if(page == pageNum){
				str = "active";
			}
			return str;
		},
		"getPagePlusOneNum" : function(pageNum){
			return pageNum + 1; 
		},
		"getPageMnsOne" : function(pageNum){
			return pageNum - 1;
		}
	});
	
	function asyncSearch_go(page, url, targets,data){
		if(page<1) return;
		
		var formData;
		var perPageNum = $(targets.pagination).find('.jobForm').find('input[name="perPage"]').val();
		
		if(data == null){
			var jobForm = $(targets.pagination).find('.jobForm');
			$(jobForm).find("input[name='page']").val(page);
			formData = $(jobForm).serialize();
		} else {
			data.perPage = perPageNum;
			data.page = page;
			formData = data;
		}
		
		$.ajax({
			url : "<%=request.getContextPath()%>/" + url,
			dataType : 'json',
			data : formData,
			success : function(res){
				var pgm = res.pageMaker;
				pgm.targets = targets;
				asyncPrintData(pgm,$(targets.pagination),$('#asyPagenation'));
				asyncPrintData(res,$(targets.table_div),$(targets.table_template));
				if(targets.search_div != null || targets.search_div != ""){
					asyncPrintData(res.pageMaker.searchMap,$(targets.search_div),$(targets.search_template));
				}
			},
			error : function(e){
				
			}
		})
		
	}
	
	var asyncPrintData = function(Arr,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(Arr);
		$(target).html(html);
	}
	
</script>




