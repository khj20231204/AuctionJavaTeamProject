<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<style>
a.btns{
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	text-decoration: none;
	border-radius: 4px;
	float:left;
}

a.btns:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 40, 200, 0.7) 0 0px 0px 40px inset;
}
</style>
<script>
$(function(){
	var msg = "${msg}";
	if(msg=="qa_insert_success"){
		alert("Q&A가 추가되었습니다.");
	} else if(msg == "qa_cate_insert_success"){
		alert("Q&A 카테고리가 추가되었습니다.");
	}
});
</script>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<h1>고객센터 Q&amp;A 관리</h1>
	</div>
	<div class="col-md-4"></div>
</div>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<a class="btn btns" href="/admin/adminQandAInput">Q&amp;A 추가</a>
		<a class="btn btns" href="/admin/adminQandADelete">Q&amp;A 수정/삭제</a>
		<a class="btn btns" href="/admin/adminQandACategoryInput">Q&amp;A 카테고리 추가</a>
		<a class="btn btns" href="/admin/adminQandACategoryDelete">Q&amp;A 카테고리 삭제</a>
	</div>
	<div class="col-md-4"></div>
</div>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<a class="btn btns" href="/admin/adminService">이전 페이지</a>
		<a class="btn btns" href="/admin/adminForm">관리자 페이지 홈으로</a>
	</div>
	<div class="col-md-4"></div>
</div>