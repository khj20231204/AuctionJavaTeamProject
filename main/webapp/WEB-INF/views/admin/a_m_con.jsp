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
<script>
$(function(){
	var msg = "${msg}";
	if(msg == "member_delete_success"){
		alert("회원정보가 삭제되었습니다.");
	}
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1>회원 정보 관리</h1>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
			<a class="btn btns" href="/admin/adminMember">이전 화면으로</a>
			<a class="btn btns" href="/admin/adminForm">관리자 메인 화면으로</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>이름</th>
						<th>이메일</th>
						<th>연락처</th>
						<th>가입일</th>
						<th>판매자등록</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				
					<c:forEach var="MemberVo" items="${memberList}">
						<tr>
							<td>${MemberVo.m_id}</td>
							<td>${MemberVo.m_name}</td>
							<td>${MemberVo.email}</td>
							<td>${MemberVo.m_phonenumber}</td>
							<td>${MemberVo.m_regdate}</td>
							<td>
								<c:choose>
									<c:when test="${MemberVo.m_selling_regdate != null}">
									${MemberVo.m_selling_regdate}
									</c:when>
									<c:otherwise>
									미등록
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a class="btn btns" href="/admin/adminMemberDelete/${MemberVo.m_id}">회원 강제탈퇴</a>
							</td>
						</tr>
					</c:forEach>
				
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
	
</div>
<%@include file="../include/footer.jsp" %>