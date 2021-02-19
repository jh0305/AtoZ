<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
tr:hover {
	background-color: #f6f4fa;
}

.clickabletr {
	cursor: pointer;
}

tr {
	text-align: center;
}

.pagination{
	margin: 10px 0px;
}
</style>
<c:set var="searchMap" value="${pageMaker.searchMap }" />
<div style="padding: 0px 15px;">
	<div class="page-header d-print-none">
		<div class="row align-items-center">
			<div class="col">
				<h2 class="page-title">이용신청 목록</h2>
			</div>
		</div>
	</div>
	
	<div class="col-12">
		<div class="card" style="height: 865px; margin: 0px;">
			<div class="card-header">
				<div class="col-12">
					<div class="row">
						<div class="col-2">
							<select class="form-select" id="searchType">
								<option value="" ${searchMap.get('searchType') eq '' ? 'selected' : '' }>검색 구분</option>
								<option value="id" ${searchMap.get('searchType') eq 'id' ? 'selected' : '' }>회원 아이디</option>
								<option value="cl_ceo" ${searchMap.get('searchType') eq 'cl_ceo' ? 'selected' : '' }>대표자명</option>
								<option value="cl_name" ${searchMap.get('searchType') eq 'cl_name' ? 'selected' : '' }>기업명</option>
								<option value="cl_regno" ${searchMap.get('searchType') eq 'cl_regno' ? 'selected' : '' }>사업자등록번호</option>
							</select>
						</div>
						<div class="col-2">
							<input type="text" class="form-control" id="keyword" value="${searchMap.get('keyword') }" placeholder="검색">
						</div>
						<div class="col-3">
							<button class="btn btn-white btn-icon" aria-label="Button" style="display: inline;" onclick="search_go()">
								<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round"
									stroke-linejoin="round">
							<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
							<circle cx="10" cy="10" r="7"></circle>
							<line x1="21" y1="21" x2="15" y2="15"></line>
						</svg>
							</button>
						</div>
					</div>
				</div>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table card-table table-vcenter text-nowrap datatable">
						<thead>
							<tr>
								<th class="text-center">회원 아이디</th>
								<th class="text-center">대표자명</th>
								<th class="text-center">기업명</th>
								<th class="text-center">사업자등록번호</th>
								<th class="text-center">활성 여부</th>
								<th class="text-center">승인 여부</th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty useList}">
									<tr>
										<td colspan="5">이용신청을 한 회원이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="client" items="${useList }" varStatus="status">
										<c:choose>
											<c:when test="${client.cl_type eq 'ROLE_SY' }"></c:when>
											<c:otherwise>
												<tr class="clickabletr"
													onclick=<c:choose>
																						<c:when test="${client.cl_type eq 'ROLE_CO'}">"getCompanyDetail('${client.cl_code }')"</c:when>
																						<c:when test="${client.cl_type eq 'ROLE_WH'}">"getWarehouseDetail('${client.cl_code }')"</c:when>
																						<c:when test="${client.cl_type eq 'ROLE_WHCO' }">"getComWareDetail('${client.cl_code }')"</c:when>
																					</c:choose>>
													<td>${client.id }</td>
													<td>${client.cl_ceo }</td>
													<td>${client.cl_name }</td>
													<td>${client.cl_regno }</td>
													<td><c:choose>
															<c:when test="${client.act_yn eq 1}">
																	활성
																</c:when>
															<c:otherwise>
																	비활성
																</c:otherwise>
														</c:choose></td>
													<td><c:choose>
															<c:when test="${client.sts_code eq 'CR001'}">
																	요청
																</c:when>
														</c:choose></td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
			<div class="card-footer" style="background-color: white; text-align: left;">
				<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
		</div>
	</div>
</div>

<div id="dialog1" class="dialogDiv" title="기업회원 상세보기">
	<%@ include file="companyDetail.jsp"%>
</div>
<div id="dialog2" class="dialogDiv" title="물류센터회원 상세보기">
	<%@ include file="warehouseDetail.jsp"%>
</div>
<div id="dialog3" class="dialogDiv" title="기업/물류센터회원 상세보기">
	<%@ include file="comwareDetail.jsp"%>
</div>

