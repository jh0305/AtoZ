<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script id="plan-template" type="text/x-handlebars-template">
<div class="card">
	<div class="card-header">
		<div class="col-12 text-center">{{types}} 목록</div>
	</div>
	<div class="table-responsive">
		<table class="table table-vcenter table-mobile-md card-table"
			id="emptable" >
			<thead style="display:block;">
				<tr>
					<th class="w-1">NO.</th>
					<th class="col-md-2">품목번호</th>
					<th class="col-md-3">품목명</th>
					<th class="col-md-3">규격명</th>
					<th class="col-md-2">수량</th>
					<th class="col-md-3">기업명</th>
				</tr>
			</thead>
			<tbody id="reqTbody" style="overflow:auto;display:block;height:500px;">
				{{#each .}}
				<tr class="emptr">
					<td data-label="Name" class="w-1">{{rownum}}</td>
					<td data-label="Name" class="col-md-2">{{item_no}}</td>
					<td data-label="Name" class="col-md-3" style="text-align:left;">{{prettifyName item_name}}</td>
					<td data-label="Name" class="col-md-3">{{std_name}}</td>
					<td data-label="Name" class="col-md-2">{{plan_qty}}</td>
					<td data-label="Name" class="col-md-3" >{{cl_name}}</td>
				</tr>
				{{/each}}
			</tbody>
		</table>
		<hr>
	</div>
</div>
</script>
<script id="request-template" type="text/x-handlebars-template">
<div class="card">
	<div class="card-header">
		<div class="col-12 text-center">{{types}} 목록</div>
	</div>
	<div class="table-responsive">
		<table class="table table-vcenter table-mobile-md card-table"
			id="emptable">
			<thead style=" display: block;"	>
				<tr style="text-align:center;">
					<th class="w-1">NO.</th>
					<th class="col-md-1">품목번호</th>
					<th class="col-md-3">품목명</th>
					<th class="col-md-2">규격</th>
					<th class="col-md-1">수량</th>
					<th style="width: 11%;">납기일</th>
					<th style="width: 11%;">요청일</th>
					<th class="col-md-2">기업명</th>
				</tr>
			</thead>
			<tbody id="planTbody" style=" height: 500px; display: block; overflow: auto; ">
				{{#each .}}
				<tr class="text-center">
					<td class="w-1">{{rownum}}</td>
					<td class="col-md-1">{{item_no}}</td>
					<td style="text-align:left;" class="col-md-3">{{prettifyName item_name}}</td>
					<td class="col-md-2">{{std_name}}</td>
					<td class="col-md-1">{{plan_qty}}</td>
					<td style="width: 11%;">{{prettifyDate plan_ymd}}</td>
					<td style="width: 11%;">{{prettifyDate req_ymd}}</td>
					<td class="col-md-2" style="text-align:center;">{{cl_name}}</td>
				</tr>
				{{/each}}
			</tbody>
		</table>
		<hr>
	</div>
</div>
</script>

<script>

window.addEventListener('onload', getLists());

// 창 로드시 기본 값 : 금일 입고 예정 목록, 입고 요청 목록
function getLists(){
	getTodayInPlan();
	getInReqList();
}

// 금일 입고 예정 목록
function getTodayInPlan(){
	$.ajax({
		url : "${pageContext.request.contextPath}/wms/getInPlanList",
		success : function(data){
			data.types = "[금일 입고 예정] : 품목 상세";
			source = $('#plan-template').html();
			template = Handlebars.compile(source);
			$('#planCard').html(template(data));
		}
	});
}
// 금일 출고 예정 목록
function getTodayOutPlan(){
	$.ajax({
		url : "${pageContext.request.contextPath}/wms/getOutPlanList",
		success : function(data){
			data.types = "[금일 출고 예정] : 품목 상세";
			source = $('#plan-template').html();
			template = Handlebars.compile(source);
			$('#planCard').html(template(data));
		}
	});
}

//입고 승인 요청 목록
function getInReqList(){
	$.ajax({
		url : "${pageContext.request.contextPath}/wms/getInReqList",
		success : function(data){
			data.types = "[입고 승인 요청] : 품목 상세";
			source = $('#request-template').html();
			template = Handlebars.compile(source);
			$('#reqCard').html(template(data));
		}
	});
}
// 출고 승인 요청 목록
function getOutReqList(){
	$.ajax({
		url : "${pageContext.request.contextPath}/wms/getOutReqList",
		success : function(data){
			data.types = "[출고 승인 요청] : 품목 상세";
			source = $('#request-template').html();
			template = Handlebars.compile(source);
			$('#reqCard').html(template(data));
		}
	});
}
Handlebars.registerHelper({
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
			rename = object.substr(0,9) + "...";
		} 
		return rename;
	}
});
</script>

