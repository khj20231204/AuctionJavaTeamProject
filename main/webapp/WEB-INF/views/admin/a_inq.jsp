<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/admin_header.jsp"%>
<style>
.inqumid{
	width:70px;
}
.inqumbtn{
	width:120px;
}
.inqutitle{
	cursor: pointer;
}
.inquiryTr{
	cursor:pointer;
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
	$(function(){
		$(".inquiryTr").on("click", function(){
			var that = $(this).next();
			that.toggle();
		});
	});
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
			<table class="table">
				<thead>
					<tr>
						<th>문의자</th>
						<th>문의 제목</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="InquiryVo" items="${inquiryList}">
						<tr class="inquiryTr">
							<td class="inqumid">${InquiryVo.m_id}</td>
							<td class="inqutitle">${InquiryVo.inquiry_title}</td>
							<td class="inqumbtn"></td>
						</tr>
						<tr style="display: none;">
							<td class="inqumid"></td>
							<td>${InquiryVo.inquiry_content}</td>
							<td class="inqumbtn"><a class="btn btns" href="/admin/inquiryAnswer/${InquiryVo.inquiry_no}">답변하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>