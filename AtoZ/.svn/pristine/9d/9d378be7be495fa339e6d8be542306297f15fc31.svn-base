<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="container-xl">
  <div class="row row-deck row-cards">
    <div class="card">
      <div class="card-body border-bottom py-3 const-body">
        <div class="row">
          <div class="card card-inl c-l" style="height:79px">
          	<table>
          		<tr>
          			<th class="th-text">
						<strong>구역</strong>
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
          			<td>
          				<div class="input-group w-160">
	                      <span class="input-group-text b-0">이름</span>
	                      <input type="text" class="form-control tdw" id="name" name="name" autocomplete="off" placeholder="1~4자 입력" maxlength='4'>
	                    </div>
          			</td>
          			<td>
	          			<div class="input-group w-160">
	                      <span class="input-group-text b-0">가로</span>
	                      <input type="text" class="form-control tdw" id="width" name="width" autocomplete="off">
	                      <span class="input-group-text">m</span>
	                    </div>
	                </td>
          			<td>
	          			<div class="input-group w-160">
	                      <span class="input-group-text b-0">세로</span>
	                      <input type="text" class="form-control tdw" id="height" name="height" autocomplete="off">
	                      <span class="input-group-text">m</span>
	                    </div>
	                </td>
	                <td>
          				<div class="input-group w-200">
	                      <span class="input-group-text b-0">취급품목유형</span>
	                      <select class="form-select" id="handlingType">
		        			<c:forEach items="${dataMap.handlingType }" var="type" varStatus="status">
					          <c:if test="${type.CM_NAME=='실온' }"><c:set value="#F9F325" var="color"/></c:if>
					          <c:if test="${type.CM_NAME=='저온' }"><c:set value="#1E6F9C" var="color"/></c:if>
					          <c:if test="${type.CM_NAME=='냉장' }"><c:set value="#22DB3F" var="color"/></c:if>
					          <c:if test="${type.CM_NAME=='냉동' }"><c:set value="#5C9FD3" var="color"/></c:if>
					          <c:if test="${type.CM_NAME=='위험물' }"><c:set value="#E32821" var="color"/></c:if>
					          <option data-cmCode="${type.CM_CODE }" data-color="${color }">${type.CM_NAME }</option>
					        </c:forEach>
					      </select>
	                    </div>
	                </td>
	                <td style="width: 64px;">
				  	    <a class="btn btn-info new-btn">구역 생성</a>
          			</td>
          		</tr>
          		<tr>
          			<th class="th-text">
						<strong>랙</strong>
          			</th>
          			<td class="th-text" id="rack-setting" style="width: 100px;">
	          			<div class="input-group">
	                    	<span class="input-group-text">랙 종류</span>
	                    	<input type="text" id="chooseRack" class="form-control tdw cp" placeholder="선택된 랙이 없습니다." autocomplete="off" disabled="disabled" style="background: white;">
	                    </div>
          			</td>
          			<td colspan="3">
	                    <div class="input-group">
	                    	<span class="input-group-text strategy-inp">
	                    		랙 적재기준&nbsp;
		                    	<select class="form-select" id="strategy">
		        					<option data-url="WH/construct/strategyList" value="없음" selected>없음</option>
			        				<c:forEach items="${dataMap.strategy }" var="str" varStatus="status">
				        				<c:choose>
						   					<c:when test="${status.first }">
								          		<option data-url="WH/construct/strategyList" data-cmCode="${str.CM_CODE }" value="${str.CM_NAME }"> ${str.CM_NAME }</option>
						   					</c:when>
						   					<c:otherwise>
								          		<option data-url="WH/construct/strategyList" data-cmCode="${str.CM_CODE }" value="${str.CM_NAME }"> ${str.CM_NAME }</option>
						   					</c:otherwise>
						   				</c:choose>
							        </c:forEach>
					          		<option data-url="WH/construct/strategyList" value="품목"> 품목</option>
						      	</select>
	                    	</span>
	                     	<select class="form-select" id="chooseStandard">
	                     	
	                    	</select>
	                    </div>
	                </td>
          			<td>
	      				<a class="btn btn-info rack-btn">랙 생성</a>
	      				<input type="hidden" id="lastRack">
	      				<a class="btn btn-info rack-clean">위치 초기화</a>
	      			</td>
          		</tr>
          	</table>
          </div>
		</div>
	    <div class="row" style="overflow:auto; max-height:725px;box-shadow: rgba(35,46,60,.04) 0 2px 4px 0;border: 1px solid rgba(101,109,119,.16);">
		    <div class="const">
		        <div class="drawing" id="drawing">
		           
		        </div>
		    </div>
	    </div>
	  </div>
    </div>
  </div><!-- /row -->
