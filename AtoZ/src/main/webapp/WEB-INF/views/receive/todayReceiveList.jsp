<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageMaker" value="${dataMap.pageMaker }"/>
	<style>
		.clickableTr{
			cursor: pointer;
		}
		.clickableTr:hover{
			background : rgb(241,244,249);
		}
	</style>
	<div class="col-12"style="padding : 0px 15px;">
		<!-- 콘텐츠 헤더 -->
		<div class="page-header d-print-none">
			<div class="row align-items-center">	
				<div class="col">
					<h2 class="page-title">
						금일 입고 예정 목록
					</h2>
				</div>
			</div>
		</div>
		<!-- /page-header -->
		<div class="card">
		  <div class="card-body">
		  		<div class="table-responsive" style="max-height:670px;height:670px;">
					<table class="table card-table table-vcenter text-nowrap datatable">
						<thead>
							<tr>
							
								<th class="text-center">NO.</th>
								<th class="text-center">번호</th>
								<th class="text-left" style="text-align: left;">기업명</th>
								<th class="text-left" style="text-align: left;">품목명</th>
								<th class="text-right" style="text-align: right;">수량</th>
								<th class="text-center">상태</th>
								<th class="text-center">담당자</th>
							
							</tr>
						</thead>
						<tbody id="receive-plan-tbody">
						<c:forEach items="${dataMap.receiveList}" var="receive" varStatus="status">
							<tr class="clickableTr" onclick="openStockList('${receive.ord_no}','${receive.co_name}','${receive.co_code }')">
								<td class="text-center">${status.index +1 }</td>	
								<td class="text-center">${receive.ord_no }</td>	
								<td class="text-left" style="text-align: left">${receive.co_name }</td>
							<c:choose>
								<c:when test="${receive.cnt > 1}">
									<td class="text-left" style="text-align: left">${receive.item_name } 외 ${receive.cnt -1}건</td>	
								</c:when>
								<c:otherwise>
									<td class="text-left" style="text-align: left">${receive.item_name }</td>	
								</c:otherwise>
							</c:choose>	
								<td class="text-right" style="text-align: right">${receive.qty }</td>	
								<td class="text-center">${receive.sts_code }</td>
								<td class="text-center">${receive.emp_name }</td>
							</tr>	
						</c:forEach>
						</tbody>
					</table>
				</div>
				<!-- /table-responsive -->
		  </div>
		  <div class="card-footer" style="background-color:white;">
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
		  </div>
		</div>
	</div>
	
	<div id="dialog1" class="dialogDiv" title="금일 입고 예정 목록">
		<%@ include file="TempStockList.jsp" %>
	</div>
	<div id="dialog2" class="dialogDiv" title="구역 정보">
		<%@ include file="/WEB-INF/views/construct/constructListPop.jsp" %>
	</div>
	
	<%@ include file="/WEB-INF/views/common/popupDial_js.jsp" %>
	
	<script type="text/x-handlebars-template"  id="item-list-template">
	{{#each .}}
		<tr class="stockInfoTr clickableTr" onclick="openConstPop(this,'{{inv_loc}}');">
			<td class="text-center" name="inv_no">{{inv_no}}</td>
			<td class="text-left" name="item_name">{{item_name}} {{std_name}}</td>
			<td style="text-align:right;" name="inv_qty">{{inv_qty}}</td>
			<td class="text-center" name="gr_code">{{gr_code}}</td>
			<td class="text-center" name="item_rank">{{nullCheck item_rank}}</td>
			<td class="text-center" name="type_code" data-code="{{cm_code}}">{{type_code}}</td>
			<td class="text-center" name="tempInvLoc">{{nullCheck inv_name}}</td>
		</tr>
	{{/each}}
	</script>
	
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
		
		function openStockList(ord_no, co_name,co_code){
			
			$('#spanForOrd').text(ord_no);
			$('#spanForCo').text(co_name);
			$('#spanForCo').attr("data-code",co_code);
			$('#strBtn').attr("data-ord",ord_no);
			
			$.ajax({
				url : "<%=request.getContextPath()%>/WH/receive/getTempStockList?ord_no=" + ord_no,
				type : 'get',
				success : function(res){
					var template = Handlebars.compile($('#item-list-template').html());
					var html = template(res.list);
					$('#stockListBody').html(html);
					if(res.sts == 'PR003'){
						$('#strBtn').css("display","none");
						$('#pubBtn').css("display","inline-block");
					} else {
						$('#strBtn').css("display","inline-block");
						$('#pubBtn').css("display","none");
					}
					openDial($('#dialog1'),1000,700);
				},
				error : function(e){
					
				}
			});
			
		}
		
		function openConstPop(th, inv_loc){
			if(document.querySelector('td[name="tempInvLoc"]').innerText == '미정'){
				alert("적재위치 배정을 해주세요.");
				return;
			}
			
			var inv_no = $(th).find('td[name="inv_no"]').text();
			var item_name = $(th).find('td[name="item_name"]').text();
			var inv_qty = $(th).find('td[name="inv_qty"]').text();
			var gr_code = "<strong>그룹</strong><br>"+$(th).find('td[name="gr_code"]').text();
			var item_rank = "<strong>등급</strong><br>"+$(th).find('td[name="item_rank"]').text();
			var type_code = $(th).find('td[name="type_code"]').text();
			var tempInvLoc = $(th).find('td[name="tempInvLoc"]').text();
			var co_name = $('#spanForCo').text();
			var co_code = $('#spanForCo').attr("data-code");
			var cm_code = $(th).find('td[name="type_code"]').attr("data-code");
			
			var table = document.getElementById('selectedItemInfoTable');
			$(table).find('td[name="inv_no"]').html("<strong>예정재고번호</strong><br>"+inv_no);
			$(table).find('td[name="item_name"]').html("<strong>품목명</strong><br>"+item_name);
			$(table).find('td[name="inv_qty"]').html("<strong>재고수량</strong><br>"+inv_qty);
			$(table).find('td[name="gr_code"]').html(gr_code);
			$(table).find('td[name="item_rank"]').html(item_rank);
			$(table).find('td[name="type_code"]').html("<strong>취급유형</strong><br>"+type_code);
			$(table).find('td[name="tempInvLoc"]').html("<strong>예정적재위치</strong><br>"+tempInvLoc);
			$(table).find('td[name="co_name"]').html("<strong>기업명</strong><br>"+co_name);
			
			$('#selectLocationForTempStockTable td[name="selectedNameInRackInfo"]').text(item_name);
			$('#selectLocationForTempStockTable td[name="selectedQtyInRackInfo"]').text(inv_qty);
			
			
			InvNoForEmphasize = inv_no;
			InvLocForEmphasize = inv_loc;
			CoCodeForEmphasize = co_code;
			TypeCodeForEmphasize = cm_code;
			invRackMarkColor(inv_loc, co_code, cm_code);
		}
		
		function getStrategy(th){
			th.setAttribute("disabled",true);
			var ord_no = th.getAttribute("data-ord");
			$('#dialog1').css("cursor", "wait");
			$('input').css("cursor", "wait");
			$('td').css("cursor", "wait");
			$.ajax({
				url : "<%=request.getContextPath()%>/WH/strategy/matching",
				data : {ord_no : ord_no},
				type : "post",
				success : function(){
					$.ajax({
						url : "<%=request.getContextPath()%>/WH/receive/getTempStockList?ord_no=" + ord_no,
						type : 'get',
						success : function(res){
							var template = Handlebars.compile($('#item-list-template').html());
							var html = template(res.list);
							$('#stockListBody').html(html);
							if(res.sts == 'PR003'){
								$('#strBtn').css("display","none");
								$('#pubBtn').css("display","inline-block");
							}
						},
						error : function(e){
							
						}
					});
				},
				error : function(e){
					if(e.status == 400){
						alert("이미 배정된 입고예정 입니다.");
						$.ajax({
							url : "<%=request.getContextPath()%>/WH/receive/getTempStockList?ord_no=" + ord_no,
							type : 'get',
							success : function(res){
								var template = Handlebars.compile($('#item-list-template').html());
								var html = template(res.list);
								$('#stockListBody').html(html);
								if(res.sts == 'PR003'){
									$('#strBtn').css("display","none");
									$('#pubBtn').css("display","inline-block");
								}
							},
							error : function(e){
								
							}
						});
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
		
		function publishQr(){
			var trs = $('.stockInfoTr');
			var arr = [];
			for(var i=0; i<trs.length; i++){
				var inv_no = $(trs[i]).find('td[name="inv_no"]').text();
				var inv_qty = $(trs[i]).find('td[name="inv_qty"]').text();
				var inv_item = $(trs[i]).find('td[name="item_name"]').text();
				var data = {
					invNo : "stock:"+inv_no,
					invQty : inv_qty,
					invName : inv_item
				};
				arr.push(data);
			}
			
			qrCodeMake(arr);
			
		}
		
	</script>
	<%@ include file="/WEB-INF/views/qr/qrCodeMake_js.jsp" %>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	