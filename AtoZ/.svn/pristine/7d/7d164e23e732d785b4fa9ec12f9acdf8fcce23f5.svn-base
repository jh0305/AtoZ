<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
<style>
	hr{
		margin: 1rem 0;
	}
	.card{
		margin: 0% 2% 0% 2%;
	}
</style>
</head>
<body>
<div style="margin:1% 0% 2% 2%;">
	<strong style="font-size:1.2rem;">이미지 수정</strong>
</div>

<div class="card">
	<div class="card-body" style="min-height:0px;">
		<div id="imageModify-div">
			<script type="text/x-handlebars-template" id="imageModify-template">
				{{#each .}}
				<div name="imageParent" style="width:30%; margin:auto; display:inline-block;">
					<div class="pictureView" style="background-image:URL(<%=request.getContextPath()%>/WC/member/getPicture?pic_name={{pic_name}}); width:200px;height:100px; background-position:center; background-size:cover; background-repeat:no-repeat;"></div>
					<div style="margin-top:1%;">
						<input type="file" class="form-control" style="margin-top:1%; display:inline-block; text-align:center; width:62%;" onchange="">
						<input type="hidden" value="{{pic_name}}" name="fileName"> 
						<input type="button" class="btn btn-white" value="수정" style="display:inline-block; width:30%;">
					</div>
				</div>
				{{/each}}
			</script>
		</div>
	</div>
</div>

<div style="margin-top:2%; margin-left:2%;">
	<input type="button" class="btn btn-white" id="cancelBtn" value="취소" onclick="closeDial($('#dialog1'))"/>
</div>
<script>
function imgChange() {
	
}
</script>