</div><!-- /container-xl -->
<div class="option card">
  <div class="card-header option-text"></div>
  <div class="card-body border-bottom">
  	<p id="turn" class="option-content">회전</p>
    <p id="remove" class="option-content" onclick="remove();">삭제</p>
  </div>
</div>
<div id="openRack" class="dialogDiv" title="랙 선택">
    <div class="openRack-header">
    	<a>선택된 랙 : <span class="selectedRack"></span></a>
	    <a class="btn btn-default newRack">랙 종류 생성</a>
    </div>
  <div class="table-responsive">
    <table class="table table-vcenter card-table racktbodyscroll">
      <thead>
        <tr class="opentr">
          <th>랙 번호</th>
          <th>층 개수</th>
          <th>열 개수</th>
          <th>칸 가로길이(m)</th>
          <th>칸 세로길이(m)</th>
          <th>칸 높이(m)</th>
          <th></th>
        </tr>
      </thead>
      <tbody id="t-b">
      </tbody>
    </table>
  </div>
</div>
<div id="openRackOption" class="dialogDiv" title="랙 층 설정">
	<div class="table-responsive rackO-tb">
		<table class="table table-vcenter card-table tdw">
		</table>
		<a class="btn btn-default f-r rackFloorOptionSave">저장</a>
	</div>
</div>

