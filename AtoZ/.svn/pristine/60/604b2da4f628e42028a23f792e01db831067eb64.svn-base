<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageMaker" value="${dataMap.pageMaker }"/>
<style>
		.clickableTr{
			cursor: pointer;
		}
		.clickableTr:hover{
			background : rgba(241,244,249);
		}
	</style>
	<div class="col-12" style="padding : 0px 15px;">
		<!-- 콘텐츠 헤더 -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">	
				<div class="col">
					<h2 class="page-title">
						금일 출고 목록
					</h2>
				</div>
			</div>
		</div>
		<!-- /page-header -->
		<div class="card col-12">
			<div class="card-body">
				<div class="table-responsive" style="height:670px;max-height:670px;">
					<table class="table card-table table-vcenter text-nowrap datatable">
						<thead>
							<tr>
								<th class="text-center">No.</th>
								<th class="text-center">번 호</th>
								<th class="text-left" style="text-align: left;">기 업 명</th>
								<th class="text-left" style="text-align: left;">목 적 지</th>
								<th class="text-center">상 태</th>
								<th class="text-center">담 당 자</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${dataMap.relList}" var="rel" varStatus="status">
							<tr class="clickableTr">
								<td class="text-center">${status.index +1}</td>
								<td class="text-center" name="rls_no_td" onclick="openItemList('${rel.rls_no}','${rel.emp_name }');">${rel.rls_no }</td>
								<td class="text-left"  style="text-align: left;"name="co_name_td" onclick="openItemList('${rel.rls_no}','${rel.emp_name }');">${rel.co_name }</td>
								<td class="text-left"  style="text-align: left;"onclick="openItemList('${rel.rls_no}','${rel.emp_name }');">${rel.dst_addr }</td>
								<td class="text-center"  onclick="openItemList('${rel.rls_no}','${rel.emp_name }');">${rel.sts_code }</td>
								<td class="text-center" name="wh_mngr_td" data-emp_id="${rel.wh_mngr }" onclick="openItemList('${rel.rls_no}','${rel.emp_name }');">${rel.emp_name }</td>
							</tr>
						</c:forEach>
						
						</tbody>
					</table>
				</div>
				<!-- /table-responsive -->
			</div>
			<!-- /card-body -->
			<div class="card-footer" style="background-color:white;">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
		  </div>
		</div>
		<!-- /card -->
	</div>
	
	<script type="text/x-handlebars-template"  id="item-list-template">
	{{#each list}}
		<tr class="clickableTr" onclick="openConstPop(this,'{{inv_loc}}','{{pik_no}}');">
			<td class="text-center" name="inv_no">{{inv_no}}</td>
			<td class="text-left" name="co_name">{{co_name}}</td>
			<td class="text-left" name="item_name">{{item_name}}</td>
			<td class="text-left" name="std_name">{{std_name}}</td>
			<td class="text-right" name="pik_qty"  style="text-align:right;">{{pik_qty}}</td>
			<td class="text-center" name="inv_name">{{inv_name}}</td>
			<td class="text-center" name="sts_code">{{sts_code}}</td>
		</tr>
	{{/each}}
	</script>
	<script type="text/x-handlebars-template"  id="mngr-list-template">
	{{#each dataList}}
		<tr class="orderMngrTr">
			<th class="text-center rls_no">{{rls_no}}</th>
			<th class="text-center">{{item_name}}</th>
			<th class="text-center">{{co_name}}</th>
			<th class="text-center">{{pik_qty}}</th>
			<th class="text-center mngr_div" data-emp_id="{{wh_mngr}}">{{emp_name}}</th>
		</tr>
	{{/each}}
	</script>
	
		<div id="dialog1" class="dialogDiv" title="피킹 목록">
			<%@ include file="pickingItemList.jsp" %>	
		</div>
		<div id="dialog2" class="dialogDiv" title="담당자 배정">
			<%@ include file="pickingSetManager.jsp" %>	
		</div>
		<div id="dialog3" class="dialogDiv" title="직원 검색">
			<%@ include file="searchEmployee.jsp" %>
		</div>
		
	<script>
	Handlebars.registerHelper({
		"nullCheck":function(data){
			if(data == null || data == ""){
				return "미정";
			} else {
				return data;
			}
			
		},
		"temporary" : function(sts_code){
			if(sts_code == 'IS002'){
				return "(예정)";
			} else {
				return "";
			}
		},
		"emphasize" : function(inv_no){
			if(inv_no == InvNoForEmphasize){
				return 'background:rgba(255, 128, 128,0.5);';
			} else {
				return "";
			}
		},
		"plus" : function(i){
			return i+1;
		}
	});
	
	function checkAll(name, target){
		var checks = $("input[name='"+name+"']");
		var bool = $(target).prop("checked");
		checks.prop("checked",bool);
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
					rls_no : $(tr).find("td[name='rls_no_td']").text(),
					item_name : $(tr).find("td[name='item_name_td']").text(),
					co_name : $(tr).find("td[name='co_name_td']").text(),
					wh_mngr : $(tr).find("td[name='wh_mngr_td']").attr("data-emp_id"),
					emp_name : $(tr).find("td[name='wh_mngr_td']").text()
				}
				arr.push(data);
			}
			
		}
		if(cnt <1){
			alert("선택된 대상이 없습니다.")
			return;
		}
		printData(arr, $("#managerBody"), $('#mngr-list-template'));
		openDial($('#dialog2'),1100,550);
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
	
	function openItemList(rls_no,emp_name){
		$('#spanForOrd').html(rls_no);
		$('#spanForMngr').html(emp_name);
		
		getPage("<%=request.getContextPath()%>/WH/picking/pickingItemList?rls_no="+rls_no);
		openDial($('#dialog1'),1000,500);
	}
	
	function getPage(pageInfo){	 
		$.getJSON(pageInfo,function(data){
			printData(data,$('#pickingListTbody'),$('#item-list-template'));
			if(data.sts == 'pick'){
				$('#strBtn').css("display","none");
			} else {
				$('#strBtn').css("display","inline-block");
			}
		});
	}
	
	var printData = function(Arr,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(Arr);
		$(target).html(html);
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
		closeDial($("#dialog3"));
	}
	
	function setMngr(){
		var val1 = $('#inputMngr').val();
		var divs = $('#managerBody');
		var emp_id = $('#inputMngr').attr("data-emp_id");
		divs.find('.mngr_div').text(val1);
		divs.find('.mngr_div').attr("data-emp_id",emp_id);
	}
	
	function modifyMngr(){
		var emp_id = $("#inputMngr").attr("data-emp_id");
		var divs = $('#managerBody .orderMngrTr');
		var arr = [];
		for(var div of divs){
			var data = {
					rls_no : $(div).find('.rls_no').text(),
					wh_mngr : $(div).find('.mngr_div').attr("data-emp_id")
			};
			arr.push(data);
		}
		var dataj = JSON.stringify(arr);
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/picking/modifyManager",
			type : "post",
			data : dataj,
			contentType : "application/json;charset=utf-8",
			success : function(){
				alert("담당자 배정 완료");
				goPage("WH041","WH/picking/pickingList", "금일출고예정");
				closeDial($("#dialog2"));
			},
			error : function(){
				alert("서버 내부 오류 입니다.\n잠시 후 다시 시도 해주세요.");
			}
		});
	}
	
	function registPicking(th){
		th.setAttribute("disabled",true);
		
		var rls_no = $('#spanForOrd').text();
		$('#dialog1').css("cursor", "wait");
		$('input').css("cursor", "wait");
		$('td').css("cursor", "wait");
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/picking/registPicking",
			data : {rls_no : rls_no},
			type : "post",
			success : function(){
				getPage("<%=request.getContextPath()%>/WH/picking/pickingItemList?rls_no="+rls_no);
			},
			error : function(e){
				if(e.status == 400){
					alert("이미 배정된 출고예정 입니다.");
					getPage("<%=request.getContextPath()%>/WH/picking/pickingItemList?rls_no="+rls_no);
				}
			},
			complete : function(){
				$('#dialog1').css("cursor","default");
				$('input').css("cursor", "default");
				$('td').css("cursor", "default");
				th.setAttribute("disabled",false);
			}
		});
	}
	
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
	
	
	<div id="dialog4" class="dialogDiv" title="구역 정보">
		<%@ include file="/WEB-INF/views/construct/constructListPop2.jsp" %>
	</div>
	<script>
	function openConstPop(th, inv_loc, pik_no){
		if(document.querySelector('td[name="tempInvLoc"]').innerText == '미정'){
			alert("피킹재고 할당을 해주세요.");
			return;
		} else if(th.querySelector('td[name="sts_code"]').innerText == '피킹완료'){
			alert("이미 피킹완료된 재고입니다.");
			return;
		}
		
		var inv_no = $(th).find('td[name="inv_no"]').text();
		var item_name = $(th).find('td[name="item_name"]').text() + " "+$(th).find('td[name="std_name"]').text();
		var pik_qty = $(th).find('td[name="pik_qty"]').text();
		var tempInvLoc = $(th).find('td[name="inv_name"]').text();
		var co_name = $(th).find('td[name="co_name"]').text();
		
		var table = document.getElementById('selectedItemInfoTable');
		$(table).find('td[name="inv_no"]').html("<strong>재고번호</strong><br>"+inv_no);
		$(table).find('td[name="item_name"]').html("<strong>품목명</strong><br>"+item_name);
		$(table).find('td[name="inv_qty"]').html("<strong>출고수량</strong><br>"+pik_qty);
		$(table).find('td[name="tempInvLoc"]').html("<strong>적재위치</strong><br>"+tempInvLoc);
		$(table).find('td[name="co_name"]').html("<strong>기업명</strong><br>"+co_name);
		
		clickedQty = pik_qty;
		clickedPikNo = pik_no;
		InvNoForEmphasize = inv_no;
		invRackMarkColor(inv_no);
		
	}
	
	</script>
	
	
	