<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="content">
    
    	<div class="row">
<!--     		<div class="btn btn-dark scannerChoice" id="bar"style="width:40%;height:40px;margin-left:7%;"><h1>입하</h1></div> -->
<!--     		<div class="btn btn-dark scannerChoice" id="qr"style="width:40%;height:40px;margin-left:5%;"><h1>입고</h1></div> -->
			<div class="card-tabs ">
                <!-- Cards navigation -->
                <ul class="nav nav-tabs">
                  <li class="nav-item"><a href="#tab-top-1" class="nav-link active" data-bs-toggle="tab">입하</a></li>
                  <li class="nav-item"><a href="#tab-top-2" class="nav-link" data-bs-toggle="tab">입고</a></li>
                  <li class="nav-item"><a href="#tab-top-3" class="nav-link" data-bs-toggle="tab">출고</a></li>
                </ul>
                <div class="tab-content">
                  <!-- Content of card #1 -->
                  <div id="tab-top-1" class="card tab-pane show active">
                    <div class="card-body">
                    	<div class="barcode-scanner barcode">바코드</div>
                    	<div class="row work-text barcode">
				    		<h2>Barcode 데이터</h2>
				    	</div>
                    </div>
                  </div>
                  <!-- Content of card #2 -->
                  <div id="tab-top-2" class="card tab-pane">
                    <div class="card-body">
                    	<div class="qr-scanner qr-receive">QR</div>
                    	<div class="row work-text qr">
				    		<h2>QR 데이터</h2>
				    	</div>
                    </div>
                  </div>
                  <!-- Content of card #3 -->
                  <div id="tab-top-3" class="card tab-pane">
                    <div class="card-body">
                    	<div class="qr-scanner qr-release">QR</div>
                    	<div class="row work-text qr">
				    		<h2>QR 데이터</h2>
				    	</div>
                    </div>
                  </div>
                </div>
              </div>
    	</div>
    	<div class="row" style="margin-top:30px;">
    		<a href="#" class="btn btn-dark" style="width:70%;height:50px;margin-left:15%;">등록하기</a>
    	</div>
	</div><!-- /content -->
	
</div> <!-- /page -->

<script>
	window.onload=function(){
		$('.scannerChoice').on('click', function(){
			if($(this).attr('id')=='bar'){
				$('#qr').css('background', '#232e3c');
				$('#bar').css('background', 'gray');
				$('.barcode').css('display', 'block');
				$('.qr').css('display', 'none');
			}else{
				$('#bar').css('background', '#232e3c');
				$('#qr').css('background', 'gray');
				$('.qr').css('display', 'block');
				$('.barcode').css('display', 'none');
			}
		});
	}
</script>