<script type="text/x-handlebars-template" id="template-G">
{{#each .}}
	<option data-code="G{{CM_CODE}}">{{CM_NAME}}</option>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="template-R">
<option class="" data-code="R1">1</option>
<option class="" data-code="R2">2</option>
<option class="" data-code="R3">3</option>
</script>
<script type="text/x-handlebars-template"  id="template-P">
{{#each .}}
	<option data-code="P{{ITEM_NO}}">{{ITEM_NAME}} {{STD_NAME}}</option>
{{/each}}
</script>
<script type="text/x-handlebars-template"  id="rack-template" >
  {{#each .}}
    <tr>
	  <td><input class="form-control newRackip2" type="text" name="no" value="{{rk_no}}" readonly></td>
	  <td><input class="form-control newRackip2" type="text" name="floor" value="{{rk_flr}}" readonly></td>
	  <td><input class="form-control newRackip2" type="text" name="col" value="{{blk_col}}" readonly></td>
	  <td><input class="form-control newRackip2" type="text" name="width" value="{{blk_width}}" readonly></td>
	  <td><input class="form-control newRackip2" type="text" name="length" value="{{blk_lngth}}" readonly></td>
	  <td><input class="form-control newRackip2" type="text" name="height" value="{{blk_height}}" readonly></td>
	  <td><a class="rackOption option-content" onclick="rackOption(this);">설정</a></td>
	</tr>
  {{/each}}
</script>
<script type="text/x-handlebars-template"  id="newRack-template" >
    <tr>
	  <td><input class="form-control newRackip" type="text" name="no" readonly></td>
	  <td><input class="form-control newRackip" type="number" name="floor"></td>
	  <td><input class="form-control newRackip" type="number" name="col"></td>
	  <td><input class="form-control newRackip" type="number" name="width"></td>
	  <td><input class="form-control newRackip" type="number" name="length"></td>
	  <td><input class="form-control newRackip" type="number" name="height"></td>
	  <td><a class="createRack option-content">저장</a></td>
	</tr>
</script>
<script type="text/x-handlebars-template" id="RackFOption-template">
<thead>
	<tr>
		<th>층 수</th>
		<th>최소 하중(kg)</th>
		<th>최대 하중(kg)</th>
	</tr>
</thead>
<tbody>
	{{#each .}}
	<tr>
		<td>
			<input type='hidden' name='no' value='{{rs_no}}'>
			<input type='text' class='form-control newRackip2' name='floor' value='{{rs_flr}}' readOnly>
		</td>
		<td><input type='number' class='form-control newRackip' name='min' value='{{min_wgt}}'></td>
		<td><input type='number' class='form-control newRackip' name='max' value='{{max_wgt}}'></td>
	</tr>
	{{/each}}
</tbody>
</script>
<script>
var mitterToPixel;
var widthLength;
var heightLength;
var rackNum=0;
$(document).ready(function(){
	//설계도 초기 크기 설정
	constructSetting();
	//해상도
	resolution();
	//저장된 구역 설정
	var dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
	var dong=dongFloor[0];
	var floor=dongFloor[1];
	goUpdateZone("zoneList",{"dong_name":dong,"floor_name":floor});
	
	//전략기준 리스트
	getStrategy();
	//전략기준 선택 시 리스트 변경
	$('#strategy').on('change',function(){
		if ($('#strategy option:selected').val() == '없음') {
			$('#chooseStandard').html('');
		} else {
			getStrategy();
		}
	});
	//구역 변경 시 설계 해상도 변경
	$('.dongFloor-select').on('change',function(){
		dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
		dong=dongFloor[0];
		floor=dongFloor[1];
		
		$('#drawing').html("");

		constructSetting();
		resolution();
		goUpdateZone("zoneList",{"dong_name":dong,"floor_name":floor});
	});
	openOption();
	//구역명 한글 금지
	$('#name').keyup(function(){
		var name=$(this).val().trim();
		var check=/^[A-Za-z0-9+]{1,5}$/;
		if(!check.test(name)){
			$(this).val("");
		}
		var upperCheck=/[a-z]/;
		if (upperCheck.test(name)) {
			$(this).val($(this).val().toUpperCase());
		}
	});
	//숫자만 가능
	$('body').on('keyup','#width, #height, .newRackip',function(){
		var len=$(this).val().trim();
		var check=/^[0-9]{1,3}$/;
		if(!check.test(len)){
			$(this).val("");
		}
	});
	//구역 등록
	$('.new-btn').on('click',function(){
		
		//설계도의 가로, 세로 길이로 구역범위 가로, 세로 길이 제한
		var printWidth = $('.dongFloor-select option').attr('data-width');
		var printHeight = $('.dongFloor-select option').attr('data-height');
		if (parseInt(printWidth) < parseInt($('#width').val()) || parseInt(printHeight) < parseInt($('#height').val())) {
			alert("해당 동/층 크기보다 가로 또는 세로길이가 클 수 없습니다.\n 다시 입력해주세요.");
			return false;
		}
		
		//필수 설정 값이 비어있는지 확인
		if ($('#name').val().trim()==""){
			alert("구역 이름을 입력하세요.");
			return false;
		}
		if ($('#width').val().trim()=="" || $('#height').val().trim()==""){
			alert("가로 또는 세로길이를 입력하세요.");
			return false;
		}
		
		//설정 값 불러오기
		var nameCheck=false;
		var name=$('#name').val().toUpperCase().trim();
		var handlingType=$('#handlingType option:selected').val();
		var handlingTypeCode=$('#handlingType option:selected').attr('data-cmCode');
		var color=$('#handlingType option:selected').attr('data-color');
		widthLength=(parseFloat($('#width').val())*parseFloat(mitterToPixel));
		heightLength=(parseFloat($('#height').val())*parseFloat(mitterToPixel));

		var length=getZoneLength();
		var top=length[0];
		var left=length[1];
		
		$('#drawing').find('div').each(function(){
			if($(this).attr('id').trim()==name){
				alert("해당 구역명이 존재합니다.");
				nameCheck=true;
			}
		});
		if(nameCheck) return false;
		
		dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
		dong=dongFloor[0];
		floor=dongFloor[1];
		
		var fontSize = widthLength / 3;
	    var mFontSize = heightLength / 15;
	    
	    if (widthLength > heightLength) {
	    	mFontSize = widthLength / 15;
	    	fontSize = heightLength / 3;
		}
		
		data = {
			"wz_loc":name,
			"cm_code":handlingTypeCode,
			"wz_lngth":parseFloat($('#height').val()).toFixed(2),
			"wz_width":parseFloat($('#width').val()).toFixed(2),
			"wz_xpoint":parseFloat(left),
			"wz_ypoint":parseFloat(top),
			"dong_name":dong,
			"floor_name":floor
		};
		goUpdateZone("regist",data);
		$("<div/>", {
	      "class":"target ui-widget-content text-center",
	      "id":name,
	      "data-cmCode":handlingTypeCode,
	      "style":"z-index:101;background:"+color+";width:"+widthLength+"px;height:"+heightLength+"px;position:absolute;top:"+top+"px;left:"+left+"px;cursor:move;display:table-cell;vertical-align:middle;line-height:"+(parseFloat($('#height').val())*mitterToPixel-14)+"px;",
	      "html":"<span style='font-size:"+fontSize+"px;font-weight:bolder;opacity:0.4;position:sticky;z-index:101;'>"+name+"</span>"
	    }).draggable({
	    	containment:$('#drawing'),
	        start:function(event,ui){
	    		$(event.target).css("z-index","101");
	        },
	   		stop:function(event,ui){
	   			$(event.target).css("z-index","100");
	   			var length = getZoneLength($('#'+name));
	   			var top=length[0];
	   			var left=length[1];
		    	data = {
		    		"wz_loc":name,
		    		"wz_xpoint":parseFloat(left),
		    		"wz_ypoint":parseFloat(top),
		    		"dong_name":dong,
					"floor_name":floor
		    	};
		    	goUpdateZone("updateCoordinate",data);
	   		}
	    }).droppable({
	    	accept:'.rack',
	    	drop:function(event,ui){
	    		var top=parseFloat($(ui.draggable).css('top'))-parseFloat($(event.target).css('top'));
				var left=parseFloat($(ui.draggable).css('left'))-parseFloat($(event.target).css('left'));
				var res=$(event.target).find(ui.draggable);
				
				var dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
				var dong=dongFloor[0];
				var floor=dongFloor[1];
				
				data = {
					"wz_loc":$(ui.draggable).attr('id'),
					"up_loc":$(event.target).attr('id'),
					"dong_name":dong,
					"floor_name":floor
				};
				goUpdateZone("updateUpNoFromZone",data);
				
				if(typeof $(res).attr('id') == "undefined"){
					$(ui.draggable).css({'top':top-1+'px','left':left-1+'px'});
				}
				ui.draggable.draggable({containment:event.target}).appendTo(event.target);
	    	}
	    }).appendTo("#drawing");
	});
	//랙 설정 팝업
	$('#rack-setting').on('click',function(){
		openDial($('#openRack'), 700, 600);
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/construct/rackList",
			type:'post',
			success:function(result){
				if (result == "empty") {
					
				} else {
					var template = Handlebars.compile($('#rack-template').html());
					var html = template(result);
					$('#t-b').html(html);
				}
			}
		})
	});
	//랙 종류 생성
	$('.newRack').on('click',function(){
		var template = Handlebars.compile($('#newRack-template').html());
		$('#t-b').append(template);
		$('#t-b').scrollTop( $('#t-b')[0].scrollHeight ); 
	})
	
	//랙 관련 이벤트
	$('#openRack').on('click', '.modifyRack', function(){
		$(this).attr('class', 'goModify option-content').text('설정');
		var parent = $(this).parents('tr');
		$(parent).find('input[name="floor"]').attr({'class':'form-control newRackip', 'readOnly':false});
		$(parent).find('input[name="col"]').attr({'class':'form-control newRackip', 'readOnly':false});
		$(parent).find('input[name="width"]').attr({'class':'form-control newRackip', 'readOnly':false});
		$(parent).find('input[name="length"]').attr({'class':'form-control newRackip', 'readOnly':false});
		$(parent).find('input[name="height"]').attr({'class':'form-control newRackip', 'readOnly':false});
	});
	$('#openRack').on('click', '.goModify', function(){
		if (RackValiChk($(this))) {
			rudRack(this, "/modifyRack");
		}
	});
	$('#openRack').on('click', '.createRack', function(){
		if (RackValiChk($(this))) {
			rudRack(this, "/registRack");
		}
	});
	function RackValiChk(target){
		$(target).siblings('.newRackip').each(function(){
			if ($(this).val() < 0) {
				alert("0이상의 수를 입력해주세요.");
				return false;
			}
		});
		
		return true;
	}
	$('#openRack').on('click', 'tr', function(){
		var no = $(this).find('input[name="no"]').val();
		var floor = $(this).find('input[name="floor"]').val();
		var col = $(this).find('input[name="col"]').val();
		var width = $(this).find('input[name="width"]').val();
		var length = $(this).find('input[name="length"]').val();
		var height = $(this).find('input[name="height"]').val();
		
		$('.selectedRack').text(no + "번 랙");
		$('#chooseRack').val(no + "번 랙").attr({'data-no':no, 'data-floor':floor, 'data-col':col, 'data-width':width, 'data-length':length, 'data-height':height});
	})
	//랙 생성
	$('.rack-btn').on('click', function(){
		if ($('#chooseRack').val().trim() == "") {
			alert("랙 생성을 위해서는 랙을 선택해야 합니다.");
			$('#rack-setting').click();
			return false;
		}
		
		//기존에 있는 랙번호 탐색, 없으면 0
		$('#drawing').find('.rack').each(function(){
			var rackNumber = parseInt($(this).attr('id').split("R")[1]);
			if (rackNum < rackNumber) {
				rackNum = rackNumber;
			}
		});
		
		rackNum++;
		var id = 'R'+rackNum;
		var col = parseInt($('#chooseRack').attr('data-col'));
		var width = parseInt($('#chooseRack').attr('data-width'));
		var height = parseInt($('#chooseRack').attr('data-height'));
		var rackWidth = parseFloat(mitterToPixel) * width;
		var rackHeight = parseFloat(mitterToPixel) * (col * height);
		var rackStd = $('#chooseStandard option:selected').attr('data-code');
		var rackStdNo = $('#chooseRack').attr('data-no');
		
		if ($('#chooseStandard').html().trim() == "") {
			rackStd = 'none';
		}
		
		var length = getZoneLength();
		var top = length[0];
		var left = length[1];
		var parent = "#drawing";
		
		//전에 생성했던 랙 정보
		if ($('#lastRack').val().trim() != "") {
			var prevRackId = $('#lastRack').val();
			var prevTop = $('#' + prevRackId).css('top');
			var prevLeft = $('#' + prevRackId).css('left');
			var prevWidth = $('#' + prevRackId).css('width').split("px")[0];
			var prevHeight = $('#' + prevRackId).css('height').split("px")[0];
			
			top = parseInt(prevTop.split("px")[0]);
			left = parseInt(prevLeft.split("px")[0]) + parseInt(prevWidth) + mitterToPixel;
			rackWidth = prevWidth;
			rackHeight = prevHeight;
			
			var lastRackId = '#' + $('#lastRack').val()
			parent = "#" + $(lastRackId).parent().attr('id');
		}

		var pWid = $(parent).css('width').split('px')[0];
		var rLef = left;
		if (parseInt(pWid) - parseInt(rLef) < width + 3) {
			alert('랙 옆에 생성될 공간이 없습니다.\n기본 위치 설정으로 변경됩니다.');
			$('#lastRack').val('');
			top = length[0];
			left = length[1];
		}
		
		if (parent != "#drawing") {
			data = {
				"wz_loc":id, "wz_lngth":rackHeight, "wz_width":rackWidth,
				"wz_xpoint":left, "wz_ypoint":top, "dong_name":dong,
				"floor_name":floor, "trg_code":rackStd, "rk_no":rackStdNo,
				"up_loc":$('#'+$('#lastRack').val()).parent().attr('id')
			};
		} else {
			data = {
				"wz_loc":id, "wz_lngth":rackHeight, "wz_width":rackWidth,
				"wz_xpoint":left, "wz_ypoint":top, "dong_name":dong,
				"floor_name":floor, "trg_code":rackStd, "rk_no":rackStdNo
			};
		}
		goUpdateZone("regist",data);
		
		$('#lastRack').val(id);
		
		$("<div/>", {
			"class":"ui-widget-content rack",
		    "id":id,
		    "style":"background:white;border:1px solid black;width:"+rackWidth+"px;height:"+rackHeight+"px;position:absolute;z-index:101;top:"+top+"px;left:"+left+"px;cursor:grab;"
	    }).draggable({
	    	containment:$(parent),
	    	start:function(event,ui){
				$(event.target).css("z-index","101").css("opacity","0.5").css("cursor","grabbing");
			},
		    stop:function(event,ui){
				$(event.target).css("z-index","100").css("opacity","1").css("cursor","grab");
				var length = getZoneLength('#'+id);
				var top=length[0];
				var left=length[1];
				data = {
					"wz_loc":id,
					"wz_xpoint":parseFloat(left),
					"wz_ypoint":parseFloat(top),
					"dong_name":dong,
					"floor_name":floor
				};
				goUpdateZone("updateCoordinate",data);
			}
	    }).appendTo(parent);
	})
	$('.rack-clean').on('click', function(){
		$('#lastRack').val('');
	})
	// 랙 관련 이벤트 끝
	
	$('.rackFloorOptionSave').on('click', function(){
		var no = new Array();
		var floor = new Array();
		var min = new Array();
		var max = new Array();
		$(this).parent().find('table').find('input[name="no"]').each(function(){
			no.push($(this).val());
		});
		$(this).parent().find('table').find('input[name="floor"]').each(function(){
			floor.push($(this).val());
		});
		$(this).parent().find('table').find('input[name="min"]').each(function(){
			min.push($(this).val());
		});
		$(this).parent().find('table').find('input[name="max"]').each(function(){
			max.push($(this).val());
		});
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/construct/modifyRackOption",
			data : {no: no, floor : floor, min : min, max : max},
			type : "POST",
			success : function(res){
				alert(res);
			}
		})
	})
	$('#turn').on('click', function(e){
		var target = $(this).parent().siblings('.option-text').text();
		
		var id = '#'+target;
		var wid = $(id).css('width');
		var hei = $(id).css('height');
		
		var dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
		var dong=dongFloor[0];
		var floor=dongFloor[1];
		
		$(id).css('width', hei);
		$(id).css('height', wid);
		
		data = {
			"wz_loc":target,
			"wz_width":hei.split('px')[0],
			"wz_lngth":wid.split('px')[0],
			"dong_name":dong,
			"floor_name":floor
		};
		
		
		goUpdateZone("updateTurnningZone", data);
	});
	$('.drawing').on('mouseenter', '.target', function(){
		$(this).find('span').css('z-index', '99');
		return false;
	});
	$('.drawing').on('mouseleave', '.target', function(){
		$(this).find('span').css('z-index', '102');
		return false;
	});
})
function constructSetting(){
	var w = $('.dongFloor-select option:selected').attr('data-width');
	var h = $('.dongFloor-select option:selected').attr('data-height');
	//설계도 크기 설정
	mitterToPixel = 10;
	
	$('#drawing').css('width', w*mitterToPixel+"px");
	$('#drawing').css('height', h*mitterToPixel+"px");
}
function resolution(){
	var width = $('.dongFloor-select option:selected').attr('data-width');
	var height= $('.dongFloor-select option:selected').attr('data-height');
	
	$('#wxh').html("가로 : "+width+"m 세로 : "+height+"m");
}
function getZoneLength(target){
	var top;
	var left;
	if (typeof target == "undefined") {
		top=1;
		left=3;
	} else {
		var tTop=$(target).css('top')
		var tLeft=$(target).css('left')
		
		top=parseFloat(tTop);
		left=parseFloat(tLeft);
	}
	var length = [top, left];
	
	return length;
}
function rudRack(target, url){
	var btn = $(target);
	var parent = $(target).parents('tr');
	var no = $(parent).find('input[name="no"]').val().trim();
	if (no == "") no = 0;
	var floor = $(parent).find('input[name="floor"]').val().trim();
	var col = $(parent).find('input[name="col"]').val().trim();
	var width = $(parent).find('input[name="width"]').val().trim();
	var length = $(parent).find('input[name="length"]').val().trim();
	var height = $(parent).find('input[name="height"]').val().trim();
	
	$.ajax({
		url : "<%=request.getContextPath()%>/WH/construct" + url,
		type:'post',
		data:{
			rk_no : no,
			rk_flr : floor,
			blk_col : col,
			blk_width : width,
			blk_lngth : length,
			blk_height : height
		},
		success:function(result){
			$(parent).find('input[name="no"]').attr({'class':'form-control newRackip2', 'readOnly':true});
			$(parent).find('input[name="floor"]').attr({'class':'form-control newRackip2', 'readOnly':true});
			$(parent).find('input[name="col"]').attr({'class':'form-control newRackip2', 'readOnly':true});
			$(parent).find('input[name="width"]').attr({'class':'form-control newRackip2', 'readOnly':true});
			$(parent).find('input[name="length"]').attr({'class':'form-control newRackip2', 'readOnly':true});
			$(parent).find('input[name="height"]').attr({'class':'form-control newRackip2', 'readOnly':true});
			
			if (url == "/registRack") {
				$(parent).find('input[name="no"]').val(result);
			}
			$(btn).val('수정');
		}
	})
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
	var target="#drawing";
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
    	fontSize = (item.wz_lngth*pixel) / 3;
	}

	$("<div/>", {
	  "class":"target ui-widget-content text-center",
	  "id":item.wz_loc,
	  "data-no":item.wz_no,
	  "data-cmCode":item.cm_code,
	  "style":"background:"+color+";width:"+item.wz_width*pixel+"px;height:"+item.wz_lngth*pixel+"px;position:absolute;top:"+item.wz_ypoint+"px;left:"+item.wz_xpoint+"px;cursor:grab;padding-top:3px;line-height:"+(item.wz_lngth*pixel-13)+"px;",
	  "html":"<span style='font-size:"+fontSize+"px;font-weight:bolder;opacity:0.4;position:sticky;z-index:101;'>"+item.wz_loc+"</span>"
	}).draggable({
		containment:$(target),
		start:function(event,ui){
    		$(event.target).css("z-index","101").css("opacity","0.5").css("cursor","grabbing");
        },
		stop:function(event,ui){
   			$(event.target).css("z-index","100").css("opacity","1").css("cursor","grab");
			var length = getZoneLength($('#'+item.wz_loc));
			var top=length[0];
			var left=length[1];
			data = {
				"wz_loc":item.wz_loc,
				"wz_xpoint":parseFloat(left),
				"wz_ypoint":parseFloat(top),
				"dong_name":item.dong_name,
				"floor_name":item.floor_name
			};
			goUpdateZone("updateCoordinate",data);
		}
	}).droppable({
		accept:'.rack',
		drop:function(event,ui){
			var top=parseFloat($(ui.draggable).css('top'))-parseFloat($(event.target).css('top'));
			var left=parseFloat($(ui.draggable).css('left'))-parseFloat($(event.target).css('left'));
			var res=$(event.target).find(ui.draggable);
			
			data = {
				"wz_loc":$(ui.draggable).attr('id'),
				"up_loc":$(event.target).attr('id'),
				"dong_name":item.dong_name,
				"floor_name":item.floor_name
			};
			goUpdateZone("updateUpNoFromZone",data);
			
			if(typeof $(res).attr('id') == "undefined"){
				$(ui.draggable).css({'top':top-1+'px','left':left-1+'px'});
			}
			ui.draggable.draggable({containment:event.target}).appendTo(event.target);
		}
	}).appendTo(target);
}
function createRack(item,pixel){
	var target="#drawing";
	//상위 계층 검사
	if (item.up_loc != null){
		target="#"+item.up_loc;
	}
		
	$("<div/>", {
		"class":"ui-widget-content rack",
		"id":item.wz_loc,
		"data-no":item.wz_no,
	    "data-cmCode":item.cm_code,
	    "style":"z-index:100;background:white;border:1px solid black;width:"+item.wz_width+"px;height:"+item.wz_lngth+"px;position:absolute;top:"+item.wz_ypoint+"px;left:"+item.wz_xpoint+"px;cursor:grab;"
    }).draggable({
    	containment:$(target),
		start:function(event,ui){
			$(event.target).css("z-index","101").css("opacity","0.5").css("cursor","grabbing");
		},
	    stop:function(event,ui){
			$(event.target).css("z-index","100").css("opacity","1").css("cursor","grab");
			var length = getZoneLength($('#'+item.wz_loc));
			var top=length[0];
			var left=length[1];
			data = {
				"wz_loc":item.wz_loc,
				"wz_xpoint":parseFloat(left),
				"wz_ypoint":parseFloat(top),
				"dong_name":item.dong_name,
				"floor_name":item.floor_name
			};
			goUpdateZone("updateCoordinate",data);
		}
	}).appendTo(target);
	
}
function getStrategy(){
	var data;
	strategy
	var url = $('#strategy option:selected').attr('data-url').trim();
	var str = $('#strategy option:selected').val().trim();
	
	if (str == '품목그룹기준') {
		data = "G";
	} else if (str == '회전율등급기준') {
		data = "R";
	} else if (str == '품목') {
		data = "P";
	} else {
		data = "N";
	}
	
	if (data == "R") {
		var template = Handlebars.compile($('#template-R').html());
		var html = template();
		$('#chooseStandard').html(html);
	} else {
		$.ajax({
			url : "<%=request.getContextPath()%>/" + url,
			type : 'post',
			data : {data : data},
			success:function(result){
				var template = Handlebars.compile($('#template-'+data).html());
				var html = template(result);
				$('#chooseStandard').html(html);
			}
		})
	}
}

function openOption(){
	$(document).on('contextmenu',function(){
		return false;
	});
	$('body').on('mousedown','.rack, .target',function(event){
		event.stopPropagation();
		if(event.button==2){
			var id = $(this).attr('id');
			$('.option > .card-header').text(id);
			$('#remove').attr('data-no', $(this).attr('data-no'));
			
			if (id.split("R")[0] != "") {
				$('#turn').css('display', 'none');
			} else {
				$('#turn').css('display', 'block');
			}
			$('.option').css({
				'top':event.clientY-3+'px',
				'left':event.clientX-3+'px',
				'display':'block',
				'z-index':'200'
			})
		}
	});
	$(".option").on('mouseleave',function(event){
		$('.option').css('display','none')
	})
}
function remove(){
	var target = $('#remove').attr('data-no');
	var dongFloor=$('.dongFloor-select option:selected').text().trim().split(" ");
	var dong=dongFloor[0];
	var floor=dongFloor[1];
	var result = confirm("정말 삭제하시겠습니까?");
	
	if (result) {
		$.ajax({
			url : "<%=request.getContextPath()%>/WH/construct/remove",
			type : 'post',
			data : {
				"wz_no":target,
				"dong_name":dong,
				"floor_name":floor
			},
			success:function(result){
				$("#"+$('.option-text').text()).remove();
				$('.option').css('display','none')
			}
		})
	}
}
function rackOption(target){
	$.ajax({
		url : "<%=request.getContextPath()%>/WH/construct/info",
		type : 'post',
		data : {rk_no:$(target).parents('tr').find('input[name="no"]').val()},
		success:function(result){
			var template = Handlebars.compile($('#RackFOption-template').html());
			var html = template(result);
			$('#openRackOption').find('table').html(html);
			
			openDial($('#openRackOption'), 300, 138+(53*parseInt(result.length)));
		}
	});
}
</script>
<%@ include file="/WEB-INF/views/common/popupDial_js.jsp"%>