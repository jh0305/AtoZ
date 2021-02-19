<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
button.btn.btn-link {
    background-color: #ffffff;
}
.form-control:disabled, .form-control[readonly] {
    background-color: #ffffff;
    opacity: 1;
}
/* table { */
/*     width: 100%; */
/*     border: 1px solid #f4f6fa; */
/*     border-collapse: collapse; */
/*  	} */
/*    th, td { */
/*     border: 1px solid #f4f6fa; */
/*     padding: 10px; */
/*    } */
   ul.pagination {
  		margin: 0px;
}
</style>
<c:set var="searchMap" value="${pageMaker.searchMap }" />
<div style="padding: 0px 15px;">
	<div class="page-header d-print-none">
		<div class="row align-items-center">
			<div class="col">
				<h2 class="page-title">공지사항 목록</h2>
			</div>
		</div>
	</div>

	<div class="card" style="height: 883px;">
		<div class="card-header">
			<h3 class="card-title"></h3>
			<select class="form-select" id="searchType" style="display: inline-block; width: 8%; display: inline;">
				<option value="title" ${searchMap.get('searchType') eq 'title' ? 'selected' : '' }>제목</option>
			</select> <input type="text" class="form-control" id="keyword" value="${searchMap.get('keyword') }" placeholder="Search for…" style="width: 20%; display: inline;">
			<button class="btn btn-white btn-icon" aria-label="Button" style="display: inline;" onclick="search_go()">
				<svg xmlns="http://www.w3.org/2000/svg" class="icon" width="24" height="24" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none" stroke-linecap="round" stroke-linejoin="round">
						  <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
						  <circle cx="10" cy="10" r="7"></circle>
						  <line x1="21" y1="21" x2="15" y2="15"></line>
					  </svg>
			</button>
		</div>

		<div class="card-body">
			<!-- form -->
			<div class="table-responsive">
				<table class="table card-table table-vcenter text-nowrap datatable" style="table-layout: fixed;">
					<thead>
						<tr>
							<th class="col-1 text-center">번호</th>
							<th class="text-center" style="width:1000px;">제목</th>
							<th class="text-center">작성자</th>
							<th class="text-center">작성일</th>

						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty noticelist }">
								<tr>
									<td colspan="5">등록된 공지사항이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach var="notice" items="${noticelist }" varStatus="status">
									<tr class="whtr clickabletr" onclick="openDial($('#dialog'),1000,800,${notice.ntc_no });">
										<td class="text-center" id="ntc_no">${notice.rn }</td>
										<td style="text-align:left; overflow:hidden; text-overflow:ellipsis; white-space: nowrap;" id="title">${notice.title}</td>
										<td class="text-center" id="admin_id">${notice.admin_id }</td>
										<td class="text-center" id="wrt_ymd">${fn:substring(notice.wrt_ymd,0,4) }-${fn:substring(notice.wrt_ymd,4,6) }-${fn:substring(notice.wrt_ymd,4,6) }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			<!-- /form -->
		</div>
		<div class="card-footer" style="background-color: white;">
			<div style="float: left; padding-top: 4px;">
				<%@ include file="/WEB-INF/views/common/pagination.jsp"%>
			</div>
			<div style="float: right;">
				<c:if test="${loginUser.cl_type eq 'ROLE_SY' }">
					<button class="btn btn-light" onclick="openDial($('#dialog2'),1000,800);" style="float: right;">신규</button>
				</c:if>
			</div>
		</div>
	</div>
</div>
<!-- 공지사항 디테일 -->
<div id="dialog" class="dialogDiv" title="공지사항 상세보기">
		<div class="container-xl">
			<div class="page-header d-print-none">
				<div class="row align-items-center">
					<div class="col">
						<h2 class="page-title">공지사항상세보기</h2>
					</div>
				</div>
			</div>
			<div id="detail"></div>
			<div class="row">
				<c:forEach items="${notice.attchList }" var="attch">
					<div class="col-md-4 col-sm-4 col-xs-12" style="cursor: pointer;" onclick="location.href='<%=request.getContextPath() %>/attch/getFile.do?notice=${notice.ntc_no}&file_no=${attch.file_no }';">
						<div class="info-box">
							<span class="info-box-icon bg-yellow"> <i class="fa fa-copy"></i>
							</span>
							<div class="info-box-content">
								<span class="info-box-text"> <fmt:formatDate value="${attch.regDate }" pattern="yyyy-MM-dd" />
								</span> <span class="info-box-number">${attch.fileName }</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row">
				<c:if test="${loginUser.cl_type eq 'ROLE_SY' }">
					<div class="col-2" style="padding: 5px; margin: auto;">
						<button class="btn btn-light w-100" onclick="openDial2($('#dialog3'),1000,800,closeDetailDial('#dialog'))">수정</button>
					</div>
				</c:if>
				<div class="col-2" style="padding: 5px; margin: auto;">
					<button class="btn btn-light w-100" onclick="closeDial($('#dialog'))">닫기</button>
				</div>
			</div>
			<!-- card -->
		</div>
		<!-- container -->
</div>

<div id="dialog3" class="dialogDiv" title="공지사항 수정">
		<div class="container-xl">

			<div class="page-header d-print-none">
				<div class="row align-items-center">
					<div class="col">
						<h2 class="page-title">공지사항 수정</h2>
					</div>
				</div>
			</div>
			<div id="detail1"></div>
			<div class="row">
				<div class="col-2" style="padding: 5px; margin: auto;">
					<button type="button" class="btn btn-light w-100" onclick="modify()">저장</button>
				</div>
				<div class="col-2" style="padding: 5px; margin: auto;">
					<button type="button" class="btn btn-light w-100" onclick="remove()">삭제</button>
				</div>
				<div class="col-2" style="padding: 5px; margin: auto;">
					<button class="btn btn-light w-100" onclick="closeDial($('#dialog3'))">취소</button>
				</div>
			</div>
			<!-- card -->
		</div>
		<!-- container -->
</div>
<%@ include file="detail_js.jsp"%>

<div id="dialog2" class="dialogDiv" title="공지사항 등록">
	<%@ include file="regist.jsp"%>
</div>
<%-- <%@ include file="/WEB-INF/views/common/popupDial_js.jsp" %> --%>

<!-- <div id="dialog1" class="dialogDiv" title="공지사항 상세보기"> -->
<!-- 	<div id="details"></div> -->
<!-- </div> -->

<script>
function search_go(){
	var data = {
			searchType : $("#searchType").val(),
			keyword : $("#keyword").val()
	}
	searchList_go(1,'${searchMap.url}',data);
}


</script>
