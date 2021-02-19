<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
	hr{
		margin: 1rem 0;
	}
	.col-1{
		margin-top:0.6%;
		width:13%;
	}
	.form-control{
		width:35%;
		margin-right:1%;
	}
	.col-1 strong{
		margin-left:10%;
	}
	.card{
		margin:1% 10%;
	}
</style>
<body>
<div class="container-xl">
<c:if test="${mode eq 'CO' }">
	<div>
		<strong style="font-size:1.2rem; margin-left:10%;">기업상세보기</strong>
	</div>
	<div class="card" style="margin-top:1%;">
		<div class="card-body">
			<div class="row">
				<div class="col-1"><strong>회원 아이디</strong></div>
				<input type="text" class="form-control" id="com_id" value="${loginUser.id }" readonly/>
				<div class="col-1"><strong>기업명</strong></div>
				<input type="text" class="form-control" id="com_name" value="${loginUser.cl_name }" readonly/>
			</div>
			<hr/>
			<div class="row">
				<div class="col-1"><strong>대표자명</strong></div>
				<input type="text" class="form-control" id="com_ceo" value="${loginUser.cl_ceo }" readonly/>
				<div class="col-1"><strong>사업자등록번호</strong></div>
				<input type="text" class="form-control" id="com_regno" value="${loginUser.cl_regno }" readonly/>
			</div>
			<hr/>
			<div class="row">
				<div class="col-1"><strong>이메일</strong></div>
				<input type="text" class="form-control" id="com_email" value="${loginUser.cl_email }" readonly/>
				<div class="col-1"><strong>전화번호</strong></div>
				<input type="text" class="form-control" id="com_tel" value="${loginUser.cl_tel }" readonly/>
			</div>
			<hr/>
			<div id="commapspace" class="row">
				<c:set var="com_addr" value="${fn:split(loginUser.co_addr,',') }"/>
				<div class="col-1" ><strong>주소</strong></div>
				<input type="text" class="form-control" id="co_addr" value="${com_addr[1] },${com_addr[2]}" readonly/>
				<div class="col-1"><strong>우편번호</strong></div>
				<input type="text" class="form-control" value="${com_addr[0] }" readonly/>
				<div style="margin:2% 0%;">
					<div id="commap" style="width:95%;height:300px; border:1px solid black; margin:auto;"></div>
				</div>
			</div>
		</div>
	</div>
	<div style="margin-top:1%; margin-right:10%; text-align:right;">
		<input type="button" class="btn btn-white" id="modifyComBtn" onclick="modifyForm_goCom();" value="수정"/>
	</div>
<script>
var com_addr = $('#co_addr').val().split(',')[0];
var mapContainer = document.getElementById('commap'); // 지도를 표시할 div 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch(com_addr, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		var mapOption = {
		    center: coords, // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
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
</script>
<script>
function modifyForm_goCom() {
	goPage('AL009','/AL/member/memberModifyForm','기업수정');
}
function deleterequest_com() {
	confirm("정말 탈퇴하겠습니까?");
}
</script>
</c:if>
<c:if test="${mode eq 'WH' }">
	<div>
		<strong style="font-size:1.2rem; margin-left:10%;">센터상세보기</strong>
	</div>

<div class="card" style="margin-top:1%;">
	<div class="card-body">
		<div class="row">
			<div class="col-1"><strong>회원 아이디</strong></div>
			<input type="text" class="form-control" id="ware_id" value="${loginUser.id }" readonly/>
			<div class="col-1"><strong>기업명</strong></div>
			<input type="text" class="form-control" id="ware_name" value="${loginUser.cl_name }" readonly/>
		</div>
		<hr/>
		<div class="row">
			<div class="col-1"><strong>대표자명</strong></div>
			<input type="text" class="form-control" id="ware_ceo" value="${loginUser.cl_ceo }" readonly/>
			<div class="col-1"><strong>사업자등록번호</strong></div>
			<input type="text" class="form-control" id="ware_regno" value="${loginUser.cl_regno }" readonly/>
		</div>
		<hr/>
		<div class="row">
			<div class="col-1"><strong>이메일</strong></div>
			<input type="text" class="form-control" id="com_email" value="${loginUser.cl_email }" readonly/>
			<div class="col-1"><strong>전화번호</strong></div>
			<input type="text" class="form-control" id="com_tel" value="${loginUser.cl_tel }" readonly/>
		</div>
		<hr/>
		<div class="row">
			<div id="carousel-controls" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner" id="wh-image-div" style="width:500px;height:333px;margin:auto;">
					<script type="text/x-handlebars-template"  id="wh-image-template" >
					{{#each .}}
						{{#if @first}}
						<div class="carousel-item active">
							<img class="d-block w-100" src="<%=request.getContextPath()%>/WC/member/getPicture?pic_name={{pic_name}}">
						</div>
						{{else}}
						<div class="carousel-item">
							<img class="d-block w-100" src="<%=request.getContextPath()%>/WC/member/getPicture?pic_name={{pic_name}}">
						</div>
						{{/if}}
					{{/each}}
					</script>	
				</div>
				<a class="carousel-control-prev" href="#carousel-controls" role="button" data-bs-slide="prev">
	                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Previous</span>
              	</a>
              	<a class="carousel-control-next" href="#carousel-controls" role="button" data-bs-slide="next">
	                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Next</span>
              	</a>
			</div>
		</div>
		<hr/>
		<div id="waremapspace" class="row">
			<c:set var="ware_addr" value="${fn:split(loginUser.wh_addr,',') }"/>
			<div class="col-1" ><strong>주소</strong></div>
			<input type="text" class="form-control" id="ware_addr" value="${ware_addr[1] },${ware_addr[2]}" readonly/>
			<div class="col-1"><strong>우편번호</strong></div>
			<input type="text" class="form-control" value="${ware_addr[0] }" readonly/>
			<div style="margin:2% 0%;">
				<div id="waremap" style="width:95%;height:300px; border:1px solid black; margin:auto;"></div>
			</div>
		</div>
		<input type="hidden" value="${loginUser.cl_code }" id="clCode">
	</div>
</div>	
<div style="margin-top:1%; margin-right:10%; text-align:right;">
	<input type="button" class="btn btn-white" id="modifyWareBtn" onclick="modifyForm_goWare();" value="수정"/>
</div>
<script>
var ware_addr = $('#ware_addr').val().split(',')[0];
var mapContainer = document.getElementById('waremap'); // 지도를 표시할 div 
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 주소로 좌표를 검색합니다
geocoder.addressSearch(ware_addr, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		var mapOption = {
		    center: coords, // 지도의 중심좌표
		    level: 3 // 지도의 확대 레벨
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
</script>
<script>
function modifyForm_goWare() {
	goPage('AL009','/AL/member/memberModifyForm','센터수정');
}
var printData=function(Arr,target,templateObject){
	var template = Handlebars.compile(templateObject.html());
	var html = template(Arr);
	$(target).html(html);
}
function getWHImage() {
	var wh_code = $('#clCode').val().trim();
	$.ajax({
		url : '<%=request.getContextPath()%>/WC/member/getWHImage',
		type : 'get',
		data : {cl_code : wh_code},
		success : function(res) {
			printData(res,$('#wh-image-div'),$('#wh-image-template'))
			printData(res,$('#imageModify-div'),$('#imageModify-template'))
		}
	});
	
}
getWHImage();
</script>
</c:if>
</div>
