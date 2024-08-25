<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<script>
$(function(){
	$("#btnNoticeInsert").click(function(){
		var title = $("#notice_title").val();
		var content = $("#notice_content").val();
		
		if(title == ""){
			alert("제목을 입력해 주세요.");
			return false;
		}
		if(content == ""){
			alert("내용을 입력해 주세요.");
			return false;
		}
		
		$("#frmNoticeWrite").submit();
	});
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<form id="frmNoticeWrite" role="form" action="insertNotice" method="get">
				
				<div class="form-group">
					<label for="notice_title">제목</label>
					<input type="text" class="form-control" id="notice_title" name="notice_title" />
				</div>
				
				<div class="form-group">
					<label for="notice_content">공지내용</label>
					<textarea class="form-control" id="notice_content" name="notice_content"></textarea>
				</div>

				<button type="button" class="btn btn-primary" id="btnNoticeInsert">
					작성완료
				</button>
				<a href="/admin/adminNotice" class="btn btns">취소</a>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>