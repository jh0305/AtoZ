<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <div class="container-xl">

            <div class="page-header d-print-none">
                <div class="row align-items-center">
                    <div class="col">
                        <h2 class="page-title">
                            공지사항 등록
                        </h2>
                    </div>
                </div>
            </div>
			
            <div class="card" style="padding:5px;">
                <div class="col-12 card-body" style="padding: 0px 8px;">
                	<div class="row" style="">
	                    <div class="col-12 table-responsive" style="padding: 5px; margin:0px;">
	                    <form enctype="multipart/form-data" action="<%=request.getContextPath()%>/notice/regist" method="post" role="form" name="registform" id="registForm" >
	                        <table class="table card-table table-vcenter text-nowrap datatable" border=1>
	                            <tbody>
	                            
	                            	<tr>
	                            		<td style="width:90px; background-color: #F4F6FA;" >제목</td>
	                            		<td><input type="text" class="form-control" id="title" name="title" ></td>
	                            	</tr>
<!-- 	                            	<tr> -->
<!-- 	                            		<td style="width:90px; background-color: #F4F6FA;" >작성자</td> -->
<%-- 	                            		<td><input type="text" class="form-control" name="admin_id" value="${loginUser.id }" readonly></td> --%>
<!-- 	                            	</tr> -->
	                            	<tr>
	                            		<td style="background-color: #F4F6FA;">내용</td>
	                            		<td><textarea class="form-control" id="content" name="content" rows="6" style="height:400px;resize: none;"></textarea></td>
	                            	</tr>
	                            	<tr>
	                            		<td style="background-color: #F4F6FA;">등록파일 첨부</td>
	                            		<td><input type="file" id="file" class="form-control" name="uploadFile" multiple></td>
	                            	</tr>
	                            	
	                            </tbody>                           
	                        </table>
		                    <div class="row">
			                    <div class="col-2" style="padding:5px; margin: auto;">
			                    	<button type="button" class="btn btn-light w-100" id="registBtn" onclick="submit_go()">
					                  	등록
					                </button>
		                    	</div>
		                    	<div class="col-2" style="padding:5px; margin: auto;">
			                    	<button class="btn btn-light w-100" onclick="close()">취소</button>
		                    	</div>
		                    </div>
	                        </form>
	                    </div>
                	</div>
                </div>
                <!-- card-body -->
            </div>
            <!-- card --> 
        </div>
        <!-- container -->
<%@ include file="regist_js.jsp"%>