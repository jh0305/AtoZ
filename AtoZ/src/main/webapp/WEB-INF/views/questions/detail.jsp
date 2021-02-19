<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="col-12" style="padding: 0px;">
	<div class="row" style="margin-bottom: 15px; padding: 0px;">
		<div class="col-1 text-center qna-subtitle" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px; background-color: F8F8F8;">제목</div>
		
		<div class="col-11" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px 0px;">
				<div class="row" style="margin: 0px 0px 5px 0px;">
					<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12">
						<div class="row" style="margin: 0px 0px 5px 0px;">
							<div class="col-12" style="padding: 0px 0px 0px 0px;">
								<span id="title" name="title" style="line-height: 36px;">제목</span>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
</div>

<div class="col-12" style="padding: 0px;">
	<div class="row" style="margin-bottom: 15px; padding: 0px;">
		<div class="col-6" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px;">
				<div class="row" style="margin-bottom: 15px; padding: 0px;">
					<div class="col-2 text-center qna-subtitle" style="line-height: 36px;">등록일</div>
					<div class="col-10" style="height: 36px; display: inline-block;">
						<div class="col-12" style="padding: 0px 0px;">
							<div class="row" style="margin: 0px 0px 5px 0px;">
								<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12">
									<div class="col-12">
										<span id="qna-reg-ymd" name="qna-reg-ymd" style="line-height: 36px;">2021-01-24</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-6" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px;">
				<div class="row" style="margin-bottom: 15px; padding: 0px;">
					<div class="col-2 text-center qna-subtitle" style="line-height: 36px;">조회수</div>
					<div class="col-10" style="height: 36px; display: inline-block;">
						<div class="col-12" style="padding: 0px 0px;">
							<div class="row" style="margin: 0px 0px 5px 0px;">
								<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12">
									<div class="col-12">
										<span id="qna-hit-cnt" name="qna-hit-cnt" style="line-height: 36px;">10</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<textarea id="w-content" name="example-textarea-input" class="form-control" rows="6" style="height: 385px; margin-bottom: 15px;">

</textarea>

<div id="detail-reply-div" class="col-12" style="border-top: 1px solid #B2B2B2;padding: 10px 5px 0px 0px; height: 55px;">
	
</div>

<!-- <div class="col-12" style="border-top: 1px solid #B2B2B2; padding-top: 10px;"> -->
<!-- 	<div class="row" style="margin-bottom: 15px; padding: 0px;"> -->
<!-- 		<div class="col-6" style="height: 36px; display: inline-block;"> -->
<!-- 			<div class="col-12" style="padding: 0px;"> -->
<!-- 				<div class="row" style="margin-bottom: 15px; padding: 0px;"> -->
<!-- 					<div class="col-4 text-center qna-subtitle" style="line-height: 36px;">작성자</div> -->
<!-- 					<div class="col-8" style="height: 36px; display: inline-block;"> -->
<!-- 						<div class="col-12" style="padding: 0px 0px;"> -->
<!-- 							<div class="row" style="margin: 0px 0px 5px 0px;"> -->
<!-- 								<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12"> -->
<!-- 									<div class="col-12"> -->
<!-- 										<input type="text" id="guest_name" class="form-control" name="qna-title" value="" style="border-radius: 3px;"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 		<div class="col-6" style="height: 36px; display: inline-block;"> -->
<!-- 			<div class="col-12" style="padding: 0px;"> -->
<!-- 				<div class="row" style="margin-bottom: 15px; padding: 0px;"> -->
<!-- 					<div class="col-4 text-center qna-subtitle" style="line-height: 36px;">비밀번호</div> -->
<!-- 					<div class="col-8" style="height: 36px; display: inline-block;"> -->
<!-- 						<div class="col-12" style="padding: 0px 0px;"> -->
<!-- 							<div class="row" style="margin: 0px 0px 5px 0px;"> -->
<!-- 								<div style="display: inline-block; height: 36px; padding: 0px;" class="col-12"> -->
<!-- 									<div class="col-12"> -->
<!-- 										<input type="password" id="guest_pwd" class="form-control" name="guest_pwd" maxlength="15" value="" style="border-radius: 3px;"> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- </div> -->

