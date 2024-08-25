<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
table td{
	vertical-align: middle;
}
.listMenu{
	text-align: center;
	font-size:15px;
}
.inquiry{
	font-size: 11px;
}
.cate_name{
	width:200px;
	font-size:15px;
	text-align: center;
}
.cate_content{
	width:1000px;
}
.cate_btn{
	text-align:center;
	width:50px;
}
.cate_btns{
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	text-decoration: none;
	border-radius: 4px;
}
.cate_btns:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

.trShow{
	top: 50%;
	left: 50%;
	text-align: center;
}
</style>
<script>
	$(function(){
		$(".trShow").on("click", function(){
			$(this).next().toggle();
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<ul class="nav nav-tabs listMenu">
				<c:forEach var="qaCategory" items="${firstQACategory}">
					<li class="nav-item"><a class="nav-link" href="/service/Q&ACategory/${qaCategory.qa_cate_no}">${qaCategory.qa_cate_name}</a></li>
				</c:forEach>
			</ul>	
		</div>
		<div class="col-md-3"></div>
	</div>
	
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<table class="table">
				<tbody>
				<c:forEach var="QandAVo" items="${QAList}">
					<tr class="trShow">
						<c:forEach var="QACateVo" items="${qaCategoryList}">
							<c:if test="${QandAVo.qa_cate_no == QACateVo.qa_cate_no}">
								<td class="cate_name">${QACateVo.qa_cate_name}</td>
							</c:if>
						</c:forEach>
						<td class="cate_content">${QandAVo.q_content}</td>
						<td class="cate_btn "><p class="btn cate_btns">+</p></td>
					</tr>
					<tr style="display: none;">
						<td class="cate_name"></td>
						<td class="cate_content">
							${QandAVo.a_content}<br>
							<div class="inquiry">
								더 궁금하신 사항이 있으시다면 <a href="/service/inquiry?m_id=${memberVo.m_id}">1:1문의</a>를 이용해주세요.<br>
								로그인 회원만 이용 가능합니다.
							</div>
						</td>
						<td class="cate_btn"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>
