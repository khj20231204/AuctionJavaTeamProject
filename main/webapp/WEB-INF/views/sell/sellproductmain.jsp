<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<style>
div{
	text-align: right;
}
h1{
	margin:0 auto;
}
#btn-tab ul {
  overflow: hidden;
}
#btn-tab li {
  float: left; width: 150px; text-align: left;
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
	box-shadow: rgba(30, 22, 54, 0.7) 0 0px 0px 40px inset;
}

</style>
<script>
$(function(){
	var msg = "${msg}";
	if(msg == "sellerReg"){
		alert("판매자 등록이 완료되었습니다.");
	} else if(msg == "Count3") {
		alert("3회 이상 정지를 당하셨기때문에 판매자등록이 불가능합니다.");
	}
})
</script>
<div class="row">
<div class="col-md-4"></div>
<div calss="col-md-4" id="btn-tab">
<c:choose>
	<c:when test="${sessionScope.memberVo.m_selling == 0}">
		<h1>판매자 등록이 필요합니다.</h1>
		<ul>
			<li><a href="/sellproduct/registration" class="btn">판매자 등록</a></li>
			<li><a href="/" class="btn">돌아가기</a></li>
		</ul>
		
		
	</c:when>
	
	<c:otherwise>
		<h1>판매자 등록된 회원입니다.</h1>
		<ul>
			<li><a href="/sellproduct/sellproduct" class="btn btns">판매하기</a></li>
			<li><a href="/" class="btn btns">돌아가기</a></li>
		</ul>
	</c:otherwise>
</c:choose>
</div>
<div class="col-md-4"></div>
</div>