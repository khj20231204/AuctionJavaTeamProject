<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="/resources/css/header_css.css" %>
<%@ include file="/resources/css/loginForm_css.css" %>
<%@ include file="/resources/css/footer_css.css"%>
<%@ include file="/resources/css/admin.css"%>
<style>


</style>
<script>
	$(function(){
		$("#moveMain").click(function(){
			$("#frmMain").submit();
		})
	});
</script>
<body>
 	<div class="container-fluid header_body">
		<div class="row">
			<!--top-header -->
			<div class="col-md-12 topHeader">
				<div class="col-md-2"></div>
				
					<div class="col-md-8">
						
						<a href="/logout" class="btn btn-link topHeader-button">로그아웃</a>
						<a href="/service/serviceMain" class="btn btn-link topHeader-button">고객 센터</a>
						<a href="/" class="btn btn-link topHeader-button">쇼핑몰 페이지로</a>
						
					</div>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<h1 id="moveMain">관리자 페이지</h1>
					<form style="display: none" id="frmMain" action="/admin/adminForm" method="get"></form>
				</div>
				<div class="col-md-3"></div>
			</div>
		</div>