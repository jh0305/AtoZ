<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.inputrow{	
	width : 70px;
	text-align : center;
	font-size : 0.9em;
}
.inputdate{
	width: 115px;
    font-size: 0.9em;
}
.editbtns{
	padding-left : 80%;
}
</style>

<div style="padding : 0px 10px;">
	<div class="page-header d-print-none" style="margin-left: 10px;">
		<div class="row align-items-center">
			<div class="col" style="padding: 0px;">
				<h2 class="page-title">실사 현황</h2>
			</div>
		</div>
	</div>
	<div class="row row-deck row-cards">
		<div class="card" style="width: 99%;margin: auto;">
			<div class="card-body border-bottom" style="padding: 10px 10px 10px 10px;">
				<div class="d-flex">
					<%-- <div class ="text-muted">
						<select class="form-select custom-select-form" id="orderType">
							<option value="" ${searchMap.get('orderType') eq '' ? 'selected' : '' }>정렬조건</option>
							<option value="item_no" ${searchMap.get('orderType') eq '' ? 'selected' : 'item_no' }>품목번호</option>
							<option value="cl_name" ${searchMap.get('orderType') eq '' ? 'selected' : 'cl_name' }>기업명</option>
						</select>
					</div> --%>
					<div class="text-muted">
						<div class="d-inline-block">
							<select class="form-select custom-select-form" id="searchType">
								<option value="" ${pageMaker.searchMap.get('searchType') eq '' ? 'selected' : '' } >검색조건</option>
								<option value="item_no" ${pageMaker.searchMap.get('searchType') eq 'item_no' ? 'selected' : '' } >품목번호</option>
								<option value="item_name" ${pageMaker.searchMap.get('searchType') eq 'item_name' ? 'selected' : '' } >품목명</option>
								<option value="bfr_loc" ${pageMaker.searchMap.get('searchType') eq 'bfr_loc' ? 'selected' : '' }>실사위치</option>
								<option value="cl_name" ${pageMaker.searchMap.get('searchType') eq 'cl_name' ? 'selected' : '' }>기업명</option>
								<option value="inv_no" ${pageMaker.searchMap.get('searchType') eq 'inv_no' ? 'selected' : '' }>재고번호</option>
							</select>
						</div>
					</div>
					<div class="text-muted">
						<div class="ms-2 d-inline-block">
							<input type="text" class="form-control form-control-md custom-search-form" id="keyword">
						</div>
						<button class="btn btn-white btn-icon" aria-label="Button"
							style="display: inline; position: relative; top: -2px; height: 33px;"
							onclick="search_go('${pageMaker.searchMap.url}')">
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
			</div>
			<div class="table-responsive" style="min-height: 655px;">
				<table class="table card-table table-vcenter text-nowrap datatable">
					<thead>
						<tr>
							<th class="w-1" style="display:none;">실사번호</th>
							<th>No.</th>
							<th>실사일자</th>							
							<th>재고번호</th>							
							<th>품목번호</th>
							<th>품목명</th>
							<th>규격</th>								
							<th>재고수량</th>								
							<th>실사수량</th>								
							<th>변동수량</th>								
							<th>실사위치</th>			
							<th>변동상태</th>			
							<th>담당자</th>							
							<th>기업명</th>							
							<th>재고반영</th>	
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty stockList }">
							<tr>
								<td></td>
								<td></td>
								<td>자료가 없습니다..</td>
							</tr>
						</c:if>
						<c:forEach var="stock" items="${stockList }">
						<tr class="check_tr" id="${stock.rownum} ${stock.co_code }">
							<td style="display:none;">${stock.chk_no }</td>
							<td><span class="text-muted">${stock.rownum }</span></td>
							<td>${stock.chk_ymd }</td>
							<td>${stock.inv_no }</td>
							<td>${stock.item_no }</td>
							<c:choose>
							<c:when test="${fn:length(stock.item_name) >= 10}">
							<td>${fn:substring(stock.item_name,0,9)}...</td>
							</c:when>
							<c:when test="${fn:length(stock.item_name) < 10}">
							<td>${stock.item_name}</td>
							</c:when>
							</c:choose>
							<td>${stock.std_name}</td>
							<td>${stock.cur_qty}</td>
							<td>${stock.chk_qty}</td>
							<td>${stock.chng_qty}</td>
							<td>${stock.bfr_loc}</td>
							<td>${stock.rsn_code}</td>
							<td>${stock.reg_name}</td>												
							<td>${stock.cl_name}</td>												
							<td>${stock.upd_yn}</td>									 			
						</tr>		
						</c:forEach>										
					</tbody>
				</table>
			</div>
			<div class="card-footer" style="padding: 14px 0px 0px 0px;">
				<div class="d-flex">
				<!-- <button type="button" class="btn btn-light">인쇄</button>
				<button type="button" class="btn btn-light">EXCEL</button> -->
				<%@ include file="/WEB-INF/views/common/pagination.jsp" %>
				<button type="button" class="btn" style="position:relative;left:85%;height:fit-content;line-height:1;" onclick="javascript:check_go()">재고조정</button>
				</div>				 
			</div>
		</div>
	</div>
