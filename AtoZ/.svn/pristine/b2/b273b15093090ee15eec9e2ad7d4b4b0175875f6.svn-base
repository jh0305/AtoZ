<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<head>
<Style>
	textarea{
		resize:none;
	}
</Style>
</head>
<body>
<div style="margin:2%">
	<strong style="font-size:1.2rem;">출고내역 상세보기</strong>
</div>

<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-header">
		<div class="col-1">No.</div>
		<div class="col-2" id="rls_no"></div>
		<div class="col-1">담당자</div>
		<div class="col-2" id="manager"></div>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table card-table table-vcenter text-nowrap datatable">
				<thead>
					<tr>
						<th>품목번호</th>
						<th style="text-align:left;">품목이름</th>
						<th style="text-align:left;">규격명</th>
						<th style="text-align:right;">출고예정수량</th>
						<th style="text-align:right;">실출고수량</th>
					</tr>
				</thead>
				<tbody id="rlsitem-list-tbody">
				</tbody>
			</table>
		</div>
	</div>
</div>
<div style="margin-top:2%; margin-left:2%;">
<input type="button" class="btn btn-white" id="cancelBtn" onclick="" value="닫기"/>
</div>
<script type="text/x-handlebars-template"  id="rlsitem-list-template" >
{{#each .}}
	<tr>
		<td class="text-center">{{item_no}}</td>
		<td style="text-align:left;">{{item_name}}</td>
		<td style="text-align:left;">{{std_name}}</td>
		<td style="text-align:right;">{{plan_qty}}</td>
		<td style="text-align:right;">{{rls_qty}}</td>
	</tr>
{{/each}}
</script>
<script>
var printData=function(Arr,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(Arr);
	$(target).html(html);
}
</script>