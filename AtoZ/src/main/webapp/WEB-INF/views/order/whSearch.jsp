<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
	.clickableTr{
		cursor: pointer;
	}
	.clickableTr:hover{
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
										<input id="inputData" type="text" class="form-control" placeholder="창고코드, 창고이름을 입력하세요" style="border-radius: 3px;">
									</div>
								</div>
								<div style="display:inline-block; height: 34px; padding: 0px 0px;" class="col-1">
									<div class="col-12 text-center">
										<div onclick="goSearch();" id="btnSearch" style="border: 1px solid #D1D4D7; border-radius:3px; background-color:#F3F6FA; cursor: pointer;">
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
								<th class="text-center">창고코드</th>
								<th class="text-center">창고명</th>
							</tr>
						</thead>
						<tbody id="whInfo_tbody">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- card-body -->
		
		<script>
		function goSearch(){
	    	var mySearchData = $('#inputData').val();
	    	
	    	$.ajax({
	    		url : '<%=request.getContextPath()%>/CO/order/getContractWH',
				type : 'post',
				data : {
					searchData : mySearchData
				},
				success : function(res) {
					$("#whInfo_tbody").empty();
					mycode = "";
					$.each(res, function(i) {
						mycode += '<tr class="clickableTr">';
						mycode += '	<td id="cl_code" class="text-center">' + res[i].cl_code + '</td>';
						mycode += '	<td id="cl_name" class="text-center">' + res[i].cl_name + '</td>';
						mycode += '</tr>';
					});
					$("#whInfo_tbody").append(mycode);
				},
				error : function(req) {
					alert("상태 : " + req.status);
				}
			});
		};
		
		$("body").on("click", ".clickableTr", function() {
			var cl_code;
			var cl_name;
			cl_code = $(this).find("#cl_code").text();
			cl_name = $(this).find("#cl_name").text();
			
			// 버튼을 클릭한 요소 
//			th_name      = $(th).attr("name");
// 			th_wh_code = $(th).siblings("input")
// 			th_wh_name = $(th)
			
			//요소에 데이터 넣기
			
			$(th_wh_code).val(cl_code);
			$(th_wh_name).val(cl_name);
			
 			if("list_wh_name" == th_name){
				goOrderListSearch();
 			}
 			
 			closeDial($('#whSearch'));
		});
		</script>