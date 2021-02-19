<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-xl">
  <div class="row row-deck row-cards mw" style="min-width:1400px;">
    <div class="card">
      <div class="card-body border-bottom py-3 const-body">
        <div class="row">
          <div class="card card-inl c-l">
          	<table class="ma" style="float:left;">
          		<tr>
          			<th class="th-text">
						<input class="form-control b-0 bb newRackip2" value="구역" readonly>
          			</th>
          			<td style="width: 280px;">
          				<div class="input-group">
					  	    <select class="form-select dongFloor-select">
					  	      <c:forEach items="${dataMap.dongFloorList }" var="dong" varStatus="status">
					  	        <option data-width="${dong.df_width }" data-height="${dong.df_lngth }" data-area="${df_area }">
					  		      ${dong.dong_name}&nbsp;${dong.floor_name}
					  		    </option>
					  	      </c:forEach>
					  	    </select>
					  	    <span class="input-group-text" id="wxh"></span>
				  	    </div>
          			</td>
          		</tr>
          	</table>
          	
          	<table class="ma" id="selectedItemInfoTable" style="float:left; margin-left:3%;">
          		<tr>
          			<th class="th-text" style="border-left : 1px solid black;">
						선택한<br>품목 정보
          			</th>
          			<td name="inv_no" style="width:12%; text-align:center;border-left : 1px solid black;">
          			</td>
          			<td name="co_name" style="width:20%;text-align:center;border-left : 1px solid black;" >
          			</td>
          			<td name="item_name" style="width:34%;text-align:center;border-left : 1px solid black;" >
          			</td>
          			<td name="inv_qty"style="width:10%;text-align: center;border-left : 1px solid black;">
          			</td>
          			<td name="tempInvLoc"style="width:15%;text-align: center;border-left : 1px solid black;border-right : 1px soli black;">
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
			<div class="page-title">
				
			</div>
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
<script type="text/x-handlebars-template" id="count-template">
{{#each countInRack}}
	<tr class="clickableTr" onclick="moveInvLoc(this);">
		<td style="text-align:center;" >{{plus @index}}열</td>
		<td style="text-align:right;" >{{this}}</td>
	</tr>
{{/each}}
</script>

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
	<a href="#tabs-{{count}}" class="nav-link tabtoggle" id="tabtoggle-{{count}}" data-bs-toggle="tab" onclick="getItemList(this);">
		{{count}}
	</a>
</li>
</script>
<script type="text/x-handlebars-template" id="floorItem-template">
<div class="tab-pane" id="tabs-{{count}}">
	<div class="table-responsive">
	<table class="table table-vcenter card-table t-c">
		<thead>
			<tr>
				<th style="text-align:left;">재고번호</th>
				<th class="w-30p" style="text-align:left;">품목명/규격</th>
				<th class="w-12p">재고위치</th>
				<th class="w-8p">단</th>
				<th class="w-8p">열</th>
				<th>출고가능수량</th>
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
	<tr id="inv-{{INV_NO}}" data-no="{{INV_NO}}" data-qty="{{CANPIK}}" style="{{emphasize INV_NO}}">
		<td style="text-align:left;">{{INV_NO}}{{temporary STS_CODE}}</td>
		<td style="text-align:left;">{{ITEM}}</td>
		<td>{{RACK_NO}}</td>
		<td>{{FLOOR}}</td>
		<td>{{BLOCK}}</td>
		<td>{{CANPIK}}</td>
	</tr>
{{/each}}
</script>
<script>
var mitterToPixel;

clickedQty="";
clickedPikNo="";
InvNoForEmphasize = "";
invNoArr = [];
function invRackMarkColor(inv_no){
	
	var zoneDivs = $('div.target');
	for(var item of zoneDivs){
		if (item.getAttribute("data-cmcode")=='WT001') item.style.background="#F9F325"; //실온
	    if (item.getAttribute("data-cmcode")=='WT002') item.style.background="#1E6F9C"; //저온
	    if (item.getAttribute("data-cmcode")=='WT003') item.style.background="#22DB3F"; //냉장
	    if (item.getAttribute("data-cmcode")=='WT004') item.style.background="#5C9FD3"; //냉동
	    if (item.getAttribute("data-cmcode")=='WT005') item.style.background="#E32821"; //위험물)
	}
	
	$('.rack').css("background","white");
	
	$.ajax({
		url : "<%=request.getContextPath()%>/WH/picking/getMarkByCode",
		type : "get",
		data : {inv_no : inv_no},
		success : function(data){
			var arr = data.invList;
			var invLoc = data.inv_loc
			
			var zones = $('div.target');
			
			for(var i =0; i < zones.length; i++){
				for(var j =0; j< arr.length; j++){
					var isSame = false;
					if(zones[i].getAttribute('data-no') == arr[j].WZ_NO){
						isSame = true;
						break;
					}
				}
				if(!isSame){
					zones[i].style.background = "white";
				}
			}
			invNoArr = [];
			for(var i =0; i < arr.length; i++){
				$('div[data-no="'+arr[i].INV_LOC+'"]').css("background", "orange");
				invNoArr.push(arr[i].INV_NO);
			}
			$('div[data-no="'+invLoc+'"]').css("background", "red");
			
		},
		error : function(){
			
		},
		complete : function(){
			openDial($('#dialog4'),1600,900,false);
		}
	})
	
}
function invRackMarkColor2(inv_no){
	
	$.ajax({
		url : "<%=request.getContextPath()%>/WH/picking/getMarkByCode",
		type : "get",
		data : {inv_no : inv_no},
		success : function(data){
			var arr = data.invList;
			var invLoc = data.inv_loc
			
			var zones = $('div.target');
			
			for(var i =0; i < zones.length; i++){
				for(var j =0; j< arr.length; j++){
					var isSame = false;
					if(zones[i].getAttribute('data-no') == arr[j].WZ_NO){
						isSame = true;
						if (zones[i].getAttribute("data-cmcode")=='WT001') zones[i].style.background="#F9F325"; //실온
					    if (zones[i].getAttribute("data-cmcode")=='WT002') zones[i].style.background="#1E6F9C"; //저온
					    if (zones[i].getAttribute("data-cmcode")=='WT003') zones[i].style.background="#22DB3F"; //냉장
					    if (zones[i].getAttribute("data-cmcode")=='WT004') zones[i].style.background="#5C9FD3"; //냉동
					    if (zones[i].getAttribute("data-cmcode")=='WT005') zones[i].style.background="#E32821"; //위험물
						break;
					}
				}
				if(!isSame){
					zones[i].style.background = "white";
				} 
			}
			invNoArr = [];
			for(var i =0; i < arr.length; i++){
				$('div[data-no="'+arr[i].INV_LOC+'"]').css("background", "orange");
				invNoArr.push(arr[i].INV_NO);
			}
			$('div[data-no="'+invLoc+'"]').css("background", "red");
			
		},
		error : function(){
			
		}
	})
	
}


$(document).ready(function(){
	//설계도 초기 크기 설정
	
	$(document).on("click", '.pikTr' , function(){
		var pikNo = clickedPikNo;
		var qty = clickedQty;
		var pikQty = this.getAttribute("data-qty")
		var invNo = this.getAttribute("data-no");
		if(pikQty < qty){
			alert("출고 가능 수량을 초과합니다.");
			return;
		} else {
			var pick = {
				pik_no : pikNo,
				pik_qty : qty,
				inv_no : invNo
			};
			$.ajax({
				url : "<%=request.getContextPath()%>/WH/picking/modifyPikInv",
				type : 'post',
				data : pick,
				success : function(){
					var rls_no = $('#spanForOrd').text();
					getPage("<%=request.getContextPath()%>/WH/picking/pickingItemList?rls_no="+rls_no);
				},
				error : function(){
					
				},
				
			});
			
			alert("피킹재고 변경 완료");
			closeDial($('#openRackInfo'));
			closeDial($('#dialog4'));
		}
	});
	
    $('.drawing').css({'width':'1540px','height':'725px'});
	constructSetting();
	//해상도
	resolution();
	//저장된 구역 설정
	var dongFloor=$('.dongFloor-select option:selected').html().trim().split("&nbsp;");
	var dong=dongFloor[0];
	var floor=dongFloor[1];
	goUpdateZone("zoneList",{"dong_name":dong,"floor_name":floor});
	
	//구역 변경 시 설계도 크기 설정
	$('.dongFloor-select').on('change',function(){
		dongFloor=$('.dongFloor-select option:selected').html().trim().split("&nbsp;");
		dong=dongFloor[0];
		floor=dongFloor[1];
		
		$('.drawing').html("");

		constructSetting();
		resolution();
		goUpdateZone("zoneList",{"dong_name":dong,"floor_name":floor});
// 		invRackMarkColor(InvNoForEmphasize);
	});
	
	//설계도가 늘어나 가로 스크롤이 생겼을 때 휠 이벤트로 이동되게 하는 이벤트
	$('.const').on('mousewheel',function(e){
		var wheelDelta = e.originalEvent.wheelDelta;

		if(wheelDelta > 0){
			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
		}else{
			$(this).scrollLeft(-wheelDelta + $(this).scrollLeft());
		}
	});
	
	var top;
	var left;
	var timer;
	$(document).on('mousemove', function(e){
		top = e.clientY;
		left = e.clientX;
	})
	
	//구역 이벤트
	$('.drawing').on('mouseenter', '.target', function(e){
		var zoneNo = $(this).attr('data-no');
		timer = setTimeout(function(zoneNo){
// 			openDial($('#openZoneInfo'), 550, 300);
			$('#openZoneInfo').css({
				'display':'block',
				'top':top+19+'px',
				'left':left+'px'
			});
		}, 1000);
	});
	$('.drawing').on('mouseleave', '.target', function(){
		clearTimeout(timer);
		$('#openZoneInfo').css('display', 'none');
	});
	$('.drawing').on('mouseenter', '.rack', function(){
		clearTimeout(timer);
		$('#openZoneInfo').css('display', 'none');
	})
	$('.drawing').on('click', '.rack', function(){
		var rack = $(this).attr('data-no');
		$("#openRackInfo .page-title").text(rack);
		
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
});
function getItemList(target){
	var no = $(target).text().trim();
	var rackNo = $('#openRackInfo .page-title').text().trim();
	var str = rackNo + "-" + no;
	
	$.ajax({
		url : '<%=request.getContextPath()%>/WH/construct/itemInRackInfo2',
		type : 'post',
		data : {invLoc : str},
		success : function(res){
			var template = Handlebars.compile($('#item-template').html());
			var html = template(res);
			$('#item-tb-'+no).html(html);
			
		},
		complete : function(){
			for(invNo of invNoArr){
				if(invNo != InvNoForEmphasize){
					$('#inv-'+ invNo).css("background","rgba(255, 198, 99,0.5)");
					$('#inv-'+ invNo).attr("class", "clickableTr pikTr");
				}
			}
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
				invRackMarkColor2(InvNoForEmphasize);
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
//     if (item.cm_code=='WT001') color="#F9F325"; //실온
//     if (item.cm_code=='WT002') color="#1E6F9C"; //저온
//     if (item.cm_code=='WT003') color="#22DB3F"; //냉장
//     if (item.cm_code=='WT004') color="#5C9FD3"; //냉동
//     if (item.cm_code=='WT005') color="#E32821"; //위험물
    
    var fontSize = (item.wz_width*pixel) / 3;
    var mFontSize = (item.wz_width*pixel) / 15;
    var mFontSize2 = (item.wz_lngth*pixel) / 15;
    
	$("<div/>", {
	  "class":"target ui-widget-content text-center",
	  "id":item.wz_loc,
	  "data-no":item.wz_no,
	  "data-cmCode":item.cm_code,
	  "style":"background:"+color+";width:"+item.wz_width*pixel+"px;height:"+item.wz_lngth*pixel+"px;position:absolute;top:"+item.wz_ypoint+"px;left:"+item.wz_xpoint+"px;padding-top:3px;line-height:"+(item.wz_lngth*pixel-14)+"px;",
	  "html":"<span style='font-size:"+fontSize+"px;font-weight:bolder;opacity:0.4;position:sticky;z-index:101;'>"+item.wz_loc+"</span><span class='m1' style='font-size:"+mFontSize+"px;'>"+item.wz_width+"m</span><span class='m2' style='font-size:"+mFontSize2+"px;'>"+item.wz_lngth+"m</span>"
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
	    "style":"cursor:pointer;background:white;border:1px solid black;width:"+item.wz_width+"px;height:"+item.wz_lngth+"px;position:absolute;top:"+item.wz_ypoint+"px;left:"+item.wz_xpoint+"px;"
    }).appendTo(target);
}

</script>
