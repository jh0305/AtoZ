<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="col-12" style="padding: 0px;">
	<div class="row" style="margin-bottom: 15px; padding: 0px;">
		<div class="col-6" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px;">
				<div class="row" style="margin-bottom: 15px; padding: 0px;">
					<div class="col-2 text-center qna-subtitle" style="line-height: 36px;">작성자</div>
					<div class="col-10" style="height: 36px; display: inline-block;">
						<div class="col-12" style="padding: 0px 0px;">
							<div class="row" style="margin: 0px 0px 5px 0px;">
								<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12">
									<div class="col-12">
										<c:choose>
											<c:when test="${not empty loginUser}">
												<input type="hidden" id="guest_code" value="${loginUser.cl_code}">
												<span name="qna-w-cl_name" style="line-height: 36px;">${loginUser.cl_name}</span>
											</c:when>
											<c:otherwise>
												<input type="text" name="qna-w-cl_name" class="form-control" style="border-radius: 3px;">
											</c:otherwise>
										</c:choose>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<c:if test="${empty loginUser}">
			<div class="col-6" style="height: 36px; display: inline-block;">
				<div class="col-12" style="padding: 0px;">
					<div class="row" style="margin-bottom: 15px; padding: 0px;">
						<div class="col-2 text-center qna-subtitle" style="line-height: 36px;">비밀번호</div>
						<div class="col-10" style="height: 36px; display: inline-block;">
							<div class="col-12" style="padding: 0px 0px;">
								<div class="row" style="margin: 0px 0px 5px 0px;">
									<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12">
										<div class="col-12">
											<input type="password" id="guest_pwd" class="form-control" name="guest_pwd" maxlength="15" value="" style="border-radius: 3px;">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>		
		</c:if>
	</div>
</div>

<div class="col-12" style="padding: 0px;">
	<div class="row" style="margin-bottom: 15px; padding: 0px;">
		<div class="col-1 text-center qna-subtitle" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px; background-color: F8F8F8;">제목</div>
		<div class="col-11" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px 0px;">
				<div class="row" style="margin: 0px 0px 5px 0px;">
					<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12">
						<div class="row" style="margin: 0px 0px 5px 0px;">
							<div class="col-11" style="padding: 0px 8px 0px 0px;">
								<input type="text" id="qna-r-title" name="qna-r-title" class="form-control" maxlength="500" style="border-radius: 3px;" value="">
							</div>
							<div class="col-1" style="padding: 0px 0px;">
								<input type="checkbox" id="qna-r-secret" name="qna-r-secret" class="form-check-input"  style="height: 18px; width: 18px; margin: 9px 0px;"> <span style="line-height: 36px;">비밀글</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<textarea id="qna-r-content" name="example-textarea-input" class="form-control" rows="6" style="height: 385px; margin-bottom: 15px;">
</textarea>

<div style="text-align: right;">
	<input type="button" class="btn btn-white" value="목록보기" style="margin-right: 5px;" onclick="closeDial($('#regist'));">
	<input type="button" class="btn btn-white" value="글쓰기" onclick="goBoard(this);">
</div>

<script>     
	function goRegist(th){
		openDial($('#regist'), 800, 600);		
	}
</script>
