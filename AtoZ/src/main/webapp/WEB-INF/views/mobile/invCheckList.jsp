<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/qr.css" />
  
	<div class="content" style="height:80%;">
	    
		<div class="row">
			<div class="btn btn-dark" style="width:80%;height:40px;margin:0 auto;">
				<h1 style="margin:auto;">재고 실사</h1>
			</div>
		</div>
		
		<div class="col-10" style="text-align: right; margin:5px auto 0 auto;">
			<input type="button" id="saveBtn" value="저장" class="btn btn-basic" onclick="saveBtnClick();" style="width:50px; height:30px; line-height: 1%;">
			<input type="button" id="qrBtn" value="QR켜기" class="btn btn-basic" onclick="qrBtnClick();" style="width:50px; height:30px; line-height: 1%;">
		</div>
		
		<div class="row" id="qrBox" style="padding-top:10px;display:none;text-align: center;">
			<div id="btn-scan-qr" style="text-align: center;"> <!-- 스캔 전 버튼 -->
           		<svg xmlns="http://www.w3.org/2000/svg" class="icon qrcamera" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><path d="M4 8v-2a2 2 0 0 1 2 -2h2" /><path d="M4 16v2a2 2 0 0 0 2 2h2" /><path d="M16 4h2a2 2 0 0 1 2 2v2" /><path d="M16 20h2a2 2 0 0 0 2 -2v-2" /><circle cx="12" cy="12" r="3" /></svg>
        	</div>
         	<canvas hidden="" id="qr-canvas"></canvas> <!-- 스캔 화면 -->
		</div>
		
		<div class="row text-center" style="margin-top:10px;">
			<h2>로케이션 : ${inv_name }</h2>
		</div>
		<!-- /row Qr -->
	   	<div class="row" id="tableRow" style="height:80%;">
	   		<div class="card col-12 table-responsive" style="margin:0 auto;max-height:90%;padding:0px; ">
		   		<table class="table card-table table-vcenter text-nowrap datatable">
		   			<thead>
		   				<tr>
			   				<th style="position: sticky;top:0;padding-left:30px;" class="text-left">번호</th>
			   				<th style="position: sticky;top:0;" class="text-left">품목명</th>
			   				<th class="text-right" style="position: sticky;top:0;text-align: right;">재고량</th>
			   				<th class="text-right" style="position: sticky;top:0;text-align: right;padding-right:30px;">실수량</th>
			   			</tr>
		   			</thead>
		   			
		   			<tbody id="invCheckList">
		   			</tbody>
		   			
		   		</table>
	   		</div>
	   	</div>
	</div><!-- /content -->
	
</div> <!-- /page -->

