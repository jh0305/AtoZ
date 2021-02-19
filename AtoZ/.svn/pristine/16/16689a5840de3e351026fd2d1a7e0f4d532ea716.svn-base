<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	hr{
		margin:1rem 0;
	}
</style>
<div style="margin:4% 0% 2% 5%;">
	<strong style="font-size:1.2rem;">품목 등록</strong>
</div>

<div class="card" style="margin: 0% 2% 0% 2%;">
	<div class="card-body">
		<div class="row">
			<div class="col-2"><strong>품목명</strong></div>
			<div class="col-4"><input type="text" class="form-control" name="item_name" id="Iitem_name"/></div>
			<div class="col-2"><strong>규격명</strong></div>
			<div class="col-4">
				<input type="text" name="std_name" id="Istd_name" class="form-control" style="width:70%; display:inline;" readonly/>
				<input type="button" class="btn btn-white btn-icon" value="검색" onclick="openStandardList()"/>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-2"><strong>무게(Kg)</strong></div>
			<div class="col-4"><input type="text" name="item_wgt" id="Iitem_wgt" class="form-control" onkeypress="return isNumberKey(event);" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣a-zA-Z]/g,'');"/></div>
			<div class="col-2"><strong>거래처명</strong></div>
			<div class="col-4">
				<input type="text" name="cp_name" id="Icp_name" class="form-control" style="width:70%; display:inline;" readonly/>
				<input type="button" class="btn btn-white btn-icon" value="검색" onclick="openCooperatorList()"/>
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-2"><strong>품목구분</strong></div>
			<div class="col-4">
				<input type="radio" name="gb_code" value="GB001"/> 원재료 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gb_code" value="GB002"/> 부재료 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gb_code" value="GB003"/> 제품 
				<br>
				<input type="radio" name="gb_code" value="GB004"/> 반제품 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gb_code" value="GB005"/> 상품 
			</div>
			<div class="col-2"><strong>품목취급유형</strong></div>
			<div class="col-4">
				<input type="radio" name="type_code" value="WT001"/> 실온 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="type_code" value="WT002"/> 저온 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="type_code" value="WT003"/> 냉장 
				<br>
				<input type="radio" name="type_code" value="WT004"/> 냉동 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="type_code" value="WT005"/> 위험물 
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-2"><strong>품목카테고리</strong></div>
			<div class="col-10">
				<input type="radio" name="gr_code" value="GR001"/> 의류&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" name="gr_code" value="GR002"/> 전자제품 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gr_code" value="GR003"/> 식품 
				<br>
				<input type="radio" name="gr_code" value="GR004"/> 의약품 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gr_code" value="GR005"/> 생활용품 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gr_code" value="GR006"/> 가구 
				<br>
				<input type="radio" name="gr_code" value="GR008"/> 문구류 &nbsp;&nbsp;&nbsp;
				<input type="radio" name="gr_code" value="GR009"/> 화장품 
			</div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-2"><strong>등록자명</strong></div>
			<div class="col-4"><input type="text" name="reg_name" id="Ireg_name" class="form-control"/></div>
		</div>
	</div>
</div>

<div style="margin-top:2%; margin-right:2%; text-align:right;">
<input type="button" class="btn btn-white" id="registBtn" onclick="registItem();" value="등록"/>
<input type="button" class="btn btn-white" id="cancelBn" onclick="closeDial($('#dialog1'))" value="취소"/>
</div>

<script>
function openStandardList() {
	asyncSearch_go(1,"CO/item/standardList", targets);
	openDial($('#dialog3'),700,800,false,function(){
		closeStandardList();
	});
}
function closeStandardList() {
	$('#standard-page').find('input[name="SsearchType"]').val("");
	$('#standard-page').find('input[name="Skeyword"]').val("");
}
function openCooperatorList() {
	asyncSearch_go(1,"CO/item/cooperatorList", targets1);
	openDial($('#dialog7'),700,800,false,function(){
		closeCooperatorList();
	});
}
function closeCooperatorList() {
	$('#cooperator-page').find('input[name="searchType"]').val("");
	$('#cooperator-page').find('input[name="keyword"]').val("");
}

function registItem() {
	var item_name = $('#Iitem_name').val().trim();
	var std_name = $('#Istd_name').val().trim();
	var cp_name = $('#Icp_name').val().trim();
	var item_wgt = $('#Iitem_wgt').val().trim();
	var reg_name = $('#Ireg_name').val().trim();
	var gb_code = $('input[name="gb_code"]:checked').val();
	var gr_code = $('input[name="gr_code"]:checked').val();
	var type_code = $('input[name="type_code"]:checked').val();
	if(item_name==""||std_name==""||cp_name==""||item_wgt==""||reg_name==""||gb_code==""||gr_code==""||type_code==""){
		alert("모든 정보를 입력해주세요.");
		return;
	}
	$.ajax({
		url : "<%=request.getContextPath()%>/CO/item/itemRegist",
		type : "post",
		data : {item_name : item_name, std_name : std_name, cp_name : cp_name, item_wgt : item_wgt, reg_name : reg_name, gb_code : gb_code, gr_code : gr_code, type_code : type_code},
		success : function (res) {
			alert("등록이 완료되었습니다.");
			closeDial($("#dialog1"));
			history.go(0);
		}
	});
}

function isNumberKey(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode;
    if (charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57))
        return false;
    // Textbox value    
    var _value = event.srcElement.value;    
    // 소수점(.)이 두번 이상 나오지 못하게
    var _pattern0 = /^\d*[.]\d*$/; // 현재 value값에 소수점(.) 이 있으면 . 입력불가
    if (_pattern0.test(_value)) {
        if (charCode == 46) {
            return false;
        }
    }

    // 1000 이하의 숫자만 입력가능
    var _pattern1 = /^\d{3}$/; // 현재 value값이 3자리 숫자이면 . 만 입력가능
    if (_pattern1.test(_value)) {
        if (charCode != 46) {
            alert("1000 이하의 숫자만 입력가능합니다");
            return false;
        }
    }
    // 소수점 둘째자리까지만 입력가능
    var _pattern2 = /^\d*[.]\d{2}$/; // 현재 value값이 소수점 둘째짜리 숫자이면 더이상 입력 불가
    if (_pattern2.test(_value)) {
        alert("소수점 둘째자리까지만 입력가능합니다.");
        return false;
    }     
    return true;
}
</script>