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
					근태 조회	                
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
	                            		<td style="width:90px; background-color: #F4F6FA;" >기준 일자</td>
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
            
        	<div class="col-4 card" style=" padding:0px; margin-bottom: 10px;">
                <div class="card-body" style="padding: 0px 8px;">
                	<div class="row">
	                    <div class="col-12 table-responsive" style="padding: 0px; margin:0px;">
	                        <table class="table card-table table-vcenter">
	                            <tbody>
	                            	<tr>
	                            		<td style="width:90px; background-color: #F4F6FA;" >근태 사유</td>
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
                        <th class="text-center">근태번호</th>
                        <th class="text-center">근태일자</th>
                        <th class="text-center">사원명</th>
                        <th class="text-center">근태사유</th>
                        <th class="text-center">적요</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td class="text-center">0101</td>
                        <td class="text-center">2021/01/05</td>
                        <td class="text-center">심민규</td>
                        <td class="text-center">휴가</td>
                        <td class="text-center">2015 정기휴가</td>
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