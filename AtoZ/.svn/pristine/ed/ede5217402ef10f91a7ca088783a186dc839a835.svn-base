<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-xl">
  <div class="row row-deck row-cards mw">
    <div class="card">
      <div class="card-body border-bottom py-3 const-body">
        <div class="row">
          <div class="card card-inl c-l">
          	<table class="ma" style="float:left;">
          		<tr>
          			<th class="th-text">
						<input class="form-control b-0 bb newRackip2" value="구역" readOnly>
          			</th>
          			<td style="width: 280px;">
          				<div class="input-group">
					  	    <select class="form-select dongFloor-select">
					  	      <c:forEach items="${dataMap.dongFloorList }" var="dong" varStatus="status">
					  	        <option data-width="${dong.df_width }" data-height="${dong.df_lngth }" data-area="${df_area }">
					  		      ${dong.dong_name} ${dong.floor_name}
					  		    </option>
					  	      </c:forEach>
					  	    </select>
					  	    <span class="input-group-text" id="wxh"></span>
				  	    </div>
          			</td>
          		</tr>
          	</table>
          </div>
		</div>
	    <div class="row" style="overflow:auto; max-height:730px;box-shadow: rgba(35,46,60,.04) 0 2px 4px 0;border: 1px solid rgba(101,109,119,.16);">
	      <div class="const">
	        <div class="drawing">
	           
	        </div>
	      </div>
	    </div>
	  </div>
    </div>
  </div><!-- /row -->
</div><!-- /container-xl -->

<div id="openRackInfo" class="dialogDiv" title="랙 정보">
	<div class="page-header d-print-center">
		<div class="row align-items-center">
			<input type="hidden" class="page-title">
			<div class="card-body">
				<div class="row">
					<div class="table-responsive">
					    <table class="table table-vcenter card-table t-c">
					    	<thead>
					        	<tr>
						        	<th class="w-8p">랙 이름</th>
						        	<th class="w-14p">사용기업</th>
						        	<th class="w-8p">단 수</th>
						        	<th class="w-8p">열 수</th>
							        <th class="w-12p">한칸 가로길이(m)</th>
							        <th class="w-12p">한칸 세로길이(m)</th>
							        <th class="w-12p">랙 면적(㎡)</th>
							        <th>취급품목유형</th>
							        <th>취급품목그룹</th>
					        	</tr>
					      	</thead>
					     	<tbody id="rack-info-tb">
					     		
					      	</tbody>
					    </table>
					</div>
				</div>
				<div class="row">
					<div class="card">
	                	<ul class="nav nav-tabs nav-tabs-alt" id="navTab" data-bs-toggle="tabs">
	                	
	                	</ul>
	                	<div class="card-body">
							<div class="tab-content" id="tabCont">
								
							</div>
						</div>
	             	</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/x-handlebars-template" id="rackInfo-template">
<tr>
	<td>{{WZ_LOC}}</td>
	<td>{{CL_NAME}}</td>
	<td>{{RK_FLR}}</td>
	<td>{{BLK_COL}}</td>
	<td>{{BLK_LNGTH}}</td>
	<td>{{BLK_WIDTH}}</td>
	<td>{{WZ_AREA}}</td>
	<td>{{CM_NAME}}</td>
	<td>{{TRG_NAME}}</td>
</tr>
</script>
<script type="text/x-handlebars-template" id="floorInfo-template">
<li class="nav-item">
	<a href="#tabs-{{count}}" class="nav-link tabtoggle" id="tabtoggle-{{count}}" data-name="{{count}}" data-bs-toggle="tab" onclick="getItemList(this);">
		{{count}}단
	</a>
</li>
</script>
<script type="text/x-handlebars-template" id="floorItem-template">
<div class="tab-pane" id="tabs-{{count}}">
	<div class="table-responsive">
	<table class="table table-vcenter card-table tdw">
		<thead>
			<tr>
				<th style="text-align:right;">재고번호</th>
				<th class="w-30p" style="text-align:left;">품목명/규격</th>
				<th style="text-align:right;">랙 번호</th>
				<th style="text-align:right;">단</th>
				<th style="text-align:right;">열</th>
				<th style="text-align:right;">재고수량</th>
			</tr>
		</thead>
		<tbody id="item-tb-{{count}}">

		</tbody>
	</table>
