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
}

a.btns:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 40, 200, 0.7) 0 0px 0px 40px inset;
}
li{
	float:left;
}
</style>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<ul>
			<li><a class="btn btns" href="/admin/adminMember">회원 관리</a></li>
			<li><a class="btn btns" href="/admin/adminDetail">게시물 관리</a></li>
			<li><a class="btn btns" href="/admin/adminCategory">카테고리 관리</a></li>
			<li><a class="btn btns" href="/admin/adminService">고객센터</a></li>
		</ul>
	</div>
	<div class="col-md-3"></div>
</div>
<%@include file="../include/footer.jsp" %>