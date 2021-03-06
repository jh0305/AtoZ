<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	    <div class="container-xl" style="width:350px; height:500px;">
	    	<!-- 콘텐츠 헤더 -->
				<div class="page-header d-print-none">
					<div class="row align-items-center">	
						<div class="col">
							<h2 class="page-title">
								공통코드 유형 검색
							</h2>
						</div>
					</div>
				</div>
				<div class="card col-12">
					<div class="card-body">
						<div class="table-responsive" style="height:380px;">
							<table class="table card-table table-vcenter text-nowrap datatable">
								<thead>
									<tr>
										<th class="text-center">유형 코드</th>
										<th class="text-center">유 형 명</th>
										<th class="text-center">사용여부</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${typeList }" var="type">
										<c:if test="${type.act_yn eq 1 }">
									<tr class="clickableTr" onclick="setSearchType('${type.type_code}')">
										<td class="text-center">${type.type_code }</td>
										<td class="text-center">${type.type_name }</td>
										<td class="text-center">${type.act_yn eq 1 ? '사용중' : '사용중지' }</td>
									</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- /table-responsive -->
					</div>
					<!-- card-body -->
				</div>
				<!-- /card col-12 -->
				<div class="row" style="margin-top : 10px;">
					<div class="col-2">
						<input type="button" class="btn btn-white" value="취소">
					</div>
				</div>
				
	    </div>
<!-- 	</div> -->