<script type="text/x-handlebars-template"  id="check-list-template" >
	{{#each .}}
		<tr>
			<td class="text-left" style="padding-left:30px;" name="chk_no" data-td="{{nullCheck1 chk_no}}" >{{nullCheck2 inv_no}}</td>
			<td class="text-left"  name="inv_no" data-td="{{inv_no}}">{{item_name}} {{std_name}}</td>
			<td class="text-right" style="text-align: right;" name="cur_qty" data-td="{{cur_qty}}" >{{cur_qty}}</td>
			<td class="text-right" style="text-align: right;" name="chk_qty">
				<input type="number" pattern="\d*" placeholder="number" onclick="$(this).select();" oninput="inp(this);" value="{{chk_qty}}" class="form-control" style="max-width:50px; text-align:right; padding:2px 20px 2px 0px; margin-left:auto;margin-right:0;">
			</td>
		</tr>
	{{/each}}
</script>

<script>
	window.onload = function(){
		Handlebars.registerHelper({
			"nullCheck1":function(chk_no){
				if(chk_no == null || chk_no == 0){
					return "0";
				} else {
					return chk_no;
				}
			},
			"nullCheck2":function(chk_no){
				if(chk_no == null || chk_no == 0){
					return "신규";
				} else {
					return chk_no;
				}
			}
		});
		
		getInvCheckList()
		
		 qrcode = window.qrcode;

         video = document.createElement("video");
         canvasElement = document.getElementById("qr-canvas");
         canvas = canvasElement.getContext("2d");

         btnScanQR = document.getElementById("btn-scan-qr");

         let scanning = false;

         // qrscan 결과
         qrcode.callback = res => { 
//            res : 스캔해 온 QR코드 값
           if (res) {
        	 var kind = res.substr(0,res.indexOf(':'));
  	    	 var code = res.substr(res.indexOf(":")+1,res.length);
  	    	 if(kind != 'stock'){
  	    		 alert("재고 코드가 아닙니다.");
  	    		 scanning = false;
  	             video.srcObject.getTracks().forEach(track => {
  	               track.stop();
  	             });
  	             
  	             setTimeout(scanQr(), 1000);
  	             return;
  	    	 }
            beep();
        	var trs = document.getElementById('invCheckList').children;
        	
        	for(var i=0; i<trs.length;i++){
	        	trs[i].style.background = "none";
        	}
        	
        	var tds = document.getElementsByName('inv_no');
        	var other = true;
        	
        	for(td of tds){
        		if(td.getAttribute("data-td") == code){
        			var tr = td.parentNode;
        			var val = tr.getElementsByTagName("input")[0].value;
        			if(val == ""){
        				val = 0;
        			}
        			tr.getElementsByTagName("input")[0].value = parseInt(val) + 1;
        			tr.style.background = "rgba(255, 128, 128,0.5)";
//         			colorChange(tr)
					other = false;
        			break;
        		}
        	}
        	   
        	if(other){
        		$.ajax({
        			url : "m.getStock",
        			type : "get",
        			data : {inv_no : code},
        			success : function(data){
        				if(confirm("이 로케이션에 등록되지 않은 재고입니다.\n계속하시겠습니까?")){
	        				$('#invCheckList').prepend(
        						'<tr>' +
			        			'	<td class="text-left" style="padding-left:30px;" name="chk_no" data-td="0">신규</td>'+
			        			'	<td class="text-left"  name="inv_no" data-td="'+data.inv_no+'">'+data.item_name+' '+data.std_name+'</td>'+
			        			'	<td class="text-right" style="text-align: right;" name="cur_qty" data-td="'+data.cur_qty+'" >'+data.cur_qty+'</td>'+
			        			'	<td class="text-right" style="text-align: right;" name="chk_qty">'+
			        			'		<input type="number" pattern="\d*" placeholder="number" onclick="$(this).select();" oninput="inp(this);" value="1" class="form-control" style="max-width:50px; text-align:right; padding:2px 20px 2px 0px; margin-left:auto;margin-right:0;">'+
			        			'	</td>'+
		        				'</tr>'		
	        				);
        				}
        			},
        			error : function(e){
        				if(e.status == 400){
        					alert("재고로 등록되지 않은 코드입니다.");
        				}
        			}
        		});
        	}
        	
             scanning = false;
             video.srcObject.getTracks().forEach(track => {
               track.stop();
             });
             
             setTimeout(scanQr(), 1000);
//              canvasElement.hidden = true;
//              btnScanQR.hidden = false;
             
           }
         };
//          function colorChange(tr){
//         	 var otp = 0.5; 
//         	 for(var i=0; i< 50; i++){
//         		setTimeout(function(){
//         			otp -= 0.01;
// 	        		tr.style.background = "rgba(255, 128, 128,"+ otp +")";
// 	        	},100);
//         	 }
//          }
         
         function scanQr(){
        	 navigator.mediaDevices
             .getUserMedia({ video: { facingMode: "environment" } })
             .then(function(stream) {
               scanning = true;
               video.setAttribute("playsinline", true); // required to tell iOS safari we don't want fullscreen
               video.srcObject = stream;
               video.play();
               tick();
               scan();
             });
         }

         btnScanQR.onclick = () => {
           navigator.mediaDevices
             .getUserMedia({ video: { facingMode: "environment" } })
             .then(function(stream) {
               scanning = true;
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
	function beep() { 
		var snd = new Audio("data:audio/wav;base64,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qJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=");
		snd.volume = 1;
		snd.play(); 
	} 
	
	var qrOn = false;
	
	function qrBtnClick(){
		var btn = document.getElementById('qrBtn');
		var qrBox = document.getElementById('qrBox');
		if(qrOn){
			qrBox.style.display = "none";
			btn.value="QR켜기";
			tableRow.style.height = "80%";
			qrOn = false;
			
			scanning = false;

            video.srcObject.getTracks().forEach(track => {
              track.stop();
            });
            
            canvasElement.hidden = true;
            
		} else {
			qrBox.style.display = "block";
			tableRow.style.height = "40%";
			btn.value="QR끄기";
			qrOn = true;
			
		}
	}
	
	function inp(th){
		var val = th.value;
		if(val.length > 1 && val.charAt(0) == 0){
			val = val.substr(1,val.length);
			th.value = val;
		}
	}
	
	function getInvCheckList(){
		$.ajax({
			url : "m.getStockList",
			data : {inv_loc : "${inv_loc}"},
			type : 'get',
			success : function(res){
				printData(res,$('#invCheckList'),$('#check-list-template'));
			},
			error : function(){
				
			}
		});
	}
	
	var printData = function(Arr,target,templateObject){
		var template = Handlebars.compile(templateObject.html());
		var html = template(Arr);
		$(target).html(html);
	}
	
	function saveBtnClick(){
		
		if(confirm('저장 하시겠습니까?')){
			var trs = document.getElementById('invCheckList').children
			var arr = [];
			for (tr of trs){
				data = {
					chk_no : tr.querySelector('td[name="chk_no"]').getAttribute("data-td"),
					inv_no : tr.querySelector('td[name="inv_no"]').getAttribute("data-td"),
					cur_qty : tr.querySelector('td[name="cur_qty"]').getAttribute("data-td"),
					chk_qty : tr.querySelector('td[name="chk_qty"]').getElementsByTagName('input')[0].value,
					bfr_loc : "${inv_loc}"
				};
				arr.push(data);
			}
			arrj = JSON.stringify(arr);
			
			$.ajax({
				url : "m.modifyInvCheck",
				type : "post",
				data : arrj,
				contentType : "application/json;charset=utf-8",
				success: function(){
					location.href="m.stockcount";
				},
				error : function(){
					alert("시스템 오류입니다.\n관리자에게 연락바랍니다.")	
				}
				
			});
		}
		
	}
	
</script>




    

       









