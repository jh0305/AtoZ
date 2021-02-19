<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.trEvent{
		cursor: pointer;
	}
	.trEvent:hover{
		background : rgb(241,244,249);
	}
</style>

		<div class="col-12 card-body" style="padding: 0px 8px;">
			<div class="row">
				<div class="col-12">
					<div class="row" style="padding: 0px 5px;">
						<div class="col-12" style="padding: 0px 0px;">
							<div class="row" style="margin: 0px 0px 5px 0px;">
								<div style="display:inline-block; height: 36px; padding: 0px 10px 0px 0px;" class="col-11">
									<div class="col-12">
										<input id="searchInput" type="text" class="form-control" placeholder="code or name" style="border-radius: 3px;">
									</div>
								</div>
								<div style="display:inline-block; height: 34px; padding: 0px 0px;" class="col-1">
									<div class="col-12 text-center">
										<div onclick="goItemSearch2()" style="border: 1px solid #D1D4D7; border-radius:3px; background-color:#F3F6FA; cursor: pointer;">
											<svg style="margin: 7px 0px;" xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
											<path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
											<circle cx="10" cy="10" r="7"></circle>
											<line x1="21" y1="21" x2="15" y2="15"></line></svg>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-12 table-responsive" style="padding: 5px; margin: 0px;">
					<table class="table card-table table-vcenter text-nowrap datatable" border=1>
						<thead>
							<tr>
								<th class="text-center">품목코드</th>
								<th class="text-center">품목이름</th>
								<th class="text-center">규격</th>
								<th class="text-center">재고수량</th>
<!-- 								<th class="text-center">출고수량</th> -->
							</tr>
						</thead>
						<tbody id="item_tbody2">
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- card-body -->


		<script>
			var tbody;
			var td;
			var tr;
			var btnSearch;
			var btnSearchCnt
			var noBtnSearchCnt
			
			function goFindElement2(th){
				
				// 내가 클릭한 btn 을 찾는다.
				btnSearch = $(th).parent();
				
				// 내가 클릭한 행(tr) 열(td) 을 찾는다.
				tr = $(th).parents('tr');
				td = tr.children();
				
				//데이터를 추가하지 않은(돋보기 상태의) 행(tr)의 갯수는 몇개 인가?
				tbody = $(th).parents('tbody');
				btnSearchCnt = 	tbody.children().length;
				
				//내가 클릭한 행을 제외한, 돋보기 행 갯수는?
				noBtnSearchCnt = tbody.children('.item_true').length;		
						
				btnSearchCnt = btnSearchCnt - noBtnSearchCnt -1;
			}
			
			function goItemSearch2(){
				$.ajax({
		    		url : '<%=request.getContextPath()%>/CO/release/getSearchReleaseItem',
					type : 'get',
					data : {
						"wh_code" : $('#inWH').val()
					},
					success : function(res) {
						$("#item_tbody2").empty();
						mycode = "";
						
						$.each(res, function(i, val) {
							mycode += '<tr class="itemListCode2 trEvent">';
							mycode += '	<td id="item_no2" class="text-center">' + res[i].item_no + '</td>';
							mycode += '	<td id="item_name2" class="text-center">' + res[i].item_name + '</td>';
							mycode += '	<td id="std_name2" class="text-center">' + res[i].std_name + '</td>';
							mycode += '	<td id="qty2" class="text-center">' + res[i].qty + '</td>';
							mycode += '</tr>';
						});
						$("#item_tbody2").append(mycode);
					},
					error : function(req) {
						alert("상태 : " + req.status);
					}
				});
			};
			
			var cnt = 0;
			$("body").on("click", ".itemListCode2", function() {
				var goReturn = false;
				var item_no = $(this).find("#item_no2").text();
				
				$('#myTbody2 tr').each(function(){
					var item_no2 = $(this).find("td:eq(1)").text();
					if(item_no == item_no2){
						console.log(item_no);
						console.log(item_no2);
						alert("중복된 품목입니다.");
						goReturn = true;
						return;	
					}
				})
				if(goReturn) return; 

				closeDial($('#itemSearchDialog2'));

				var item_name = $(this).find("#item_name2").text();
				var std_name = $(this).find("#std_name2").text();
				var qty = $(this).find("#qty2").text();
				btnSearch.remove();
				
				// 클릭한 tr 의 td에 각각 데이터를 입력한다.
				tr.removeClass('item_false');
				tr.addClass('item_true');
				td.eq(1).text(item_no);
				td.eq(2).text(item_name);
				td.eq(3).text(std_name);
				td.eq(4).text(qty);
				cnt++;
			});
			
		</script>		