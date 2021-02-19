<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script id="rdetail-template" type="text/x-handlebars-template">
<div class="card">
<div class="card-body">
<div id="detailcr">
	<div class="table-responsive">
		<table class="table table-vcenter">
			<thead>
				<tr>
					<th></th>
					{{#if isReq}}
						<th style="text-align:right;font-size:1.1em;">계약 요청 내역(상태:{{cm_name}})</th>
					{{else}}
						<th style="text-align:right;font-size:1.1em;">계약 상세 내역</th>
					{{/if}}
				</tr>
			</thead>
			<tbody id="_tbody">
				<tr>
				   	<th>계약번호</th>
					<td id="cc_no">{{cno}}</td>
				</tr>
				<tr>
				    <th>계약자(기업)</th>
					<td>{{cname}}</td>
				</tr>
				<tr>
				   	<th>계약자(물류센터)</th>
					<td>${loginUser.cl_name }</td>
				</tr>
				<tr>
				   	<th>물류센터소재지</th>
					<td>${loginUser.wh_addr }</td>
				</tr>
				<tr>
				   	<th>계약총면적</th>
					<td>{{crarea}}</td>
				</tr>
			{{#each zone_list}}
				<tr>
					<th>&nbsp;&nbsp;계약 상세</th>
					<td>
						구역({{wz_loc}})&nbsp;[{{type_name}}] : {{wz_area}}(㎡)
					</td>
				</tr>
			{{/each}}
			{{#isExist crymd}}
					<tr>
						<th>계약시작일자</th>
						<td>{{crymd}}</td>
					</tr>
					<tr>
						<th>계약종료일자</th>
						<td>{{prettifyDate expymd}}</td>
					</tr>
					<tr>
						<th>계약월사용료</th>
						<td>{{mnth_chrg}}원</td>
					</tr>
					<tr>
						<th>기타(납기기한 등)</th>
						<td>{{cc_dsc}}</td>
					</tr>
			{{else}}
					<tr>
						<th>계약희망기간</th>
						<td>{{prepriod}}년</td>
					</tr>
					<tr>
						<th>요청일시</th>
						<td>{{regdate}}</td>
					</tr>
					<tr>
						<th>견적(월사용료)</th>
						<td><input type="number" id="cmnth_chrg" placeholder="견적(숫자만)" style="width:100px;" value="{{#ExistMnthChrg mnth_chrg}}{{mnth_chrg}}{{/ExistMnthChrg}}">원</td>			
					</tr>
					{{#unless isMe}}
					<tr>
						<th>요청사항</th>
						<td><textarea placeholder="(N/A)" style="width:300px;overflow:auto;" readonly>{{dm_content}}</textarea></td>
					</tr>
					{{/unless}}
					<tr>
						<th>전달사항</th>						
						<td>
							<textarea class="_textarea" id="crtextarea" name="dm_content" placeholder="(계약 승인시 납기기한 등을 꼭 적어주세요.)" style="width:300px;overflow:auto;"></textarea>
							<span><span id = "text-length">0</span>/200</span>
						</td>
					</tr>
			{{/isExist}}
			</tbody>
		</table>
		<div id="btn_space">
		{{#isCancel req_sts}}
			<button class="btn btn-sm" style="margin-top:10px;position:relative;left:90%;" onclick="javascript:closeDial($('#contract'));">닫기</button>
		{{else}}
			{{#isValid expymd}}
				<button class="btn btn-sm" style="margin-top:10px;" onclick="javscript:cancle_form(this);">중도해지</button>
				<button class="btn btn-sm" style="margin-top:10px;position:relative;left:77%;" onclick="javascript:closeDial($('#contract'));">닫기</button>
			{{else}}
				<button class="btn btn-sm" style="margin-top:10px;" onclick="javscript:cancle_form(this);">계약반려</button>
				{{#if isMe}}
					<button class="btn btn-sm" style="margin-top:10px;position:relative;left:75%;" onclick="javscript:send_modi();">견적수정</button>
				{{else}}
					{{#forWhsChrgReq cm_name}} 
					<button class="btn btn-sm" style="margin-top:10px;position:relative;left:75%;" onclick="javscript:send_form()">견적전송</button>
					{{else}}
					<button class="btn btn-sm" style="margin-top:10px;position:relative;left:75%;" onclick="javscript:regist_contract();">계약승인</button>
					{{/forWhsChrgReq}}
				{{/if}}
			{{/isValid}}
		{{/isCancel}}
		</div>			
	</div>
</div>
</div>
{{#isCancel req_sts}}
<div class="ribbon ribbon-top ribbon-start bg-red">
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-letter-x" width="52" height="52" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
  	<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
  	<line x1="7" y1="4" x2="17" y2="20" />
  	<line x1="17" y1="4" x2="7" y2="20" />
	</svg>
</div>
{{/isCancel}}
{{#isContract req_sts}}
<div class="ribbon ribbon-top ribbon-start bg-green">
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-checkbox" width="52" height="52" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
  	<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
  	<polyline points="9 11 12 14 20 6" />
  	<path d="M20 12v6a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h9" />
	</svg>
</div>
{{/isContract}}
</div>
</script>
<script id="codetail-template" type="text/x-handlebars-template">
<div class="card">
<div class="card-body">
<div id="detailcr">
	<div class="table-responsive">
		<table class="table table-vcenter">
			<thead>
				<tr>
					<th></th>
					{{#if isReq}}
						<th style="text-align:right;font-size:1.1em;">계약 요청 내역&nbsp;[상태 : {{cm_name}}]</th>
					{{else}}
						<th style="text-align:right;font-size:1.1em;">계약 상세 내역</th>
					{{/if}}
				</tr>
			</thead>
			<tbody id="_tbody">
				<tr>
				   	<th>계약번호</th>
					<td id="cocc_no">{{cno}}</td>
				</tr>
				<tr>
				    <th>계약자(물류센터)</th>
					<td>{{cname}}</td>
				</tr>
				<tr>
				   	<th>계약자(기업)</th>
					<td>${loginUser.cl_name }</td>
				</tr>
				<tr>
				   	<th>물류센터소재지</th>
					<td>{{wh_addr}}</td>
				</tr>
				<tr>
				   	<th>계약총면적</th>
					<td>{{crarea}}</td>
				</tr>
			{{#each zone_list}}
				<tr>
					<th>&nbsp;&nbsp;계약 상세</th>
					<td>
						구역({{wz_loc}})&nbsp;[{{type_name}}] : {{wz_area}}(㎡)
					</td>
				</tr>
			{{/each}}
			{{#isExist crymd}}
					<tr>
						<th>계약시작일자</th>
						<td>{{crymd}}</td>
					</tr>
					<tr>
						<th>계약종료일자</th>
						<td>{{prettifyDate expymd}}</td>
					</tr>
					<tr>
						<th>계약월사용료</th>
						<td>{{mnth_chrg}}</td>
					</tr>
					<tr>
						<th>기타(납기기한 등)</th>
						<td>{{cc_dsc}}</td>
					</tr>
					
			{{else}}
					<tr>
						<th>계약희망기간</th>
						<td>{{prepriod}}년</td>
					</tr>
					<tr>
						<th>요청일시</th>
						<td>{{regdate}}</td>
					</tr>
					<tr>
						<th>견적(월사용료)</th>
						<td><input type="text" id="comnth_chrg" placeholder="견적 요청중" style="width:100px;" value="{{#ExistMnthChrg mnth_chrg}}{{mnth_chrg}}{{/ExistMnthChrg}}" readonly>원</td>			
					</tr>
					{{#unless isMe}}
					<tr>
						<th>요청사항</th>
						<td><textarea placeholder="(N/A)" style="width:300px;overflow:auto;" readonly>{{dm_content}}</textarea></td>
					</tr>
					{{/unless}}
					{{#isCancel req_sts}}
					{{else}}
					<tr>
						<th>전달사항</th>						
						<td>
							<textarea class="_textarea" id="cotextarea" name="dm_content" placeholder="(전달하고 싶은 사항을 입력해주세요.)" style="width:300px;overflow:auto;"></textarea>
							<span><span id = "text-length">0</span>/200</span>
						</td>
					</tr>
					{{/isCancel}}
			{{/isExist}}
			</tbody>
		</table>
		<div id="btn_space">
		{{#isCancel req_sts}}
			<button class="btn btn-sm" style="margin-top:10px;position:relative;left:90%;" onclick="javascript:closeDial($('#contract'));">닫기</button>
		{{else}}
			{{#isValid expymd}}
				<button class="btn btn-sm" style="margin-top:10px;" onclick="javscript:cancle_form(this);">중도해지</button>
				<button class="btn btn-sm" style="margin-top:10px;position:relative;left:77%;" onclick="javscript:closeDial($('#contract'));">닫기</button>
			{{else}}
				<button class="btn btn-sm" style="margin-top:10px;" onclick="javscript:cancle_form(this);">계약취하</button>			
				{{#ExistMnthChrg mnth_chrg}}
					{{#isReReq cm_name}}
					<button class="btn btn-sm" style="margin-top:10px;position:relative;left:77%;" onclick="javscript:closeDial($('#contract'));">닫기</button>
					{{else}}
						<button class="btn btn-sm" style="margin-top:10px;position:relative;left:60%;" onclick="javscript:re_req_contract();">수정요청</button>
						<button class="btn btn-sm" style="margin-top:10px;position:relative;left:61%;background:#ceedab;" onclick="javscript:req_contract();">계약요청</button>
					{{/isReReq}}
				{{else}}
				<button class="btn btn-sm" style="margin-top:10px;position:relative;left:77%;" onclick="javascript:closeDial($('#contract'));">닫기</button>
				{{/ExistMnthChrg}}
			{{/isValid}}
		{{/isCancel}}
		</div>			
	</div>
</div>
</div>
{{#isCancel req_sts}}
<div class="ribbon ribbon-top ribbon-start bg-red">
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-letter-x" width="52" height="52" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
  	<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
  	<line x1="7" y1="4" x2="17" y2="20" />
  	<line x1="17" y1="4" x2="7" y2="20" />
	</svg>
</div>
{{/isCancel}}
{{#isContract req_sts}}
<div class="ribbon ribbon-top ribbon-start bg-green">
	<svg xmlns="http://www.w3.org/2000/svg" class="icon icon-tabler icon-tabler-checkbox" width="52" height="52" viewBox="0 0 24 24" stroke-width="1.5" stroke="#ffffff" fill="none" stroke-linecap="round" stroke-linejoin="round">
  	<path stroke="none" d="M0 0h24v24H0z" fill="none"/>
  	<polyline points="9 11 12 14 20 6" />
  	<path d="M20 12v6a2 2 0 0 1 -2 2h-12a2 2 0 0 1 -2 -2v-12a2 2 0 0 1 2 -2h9" />
	</svg>
</div>
{{/isContract}}
</div>
</script>
<script id="cancle-template" type="text/x-handlebars-template">
<tr>
	<th>사유</th>						
	<td>
		<textarea class="_textarea" id="cncl_textarea" name="dm_content" placeholder="계약 해지/반려/취하 사유를 적어주세요." style="width:300px;overflow:auto;"></textarea>
		<span><span id = "text-length">0</span>/200</span>
	</td>
</tr>
</script>
<script id="cancle-button-template" type="text/x-handlebars-template">
	<button class="btn btn-sm" style="margin-top:10px;position:relative;left:77%;background:red;" onclick="javscript:cancle_contract(this);">계약 취소</button>
</script>

<script>

	var cc_no; //전역적으로 사용할 cc_no! 
	var dm_no; 
	var req_sts;
	var prepriod;
	var co_code; 
	var title; // 계약 취소 요청시 종류
	
	//계약 승인 함수(주체 : 물류센터) 
	function regist_contract(){
		let cc_dsc = $('#crtextarea').val();
		if(!cc_dsc){
		 	alert("승인시 전달사항은 필수입니다.");
		 	return false;
		}
		
		if(!confirm("계약승인하시겠습니까?")){
			return false;
		}
		
		param = {"cc_no" : cc_no, "pre_priod" : prepriod, "cc_dsc" : cc_dsc, "sts_code" : 'CR002', "co_code" :co_code};
		
		$.ajax({
			url :"${pageContext.request.contextPath}/contract/registContract",
			data : JSON.stringify(param),
			type : "post",
			contentType: "application/json",
			success : function(){
				alert("계약 되었습니다!");
				location.reload(true);
				closeDial($('#contract'));
			}
		});
	}
	
	function cancle_form(object){
		title = $(object).text();
		$(object).remove();
		// _tbody에 cancle-template 생성되게 하기
		source = $('#cancle-template').html();
		template = Handlebars.compile(source);
		$('#_tbody').append(template());
		$('#btn_space').empty();
		btn_source = $('#cancle-button-template').html();
		btemplate = Handlebars.compile(btn_source);
		$('#btn_space').html(btemplate());
		
	}
	
	//계약 취하 함수
	function cancle_contract(object){
		var cm_code = "";
		var dm_content = $('#cncl_textarea').val();
		if(!dm_content){
			alert("사유 입력은 필수입니다.");
			return false;
		}
		if(!confirm("정말 " + title + "하시겠습니까? \n 위약금이 발생할 수도 있습니다.")){
			return false;
		}
		if(title == '중도해지'){
			cm_code = 'CC003';
		}else if(title == '계약반려'){
			cm_code = 'CC001';
		}else if(title =='계약취하'){
			cm_code = 'CC002';
		}
		// c2c_contract, detail_mng에 insert
		let json_data =  {"cc_no" : cc_no, "dm_content" : dm_content, 
				"cc_dsc" : dm_content, "sts_code" : 'CR004', "cm_code" : cm_code, 
				"cl_code" : '${loginUser.cl_code}', "co_code" : co_code};
		$.ajax({
			url : "${pageContext.request.contextPath}/contract/cancleContract",
			data : JSON.stringify(json_data),
			type : "post",
			contentType: "application/json",
			success: function(){
				alert("계약이 파기되었습니다.");
				location.reload(true);
				closeDial($('#contract'));
			}
		});
	}
	
	
	
	// 계약 요청 함수
	function req_contract(){
		// 넘길 것 : cc_no, dm_content
		let dm_content = $('#cotextarea').val();
		if(!dm_content){
			dm_content = "N/A";
		}
		let json_data =  {"cc_no" : cc_no, "dm_content" : dm_content, "cm_code" : 'DM004'};
		json_data =JSON.stringify(json_data);
		$.ajax({
			url : "${pageContext.request.contextPath}/contract/requestContract",
			data : json_data,
			type : "post",
			contentType: "application/json",
			success: function(){
				alert("계약 요청되었습니다.");
				location.reload(true);
				closeDial($('#contract'));
			}
		}); 
	}
	
	// 견적 재요청 함수
	function re_req_contract(){
		let dm_content = $('#cotextarea').val();
		if(!dm_content){
			dm_content = "N/A";
		}
		let json_data = {"cc_no" : cc_no, "dm_content" : dm_content, "cm_code" : 'DM003'};
		json_data =JSON.stringify(json_data);
		$.ajax({
			url : "${pageContext.request.contextPath}/contract/requestContract",
			data : json_data,
			type : "post",
			contentType: "application/json",
			success: function(){
				alert("견적 재요청되었습니다.");
				location.reload(true);
				closeDial($('#contract'));
			}
		}); 
	}
	
	//견적 전송 함수
	function send_form(){		
		var crtext = $('#crtextarea').val();
		// 전송 유효성 검사
		var mnth_chrg = $('#cmnth_chrg').val();
		if(!mnth_chrg || mnth_chrg <= 0){
			alert("견적을 입력해 주세요.");
			return false;
		}
		
		$.ajax({
			url : "${pageContext.request.contextPath}/contract/sendContractFromWhs",
			data : {"dm_content" : crtext, "mnth_chrg" : $('#cmnth_chrg').val(), "cc_no" : cc_no },
			success : function(){
				alert("전송되었습니다.");
				location.reload(true);
				closeDial($('#contract'));
			}
		})
	};
	
	// 견적 수정 함수
	function send_modi(){
		var crtext = $('#crtextarea').val();
		// 전송 유효성 검사
		var mnth_chrg = $('#cmnth_chrg').val();
		if(!mnth_chrg || mnth_chrg <= 0){
			alert("견적을 입력해 주세요.");
			return false;
		}
		$.ajax({
			url : "${pageContext.request.contextPath}/contract/modifyContractFromWhs",
			data : {"dm_content" : crtext, "mnth_chrg" : $('#cmnth_chrg').val(), "dm_no" : dm_no, "cc_no" : cc_no },
			success : function(){
				alert("수정되었습니다.");
				location.reload(true);
				closeDial($('#contract'));
			}
		});
	}
	
	// 견적 숫자 유효성 검사
	$(document).on("keyup", "#cmnth_chrg", function(){
		var regCheck = /[^0-9]/;
		var v = $('#cmnth_chrg').val();
		for(let i =0; i<v.length; i++){
			
		}
		$('#cmnth_chrg').val(v.replace(regCheck, ''));
	});
	
	// 전달사항 200byte 글자수 제한
	$(document).on("keyup", "._textarea", function(){ 
			var dom = $(this);
			var textDom = $('#text-length');
			str = dom.val();
			var _byte = 0;
			var strLength = 0;
			var charStr = '';
			var cutStr = '';
			var maxLength = 200;
			
			if (str.length <= 0) { 
				return; 
			} 
			for (var i = 0; i < str.length; i++) {
				charStr = str.charAt(i); 
				if (escape(charStr).length > 4) {
					_byte += 2; 
				} else {
				_byte++; 
				} 
				if (_byte <= maxLength) {
					strLength = i + 1; 
				} 
			} 
			textDom.text(_byte); 
			if (_byte > maxLength) {
				cutStr = dom.val().substr(str, strLength); 
				dom.val(cutStr); 
				textDom.text(maxLength); 
				return; 
			} else { 
				textDom.text(_byte); 
			}			
	});

	
	

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
		
		req_sts = $(object).find('span[name=td_cm_name]').text();
		
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
	
	function coWhsDetailAjax(dialog, width, height, object){
		var user1 = '${loginUser.cl_code}';
		var distin = $(object).parents('.whtr').find('input[name=clcodes]').val();
		var distin2 = $(object).text();
		if(user1.indexOf('W') == 0 && isNaN(distin2)){ //물류센터 주체일때, 기업 팝업
			getCompanyDetail(distin);
			return false;
		}
		if(user1.indexOf('C') == 0 && isNaN(distin2)){ //기업 주체일때, 물류센터 팝업
			getWarehouseDetail(distin);
			return false;
		}
	}
	
	
	function detailAjax(dialog, width, height, object){
		
		openDial(dialog, width, height, object);
		
		cc_no = $(object).find('>:first-child').text();
		$.ajax({
			url : "<%=request.getContextPath()%>/contract/getConDetail",
			data : {"cc_no":cc_no},
			success : function(data){				
				var detailList = data.dataList;
				var zoneList = data.zoneList;
				var cno = detailList[0].cc_no;
				var cname = detailList[0].cl_name;
				var crarea = detailList[0].cr_area;
				dm_no = detailList[0].dm_no;
				co_code = detailList[0].co_code;
				var regdate = "";
				var crymd = "";
				var expymd = "";
				var isReq = "";
				var mnth_chrg = "";
				var isMe = false;
				var cc_dsc = "";
				var cm_name ="";
				var dm_content = detailList[0].dm_content;
				if(detailList[0].cl_code == '${loginUser.cl_code}'){
					isMe = true;
				}
				
				if(detailList[0].cr_ymd!='N'){
					crymd = detailList[0].cr_ymd;
					expymd = detailList[0].exp_ymd;
					mnth_chrg = detailList[0].mnth_chrg;
					cc_dsc = detailList[0].cc_dsc;
				}else{
					isReq = detailList[0].is_Req;
					prepriod = detailList[0].pre_priod;
					regdate = detailList[0].reg_date;					
					mnth_chrg = detailList[0].mnth_chrg;
				}
				cm_name = detailList[0].cm_name;
				var rdata = {"cno" : cno, "cname" : cname, "crarea" : crarea, "prepriod" : prepriod, "isMe" : isMe, "dm_content" : dm_content, "wh_addr" : detailList[0].wh_addr,
						"crymd" : crymd, "regdate" : regdate, "expymd" : expymd, "isReq":isReq, "mnth_chrg" : mnth_chrg, "zone_list" : zoneList, "cc_dsc" : cc_dsc, "req_sts" : req_sts, 
						"cm_name" : cm_name, "list" : detailList};
					
				if('${loginUser.cl_code}'.indexOf('C')==0){
					source = $('#codetail-template').html();
					template = Handlebars.compile(source);
					$('#contract').html(template(rdata));
				}else{
					source = $('#rdetail-template').html();
					template = Handlebars.compile(source);
					$('#contract').html(template(rdata));
				}
			}
		});
	}
	
	Handlebars.registerHelper({
		"isExist" : function(object, options){
			return (object != "") ? options.fn(this) : options.inverse(this);
		},
		"isValid" : function(expdate, options){
			if(expdate == 'N'){
				return options.inverse(this);
			}
			var today = new Date();
			var exp_date = new Date(expdate);
			return (today <= exp_date) ? options.fn(this) : options.inverse(this);
		},
		"prettifyDate" : function(givendate, options){
			if(!givendate){
				return '-'
			}
			var toDate = new Date(givendate);
			let yr = toDate.getFullYear();
			let mnth = toDate.getMonth() + 1; 
			if(mnth < 10) {
				mnth = '0' + mnth;
			}
			let dte = toDate.getDate();
			if(dte < 10){
				dte = '0' + dte;
			}
			return yr + '-' + mnth + '-' + dte;
		},
		"isReq" : function(object, options){
			return (object == 'CR001' || object=='요청') ? options.fn(this) : options.inverse(this);
		},
		"ExistMnthChrg" : function(object, options){
			return (object > 0) ? options.fn(this) : options.inverse(this);	
		},
		"isReReq" : function(object, options){
			return (object == '견적재요청' || object == '계약요청') ? options.fn(this) : options.inverse(this);
		},
		"forWhsChrgReq" : function(object, options){
			return (object == '견적재요청' || object == '견적요청') ? options.fn(this) : options.inverse(this);
		},
		"isCancel": function(object, options){
			return (object == '파기') ? options.fn(this) : options.inverse(this);
		},
		"isContract" : function(object, options){
			return (object == '계약') ? options.fn(this) : options.inverse(this);
		}
		
	});
 </script>   
 <script>
//영섭's code
function getCompanyDetail(cl_code) {
	$('#commapspace').empty();
	
	$.ajax({
		url : '<%=request.getContextPath()%>/contract/companyDetail?cl_code='+cl_code,
		type:'get',
		success:function(res){
			$('#c_id').html(res.id);
			$('#c_name').html(res.cl_name);
			$('#c_ceo').html(res.cl_ceo);
			$('#c_regno').html(res.cl_regno);
			$('#c_email').html(res.cl_email);
			$('#c_tel').html(res.cl_tel);
			$('#c_addr').html(res.co_addr.split(",")[1] + " " + res.co_addr.split(",")[2])
			openDial($('#dialog1'),600,900,closeComDetail());
			
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
// 물류센터 상세보기
function getWarehouseDetail(cl_code) {
	$('#waremapspace').empty();
	$.ajax({
		url : '<%=request.getContextPath()%>/contract/companyDetail?cl_code='+cl_code,
		type:'get',
		success:function(res){
			$('#w_id').html(res.id);
			$('#w_name').html(res.cl_name);
			$('#w_ceo').html(res.cl_ceo);
			$('#w_regno').html(res.cl_regno);
			$('#w_email').html(res.cl_email);
			$('#w_tel').html(res.cl_tel);
			$('#w_area').html(res.df_area+"m²");
			$('#w_addr').html(res.wh_addr.split(",")[1] + " " + res.wh_addr.split(",")[2])
			openDial($('#dialog2'),600,900);
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
</script>