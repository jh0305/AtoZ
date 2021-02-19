<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.pagination{
		display:inline-flex; 
	}
</style>
<c:set var="search" value="${pageMaker.searchMap }" />
<ul class="pagination ">
	<li class="page-item <c:if test='${!pageMaker.prev }'>disabled</c:if>">
		<a class="page-link" href="javascript:searchList_go(${pageMaker.startPage-1 });" tabindex="-1" aria-disabled="true">
		<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="15 6 9 12 15 18" /></svg>
		</a>
	</li>
	
	<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="pageNum">
		<li class="page-item <c:if test='${pageMaker.searchMap.page == pageNum }'>active</c:if>"><a class="page-link" href="javascript:searchList_go(${pageNum },'${search.url }');">${pageNum }</a></li>
	</c:forEach>
	
	<li class="page-item <c:if test='${!pageMaker.next }'>disabled</c:if>">
		<a class="page-link" href="javascript:searchList_go(${pageMaker.endPage+1 });">
		<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round"><path stroke="none" d="M0 0h24v24H0z" fill="none"/><polyline points="9 6 15 12 9 18" /></svg>
		</a>
	</li>
</ul>


<form id="jobForm">
	<input type="hidden" name="page" value="${search.page }" />
	<input type="hidden" name="perPage" value="${search.perPage }" />
	
	<c:forEach items="${search.keys }" var="key">
		<input type="hidden" name="${key }" value="${search.get(key) }" />
	</c:forEach>
</form>

<script>
function searchList_go(page, url, data){
	if(page<1) return;
	
	if(data == null){
		var jobForm = document.getElementById("jobForm");
		$(jobForm).find("input[name='page']").val(page);
		var formData = $(jobForm).serialize();
		$(".content").load("<%=request.getContextPath()%>"+url, formData);
	} else {
		data.page = page;
		$(".content").load("<%=request.getContextPath()%>"+url, data);
	}
	
}
</script>