<%@ include file="/WEB-INF/views/common/popupDial_js.jsp"%>
<script>
function search_go(){
	var data = {
			searchType : $("#searchType").val(),
			keyword : $("#keyword").val()
	}
	searchList_go(1,'${searchMap.url}',data);
}
function getCompanyDetail(cl_code) {
	$.ajax({
		url : '<%=request.getContextPath()%>/SY/serviceUse/companyDetail?cl_code='+cl_code,
		type:'get',
		success:function(res){
			$('#c_code').val(res.cl_code);
			$('#c_id').html(res.cl_id);
			$('#c_name').html(res.cl_name);
			$('#c_ceo').html(res.cl_ceo);
			$('#c_regno').html(res.cl_regno);
			$('#c_email').html(res.cl_email);
			$('#c_tel').html(res.cl_tel);
			$('#c_addr').html(res.co_addr.split(",")[1] + " " + res.co_addr.split(",")[2])
			openDial($('#dialog1'),600,900,true,closeComDetail());
			
			$('#commapspace').append('<div id="commap" style="width:95%;;height:200px; border:1px solid black; margin:auto;"></div>');
			
			var mapContainer = document.getElementById('commap'); // 지도를 표시할 div 
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(res.co_addr.split(",")[1], function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					var mapOption = {
					    center: coords, // 지도의 중심좌표
					    level: 5 // 지도의 확대 레벨
					};  
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
  			        map.relayout();
		   		} 
			});    
		}
	});
}
function getWarehouseDetail(cl_code) {
	$.ajax({
		url : '<%=request.getContextPath()%>/SY/serviceUse/companyDetail?cl_code='+cl_code,
		type:'get',
		success:function(res){
			$('#w_code').val(res.cl_code);
			$('#w_id').html(res.id);
			$('#w_name').html(res.cl_name);
			$('#w_ceo').html(res.cl_ceo);
			$('#w_regno').html(res.cl_regno);
			$('#w_email').html(res.cl_email);
			$('#w_tel').html(res.cl_tel);
			$('#w_area').html(res.df_area+"m²");
			$('#w_addr').html(res.wh_addr.split(",")[1] + " " + res.wh_addr.split(",")[2])
			openDial($('#dialog2'),600,900,true,function(){
				closeWareDetail();
			});
			$('#waremapspace').append('<div id="waremap" style="width:95%;height:200px; border:1px solid black; margin:auto;"></div>');
			var mapContainer = document.getElementById('waremap'); // 지도를 표시할 div 
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(res.wh_addr.split(",")[1], function(result, status) {

			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				    var mapOption = {
				        center: coords, // 지도의 중심좌표
				        level: 5 // 지도의 확대 레벨
				    };  
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        map.relayout();
		   		} 
			}); 
		}
	});
}
var coaddr;
var wareaddr;
function getComWareDetail(cl_code) {
	$.ajax({
		url : '<%=request.getContextPath()%>/SY/serviceUse/companyDetail?cl_code='+cl_code,
		type:'get',
		success:function(res){
			$('#cw_code').val(res.cl_code);
// 			$('#cw_code1').val(res.cl_code);
			$('#cw_id').html(res.id);
			$('#cw_id1').html(res.id);
			$('#cw_name').html(res.cl_name);
			$('#cw_name1').html(res.cl_name);
			$('#cw_ceo').html(res.cl_ceo);
			$('#cw_ceo1').html(res.cl_ceo);
			$('#cw_regno').html(res.cl_regno);
			$('#cw_regno1').html(res.cl_regno);
			$('#cw_email').html(res.cl_email);
			$('#cw_email1').html(res.cl_email);
			$('#cw_tel').html(res.cl_tel);
			$('#cw_tel1').html(res.cl_tel);
			$('#cw_area').html(res.df_area+"m²");
			$('#cw_addr').html(res.co_addr.split(",")[1] + " " + res.co_addr.split(",")[2])
			coaddr = res.co_addr.split(",")[1];
			$('#cw_addr1').html(res.wh_addr.split(",")[1] + " " + res.wh_addr.split(",")[2])
			wareaddr = res.wh_addr.split(",")[1];
			openDial($('#dialog3'),600,900,true,function(){
				closeCOWHDetail();	
			});
			$('#commapspace1').append('<div id="commap1" style="width:95%;;height:200px; border:1px solid black; margin:auto;"></div>');
			var mapContainer = document.getElementById('commap1'); // 지도를 표시할 div 
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(res.co_addr.split(",")[1], function(result, status) {
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				    var mapOption = {
				        center: coords, // 지도의 중심좌표
				        level: 5 // 지도의 확대 레벨
				    };  
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
			        setTimeout(function(){ map.relayout(); map.setCenter(coords)}, 1000);
		   		} 
			}); 
			
		}
	});
}
</script>