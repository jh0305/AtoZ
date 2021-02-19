<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<style>
		.clickableTr{
			cursor: pointer;
		}
		.clickableTr:hover{
			background : rgb(241,244,249);
		}
	</style>
	<div class="col-12" style="padding : 0px 15px;">
		<!-- 콘텐츠 헤더 -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">	
				<div class="col">
					<h2 class="page-title">
						입고 정보 목록
					</h2>
				</div>
			</div>
		</div>
		<!-- /page-header -->
		
		<div class="card col-12">
		  <ul class="nav nav-tabs" data-bs-toggle="tabs">
		    <li class="nav-item">
		      <a href="#tabs-req-ex1" onclick="asyncSearch_go(1, 'AL/receive/receiveReqList', targets3);setCurrTab(1);" class="nav-link active" data-bs-toggle="tab">입고요청</a>
		    </li>
		    <li class="nav-item">
		      <a href="#tabs-plan-ex1" onclick="asyncSearch_go(1, 'AL/receive/receivePlanList', targets);setCurrTab(2);" class="nav-link" data-bs-toggle="tab">입고예정</a>
		    </li>
		    <li class="nav-item">
		      <a href="#tabs-compl-ex1" onclick="asyncSearch_go(1, 'AL/receive/receiveComplList', targets2);setCurrTab(3);" class="nav-link" data-bs-toggle="tab">입고완료</a>
		    </li>
		  </ul>
		  <div class="card-body">
		    <div class="tab-content">
		      <div class="tab-pane active show" id="tabs-req-ex1">
				<%@ include file="receiveReqList.jsp" %>
		      </div>
		      
		      <div class="tab-pane" id="tabs-plan-ex1">
		        <div class="card-header">
						<div class="row" id="search-plan-div">
							
						</div>
					</div>
					<!-- /card-head -->
					<div class="card-body">
						<div class="table-responsive" style="max-height:500px;height:500px;">
							<table class="table card-table table-vcenter text-nowrap datatable">
								<thead>
									<tr>
									<c:if test="${mode eq 'WH' }">
										<th class="w-1"><input type="checkbox" id="planAllCheck" onclick="checkAll('checkPlan', this);"></th>
									</c:if>
										<th class="text-center">NO.</th>
										<th class="text-center">번호</th>
									<c:if test="${mode eq 'WH' }">
										<th class="text-left" style="text-align:left">기업명</th>
									</c:if>
									<c:if test="${mode eq 'CO' }">
										<th class="text-left" style="text-align: left">물류센터</th>
									</c:if>
										<th class="text-left" style="text-align: left">품목명</th>
										<th class="text-right" style="text-align: right;">수량</th>
										<th class="text-center">납기일</th>
										<th class="text-center">요청일</th>
										<th class="text-center">상태</th>
										<c:if test="${mode eq 'WH' }">
											<th class="text-center">담당자</th>
										</c:if>
									</tr>
								</thead>
								<tbody id="receive-plan-tbody">
									
								</tbody>
							</table>
						</div>
						<!-- /table-responsive -->
					</div>
					<!-- /card-body -->
					<div class="card-footer" style="background:white;">
						<div class="row">
							<div class="col-6" id="plan-pag" style="text-align: left;">
								
							</div>
							<div class="col-6" style="text-align: right;">
								<c:if test="${mode eq 'WH' }">
									<input type="button" class="btn btn-light" onclick="openSetManager();" value="담당자 배정">
								</c:if>
							</div>
						</div>
					</div>
		      </div>
		      <!-- /tabs-plan -->
		      <div class="tab-pane" id="tabs-compl-ex1">
		        <%@ include file="receivedList.jsp" %>
		      </div>
		      <!-- /tabs-compl -->
		    </div>
		  </div>
		</div>
		
	</div>
	
<c:if test="${mode eq 'WH' }">
	<div id="dialog1" class="dialogDiv" title="담당자 배정">
		<%@ include file="receiveSetManager.jsp" %>
	</div>
	<div id="dialog3" class="dialogDiv" title="직원 검색">
		<%@ include file="searchEmployee.jsp" %>
	</div>
