  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
  <script src="<%=request.getContextPath()%>/resources/js/print.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/tabler-1568447964.min.js"></script>
  
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  
  <script src="<%=request.getContextPath()%>/resources/js/jquery-ui.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/selectize/dist/js/standalone/selectize.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/flatpickr.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/flatpickr/dist/plugins/rangePlugin.js"></script>
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/libs/nouislider/distribute/nouislider.min.js"></script>
  <script src="<%=request.getContextPath()%>/resources/js/jquery.mask.min.js"></script>
  <!-- Tabler Core -->
  <script src="<%=request.getContextPath()%>/resources/bootstrap/dist/js/tabler.min.js"></script>

  <script>
  	function setMode(mode){
  		if(mode == "com"){
	  		window.location.href="<%=request.getContextPath()%>/common/setMode?mode=CO";
  		}else if(mode == "ware"){
	  		window.location.href="<%=request.getContextPath()%>/common/setMode?mode=WH";
  		}else if(mode="sys"){
	  		window.location.href="<%=request.getContextPath()%>/common/setMode?mode=SY";
  		}
  		
  	}
  </script>
  <script>
	window.onpopstate = function(){
		var url = history.state.url;
		var mCode = history.state.mCode;
		var title = history.state.title;
		goPage(mCode, url, title, true);
	}
		
	goPage("${menu.mn_code}","${menu.mn_url}","${menu.mn_name}");
		
	function goPage(mCode, url, title, ispop){
		
		if(!ispop){
			if(typeof(history.pushState) == 'function') {
				var renewURL = location.href;
				//현재 주소 중 .do 뒤 부분이 있다면 날려버린다.
				renewURL = renewURL.substring(0, renewURL.lastIndexOf("/")+1);
				renewURL += mCode;
				
				
				//페이지를 리로드하지 않고 페이지 주소만 변경할 때 사용
				history.pushState({mCode : mCode, url : url, title : title}, null, renewURL);
				
			}else {
				location.hash = "#"+mCode;
			}
		}
		
		var divs = document.querySelectorAll('div[role="dialog"]');
		for(div of divs){
			div.remove();
		}
		$(".content").load('<%=request.getContextPath()%>'+url);
		document.title = title;
	}
</script>

<div id="msgdialog" class="dialogDiv" title="쪽지함">
	<%@ include file="../message/messageList.jsp" %>
</div>
<div id="sendMsgDetaildialog" class="dialogDiv" title="보낸 쪽지 상세">
	<%@ include file="../message/sendMessageDetail.jsp" %>
</div>
<div id="receiveMsgDetaildialog" class="dialogDiv" title="받은 쪽지 상세">
	<%@ include file="../message/receiveMessageDetail.jsp" %>
</div>
<div id="newMessagedialog" class="dialogDiv" title="쪽지 작성">
	<%@ include file="../message/messageSend.jsp" %>
</div>
<!-- <div id="questionsDialog" class="dialogDiv" title="질문과답변"> -->
<%-- 	<%@ include file="../questions/main.jsp" %> --%>
<!-- </div> -->





<%@ include file="/WEB-INF/views/common/popupDial_js.jsp" %>
</body>
</html>