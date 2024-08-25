<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="include/header.jsp"%>


<script>
$(function(){
	$("#btnBuy").click(function(){
		var current_id = "${sessionScope.memberVo.m_id}";
		
		if(current_id == null || current_id == ""){
			alert("로그인 하시오.");
			return;
		} else {
			
			var p_no = '${productVo.p_no}';
	// 		console.log(p_no);
			location.href = "/page/purchase?p_no=${productVo.p_no}"
		}
	});
	
	$("#btnBuy2").click(function(){
		var current_id = "${sessionScope.memberVo.m_id}";
		console.log("current_id:" + current_id);
		var p_no = "${productVo.p_no}";
		console.log("p_no:" + p_no);
		
		var url = "/buyComputerProduct/putBasketProduct";
		
		var sendData = {
				"m_id" 	: current_id,
				"p_no"	: p_no
		};
		
		if(current_id == null || current_id == ""){
			alert("로그인 하시오.");
		}else{
			$.post(url,sendData,function(data){
				if(data == "success"){
					alert("해당 상품을 장바구니에 추가하였습니다.");
				}
			});
		}		
	});
	
}); // main function

</script>


<div class="row">
	<div class="col-md-12 borderAllCategory" id="borderAllCategory">
		<div class="col-md-2"></div>
		<div class="col-md-8" >
			<%@ include file="include/header_mainCatagories.jsp"%>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
		
<div class="row" style="padding-top: 3%">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<img id="content_img" src="/resources/image/${productVo.p_thumbimg}"/>
	</div>
	
	<div class="col-md-2"></div>
	
</div>

<div class="row" style="padding-top: 3%">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div id="divContent">
			<span id="content_p_name">${productVo.p_name}</span>
		</div>
		
	</div>
	
	<div class="col-md-2"></div>
	
</div>

<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" id="content_detail_info">
			<span class="content_span2">${productVo.p_seller}</span><br>
			<span class="content_span4">${productVo.road_address}<br><span>신용등급 ★★★★☆</span></span><br>
			<button type="button" class="btn btn-primary" id="btnBuy">구매 하기</button>
			<button type="button" class="btn btn-outline-warning" id="btnBuy2">장바구니에 담기</button>
		</div>
			
		<div class="col-md-2"></div>
</div>

<div class="row" style="padding-top: 3%">
		<div class="col-md-2"></div>
		<div class="col-md-8" style="text-align:center;">
			<span id="span_detail">상품 상세정보</span><br>
			<span>${productVo.p_content}</span>
			<span><img id="content_detail_img"src="/resources/image/${productVo.p_thumbimg}"/></span><br>
			
		</div>
		<div class="col-md-2"></div>
</div>
<br>
	
	


