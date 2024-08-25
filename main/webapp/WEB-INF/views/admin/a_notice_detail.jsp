<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
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
#btnNoticeDelete{
	float: right;
}

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
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
			<a class="btn btns" href="/admin/adminNotice">이전 페이지</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div id="notice">
		<h3>${noticeDetail.notice_title}</h3>
		<ul id="administrator">
			<li>${noticeDetail.notice_reg}</li>
			<li>관리자</li>
		</ul>
		<a href="/admin/noticeDelete/${noticeDetail.notice_no}" class="btn btns" id="btnNoticeDelete">삭제</a>
		<br>
		<hr>
		<ul>
			<li id="noticeContent">${noticeDetail.notice_content}</li>		
		</ul>
	</div>
</div>
<div class="col-md-3"></div>
</div>