</div>
</div>
</script>
<script type="text/x-handlebars-template" id="item-template">
{{#each .}}
	<tr style="{{INV_NO}}">
		<td style="text-align:right;">{{INV_NO}}</td>
		<td style="text-align:left;">{{ITEM}}</td>
		<td style="text-align:right;">{{RACK_NO}}</td>
		<td style="text-align:right;">{{FLOOR}}</td>
		<td style="text-align:right;">{{BLOCK}}</td>
		<td style="text-align:right;">{{INV_QTY}}</td>
	</tr>
{{/each}}
</script>
<script>
var mitterToPixel;

$(document).ready(function(){
	//설계도 초기 크기 설정
    $('.drawing').css({'width':'1540px','height':'725px'});
	constructSetting();
	//해상도
	resolution();
	//저장된 구역 설정
	var dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
	var dong=dongFloor[0];
	var floor=dongFloor[1];
	goUpdateZone("zoneList",{"dong_name":dong,"floor_name":floor});
	
	//구역 변경 시 설계도 크기 설정
	$('.dongFloor-select').on('change',function(){
		dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
		dong=dongFloor[0];
		floor=dongFloor[1];
		
		$('.drawing').html("");

		constructSetting();
		resolution();
		goUpdateZone("zoneList",{"dong_name":dong,"floor_name":floor});
	});
	
	$('.drawing').on('click', '.rack', function(){
		var rack = $(this).attr('data-no');
		$("#openRackInfo .page-title").val(rack);
		
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/construct/itemInRackInfo",
			type : "post",
			data : {wzNo:rack},
			success : function(result){
				var rack = result.rack;
				var count = result.floor;
				
				$('#navTab').html('');
				$('#tabCont').html('');
				
				var template = Handlebars.compile($('#rackInfo-template').html());
				var html = template(rack);
				$('#rack-info-tb').html(html);
				
				for(var i=1; i<count+1; i++){
					var template2 = Handlebars.compile($('#floorInfo-template').html());
					var html2 = template2({count:i});
					$('#navTab').append(html2);
					
					var template3 = Handlebars.compile($('#floorItem-template').html());
					var html3 = template3({count:i});
					$('#tabCont').append(html3);
				}
				
				openDial($('#openRackInfo'), 1200, 700);
				getItemList($('#tabtoggle-1'));
				$('#tabtoggle-1').addClass('active');
				$('#tabs-1').addClass('active');
			}
		});
	});
	$('.drawing').on('mouseenter', '.target', function(){
		$(this).find('span').css('z-index', '99');
		return false;
	})
	$('.drawing').on('mouseleave', '.target', function(){
		$(this).find('span').css('z-index', '102');
		return false;
	})
});
function getItemList(target){
	var no = $(target).attr('data-name').trim();
	var rackNo = $('#openRackInfo .page-title').val().trim();
	var str = rackNo + "-" + no;
	
	$.ajax({
		url : '<%=request.getContextPath()%>/WH/construct/itemInRackInfo2',
		type : 'post',
		data : {invLoc : str},
		success : function(res){
			var template = Handlebars.compile($('#item-template').html());
			var html = template(res);
			$('#item-tb-'+no).html(html);
		}
	});
}
function constructSetting(){
	var w = $('.dongFloor-select option:selected').attr('data-width');
	var h = $('.dongFloor-select option:selected').attr('data-height');
	//설계도 크기 설정
	mitterToPixel = 10;
	
	$('.drawing').css('width', w*mitterToPixel+"px");
	$('.drawing').css('height', h*mitterToPixel+"px");
}
function resolution(){
	var width = $('.dongFloor-select option:selected').attr('data-width');
	var height= $('.dongFloor-select option:selected').attr('data-height');
	
	$('#wxh').html("가로 : "+width+"m 세로 : "+height+"m");
}
function goUpdateZone(url,data){
	$.ajax({
		url : "<%=request.getContextPath()%>/WH/construct/"+url,
		type:'post',
		data:data,
		success:function(result){
			if (result != "" || result != null) {
				$.each(result, function(index, item){
					//랙인지 구분
					if (item.rk_no == -1) { //구역
						createZone(item,mitterToPixel);
					} else { //랙
						createRack(item,mitterToPixel);
					}
				});
			}
		},
		error:function(error){
			alert("서버 내부 오류입니다. 관리자에게 문의하세요.")
		}
	});
}
function createZone(item,pixel){
	var target=".drawing";
	//상위 계층 검사
	if (item.up_loc != null){
		target="#"+item.up_loc;
	}
    var color;
    if (item.cm_code=='WT001') color="#F9F325"; //실온
    if (item.cm_code=='WT002') color="#1E6F9C"; //저온
    if (item.cm_code=='WT003') color="#22DB3F"; //냉장
    if (item.cm_code=='WT004') color="#5C9FD3"; //냉동
    if (item.cm_code=='WT005') color="#E32821"; //위험물
    
    var fontSize = (item.wz_width*pixel) / 3;
    var mFontSize = (item.wz_width*pixel) / 15;
    
    if (item.wz_width > item.wz_lngth) {
    	mFontSize = (item.wz_lngth*pixel) / 15;
	}
    
	$("<div/>", {
	  "class":"target ui-widget-content text-center",
	  "id":item.wz_loc,
	  "data-no":item.wz_no,
	  "data-cmCode":item.cm_code,
	  "style":"background:"+color+";width:"+item.wz_width*pixel+"px;height:"+item.wz_lngth*pixel+"px;position:absolute;top:"+item.wz_ypoint+"px;left:"+item.wz_xpoint+"px;padding-top:3px;line-height:"+(item.wz_lngth*pixel-14)+"px;",
	  "html":"<span style='font-size:"+fontSize+"px;font-weight:bolder;opacity:0.4;position:sticky;z-index:102;'>"+item.wz_loc+"</span>"
	}).appendTo(target);
}
function createRack(item,pixel){
	var target=".drawing";
	//상위 계층 검사
	if (item.up_loc != null){
		target="#"+item.up_loc;
	}
	$("<div/>", {
		"class":"ui-widget-content rack",
		"id":item.wz_loc,
		"data-no":item.wz_no,
	    "data-cmCode":item.cm_code,
	    "style":"cursor:pointer;background:white;border:1px solid black;width:"+item.wz_width+"px;height:"+item.wz_lngth+"px;position:absolute;top:"+item.wz_ypoint+"px;left:"+item.wz_xpoint+"px;z-index:101;"
    }).appendTo(target);
}

</script>
<%@ include file="/WEB-INF/views/common/popupDial_js.jsp"%>