</div>

<script>	
function check_go(){
	var paramArr = new Array(); // 넘길 데이터
		//var checkArr = $('input[type=checkbox]');
		var flag = false;
		var trArr = $('.check_tr');
		
		for(var i=0; i<trArr.length; i++){
			var trs = trArr[i];
			var chk_no = $(trs).find('td:first-child').text();
			var isYN = $(trs).find('td:last-child').text();
	 		var chk_ymd = $(trs).find('td:nth-child(3)').text();
	 		var today = new Date();
	 		var month = parseInt(today.getMonth()) + 1;	 		
	 		if(month < 10){
	 			month = "0" + month;
	 		}
	 		var date = today.getDate();	 		
	 		if(date < 10){
	 			date = "0" + date;
	 		}
	 		var today_ = today.getFullYear() + "-" + month + "-" + date;
	 		
	 		if(isYN=='N'){
					flag = true;
					if(today_ == chk_ymd){
			 			alert("실사 당일에는 재고 조정이 불가합니다.");
			 			return false;
			 		}
	 			var rsn_code = $(trs).find('td:nth-child(12)').text();
	 			var item_no = $(trs).find('td:nth-child(5)').text();
	 			var item_name = $(trs).find('td:nth-child(6)').text();
	 			var std_name = $(trs).find('td:nth-child(7)').text();
	 			var cur_qty = $(trs).find('td:nth-child(8)').text();
	 			var chk_qty = $(trs).find('td:nth-child(9)').text();
	 			var co_code =  $(trs).attr("id");
				paramMap = {};
				paramMap["chk_no"] = chk_no;
				paramMap["rsn_code"] = rsn_code; 
				paramMap["co_code"] = co_code; 
				paramMap["chk_ymd"] = chk_ymd; 
				paramMap["item_no"] = item_no; 
				paramMap["item_name"] = item_name; 
				paramMap["std_name"] = std_name; 
				paramMap["cur_qty"] = cur_qty; 
				paramMap["chk_qty"] = chk_qty; 
					paramArr.push(paramMap); 					
			}
				if(!flag){
					alert("재고 조정할 실사 항목이 없습니다.");
					return false;
				}
			}  		
			
			$.ajax({
				url : "${pageContext.request.contextPath}/stock/check_to_stock",
				method : "post",
				data : JSON.stringify(paramArr),
				contentType: 'application/json',
				success : function(data){
					alert("재고에 반영되었습니다."); //팝업으로 만들기.
					location.reload(true);
				} 			
			}); 
		
	}
 	function search_go(){
 		
 		var data = {
 				searchType : $("#searchType").val(),
 				keyword : $("#keyword").val()			
 		}
 		searchList_go(1,'${searchMap.url}',data);
 	}
 	
 	
 </script>   
