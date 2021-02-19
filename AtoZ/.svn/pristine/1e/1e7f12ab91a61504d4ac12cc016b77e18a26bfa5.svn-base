<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/qr.css" />
    
    <div class="content">
	    <div id="container">
		  <div id="btn-scan-qr">
		  	<svg xmlns="http://www.w3.org/2000/svg" class="icon qrcamera" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 8v-2a2 2 0 0 1 2 -2h2" /><path d="M4 16v2a2 2 0 0 0 2 2h2" /><path d="M16 4h2a2 2 0 0 1 2 2v2" /><path d="M16 20h2a2 2 0 0 0 2 -2v-2" /><circle cx="12" cy="12" r="3" /></svg>
		  </div>
	      <canvas hidden="" id="qr-canvas"></canvas>
	
	      <div id="qr-result" hidden="">
	        <b>Data:</b> <span id="outputData"></span>
	      </div>
	    </div>
		<script type="text/javascript">
		window.onload=function(){
			const qrcode = window.qrcode;

			const video = document.createElement("video");
			const canvasElement = document.getElementById("qr-canvas");
			const canvas = canvasElement.getContext("2d");

			const qrResult = document.getElementById("qr-result");
			const outputData = document.getElementById("outputData");
			const btnScanQR = document.getElementById("btn-scan-qr");

			let scanning = false;

			// qrscan 결과
			qrcode.callback = res => {
			  if (res) {
// 				$.ajax({
<%-- 					url : "<%=request.getContextPath()%>/"+res, --%>
// 					type:'post',
// 					success:function(msg){
// 					    outputData.innerText = msg;
// 					},
// 					error:function(error){
// 					}
// 				});   
			    outputData.innerText = res;
			    scanning = false;

			    video.srcObject.getTracks().forEach(track => {
			      track.stop();
			    });

			    qrResult.hidden = false;
			    canvasElement.hidden = true;
			    btnScanQR.hidden = false;
			  }
			};

			btnScanQR.onclick = () => {
// 				alert(navigator.getUserMedia);
			  navigator.mediaDevices
			    .getUserMedia({ video: { facingMode: "environment" } })
			    .then(function(stream) {
			      scanning = true;
			      qrResult.hidden = true;
			      btnScanQR.hidden = true;
			      canvasElement.hidden = false;
			      video.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
			      video.srcObject = stream;
			      video.play();
			      tick();
			      scan();
			    });
			};

			function tick() {
			  canvasElement.height = video.videoHeight;
			  canvasElement.width = video.videoWidth;
			  canvas.drawImage(video, 0, 0, canvasElement.width, canvasElement.height);

			  scanning && requestAnimationFrame(tick);
			}

			function scan() {
			  try {
			    qrcode.decode();
			  } catch (e) {
			    setTimeout(scan, 300);
			  }
			}

		}
		</script>
    	
	</div><!-- /content -->
	
</div> <!-- /page -->
