<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>
$(function(){
	$("#btnInquiry").click(function(){
		var inquiry_title = $("#inquiry_title").val();
		var inquiry_content = $("#inquiry_content").val();
		if(inquiry_title == ""){
			alert("제목을 입력하세요.");
			return false;
		}
		if(inquiry_content == ""){
			alert("내용을 입력하세요.");
			return false;
		}
		
		$("#frmInquiry").submit();
	});
})
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		
			<form role="form" id="frmInquiry" action="/service/inquiryQ" method="get">
				<input type="hidden" name="m_id" value="${sessionScope.memberVo.m_id}">
				<input type="hidden" name="email" value="${sessionScope.memberVo.email}">
				<div class="form-group">
					<label>제목</label>
					<input type="text" class="form-control" name="inquiry_title" id="inquiry_title"/>
				</div>
				
				<div class="form-group">
					<label>문의 내용</label>
					<textarea class="form-control" name="inquiry_content" id="inquiry_content"></textarea>
				</div>
				
				<div>
					<p>해당 문의는 회원님의 이메일 정보를 바탕으로 답신을 보내드립니다. 이메일을 확인해주세요.</p>
				</div>
				<button type="button" id="btnInquiry" class="btn btn-primary">
					문의하기
				</button>
			</form>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>