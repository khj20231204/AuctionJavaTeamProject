<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>

#notice{
	border:2px solid #CCC;
	padding:20px;
	width:900px;
	text-align: center;
}

h3 {
	color:#000;
	font-size:30pt;
	margin:0 0 5px 0;
	padding:0 0 0 18px;
}

ul {
	list-style: none;
	margin:0;
	padding:0;
	text-align: center;
}

#administrator{
	text-align: right;
}
#noticeContent{
	text-align: left;
}
</style>
<div class="row">
</div>
<div class="row">
<div class="col-md-3"></div>
<div class="col-md-6">
	<div id="notice">
		<h3>${noticeDetail.notice_title}</h3>
		<ul id="administrator">
			<li>${noticeDetail.notice_reg}</li>
			<li>관리자</li>
		</ul>
		<hr>
		<ul>
			<li id="noticeContent">${noticeDetail.notice_content}</li>		
		</ul>
	</div>
</div>
<div class="col-md-3"></div>
</div>
<div class="row">
	<div class="col-md-3"></div>
	<div class="col-md-6">
		<a href="/service/notice" class="btn btn-info">돌아가기</a>
	</div>
	<div class="col-md-3"></div>
</div>