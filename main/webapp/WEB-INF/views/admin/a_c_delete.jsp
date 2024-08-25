<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@include file="../include/admin_header.jsp" %>
<style>
h1{
	text-align: center;
}
.categoryMenu {					/* 상품 리스트 전체 길이 */
	padding-left : 700px;
	padding-bottom : 5px;
 	background-color : white;
	text-align:center;
	color: black;
	font-size : 22px;
	border: 1px solid white;
}
.categoryno{
	text-align: center;
	width:140px;
}
.categoryname{
	text-align: center;
	
}
.categorybtn{
	text-align: center;
	width:90px;
}
li{
	float: left;
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
}

a.btns:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 40, 200, 0.7) 0 0px 0px 40px inset;
}
</style>
<script>
$(function(){
	var msg = "${msg}"
	if(msg == "success"){
		alert("삭제되었습니다.");
	}
})
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12" style="text-align: center"><h1>카테고리 삭제</h1></div>
	</div>
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3" style="text-align: center">
			<ul>
				<li><a class="btn btns" href="/admin/adminCategory">이전 화면으로</a></li>
				<li><a class="btn btns" href="/admin/adminForm">관리자 메인 화면으로</a></li>
			</ul>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row listMain">
		<ul class="nav nav-tabs categoryMenu">
			<li class="nav-item"><a class="nav-link" href="/admin/adminCategoryDelete">전체</a></li>
			<c:forEach var="firstCategory" items="${firstCategory}">
				<li class="nav-item"><a class="nav-link" href="/admin/categoryDeletePage/${firstCategory.cate_no}">${firstCategory.cate_name}</a></li>			
			</c:forEach>
		</ul>
	</div>
	
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="categoryno">카테고리 번호</th>
						<th class="categoryname">카테고리 이름</th>
						<th class="categorybtn"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="CategoryVo" items="${categoryList}">
					<tr>
						<td class="categoryno">${CategoryVo.cate_no}</td>
						<td class="categoryname">${CategoryVo.cate_name}</td>
						<td class="categorybtn">
							<a href="/admin/CategoryDelete/${CategoryVo.cate_no}" class="btn btns categoryDelete">삭제</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>