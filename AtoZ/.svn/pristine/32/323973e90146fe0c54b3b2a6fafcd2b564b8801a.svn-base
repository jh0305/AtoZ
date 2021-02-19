<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.psvg:hover, .msvg:hover{
		cursor : pointer;
		stroke : #00abfb;
	}
</style>

<script id="picture-template" type="text/x-handlebars-template">
{{#each .}}
	{{#isFirst @index}}
	<div class="carousel-item active">
	{{else}}
	<div class="carousel-item">
	{{/isFirst}}
		<img class="d-block w-100" src="<%=request.getContextPath()%>/WC/member/getPicture?pic_name={{this}}">
	</div>
{{/each}}
</script>

<script id="detail-template" type="text/x-handlebars-template">
<div class="row crow">
<div class="col-lg-3">
	<div class="ms-auto text-muted">
		<div class="mb-4">
			<label class="form-label">계약 면적 선택</label>
			<select class="form-select areaSelectBox" name="cm_type" onchange="javascript:choose_type(this);" style="background:white;color:black;">
				<option value="0" selected>취급유형선택</option>
				{{#each .}}
					<option value='{{cm_code}}'>{{cm_name}}</option>
				{{/each}}
			</select>			
		</div>
	</div>
</div>
<div class="col-lg-2" name="zarea">
	<div class="ms-auto text-muted">
		<div class="mb-4">			
			<label class="form-label">&nbsp;</label>
			<select class="form-select areaSelectBox" name="zone_area" style="background:white;color:black;">
				<option value="0" selected>면적</option>					
			</select>			
		</div>
	</div>
</div>
<div class="col-lg-2 icons"></div>
</script>

<script id="area-template" type="text/x-handlebars-template">
	<div class="ms-auto text-muted">
		<div class="mb-4">			
			<label class="form-label">&nbsp;</label>
			<select class="form-select" name="zone_area" onchange="javascript:add_icon(this);" style="background:white;color:black;">				
				<option value="0" selected>면적(m2)</option>
				{{#each .}}
					<option value="{{wz_no}}">{{wz_area}}</option>
				{{/each}}					
			</select>			
		</div>
	</div>	
</script>

<script id="picon-template" type="text/x-handlebars-template">
<div class="col-lg-1 picon" onclick="javascript:add_col(this);">
	<label class="form-label">&nbsp;</label>
	<span style="line-height:2;">	
		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-square-plus psvg" width="52" height="52" viewBox="0 0 24 24" stroke-width="1.5" stroke="#000000" fill="none" stroke-linecap="round" stroke-linejoin="round">
  			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
  			<rect x="4" y="4" width="16" height="16" rx="2" />
  			<line x1="9" y1="12" x2="15" y2="12" />
  			<line x1="12" y1="9" x2="12" y2="15" />
		</svg>	
	</span> 
</div>
</script>
<script id="micon-template" type="text/x-handlebars-template">
<div class="col-lg-1 picon" onclick="javascript:remove_col(this);">
	<label class="form-label">&nbsp;</label>
	<span style="line-height:2;">	
		<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-square-minus msvg" width="52" height="52" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ff2825" fill="none" stroke-linecap="round" stroke-linejoin="round">
  			<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
  			<rect x="4" y="4" width="16" height="16" rx="2" />
 			<line x1="9" y1="12" x2="15" y2="12" />
		</svg>
	</span>
</div>
</script>

<script>
 var clno; //물류센터 코드
 var thisAreaDiv; 
 var wznos = new Array();
 
 function choose_type(object){ // 면적 나오기
	 var ctype = $(object).val(); //cm_code (취급유형코드)
	 if(ctype == 0){
		 $(object).parents('.crow').find('select[name=zone_area]').attr("disabled",false);
		 $(object).parents('.crow').find('select[name=zone_area]').empty();
		 $(object).parents('.crow').find('.picon').remove();
		 return false;
	 }
	 thisAreaDiv = $(object).parents('.crow').find('div[name=zarea]');
	 $.ajax({
		url : "${pageContext.request.contextPath}/contract/getArea",
		method : 'post',
		data : {"cm_code" : ctype , "wh_code" : clno, "wznos" : wznos},
		success : function(data){
			source = $('#area-template').html();
			template = Handlebars.compile(source);
			$(thisAreaDiv).html(template(data));
		}
	 });
	 
 }
 function removeA(arr) {
	    var what, a = arguments, L = a.length, ax;
	    while (L > 1 && arr.length) {
	        what = a[--L];
	        while ((ax= arr.indexOf(what)) !== -1) {
	            arr.splice(ax, 1);
	        }
	    }
	    return arr;
}
 
 // (+) 버튼 추가하는 함수
 function add_icon(object){
	 let areaVal = $(object).val();
	 
	 // 0206 면적 선택을 바꿔도 add_icon 돼있을 경우(아래에 행이 있을 경우) return 되게
	 if($(object).parents('.crow').next().length > 0){
		 alert("hi");
		 return false;
	 }
	 
	 if($(object).parents('.crow').find('.picon')){ //0204 수정
		 $(object).parents('.crow').find('.picon').remove();
	 }
	 if(areaVal==0){ // 면적 선택 안함 선택시
		 $(object).parents('.crow').find('.picon').remove();
		 return false;
	 }
	 source = $('#picon-template').html();
	 template = Handlebars.compile(source);
	 $(object).parents('.crow').find('.icons').append(template());	 
 }

 function add_col(object){
	 // 1. + 아이콘을 - 아이콘으로 교체하기 2. ajax로 detail-template 추가
	 let wzno = $(object).parents('.crow').find('select[name=zone_area]').val();
	 $(object).parents('.crow').find('select[name=zone_area]').prop("disabled",'disabled');
	 $(object).parents('.crow').find('select[name=cm_type]').prop("disabled",'disabled');
	 wznos.push(wzno);
	 source = $('#micon-template').html();
	 template = Handlebars.compile(source);
	 //$(object).parents('.picon').html(template());
	 $(object).parents('.crow').find('.icons').html(template());
	 
	 $.ajax({
		url : "<%=request.getContextPath()%>/contract/getDetail",
		data : {"wh_code":clno},
		dataType : "json", 
		success : function(data){				
			var detailList = data.typeList;
			if(detailList.length==0){
				alert("더이상 계약 가능한 공간이 없습니다.");
				return false;
			}
			var source = $('#detail-template').html();
			var template = Handlebars.compile(source);
			$('#details').append(template(detailList));
		}
	});
 }
 
 // (-) 버튼 눌렀을때 
 	function remove_col(object){
		 if(wznos.length == 1){ //한개 밖에 남지 않았을 경우 + 밑에 컬럼 있을경우
			 wznos = new Array();
			 //$(object).parents('.crow').find('select[name=cm_type]').val('0');
			 //$(object).parents('.crow').find('select[name=zone_area]').empty();
			 $(object).parents('.crow').remove();
			 //$('#details > div:nth-child(2)').remove();
			 return false;
		 }
		 wzno = $(object).parents('.crow').find('select[name=zone_area]').val();
		 removeA(wznos,wzno);
		 $(object).parents('.crow').remove();
	}

	function closeDial(dialog){
		$(dialog).dialog("close");
	}
	
// 팝업 내부 input 초기화
	function resetDial(dialog){
		$(dialog).find("input").not("input[type='button']").val("");
		$(dialog).find("textarea").val("");
		
	}

// 팝업띄우기
	function openDial(dialog, width, height, object){	
	
	 	$(dialog).dialog({
			  classes : {
				  	"ui-dialog" : "no-pad",
				  	"ui-dialog-titlebar" : "no-radius"
				  },
		      autoOpen: false,
		      height: height,
		      width: width,
		      modal: true,
		      resizable : false,
		      close : function(event,ui){
		    	  resetDial(dialog);
		      }
	      
		  });
		$('button.ui-dialog-titlebar-close').html('<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 30 30" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>');
		
  		dialog.dialog( "open" );
  		dialog.dialog({dialogClass : "index-z"});
  		$(".index-z").css("z-index","2222");
  		dialog.dialog("moveToTop");
	}
	
	function detailAjax(dialog, width, height, object){

		openDial(dialog, width, height, object);
		
		var clname = $(object).find('td:nth-child(2)').text();
		clno = $(object).find('input[name=cl_code]').val();
		var totarea = $(object).find('td:nth-child(5)').text();
		var ceoname =  $(object).find('td:nth-child(6)').text();
		var cltel = $(object).find('td:nth-child(7)').text();
		var regno = $(object).find('input[name=reg_no]').val();
		var claddr = $(object).find('td:nth-child(3)').text();
		$('#whtitle').text(clname);
		$('#whceo').val(ceoname);
		$('#whtel').val(cltel);
		$('#whtotarea').val(totarea);
		$('#addr').val(claddr);
		$('#mregno').val(regno);
		
		//사진 넘기기
		$.ajax({
			url : "<%=request.getContextPath()%>/contract/getPicture",
			data : {"wh_code" : clno},
			success: function(data){
				var source = $('#picture-template').html();
				var template = Handlebars.compile(source);
				$('#wh-image-div').html(template(data));
			}
		});
		
		
		
		$.ajax({
			url : "<%=request.getContextPath()%>/contract/getDetail",
			data : {"wh_code":clno},
			dataType : "json", 
			success : function(data){				
				var detailList = data.typeList;
				//var fileNames = data.fileNames;				
				var source = $('#detail-template').html();
				var template = Handlebars.compile(source);
				$('#details').html(template(detailList));
			},
			error : function(err){
				
			}
		});
	}
	
	function sendContract(){
		
		// 유효성 검사하기.
		var prperiod = $('#preperiod').val();
		if(prperiod == 0){
			alert("계약기간 선택은 필수입니다.");
			return false;
		}
		var crareaList = new Array(); //구역번호
		var size = $("select[name='zone_area']").length;		
		
		for(i=0; i<size; i++){
			if($("select[name='zone_area']").eq(i).val()!=0){
				crareaList.push($("select[name='zone_area']").eq(i).val());
			}
		}
		if(crareaList.length == 0){
			alert("면적 선택은 필수입니다.");
			return false;
		}
		
		if(!confirm("견적 요청하시겠습니까?")){
			return false;
		}
		
		for(i=0; i<size; i++){
			$("select[name='zone_area']").eq(i).attr("disabled",false);
		}
		
		var data = {};
		data["wz_no"] = crareaList;
		data["wh_code"] = clno;
		data["pre_priod"] = prperiod;
		
		$.ajax({
			url : "<%=request.getContextPath()%>/contract/sendContract",
			method : "post",
			data : JSON.stringify(data),
			contentType: 'application/json',
			success : function(){
				alert("견적이 요청되었습니다.");
				location.reload(true);
				closeDial($('#dialog'));
			}
		});
	}
	
	Handlebars.registerHelper({
		"getIt" : function(n, block){
			var ca = n / 100;
			var code = "";
			for(i= 1 ; i<=ca; ++i){
				code += block.fn(100*i);
			}
			return code;
		},
		"isFirst" : function(object,options){
			return (object == 0) ? options.fn(this) : options.inverse(this);
		}
	});
 </script>   