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
th{
	text-align: center;
}
.btndelete{
	width:130px;
}
.memberid{
	width:100px;
}

.membersanc{
	width:130px;
	text-align: center;
}
</style>

<script>
$(function(){
	var msg = "${msg}";
	if(msg == "selling_delete_success"){
		alert("판매자 권한을 삭제하였습니다.");
	}
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1>회원 판매자 등록 권한 관리</h1>
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
						<th class="memberid">ID</th>
						<th class="membername">이름</th>
						<th class="memberreg">가입일</th>
						<th class="memberregsell">등록일</th>
						<th class="membersanc">등록취소 횟수</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="MemberVo" items="${sellerList}">
					<tr>
						<td>${MemberVo.m_id}</td>
						<td>${MemberVo.m_name}</td>
						<td>${MemberVo.m_regdate}</td>
						<td>${MemberVo.m_selling_regdate}</td>
						<td class="membersanc">
							<c:forEach var="SanctionVo" items="${sancList}">
									<c:if test="${SanctionVo.m_id == MemberVo.m_id}">
										${SanctionVo.sanc_count}
									</c:if>
							</c:forEach>
						</td>
						<td>
							<a class="btn btns btndelete" href="/admin/adminRollbackSeller/${MemberVo.m_id}">판매권한 삭제</a>
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