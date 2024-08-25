<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../include/admin_header.jsp" %>
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
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<h1>회원 관리</h1>
	</div>
	<div class="col-md-4"></div>
</div>

<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<ul>
		<li><a class="btn btns" href="/admin/adminMemberCon">회원 정보 관리</a></li>
		<li><a class="btn btns" href="/admin/adminMemberSellCon">회원 판매자권한 관리</a></li>
		</ul>
	</div>
	<div class="col-md-4"></div>
</div>
<div class="row">
	<div class="col-md-4"></div>
	<div class="col-md-4">
		<a class="btn btns" href="/admin/adminForm">이전 화면으로</a>
	</div>
	<div class="col-md-4"></div>
</div>
<%@include file="../include/footer.jsp" %>