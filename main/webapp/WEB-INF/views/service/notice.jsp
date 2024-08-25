<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
table{
	text-align: center;
}
.noticeNo{
	width:90px;
}
.noticeWriter{
	width:100px;
}
.noticeReg{
	width:200px;
}
.noticeTitle{
	text-align: left;
}
</style>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="noticeNo">번호</th>
						<th class="noticeTitleHead">제목</th>
						<th class="noticeWriter">작성자</th>
						<th class="noticeReg">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="NoticeVo" items="${noticeList}">
						<tr>
							<td>${NoticeVo.notice_no}</td>
							<td class="noticeTitle noticeTitleHead"><a href="/service/noticeDetail/${NoticeVo.notice_no}">${NoticeVo.notice_title}</a></td>
							<td>관리자</td>
							<td class="noticeReg">${NoticeVo.notice_reg}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>