<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script id="notice_detail-template" type="text/x-handlebars-template">
	<div class="card" style="padding:5px;">
                <div class="col-12 card-body" style="padding: 0px 8px;">
                	<div class="row" style="">
	                    <div class="col-12 table-responsive" style="padding: 5px; margin:0px;">
	                        <table class="table card-table table-vcenter text-nowrap datatable" border=1>
	                            <tbody>
									<input type="hidden" id="ntc_no" name="ntc_no" value="{{ntc_no}}" />
	                            	<tr>
	                            		<td style="width:90px; background-color: #F4F6FA;" >제목</td>
	                            		<td colspan="3" id="title" name="title">{{title}}</td>
	                            	</tr>
	                            	<tr>
	                            		<td style="width:90px; background-color: #F4F6FA;" >작성자</td>
	                            		<td id="admin_id" name="admin_id">{{admin_id}}</td>
	                            		<td style="width:90px; background-color: #F4F6FA;" >작성일</td>
	                            		<td id="wrt_ymd" name="wrt_ymd" style="width:200px;">{{dateformat wrt_ymd}}</td>
	                            	</tr>
									<tr>
	                            		<td style="background-color: #F4F6FA;" >첨부파일</td>
	                            		<td colspan="3">
											<div style="display:grid;">
												{{#each attchList}}
													<a href="<%=request.getContextPath() %>/AL/notice/getFile?ntc_no={{ntc_no}}&file_no={{file_no}}">{{file_name}}</a>
												{{else}}
													첨부된 파일이 없습니다.
												{{/each}}
											</div>
										</td>
	                            	</tr>
	                            	<tr style="height:400px; resize: none;">
	                            		<td style="background-color: #F4F6FA;">내용</td>
	                            		<td colspan="3"><textarea class="form-control" id="content" name="content" rows="6" style="height:400px;resize: none;" readonly>{{content}}</textarea></td>
	                            	</tr>
	                            </tbody>                           
	                        </table>
	                    </div>
                	</div>
                </div> 
            </div>
</script>
<script id="notice_modify-template" type="text/x-handlebars-template">
	<div class="card" style="padding:5px;">
                <div class="col-12 card-body" style="padding: 0px 8px;">
                	<div class="row" style="">
	                    <div class="col-12 table-responsive" style="padding: 5px; margin:0px;">
							<form name="modifyForm" id="modifyForm" role="form">
	                        	<table class="table card-table table-vcenter text-nowrap datatable" border=1>
	                            	<tbody>
										<input type="hidden" id="ntc_no" name="ntc_no" value="{{ntc_no}}" />
	                            		<tr>	
	                            			<td style="width:90px; background-color: #F4F6FA;" >제목</td>
	                            			<td><input type="text" name="title" class="form-control" value="{{title}}"></td>
	                            		</tr>
	    	                        	<tr style="height:400px; resize: none;">
	        	                    		<td style="background-color: #F4F6FA;">내용</td>
	            	                		<td><textarea class="form-control" id="content" name="content" rows="6" style="height:400px;resize: none;">{{content}}</textarea></td>
	                	            	</tr>
										<tr>
	                            			<td style="background-color: #F4F6FA;">등록파일 첨부</td>
	                            			<td><input type="file" id="uploadFile" class="form-control" name="uploadFile" multiple></td>
	                            		</tr>
										{{#each attchList}}
										<tr class="attch-item">
	                            			<td style="width:90px; background-color: #F4F6FA;" >첨부파일</td>
	                            			<td><a id="fileList" attach-fileName="{{file_name }}" attach-no="{{file_no }}" name="attchedFile"  href="<%=request.getContextPath() %>/AL/notice/getFile?ntc_no={{ntc_no}}&file_no={{file_no}}">
												{{file_name}}&nbsp;&nbsp;
												<button type="button" style="border:0;outline:0;" class="badge bg-red" id="subm" onclick="fileDelete()">X</button>
												</a>
											</td>
	                            		</tr>
										{{/each}}
	                    	        </tbody>                           
	                   		     </table>
							</form>
	                    </div>
                	</div>
                </div>
            </div>
</script>


 <script>
 var ntc_no;
 function closeDial(dialog){
		$(dialog).dialog("close");
	}
 function closeDetailDial(dialog){
		$(dialog).dialog("close");
	}
//팝업 내부 input 초기화
	function resetDial(dialog){
		$(dialog).find("input").not("input[type='button']").val("");
		$(dialog).find("textarea").val("");
	}

//팝업띄우기
function openDial(dialog, width, height, object){
	ntc_no = object;
	noticeDetail(object);
	
	 $(dialog).dialog({
		  classes : {
			  	"ui-dialog" : "no-pad",
			  	"ui-dialog-titlebar" : "no-radius"
			  },
	      autoOpen: false,
	      height: height,
	      width: width,
	      modal: true,
	      resizable : false,
	      close : function(event,ui){
	    	  resetDial(dialog);
	      }
	      
	  });
	  $('button.ui-dialog-titlebar-close').html('<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 30 30" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>');
		
	dialog.dialog( "open" );
	dialog.dialog({dialogClass : "index-z"});
	$(".index-z").css("z-index","2222");
	dialog.dialog("moveToTop");
}

function openDial2(dialog, width, height){
	
	noticeModifyForm(ntc_no);
	
	 $(dialog).dialog({
		  classes : {
			  	"ui-dialog" : "no-pad",
			  	"ui-dialog-titlebar" : "no-radius"
			  },
	      autoOpen: false,
	      height: height,
	      width: width,
	      modal: true,
	      resizable : false,
	      close : function(event,ui){
	    	  resetDial(dialog);
	      }
	      
	  });
	  $('button.ui-dialog-titlebar-close').html('<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 30 30" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><line x1="18" y1="6" x2="6" y2="18" /><line x1="6" y1="6" x2="18" y2="18" /></svg>');
		
	dialog.dialog( "open" );
	dialog.dialog({dialogClass : "index-z"});
	$(".index-z").css("z-index","2222");
	dialog.dialog("moveToTop");
}
 
 function noticeDetail(object) {
		$.ajax({
			url : '<%=request.getContextPath()%>/AL/notice/detail',
			data:{"ntc_no" : object},
			dataType:"json",
			type:'get',
			success:function(data){
	 			var source =$('#notice_detail-template').html();
	 			var template = Handlebars.compile(source);
	 			$('#detail').html(template(data));
			}
		});
	}
 

function noticeModifyForm(object) {
	$.ajax({
		url : '<%=request.getContextPath()%>/SY/notice/modifyForm',
		data:{"ntc_no" : object},
		type:'get',
		success:function(data){
			var source =$('#notice_modify-template').html();
 			var template = Handlebars.compile(source);
 			$('#detail1').html(template(data));
		}
	});
}

function modify(){
	var formData = new FormData($("#modifyForm")[0]);
	$.ajax({
		url:'<%=request.getContextPath()%>/SY/notice/modify',
		type:'post',
		data :formData,
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		success:function(){
			alert("공지사항 수정이 완료되었습니다.");
			closeDial('#dialog3');
			location.reload();
		},
		error:function(error, request, status){
			alert(error.status+" , "+request.responseText+" , "+status)
		}
	})
}

function remove(){
	$.ajax({
		cache : false,
		url:'<%=request.getContextPath()%>/SY/notice/remove',
		type:'get',
		data :$('#modifyForm').serialize(),
		async:false,
		success:function(){
			alert("공지사항이 삭제되었습니다.");
			closeDial('#dialog3');
			location.reload();
			
		},
		error:function(error, request, status){
			alert(error+" , "+request.responseText+" , "+status)
		}		
		
	})
}

function fileDelete(){
	event.preventDefault();	
	var parent = $('#fileList');
	if(!confirm(parent.attr("attach-fileName") + "파일을 삭제하시겠습니까?")) return false;
	
	var file_no = parent.attr("attach-no");
	
	$('#subm').parents('tr.attch-item').remove();
	
	var input=$('<input>').attr({
		"type":"hidden",
		"name":"deleteFile",
		"value":file_no
	});
	
	$('form[role="form"]').prepend(input);
	
	return false;
}
 </script> 