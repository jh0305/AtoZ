<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="content">
    	<div class="row">
    		<div class="btn btn-dark" style="width:80%;height:50px;margin-left:10%;"><h1>입고 예정 현황</h1></div>
    	</div>
    	<div class="row">
    		<div class="table-responsive" style="width:90%;margin-top:50px;margin-left:5%;">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                  <tr>
                    <th class="w-1 text-center">No</th>
                    <th class="text-center">입고번호</th>
                    <th class="text-center">기업명</th>
                    <th class="text-center">총입고량</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="1" onclick="popupMenuOpen('m.receiveDetail','입고예정품목')">
                    <td class="text-center"><span class="text-muted">1</span></td>
                    <td class="text-center">673</td>
                    <td class="text-center">롯데칠성음료</td>
                    <td class="text-center">3785</td>
                  </tr>
                  <tr class="2">
                    <td class="text-center"><span class="text-muted">2</span></td>
                    <td class="text-center">674</td>
                    <td class="text-center">맘스터치</td>
                    <td class="text-center">385</td>
                  </tr>
                </tbody>
              </table>
            </div><!-- /table-responsive -->
    	</div><!-- /row -->
	</div><!-- /content -->
</div> <!-- /page -->
<div class="mobile-pop">
	<div class="row">
   		<div class="btn btn-dark" style="width:80%;height:50px;margin-left:10%;margin-top:10px;"><h1>입고 예정 품목</h1></div>
   	</div>
   	<div class="row">
   		<div class="table-responsive" style="margin-top:10%;margin-left:4%;width:355px;'">
             <table class="table card-table table-vcenter text-nowrap datatable">
               <thead>
                 <tr>
                   <th class="w-1 text-center">No</th>
                   <th class="text-center">품목명</th>
                   <th class="text-center">규격</th>
                   <th class="text-center">입고예정수량</th>
                 </tr>
               </thead>
               <tbody>
                 <tr class="1">
                   <td class="text-center"><span class="text-muted">1</span></td>
                   <td class="text-center">칠성사이다</td>
                   <td class="text-center">1.5L</td>
                   <td class="text-center">3000</td>
                 </tr>
                 <tr class="2">
                   <td class="text-center"><span class="text-muted">2</span></td>
                   <td class="text-center">핫식스</td>
                   <td class="text-center">350ml</td>
                   <td class="text-center">785</td>
                 </tr>
               </tbody>
             </table>
           </div><!-- /table-responsive -->
   	</div><!-- /row -->
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.7.6/handlebars.min.js"></script>
<script type="text/x-handlebars-template"  id="receive-item" >
	
</script>
<script>
	var popup=false;
	window.onload=function(){
		$('tbody tr').on('click',function(){
			$('.mobile-pop').css('display', 'block');
			popup=true;
		});
		
		$('body').on('click',function(event){
			if(popup){
				if($('.mobile-pop').css('display')=='block' && !$(event.target).hasClass('mobile-pop')){
// 					$('.mobile-pop').css('display', 'none');
				}
			}
		});
	}
</script>
