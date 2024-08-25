<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
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
	var msg = "${msg}";
	if(msg == "notice_delete_success"){
		alert("삭제되었습니다.");
	} else if(msg=="notice_write_success"){
		alert("공지사항이 작성되었습니다.");
	}
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
			<a class="btn btns" href="/admin/adminService">이전 페이지</a>
			<a class="btn btns" href="/admin/adminForm">관리자 페이지 홈으로</a>
		</div>
		<div class="col-md-4"></div>
	</div>
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
							<td class="noticeTitle noticeTitleHead"><a href="/admin/noticeDetail/${NoticeVo.notice_no}">${NoticeVo.notice_title}</a></td>
							<td>관리자</td>
							<td class="noticeReg">${NoticeVo.notice_reg}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<a href="/admin/adminNoticeWrite" class="btn btns btn-xlarge">글쓰기</a>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>