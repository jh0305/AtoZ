<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="content">
		<div class="container-xl">
			
			<div class="page-header d-print-none">
	          <div class="row align-items-center">
	            <div class="col">
	              <h2 class="page-title">
					출퇴근 조회	                
	              </h2>
	            </div>
	          </div>
        	</div>
        	
        	<div class="col-4 card" style=" padding:0px; margin-bottom: 10px;">
                <div class="card-body" style="padding: 0px 8px;">
                	<div class="row">
	                    <div class="col-12 table-responsive" style="padding: 0px; margin:0px;">
	                        <table class="table card-table table-vcenter">
	                            <tbody>
	                            	<tr>
	                            		<td style="width:90px; background-color: #F4F6FA;" >기간</td>
	                            		<td ></td>
	                            	</tr>
	                            </tbody>                           
	                        </table>
	                    </div>
                	</div>
                </div>
                <!-- card-body -->
            </div>
            <!-- card --> 
            
        	<div class="col-4 card" style=" padding:0px; margin-bottom: 10px;">
                <div class="card-body" style="padding: 0px 8px;">
                	<div class="row">
	                    <div class="col-12 table-responsive" style="padding: 0px; margin:0px;">
	                        <table class="table card-table table-vcenter">
	                            <tbody>
	                            	<tr>
	                            		<td style="width:90px; background-color: #F4F6FA;" >사원명</td>
	                            		<td ></td>
	                            	</tr>
	                            </tbody>                           
	                        </table>
	                    </div>
                	</div>
                </div>
                <!-- card-body -->
            </div>
            <!-- card --> 
            
            <button style="margin-bottom: 10px;" class="btn">검색</button>
        	
        	<div class="col-12">
              <div class="card">
                <div class="table-responsive" style="margin-bottom: 0px;">
                  <table class="table table-vcenter card-table">
                    <thead>
                      <tr>
                        <th class="text-center">일자</th>
                        <th class="text-center">사원명</th>
                        <th class="text-center">출근시간</th>
                        <th class="text-center">퇴근시간</th>
                        <th class="text-center">근무시간</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="text-center">2021/01/05</td>
                        <td class="text-center">심민규</td>
                        <td class="text-center">2021/01/05 오전 8:28:16</td>
                        <td class="text-center">2021/01/05 오후 8:28:16</td>
                        <td class="text-center">8시간</td>
                      </tr>
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
		</div>
		<!-- contai -->
	</div>
	<!-- content -->
</body>
</html>