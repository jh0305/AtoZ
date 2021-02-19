<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="content">
    	<div class="row">
    		<div class="btn btn-dark" style="width:80%;height:50px;margin-left:10%;"><h1>출고 예정 현황</h1></div>
    	</div>
    	<div class="row">
    		<div class="table-responsive" style="width:90%;margin-top:50px;margin-left:5%;">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                  <tr>
                    <th class="w-1 text-center">No</th>
                    <th class="text-center">출고번호</th>
                    <th class="text-center">도착지점</th>
                    <th class="text-center">담당자</th>
                    <th class="text-center">총출고량</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="1">
                    <td class="text-center"><span class="text-muted">1</span></td>
                    <td class="text-center">1101</td>
                    <td class="text-center">선화점 롯데리아</td>
                    <td class="text-center">이영섭</td>
                    <td class="text-center">3450</td>
                  </tr>
                  <tr class="2">
                    <td class="text-center"><span class="text-muted">2</span></td>
                    <td class="text-center">1102</td>
                    <td class="text-center">갈마점 맘스터치</td>
                    <td class="text-center">김인혁</td>
                    <td class="text-center">1587</td>
                  </tr>
                </tbody>
              </table>
            </div><!-- /table-responsive -->
    	</div><!-- /row -->
	</div><!-- /content -->
</div> <!-- /page -->
<div class="mobile-pop">
	<div class="row">
   		<div class="btn btn-dark" style="width:80%;height:50px;margin-left:10%;margin-top:10px;"><h1>출고 예정 품목</h1></div>
   	</div>
   	<div class="row">
   		<div class="table-responsive" style="margin-top:10%;margin-left:4%;width:355px;'">
             <table class="table card-table table-vcenter text-nowrap datatable">
               <thead>
                 <tr>
                   <th class="w-1 text-center">No</th>
                   <th class="text-center">품목명</th>
                   <th class="text-center">규격</th>
                   <th class="text-center">출고예정수량</th>
                 </tr>
               </thead>
               <tbody>
                 <tr class="1">
                   <td class="text-center"><span class="text-muted">1</span></td>
                   <td class="text-center">양배추</td>
                   <td class="text-center">-</td>
                   <td class="text-center">783</td>
                 </tr>
                 <tr class="2">
                   <td class="text-center"><span class="text-muted">2</span></td>
                   <td class="text-center">토마토</td>
                   <td class="text-center">-</td>
                   <td class="text-center">804</td>
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
