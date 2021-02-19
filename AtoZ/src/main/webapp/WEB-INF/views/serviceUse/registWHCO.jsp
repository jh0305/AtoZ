<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/jqvmap/dist/jqvmap.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-flags.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-payments.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/tabler-vendors.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/css/demo.min.css" rel="stylesheet" />
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>

  <link href="<%=request.getContextPath()%>/resources/css/jquery-ui.min.css" rel="stylesheet" />

  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/selectize/dist/css/selectize.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/flatpickr.min.css" rel="stylesheet" />
  <link href="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/nouislider/distribute/nouislider.min.css" rel="stylesheet" />
<title>Insert title here</title>
<style>
#preview img {
	width: 130px;
	height: 130px;
}
.preview-box {
	border: 1px solid rgba(101,109,119,.24);
	padding: 5px;
	border-radius: 2px;
	margin-bottom: 10px;
	width: 150px;
    margin-left: 1%;
    text-align: center;
}
div#preview {
    display: contents;
}
p {
    margin-top: 0;
    margin-bottom: 1rem;
    color: cornflowerblue;
}
</style>
</head>
<body>
<!-- 이메일, 전화번호, 가입신청시 경로 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                	<div class="container">
		              <div class="card" style="width:45%; margin-left:23%">
	                  <div class="card-header">
	                    <h5 class="card-title">서비스 이용신청</h5>
	                  </div>
	                  <div class="card-body">
	              	<form action="<%=request.getContextPath() %>/serviceUse/WHCOregist" method="post" role="form" enctype="multipart/form-data" id="WHForm">
	              		<input type="hidden" value="ROLE_WHCO" name="cl_type">
	                    <div class="mb-3">
	                      <label class="form-label">아이디</label>
	                      <input type="text" onkeyup="this.value=this.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, &#39;&#39;);" class="form-control" name="id" id="cl_id" placeholder="id">
	                      <button type="button" onclick="idCheck_go();"  class="btn btn-info btn-sm btn-append" style="margin-top:1.5%; height: 30px">중복확인</button>
	                      <div class="cl_id regex"></div>
	                    </div>
	                    <div class="mb-3">
	                      <label class="form-label">비밀번호</label>
	                      <input type="password" class="form-control" name="pwd" id="cl_pwd" placeholder="영어대소문자,숫자 ,특수문자 8-16자리">
	                       <div class="cl_pwd regex"></div>
	                    </div>
	                    <div class="mb-3">
	                      <label class="form-label">비밀번호확인</label>
	                      <input type="password" class="form-control" id="cl_pwd2" placeholder="비밀번호 확인">
	                       <div class="cl_pwd2 regex"></div>
	                    </div>
	                    <div class="mb-3">
	                      <label class="form-label">기업명</label>
	                      <input type="text" class="form-control" id="cl_name" name="cl_name" placeholder="기업명">
	                    </div>
	                    <div class="mb-3">
	                      <label class="form-label">대표자명</label>
	                      <input type="text" class="form-control" id="cl_ceo" name="cl_ceo" placeholder="대표자명">
	                    </div>
	                    <div class="mb-3">
	                      <label class="form-label">이메일</label>
	                      <div id="email" style="display: flex">
	                      <input type="text" class="form-control" id="cl_email1" name="cl_email" placeholder="이메일" style="width:45%;">
	                      <label style="font:16px;font-size: 16px;margin-top: 5px;">&nbsp@&nbsp</label>
	                      <input type="text" class="form-control" id="cl_email2" name="cl_email" placeholder="주소" style="width:60%;">
	                      </div>
	                    </div>
	                    <div class="mb-3">
	                      <label class="form-label">사업자등록번호</label>
	                      <input type="text" class="form-control" id="cl_regno" name="cl_regno" placeholder=" - 을 제외한 10자리 숫자">	                      
	                    </div>
	                    <div class="mb-3">
	                      <label class="form-label">전화번호</label>
	                      <div style="display: flex">
	                      <input type="text" class="form-control" id="cl_tel1" name="cl_tel" placeholder="010" style="width:15%">
	                      <label style="font:16px;font-size: 16px;margin-top: 5px;">&nbsp-&nbsp</label>
	                      <input type="text" class="form-control" id="cl_tel2" name="cl_tel" placeholder="0000" style="width:15%">
	                      <label style="font:16px;font-size: 16px;margin-top: 5px;">&nbsp-&nbsp</label>
	                      <input type="text" class="form-control" id="cl_tel3" name="cl_tel" placeholder="0000" style="width:15%">
	                    </div>
	                  </div>
	                    <div class="mb-3">
	                    <label class="form-label">기업주소</label>
	                        <input type="text" class="form-control" id="sample4_postcode" name="co_addr" placeholder="우편번호" style="width:300px; display:inline-block" readonly>
							<input type="button" class="btn btn-primary ms-auto" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" style="margin-bottom:1px">
							<input type="text"  class="form-control"id="sample4_roadAddress" name="co_addr" placeholder="도로명주소" style="margin-top:3px" readonly>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text"  class="form-control"id="sample4_detailAddress" name="co_addr" placeholder="상세주소" style="margin-top:3px">
	                    </div>
	                    <div class="mb-3">
	                    <div style="display: flex;"><label class="form-label">물류센터주소</label><p>&nbsp&nbsp* 기업주소와 동일시 작성하지 않아도 됩니다.</p></div>
	                        <input type="text" class="form-control" id="sample5_postcode" name="wh_addr" placeholder="우편번호" style="width:300px; display:inline-block" readonly>
							<input type="button" class="btn btn-primary ms-auto" onclick="sample5_execDaumPostcode()" value="우편번호 찾기" style="margin-bottom:1px">
							<input type="text"  class="form-control"id="sample5_roadAddress" name="wh_addr" placeholder="도로명주소" style="margin-top:3px" readonly>
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text"  class="form-control"id="sample5_detailAddress" name="wh_addr" placeholder="상세주소" style="margin-top:3px">
	                    </div>
	                    <div class="mb-3" id="whtype">
	                      <label class="form-label">물류센터유형
		                      <svg onclick="typePlust()" style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="12" cy="12" r="9" /><line x1="9" y1="12" x2="15" y2="12" /><line x1="12" y1="9" x2="12" y2="15" /></svg>
		                      <svg onclick="typeMin()" style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="12" cy="12" r="9" /><line x1="9" y1="12" x2="15" y2="12" /></svg>
	                      </label>
	                      <div style="display: flex;" id="whtypePlus">
		                      <select class="form-control" id="typemin" name="cm_codeList[0]" style="width:82px; text-align-last: center; margin-right: 5px;">
		                       <option>유형선택</option>
		                      	<option value="WT001">실온</option>
		                      	<option value="WT002">저온</option>
		                      	<option value="WT003">냉장</option>
		                      	<option value="WT004">냉동</option>
		                      	<option value="WT005">위험물</option>
		                      </select>
	                      </div>
	                     </div>
	                     
	                     <div class="mb-3" id="whfloor">
	                      <label class="form-label">물류센터 동/층 정보
		                      <svg onclick="floorPlus()" style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="12" cy="12" r="9" /><line x1="9" y1="12" x2="15" y2="12" /><line x1="12" y1="9" x2="12" y2="15" /></svg>
		                      <svg onclick="floorMin()" style="cursor: pointer;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><circle cx="12" cy="12" r="9" /><line x1="9" y1="12" x2="15" y2="12" /></svg>
	                      </label>
	                      <div id="whdongPlus">
		                      <div id="dongdiv" style="display:flex; margin-bottom:1%;">
				                      <input class="form-control" type="text" name="dong_nameList[0]" style="width:8%;">
				                      <label style="font:16px;font-size: 16px;margin-top: 5px;">동&nbsp</label>
				                      <input class="form-control" type="text" name="floor_nameList[0]" style="width:8%;">
				                      <label style="font:16px;font-size: 16px;margin-top: 5px;">층&nbsp&nbsp</label>
				                      <input class="form-control" type="text" name="df_widthList[0]" style="width:12.5%; margin-right:1%;" placeholder="가로길이(m)">
				                      <input class="form-control" type="text" name="df_lngthList[0]" style="width:12.5%; margin-right:1%;" placeholder="세로길이(m)">
				                      <input class="form-control" type="text" name="df_areaList[0]" style="width:20%; margin-right:1%;" placeholder="총면적(㎡)">
				                      <input class="form-control" type="text" name="df_dscList[0]" style="width:30%;" placeholder="비고">
		                      </div>
	                      </div>
	                     </div>
	                    
						<div class="mb-3">
							<div style="display: flex;"><label class="form-label">물류센터 사진 등록</label><p>&nbsp&nbsp* 1장이상 3장이하로 필수 등록입니다.</p></div>
							<!-- 첨부 버튼 -->
							
							<!-- 미리보기 영역 -->
							<div style="display: flex;">
								<div id="preview" class="content"></div>
							</div>
							
							<div id="attach">
								<label class="btn btn-info" for="uploadInputBox">사진첨부</label> 
								<input id="uploadInputBox" style="display: none" type="file" name="picture" multiple />
							</div>
						</div>
	                  <div class="card-footer">
	                  <div>
	                    <a href="<%=request.getContextPath() %>/homepage/home" class="btn btn-light link-secondary" >
							취소
	                    </a>
	                    <button class="btn btn-primary ms-auto" type="button" onclick="submit_go()" style="float: right;">
	                      <svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
	                        <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
	                        <line x1="12" y1="5" x2="12" y2="19"></line>
	                        <line x1="5" y1="12" x2="19" y2="12"></line>
	                      </svg>
	                     	가입신청
	                    </button>
	                  </div>
	                  </div>
	                </form>
	              </div>
                 </div>
            	</div>