<div class="col-12" style="padding-top: 10px;padding-bottom: 10px;border-top: 1px solid #B2B2B2;">
	<div class="row" style="padding: 0px; height: 70px;">
		<div class="col-2 text-center qna-subtitle" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 70px; background-color: F8F8F8;">댓글</div>
		<div class="col-10" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px 0px;">
				<div class="row" style="margin-bottom: 15px; padding: 0px;">
					<div class="col-10 text-center qna-subtitle" style="line-height: 36px;">
						<textarea id="detail_cont" name="detail_cont" class="form-control" style="height: 70px;"></textarea>
					</div>
					<div class="col-2" style="height: 36px; display: inline-block;">
						<div class="col-12" style="padding: 0px 0px;">
							<input type="button" class="btn btn-white" value="확인" style="width: 100%; height: 70px;" onclick="goReply(this);">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="col-12" style="border-top: 1px solid #B2B2B2; padding-top: 10px;">
	<div class="row" style="padding: 0px;">
		<div class="col-2 text-center qna-subtitle" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px; background-color: F8F8F8;">이전글</div>
		<div class="col-10" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px 0px;">
				<a href="#" class="link" title="">
					<span style="line-height: 36px;">이전 목록이 없습니다.</span>
				</a>
			</div>
		</div>
	</div>
</div>
<hr style="margin: 10px 0px;">
<div class="col-12" style="margin-bottom: 15px; border-bottom: 1px solid #B2B2B2; padding-bottom: 10px;">
	<div class="row" style="padding: 0px;">
		<div class="col-2 text-center qna-subtitle" style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px; background-color: F8F8F8;">다음글</div>
		<div class="col-10" style="height: 36px; display: inline-block;">
			<div class="col-12" style="padding: 0px 0px;">
				<a href="#" class="link" title="">
					<span style="line-height: 36px;">이전 목록이 없습니다.</span>
				</a>
			</div>
		</div>
	</div>
</div>

<div style="text-align: right;">
	<input type="button" class="btn btn-white" value="수정" style="margin-right: 5px;" onclick="goModify(this);"> 
	<input type="button" class="btn btn-white" value="삭제" style="margin-right: 5px;" onclick="goDelete(this);"> 
	<input type="button" class="btn btn-white" value="목록보기" style="margin-right: 5px;" onclick="closeDial($('#detail'));"> 
	<input type="button" class="btn btn-white" value="글쓰기" onclick="goBoard();">
</div>

<script>
	function goModify(){
		openDial($('#password'), 400, 150);
	}
	function goDelete(){
		openDial($('#password'), 400, 150);
	}
	
</script>

<script type="text/x-handlebars-template" id="detail-reply-div-template">
{{#each dataList}}
    <div class="row" style="padding: 0px;margin-bottom: 15px;">
        <div class="col-2 text-center qna-subtitle"
            style="display: inline-block; padding: 0px 0px; height: 36px; line-height: 36px; background-color: F8F8F8;">
            {{cl_name}} :</div>
        <div class="col-8" style="font-size: 12px;height: 36px;display: inline-block;">
            <div class="col-12" style="padding: 0px 0px;">
                <input type="text" class="form-control" maxlength="500"
                    style="border-radius: 3px; border: 0;" value="{{content}}">
            </div>
        </div>
        <div class="col-1" style="font-size: 12px;height: 36px;display: inline-block;">
            <input type="button" class="btn btn-white" value="수정" style="margin-right: 5px;" onclick="goReplyModify(this);">
        </div>
        <div class="col-1" style="font-size: 12px;height: 36px;display: inline-block;">
            <input type="button" class="btn btn-white" value="삭제" style="margin-right: 5px;" onclick="goReplyDelete(this);">
        </div>
    </div>
{{/each}}
</script>
