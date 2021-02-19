<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script id="request-detail-template" type="text/x-handlebars-template">
          <div class="col-12 card-body" style="padding: 0px 8px; min-height:330px; overflow:auto;">
            <!-- form -->
            <div class="table-responsive">
              <table class="table card-table table-vcenter text-nowrap datatable">
                <thead>
                  <tr>
                    <th class="text-center">품목번호</th>
                    <th class="text-center">기업이름</th>
					<th class="text-center">품목명</th>
					<th class="text-center">규격</th>
                    <th class="text-center">출고예정수량</th>
                  </tr>
                </thead>
				<tbody>
                {{#each .}}
                  <tr>
					<input type="hidden" value="{{rls_no}}" name="rls_no">
                    <td class="col-2 text-center" id="item_no" name="item_no">{{item_no}}</td>
                    <td class="col-3 text-center" id="co_name" name="co_name">{{co_name}}</td>
					<td class="col-4 text-center" id="item_no" name="item_no">{{item_name}}</td>
					<td class="col-3 text-center" id="std_name" name="std_name">{{std_name}}</td>
                    <td class="col-2 text-center" id="plan_qty" name="plan_qty">{{plan_qty}}</td>
                  </tr>
				{{/each}}
                </tbody>
              </table>
            </div>
            <!-- /form -->
          </div>
</script>

<script type="text/x-handlebars-template"  id="employee-list-template">
	{{#each .}}
		<tr class="clickabletr" onclick="selectManager_go('{{emp_name}}', '{{emp_id}}')">
			<td class="text-center" id="idemp">{{emp_id}}</td>
			<td class="text-center" id="nameemp">{{emp_name}}</td>
			<td class="text-center">{{emp_job}}</td>
		</tr>
	{{/each}}
</script>
<script>

 function selectManager_go(emp_name, emp_id){
	 var name = $('#idemp').text();
	 var id = $('#nameemp').text();
	 $('#empid').val(emp_id);
	 $('#empname').val(emp_name);
	 closeDial('#dialog2');
		 
	 }
 var rls_no;
 function closeDial(dialog){
		$(dialog).dialog("close");
	}
//팝업 내부 input 초기화
	function resetDial(dialog){
		$(dialog).find("input").not("input[type='button']").val("");
		$(dialog).find("textarea").val("");
		
	}

//팝업띄우기
function openDial7(dialog, width, height, object, sts, type, emp){
// 	if (!typeof object == 'undfined') {
// 	}
		rls_no = object;
		sts_code = sts;
		cl_type = type;
		emp_name = emp;
		releaseReuestDetail(object, sts, clType, emp);
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


function releaseReuestDetail(object, sts, type, emp){
	$.ajax({
		url:'<%=request.getContextPath()%>/WC/release/releaseRequestDetail',
		data:{"rls_no" : object},
		dataType:"json",
		type:'get',
		success:function(data){
			$('#rls').val(object);
			$('#sts').val(sts);
			$('#clType').val(type);
			$('#empname2').val(emp);
			var dataList = data.dataList;
			var source =$('#request-detail-template').html();
 			var template = Handlebars.compile(source);
 			$('#releaseRequestDetail').html(template(dataList));
 			PRButton();
 			PR();
		},
		error:function(error, status){
		}
		
	})
}

function PRButton(){
	if($('#sts').val() == 'PR001'){
		$('#but')[0].style.display = 'inline-block';
		$('#clbut')[0].style.display = 'none';
	}else{
		$('#but')[0].style.display = 'none';
		$('#clbut')[0].style.display = 'inline-block';
	}
}

function PR(){
	if($('#sts').val() == 'PR001'){
		$('#pr001')[0].style.display = 'flex';
		$('#pr')[0].style.display = 'none';
	}else{
		$('#pr001')[0].style.display = 'none';
		$('#pr')[0].style.display = 'flex';
	}
}
function approve(){
	var formData = $("#approveForm").serialize();
	$.ajax({
		cache : false,
		url:'<%=request.getContextPath()%>/WH/release/releaseRequestApprove',
		type:'get',
		data :formData,
		async:false,
		success:function(){
			alert("승인이 완료되었습니다.");
			closeDial('#dialog');
			location.reload();
		},
		error:function(error, request, status){
			alert(error.status+" , "+request.responseText+" , "+status)
		}
	})
}
function reject(){
	var formData = $("#approveForm").serialize();
	$.ajax({
		cache : false,
		url:'<%=request.getContextPath()%>/WH/release/releaseRequestReject',
		type:'get',
		data :formData,
		async:false,
		success:function(){
			alert("요청 거절이 완료되었습니다.");
			closeDial('#dialog');
			location.reload();
		},
		error:function(error, request, status){
			alert(error.status+" , "+request.responseText+" , "+status)
		}
	})
}

function openDial2(dialog, width, height){
	employeeList();
	
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

function employeeList(){
		$.ajax({
			url:'<%=request.getContextPath()%>/WH/release/getEmployeeList',
			cache : false,
			async:false,
			dataType:"json",
			type:'get',
			success:function(data){
				var dataList = data.dataList;
				var source =$('#employee-list-template').html();
	 			var template = Handlebars.compile(source);
	 			$('#employeeBody').html(template(dataList));
			}
			
		})
	}

function removeRelease(){
	var formData = $("#approveForm").serialize();
	$.ajax({
		url:'<%=request.getContextPath()%>/CO/release/removeRelease',
		type:'get',
		data: formData,
		success: function(res){
			alert("출고 요청이 삭제되었습니다.");
			closeDial('#dialog');
			location.reload();
		}
	})
}

</script>
