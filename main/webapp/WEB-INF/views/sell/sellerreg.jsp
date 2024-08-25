<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/terms.css" %>
<%@ include file="../include/header.jsp"%>
<style>
.check{
	position:relative;
	left:500px;
}
#sellerReg{
	margin-left: 520px;
}
</style>
<script>
$(function(){
	$(".check1").click(function(){
		$("#termCheck").trigger("click");
	});
	$(".check2").click(function(){
		$("#dataCheck").trigger("click");
	});
	$("#sellerReg").click(function(){
		var checked1 = $("#termCheck").prop("checked");
		var checked2 = $("#dataCheck").prop("checked");
		if(checked1 && checked2){
			$(this).attr("href", "/sellproduct/registrationRun");
			$(this).trigger("click");
		} else {
			alert("약관에 동의해주시기 바랍니다.");
		}
	});
});
</script>
<div align="center">
	<h1>판매자 이용 약관 동의</h1>
</div>
<div class="col-md-3"></div>
	<div class="col-md-6">
		<%@include file="regTerm.jsp" %>
		<input type="checkbox" class="check" id="termCheck">
		<label class="check check1">이 약관을 모두 읽었고, 내용에 동의합니다.(필수)</label>
		<%@include file="regInclude.jsp" %>
		<input type="checkbox" class="check" id="dataCheck">
		<label class="check check2">이 약관을 모두 읽었고, 내용에 동의합니다.(필수)</label>
		<br>
	</div>
	<div class="col-md-3"></div>

	<a class="btn btn-primary" href="#" id="sellerReg">등록</a>

<%@ include file="../include/footer.jsp"%>