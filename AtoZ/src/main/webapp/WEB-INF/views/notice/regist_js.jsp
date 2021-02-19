<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>  
<script>
function submit_go(){
	if($('input[name="title"]').val()==""){
		alert("제목은 필수입니다.");
		return;
	}
	
	if($('textarea[name="content"]').val()==""){
		alert("내용은 필수입니다.");
		return;
	}

	var form=$('form[role="form"]');
	form.submit();
	alert("공지사항이 등록되었습니다.");
}
</script>