</c:if>
	<div id="dialog2" class="dialogDiv" title="품목 목록">
		<%@ include file="receiveItemList.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/common/asyPagination.jsp" %>
	
	<script type="text/x-handlebars-template"  id="item-list-template">
	{{#each .}}
		<tr>
			<td class="text-center">{{oi_no}}</td>
			<td class="text-left">{{item_name}}</td>
			<td class="text-left">{{std_name}}</td>
			<td class="text-right" style="text-align:right;">{{qty}}</td>
			<td class="text-right" style="text-align:right;">{{in_qty}}</td>
			<td class="text-center">{{gr_name}}</td>
			<td class="text-center">{{gb_name}}</td>
		</tr>
	{{/each}}
	</script>
	
	<script type="text/x-handlebars-template"  id="search-plan-template">
		<div class="col-12">
			<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
			<c:if test="${mode eq 'WH' }">
				기업명&nbsp;&nbsp; <input type="text" name="co_name" style="width:145px; height:25px;" value="{{search.cl_name}}" class="form-control">&nbsp;&nbsp;
			</c:if>
			<c:if test="${mode eq 'CO' }">
				물류센터명&nbsp;&nbsp; <input type="text" name="co_name" style="width:145px; height:25px;" value="{{search.cl_name}}" class="form-control">&nbsp;&nbsp;
			</c:if>
				품목명&nbsp;&nbsp; <input type="text" name="item_name" style="width:145px; height:25px;" value="{{search.item_name}}" class="form-control">
				<button type="button"onclick="search_plan_go();" class="btn btn-light" style="width:50px;height:25px;margin-left : 20px;line-height:0%;">검색</button>
			</div>
		</div> 
		<div class="col-12">
			<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
				납기일&nbsp;&nbsp; <input type="date" name="s_deli_ymd" style="width:145px; height:25px;" value="{{parseDate search.s_deli_ymd}}" class="form-control">&nbsp;&nbsp; ~
				&nbsp;&nbsp;<input  style="width:145px; height:25px;" name="d_deli_ymd" value="{{parseDate search.d_deli_ymd}}" class="form-control" type="date">&nbsp;&nbsp;
				요청일&nbsp;&nbsp; <input style="width:145px; height:25px;" name="s_req_ymd" value="{{parseDate search.s_req_ymd}}" class="form-control" type="date">&nbsp;&nbsp; ~ 
				&nbsp;&nbsp;<input style="width:145px; height:25px;" name="d_req_ymd" value="{{parseDate search.d_req_ymd}}" class="form-control" type="date">&nbsp;&nbsp;
				정렬기준&nbsp;&nbsp;
				<select name="orderBy" onchange="search_plan_go()" class="form-control" style="width:150px;padding-top:0; padding-bottom:0; height:25px;" >
					<option {{selected search.orderBy "sts_code"}} value="sts_code">상태</option>
					<option {{selected search.orderBy "deli_ymd"}} value="deli_ymd">납기일자[오름차순]</option>
					<option {{selected search.orderBy "deli_ymd DESC"}} value="deli_ymd DESC">납기일자[내림차순]</option>
					<option {{selected search.orderBy "req_ymd"}} value="req_ymd">요청일자[오름차순]</option>
					<option {{selected search.orderBy "req_ymd DESC"}} value="req_ymd DESC">요청일자[내림차순]</option>
				</select>
			</div>
		</div> 
	</script>
	<script type="text/x-handlebars-template"  id="receive-plan-template">
	{{#each dataList}}
		<tr class="clickableTr">
		<c:if test="${mode eq 'WH' }">
			<td class="text-center"><input name="checkPlan" onclick="if($('#planAllCheck').prop('checked')){$('#planAllCheck').prop('checked',false);}"  type="checkbox"></td>
		</c:if>
			<td class="text-center">{{plus @index}}</td>
		<c:if test="${mode eq 'WH' }">
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="ord_no_td">{{ord_no}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="co_name_td">{{co_name}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="item_name_td">{{makeItemName item_name cnt}}</td>
			<td class="text-right" style="text-align:right" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="qty_td">{{qty}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="deli_ymd_td">{{parseDate deli_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="req_ymd_td">{{parseDate req_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="sts_code">{{parseSts sts_code}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="wh_mngr_td" data-emp_id="{{wh_mngr}}">{{emp_name}}</td>
		</c:if>
		<c:if test="${mode eq 'CO' }">
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{wh_name}}')" name="ord_no_td">{{ord_no}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{wh_name}}')">{{wh_name}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{wh_name}}')" name="item_name_td">{{makeItemName item_name cnt}}</td>
			<td class="text-right" style="text-align:right" onclick="clickTr('{{ord_no}}','{{wh_name}}')" name="qty_td">{{qty}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{wh_name}}')" name="deli_ymd_td">{{parseDate deli_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{wh_name}}')" name="req_ymd_td">{{parseDate req_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="sts_code">{{parseSts sts_code}}</td>
		</c:if>
		</tr>
	{{/each}}
	</script>
	
	<script type="text/x-handlebars-template"  id="search-compl-template">
		<div class="col-12">
			<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
				<c:if test="${mode eq 'WH' }">
				기업명&nbsp;&nbsp; <input type="text" name="co_name" style="width:145px; height:25px;" value="{{search.cl_name}}" class="form-control">&nbsp;&nbsp;
			</c:if>
			<c:if test="${mode eq 'CO' }">
				물류센터명&nbsp;&nbsp; <input type="text" name="co_name" style="width:145px; height:25px;" value="{{search.cl_name}}" class="form-control">&nbsp;&nbsp;
			</c:if>
				품목명&nbsp;&nbsp; <input type="text" name="item_name" style="width:145px; height:25px;" value="{{search.item_name}}" class="form-control">&nbsp;&nbsp;
				입고일&nbsp;&nbsp; <input type="date" style="width:145px; height:25px;" value={{parseDate search.s_in_ymd}} class="form-control">&nbsp;&nbsp; ~
							  &nbsp;&nbsp;<input  style="width:145px; height:25px;" value={{parseDate search.d_in_ymd}} class="form-control" type="date">&nbsp;&nbsp;
				<input type="button" value="검색" onclick="search_compl_go();" class="btn btn-light" style="width:50px;height:25px;margin-left : 20px;line-height:0%;">
			</div>
		</div> 
		<div class="col-12">
			<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
				납기일&nbsp;&nbsp; <input type="date" name="s_deli_ymd" style="width:145px; height:25px;" value="{{parseDate search.s_deli_ymd}}" class="form-control">&nbsp;&nbsp; ~
				&nbsp;&nbsp;<input  style="width:145px; height:25px;" name="d_deli_ymd" value="{{parseDate search.d_deli_ymd}}" class="form-control" type="date">&nbsp;&nbsp;
				요청일&nbsp;&nbsp; <input style="width:145px; height:25px;" name="s_req_ymd" value="{{parseDate search.s_req_ymd}}" class="form-control" type="date">&nbsp;&nbsp; ~ 
				&nbsp;&nbsp;<input style="width:145px; height:25px;" name="d_req_ymd" value="{{parseDate search.d_req_ymd}}" class="form-control" type="date">&nbsp;&nbsp;
				정렬기준&nbsp;&nbsp;
				<select name="orderBy" onchange="search_compl_go()" class="form-control" style="width:150px;padding-top:0; padding-bottom:0; height:25px;" >
					<option {{selected search.orderBy "in_ymd"}} value="in_ymd">입고일자[오름차순]</option>
					<option {{selected search.orderBy "in_ymd DESC"}} value="in_ymd DESC">입고일자[내림차순]</option>
					<option {{selected search.orderBy "deli_ymd"}} value="deli_ymd">납기일자[오름차순]</option>
					<option {{selected search.orderBy "deli_ymd DESC"}} value="deli_ymd DESC">납기일자[내림차순]</option>
					<option {{selected search.orderBy "req_ymd"}} value="req_ymd">요청일자[오름차순]</option>
					<option {{selected search.orderBy "req_ymd DESC"}} value="req_ymd DESC">요청일자[내림차순]</option>
				</select>
			</div>
		</div> 
	</script>
	<script type="text/x-handlebars-template"  id="receive-compl-template">
	{{#each dataList}}
		<c:if test="${mode eq 'WH' }">
			<tr class="clickableTr" onclick="clickTr('{{ord_no}}','{{co_name}}')">
		</c:if>
		<c:if test="${mode eq 'CO' }">
			<tr class="clickableTr" onclick="clickTr('{{ord_no}}','{{wh_name}}')">
		</c:if>
			<td class="text-center"></td>
			<td class="text-center">{{plus @index}}</td>
			<td class="text-center">{{ord_no}}</td>
		<c:if test="${mode eq 'WH' }">
			<td class="text-left")">{{co_name}}</td>
		</c:if>
		<c:if test="${mode eq 'CO' }">
			<td class="text-left")">{{wh_name}}</td>
		</c:if>
			<td class="text-left">{{makeItemName item_name cnt}}</td>
			<td class="text-right" style="text-align:right">{{qty}}</td>
			<td class="text-right" style="text-align:right">{{in_qty}}</td>
			<td class="text-center">{{parseDate deli_ymd}}</td>
			<td class="text-center">{{parseDate req_ymd}}</td>
		<c:if test="${mode eq 'WH' }">
			<td class="text-center">{{emp_name}}</td>
		</c:if>
			<td class="text-center">{{parseDate in_ymd}}</td>
		</tr>
	{{/each}}
	</script>
	
	<script type="text/x-handlebars-template"  id="search-req-template">
		<div class="col-12">
			<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
			<c:if test="${mode eq 'WH' }">
				기업명&nbsp;&nbsp; <input type="text" name="co_name" style="width:145px; height:25px;" value="{{search.cl_name}}" class="form-control">&nbsp;&nbsp;
			</c:if>
			<c:if test="${mode eq 'CO' }">
				물류센터명&nbsp;&nbsp; <input type="text" name="co_name" style="width:145px; height:25px;" value="{{search.cl_name}}" class="form-control">&nbsp;&nbsp;
			</c:if>
				품목명&nbsp;&nbsp; <input type="text" name="item_name" style="width:145px; height:25px;" value="{{search.item_name}}" class="form-control">
				<input type="button" value="검색" onclick="search_req_go();" class="btn btn-light" style="width:50px;height:25px;margin-left : 20px;line-height:0%;">
			</div>
		</div> 
		<div class="col-12">
			<div class="row" style="margin-left:5px;margin-top:10px;line-height:190%;">
				납기일&nbsp;&nbsp; <input type="date" name="s_deli_ymd" style="width:145px; height:25px;" value="{{parseDate search.s_deli_ymd}}" class="form-control">&nbsp;&nbsp; ~
				&nbsp;&nbsp;<input  style="width:145px; height:25px;" name="d_deli_ymd" value="{{parseDate search.d_deli_ymd}}" class="form-control" type="date">&nbsp;&nbsp;
				요청일&nbsp;&nbsp; <input style="width:145px; height:25px;" name="s_req_ymd" value="{{parseDate search.s_req_ymd}}" class="form-control" type="date">&nbsp;&nbsp; ~ 
				&nbsp;&nbsp;<input style="width:145px; height:25px;" name="d_req_ymd" value="{{parseDate search.d_req_ymd}}" class="form-control" type="date">&nbsp;&nbsp;
				정렬기준&nbsp;&nbsp;
				<select name="orderBy" onchange="search_req_go()" class="form-control" style="width:150px;padding-top:0; padding-bottom:0; height:25px;" >
					<option {{selected search.orderBy "sts_code"}} value="sts_code">상태</option>
					<option {{selected search.orderBy "deli_ymd"}} value="deli_ymd">납기일자[오름차순]</option>
					<option {{selected search.orderBy "deli_ymd DESC"}} value="deli_ymd DESC">납기일자[내림차순]</option>
					<option {{selected search.orderBy "req_ymd"}} value="req_ymd">요청일자[오름차순]</option>
					<option {{selected search.orderBy "req_ymd DESC"}} value="req_ymd DESC">요청일자[내림차순]</option>
				</select>
			</div>
		</div> 
	</script>
	<script type="text/x-handlebars-template"  id="receive-req-template">
	{{#each dataList}}
		<tr class="clickableTr">
		<c:if test="${mode eq 'WH' }">
			<td class="text-center"><input name="checkReq" onclick="if($('#reqAllCheck').prop('checked')){$('#reqAllCheck').prop('checked',false);}"  value="{{ord_no}}" type="checkbox"></td>
		</c:if>
			<td class="text-center">{{plus @index}}</td>
		<c:if test="${mode eq 'WH' }">
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')">{{ord_no}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{co_name}}')">{{co_name}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{co_name}}')">{{makeItemName item_name cnt}}</td>
			<td class="text-right" style="text-align:right" onclick="clickTr('{{ord_no}}','{{co_name}}')">{{qty}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')">{{parseDate deli_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')">{{parseDate req_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="sts_code">{{parseSts sts_code}}</td>
		</c:if>
		<c:if test="${mode eq 'CO' }">
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{wh_name}}')">{{ord_no}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{wh_name}}')">{{wh_name}}</td>
			<td class="text-left" onclick="clickTr('{{ord_no}}','{{wh_name}}')">{{makeItemName item_name cnt}}</td>
			<td class="text-right" style="text-align:right" onclick="clickTr('{{ord_no}}','{{wh_name}}')">{{qty}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{wh_name}}')">{{parseDate deli_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{wh_name}}')">{{parseDate req_ymd}}</td>
			<td class="text-center" onclick="clickTr('{{ord_no}}','{{co_name}}')" name="sts_code">{{parseSts sts_code}}</td>
		</c:if>
		</tr>
	{{/each}}
	</script>
	
	<script>
	Handlebars.registerHelper({
		"parseDate":function(date){
			if(date == "19000101" || date == "99991231"){
				return "";
			}
			var yy = date.slice(0,4);
			var mm = date.slice(4,6);
			var dd = date.slice(6,8);
			
			return yy +"-"+ mm +"-"+ dd;
		},
		"selected" : function(target , value){
			var str = "";
			if(target == value){
				str = "selected";
			}
			return str;
		},
		"makeItemName" : function(item_name, cnt){
			var str = item_name
			if(cnt > 1){
				str += " 외 "+ (cnt-1) +"건";
			}
			return str;
		},
		"plus" : function(i){
			return i+1;
		},
		"parseSts" : function(stsCode){
			var str = "";
			if(stsCode == 'PR001'){
				str = '승인대기';
			} else if (stsCode == 'PR002'){
				str = '입고예정';
			} else if (stsCode == 'PT002'){
				str = '보안요청';
			} else if (stsCode == 'PR003'){
				str = '입고대기';
			} else if (stsCode == 'PR004'){
				str = '입고완료';
			}
			return str;
		}
	});
	</script>
	
	
	<script>
		var currTab = 1;
		var targets = {
				pagination : '#plan-pag',
				table_div : '#receive-plan-tbody',
				table_template : '#receive-plan-template',
				search_div : '#search-plan-div',
				search_template : '#search-plan-template'
		};
		asyncSearch_go(1, "AL/receive/receivePlanList", targets);
		
		var targets2 = {
				pagination : '#compl-pag',
				table_div : '#receive-compl-tbody',
				table_template : '#receive-compl-template',
				search_div : '#search-compl-div',
				search_template : '#search-compl-template'
		};
		asyncSearch_go(1, "AL/receive/receiveComplList", targets2);
		
		var targets3 = {
				pagination : '#req-pag',
				table_div : '#receive-req-tbody',
				table_template : '#receive-req-template',
				search_div : '#search-req-div',
				search_template : '#search-req-template'
		};
		asyncSearch_go(1, "AL/receive/receiveReqList", targets3);
		
		function setCurrTab(tab){
			currTab = tab;
		}
		
		$('body').keydown(function(key){
			if(key.keyCode == 13){
				if(currTab == 1) search_req_go();
				if(currTab == 2) search_plan_go();
				if(currTab == 3) search_compl_go();
			}
		});
		
		function search_plan_go(){
			var tdiv = $('#search-plan-div');
			
			var cl_name = $(tdiv).find('input[name="co_name"]').val();
			var item_name = $(tdiv).find('input[name="item_name"]').val();
			var s_deli_ymd = $(tdiv).find('input[name="s_deli_ymd"]').val();
			var d_deli_ymd = $(tdiv).find('input[name="d_deli_ymd"]').val();
			var s_req_ymd = $(tdiv).find('input[name="s_req_ymd"]').val();
			var d_req_ymd = $(tdiv).find('input[name="d_req_ymd"]').val();
			var orderBy = $(tdiv).find('select[name="orderBy"]').val();
			
			var data = {
				cl_name : cl_name,
				item_name : item_name,
				s_deli_ymd : s_deli_ymd,
				d_deli_ymd : d_deli_ymd,
				s_req_ymd : s_req_ymd,
				d_req_ymd : d_req_ymd,
				orderBy : orderBy
			};
			asyncSearch_go(1, "AL/receive/receivePlanList", targets, data);
		}
		
		function search_compl_go(){
			var tdiv = $('#search-compl-div');
			
			var cl_name = $(tdiv).find('input[name="co_name"]').val();
			var item_name = $(tdiv).find('input[name="item_name"]').val();
			var s_deli_ymd = $(tdiv).find('input[name="s_deli_ymd"]').val();
			var d_deli_ymd = $(tdiv).find('input[name="d_deli_ymd"]').val();
			var s_req_ymd = $(tdiv).find('input[name="s_req_ymd"]').val();
			var d_req_ymd = $(tdiv).find('input[name="d_req_ymd"]').val();
			var s_in_ymd = $(tdiv).find('input[name="s_in_ymd"]').val();
			var d_in_ymd = $(tdiv).find('input[name="d_in_ymd"]').val();
			var orderBy = $(tdiv).find('select[name="orderBy"]').val();
			
			var data = {
				cl_name : cl_name,
				item_name : item_name,
				s_deli_ymd : s_deli_ymd,
				d_deli_ymd : d_deli_ymd,
				s_req_ymd : s_req_ymd,
				d_req_ymd : d_req_ymd,
				s_in_ymd : s_in_ymd,
				d_in_ymd : d_in_ymd,
				orderBy : orderBy
			};
			asyncSearch_go(1, "AL/receive/receiveComplList", targets2, data);
		}
		
		function search_req_go(){
			var tdiv = $('#search-req-div');
			
			var cl_name = $(tdiv).find('input[name="co_name"]').val();
			var item_name = $(tdiv).find('input[name="item_name"]').val();
			var s_deli_ymd = $(tdiv).find('input[name="s_deli_ymd"]').val();
			var d_deli_ymd = $(tdiv).find('input[name="d_deli_ymd"]').val();
			var s_req_ymd = $(tdiv).find('input[name="s_req_ymd"]').val();
			var d_req_ymd = $(tdiv).find('input[name="d_req_ymd"]').val();
			var orderBy = $(tdiv).find('select[name="orderBy"]').val();
			
			var data = {
				cl_name : cl_name,
				item_name : item_name,
				s_deli_ymd : s_deli_ymd,
				d_deli_ymd : d_deli_ymd,
				s_req_ymd : s_req_ymd,
				d_req_ymd : d_req_ymd,
				orderBy : orderBy
			};
			asyncSearch_go(1, "AL/receive/receiveReqList", targets3, data);
		}
		
		function clickTr(ord_no, co_name){
			$('#spanForOrd').html(ord_no);
			$('#spanForCo').html(co_name);
			
			getItemList(ord_no);
		}
		
		function getItemList(ord_no){
			$.ajax({
				url : "<%=request.getContextPath()%>/AL/receive/getOrderItemList",
				type : 'get',
				data : {ord_no : ord_no},
				success : function(res){
					printData(res, $("#itemListBody"), $('#item-list-template'));
					openDial($('#dialog2'),950,600);
				},
				error : function(){
					alert("서버 내부 오류 입니다.\n잠시 후 다시 시도 해주세요.")
				}
			});
		}
		
		var printData = function(Arr,target,templateObject){
			var template = Handlebars.compile(templateObject.html());
			var html = template(Arr);
			$(target).html(html);
		}
		
		function checkAll(name, target){
			var checks = $("input[name='"+name+"']");
			var bool = $(target).prop("checked");
			checks.prop("checked",bool);
		}
		
		function decision(decision){
			var checks = $('input[name="checkReq"]');
			var str = "";
			var cnt = 0;
			for(var i=0; i < checks.length; i++){
				if(checks[i].checked){
					if(cnt > 0){
						str += ",";
					}
					str += checks[i].value;
					cnt ++;
				}
			}
			if(cnt < 1){
				alert("선택된 대상이 없습니다.");
				return;
			}
			
			$.ajax({
				url : "<%=request.getContextPath()%>/WH/receive/decision",
				type :"post",
				data : {ord_nos : str, decision : decision},
				success : function(res){
					if(decision == 'PR002'){
						alert("요청 승인 완료");
					} else {
						alert("요청 거부 완료");
					}
					asyncSearch_go(1, "AL/receive/receiveReqList", targets3);
				},
				error : function(e){
					alert("서버 내부 오류 입니다.\n잠시 후 다시 시도 해주세요.")
				}
			});
		}
		
		function openSetManager(){
			var checks = $('input[name="checkPlan"]');
			var arr = [];
			var cnt = 0;
			for(var check of checks){
				if(check.checked){
					cnt++;
					var tr = $(check).parents("tr");
					var data = {
						ord_no : $(tr).find("td[name='ord_no_td']").text(),
						co_name : $(tr).find("td[name='co_name_td']").text(),
						item_name : $(tr).find("td[name='item_name_td']").text(),
						qty : $(tr).find("td[name='qty_td']").text(),
						deli_ymd : $(tr).find("td[name='deli_ymd_td']").text(),
						req_ymd : $(tr).find("td[name='req_ymd_td']").text(),
						emp_name : $(tr).find("td[name='wh_mngr_td']").text(),
						wh_mngr : $(tr).find("td[name='wh_mngr_td']").attr("data-emp_id")
							
					}
					if($(tr).find("td[name='sts_code']").text() == '입고대기'){
						alert("입고대기 중인 항목은 담당자를 변경할 수 없습니다.");
						return;
					}
					arr.push(data);
				}
				
			}
			if(cnt <1){
				alert("선택된 대상이 없습니다.")
				return;
			}
			printData(arr, $("#managerBody"), $('#order-manager-template'));
			openDial($('#dialog1'),1050,700);
		}
		
		var empTarget = {
				pagination : '#employeePage',
				table_div : '#employeeBody',
				table_template : '#employee-list-template',
				search_div : '#employeeSearch',
				search_template : '#employee-search-template'
		};
		function openEmployeeList(){
 			asyncSearch_go(1, "WH/receive/getEmployeeList", empTarget);
			openDial($('#dialog3'), 600, 700,true, function(){
				$('#employeePage').find("input[name='keyword']").val("");
				$('#employeePage').find("input[name='emp_job']").val("");
			});
		}
		function search_employee_go(){
			var tdiv = $('#employeeSearch');
			
			var keyword = $(tdiv).find('input[name="keyword"]').val();
			var emp_job = $(tdiv).find('select[name="emp_job"]').val();
			
			var data = {
					keyword : keyword,
					emp_job : emp_job
			};
			asyncSearch_go(1, "WH/receive/getEmployeeList", empTarget, data);
		}
		function selectManager_go(emp_name, emp_id){
			var divs = $("#inputMngr");
			divs.val(emp_name);
			divs.attr("data-emp_id", emp_id);
			setMngr();
			closeDial($("#dialog3"));
		}
		function setMngr(){
			var val1 = $('#inputMngr').val();
			var divs = $('#managerBody');
			var emp_id = $('#inputMngr').attr("data-emp_id");
			divs.find('.mngr_div').text(val1);
			divs.find('.mngr_div').attr("data-emp_id", emp_id);
		}
		function modifyMngr(){
			var emp_id = $("#inputMngr").attr("data-emp_id");
			var divs = $('#managerBody .orderMngrTr');
			var arr = [];
			for(var div of divs){
				var data = {
						ord_no : $(div).find('.ord_no').text(),
						wh_mngr : $(div).find('.mngr_div').attr("data-emp_id")
				};
				if(data.wh_mngr == ""){
					alert("담당자가 배정되지 않은 항목이 있습니다.");
					return;
				}
				arr.push(data);
			}
			var dataj = JSON.stringify(arr);
			$.ajax({
				url : "<%=request.getContextPath()%>/WH/receive/modifyManager",
				type : "post",
				data : dataj,
				contentType : "application/json;charset=utf-8",
				success : function(){
					alert("담당자 배정 완료");
					closeDial($("#dialog1"));
					asyncSearch_go(1, "AL/receive/receivePlanList", targets);
				},
				error : function(){
					alert("서버 내부 오류 입니다.\n잠시 후 다시 시도 해주세요.");
				}
			});
		}
	</script>
	<script type="text/x-handlebars-template"  id="order-manager-template">
	{{#each .}}
		<tr class="orderMngrTr">
			<td class="text-center ord_no">{{ord_no}}</td>
			<td class="text-center">{{co_name}}</td>
			<td class="text-center">{{item_name}}</td>
			<td class="text-center">{{qty}}</td>
			<td class="text-center">{{deli_ymd}}</td>
			<td class="text-center">{{req_ymd}}</td>
			<td class="text-center mngr_div" data-emp_id={{wh_mngr}}>{{emp_name}}</td>
		</tr>
	{{/each}}
	</script>
	
	<script type="text/x-handlebars-template"  id="employee-list-template">
	{{#each dataList}}
		<tr class="clickableTr" onclick="selectManager_go('{{emp_name}}', '{{emp_id}}')">
			<td class="text-center">{{emp_id}}</td>
			<td class="text-center">{{emp_name}}</td>
			<td class="text-center">{{emp_job}}</td>
		</tr>
	{{/each}}
	</script>
	
	<script type="text/x-handlebars-template"  id="employee-search-template">
	<div class="col-4">
		<div class="input-icon">
              <input type="text" value="{{search.keyword}}" name="keyword" class="form-control" placeholder="직원명 또는 ID">
	             <span class="input-icon-addon">
					           <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24"
					             stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
					             <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
					            <circle cx="10" cy="10" r="7"></circle>
					             <line x1="21" y1="21" x2="15" y2="15"></line>
					           </svg>
					         </span>
					       </div>
		</div>
		<div class="col-6" style="padding-left:20px;">
			담당업무 
			<select style="display:inline-block; width:100px;" name="emp_job" class="form-select">
				<option value="" {{selected search.emp_job "default"}}>담당업무</option>
				<option value="입고" {{selected search.emp_job "입고"}}>입고</option>
				<option value="출하" {{selected search.emp_job "출하"}}>출고</option>
				<option value="피킹" {{selected search.emp_job "피킹"}}>피킹</option>
			</select>
		</div>
		<input type="button" onclick="search_employee_go();" value="검색" class="btn btn-light">
	</script>
	
	
	<%@ include file="/WEB-INF/views/common/popupDial_js.jsp" %>
	
	
	
	
	