<%@include file="regist_js.jsp" %>

<script>
	var i=1;
	var j=1;
	var cnt = 1;
	var cnt2 = 1;
	function typePlust(){
		if(cnt >= 5) return;
		var target = $('#whtype').find('#whtypePlus');
		$(target).append($(
	             '<select class="form-control" id="typemin" name="cm_codeList['+i+']" style="width:82px; text-align-last: center; margin-right: 5px;">'
	              +'  <option>유형선택</option>'
	              +'  	<option value="WT001">실온</option>'
	              +'  	<option value="WT002">저온</option>'
	              +'  	<option value="WT003">냉장</option>'
	              +'  	<option value="WT004">냉동</option>'
	              +'  	<option value="WT005">위험물</option>'
	              +'  </select>'
			));
		cnt++;
		i++;
	}
	
	function typeMin(){
		if(cnt <= 1) return;
		$('select[name="cm_codeList['+(i-1)+']"]').remove();
		i--;
		cnt--;
	}
	
	function floorPlus(){
		var target =$('#whfloor').find('#whdongPlus');
		$(target).append($(
				'<div id="dongdiv['+j+']" style="display:flex; margin-bottom:1%;">'
                +'<input class="form-control" type="text" name="dong_nameList['+j+']" style="width:8%;">'
                +'<label style="font:16px;font-size: 16px;margin-top: 5px;">동&nbsp</label>'
                +'<input class="form-control" type="text" name="floor_nameList['+j+']" style="width:8%;">'
                +'<label style="font:16px;font-size: 16px;margin-top: 5px;">층&nbsp&nbsp</label>'
                +'<input class="form-control" type="text" name="df_widthList['+j+']" style="width:12.5%; margin-right:1%;" placeholder="가로길이(m)">'
                +'<input class="form-control" type="text" name="df_lngthList['+j+']" style="width:12.5%; margin-right:1%;" placeholder="세로길이(m)">'
                +'<input class="form-control" type="text" name="df_areaList['+j+']" style="width:20%; margin-right:1%;" placeholder="총면적(㎡)">'
                +'<input class="form-control" type="text" name="df_dscList['+j+']" style="width:30%;" placeholder="비고">'
        		+'</div>'
		));
		j++
		cnt2++
	}
	
	function floorMin(){
		if(cnt2 <= 1) return;
		$('div[id="dongdiv['+(j-1)+']"]').remove();
		j--;
		cnt2--;
	}

	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
	
    function sample5_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample5_postcode').value = data.zonecode;
                document.getElementById("sample5_roadAddress").value = roadAddr;

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    
  //임의의 file object영역
	var files = {};
	var previewIndex = 0;

	// image preview 기능 구현
	// input = file object[]
	function addPreview(input) {
		if (input[0].files) {
			//파일 선택이 여러개였을 시의 대응
			for (var fileIndex = 0; fileIndex < input[0].files.length; fileIndex++) {
				var file = input[0].files[fileIndex];

				if (validation(file.name))
					continue;

				var reader = new FileReader();
				reader.onload = function(img) {
					//div id="preview" 내에 동적코드추가.
					//이 부분을 수정해서 이미지 링크 외 파일명, 사이즈 등의 부가설명을 할 수 있을 것이다.
					if(previewIndex >= 3) return;
					var imgNum = previewIndex++;
					$("#preview")
							.append(
									"<div class=\"preview-box\" value=\"" + imgNum +"\">"
											+ "<img class=\"thumbnail\" src=\"" + img.target.result + "\"\/>"
// 											+ "<p>"
// 											+ file.name
// 											+ "</p>"
											+ "<a href=\"#\" value=\""
											+ imgNum
											+ "\" onclick=\"deletePreview(this)\">"
											+ "삭제" + "</a>" + "</div>");
					
					files[imgNum] = file;
				};
				reader.readAsDataURL(file);
			}
		} else
			alert('invalid file input'); // 첨부클릭 후 취소시의 대응책은 세우지 않았다.
	}
	
	//preview 영역에서 삭제 버튼 클릭시 해당 미리보기이미지 영역 삭제
	function deletePreview(obj) {
		var imgNum = obj.attributes['value'].value;
		delete files[imgNum];
		$("#preview .preview-box[value=" + imgNum + "]").remove();
		imgNum = previewIndex--;
	}
	
	//client-side validation
	//always server-side validation required
	function validation(fileName) {
		fileName = fileName + "";
		var fileNameExtensionIndex = fileName.lastIndexOf('.') + 1;
		var fileNameExtension = fileName.toLowerCase().substring(
				fileNameExtensionIndex, fileName.length);
		if (!((fileNameExtension === 'jpg')
				|| (fileNameExtension === 'gif') || (fileNameExtension === 'png'))) {
			alert('jpg, gif, png 확장자만 업로드 가능합니다.');
			return true;
		} else {
			return false;
		}
	}

	
	$(document).ready(function() {
		// <input type=file> 태그 기능 구현
		$('#attach input[type=file]').change(function() {
			addPreview($(this)); //preview form 추가하기
		});
	});
</script>
</body>
<script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/jquery.mask.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/selectize/dist/js/standalone/selectize.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/flatpickr.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/plugins/rangePlugin.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/nouislider/distribute/nouislider.min.js"></script>
  <!-- Tabler Core -->
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/tabler.min.js"></script>
</html>
