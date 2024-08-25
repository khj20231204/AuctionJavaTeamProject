<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProductDetail_css.css" %>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(function(){

// ------------------------------------------이니시스 결제 Script--------------------------------------------
	var IMP = window.IMP; // 생략가능
	IMP.init('${ImPortkey}');
	
	$("#btnBuy_final").click(function(){
		
		var price = 1000;
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : price,
		    buyer_email : '324@naver.com',
		    buyer_name : 'aaaa',
		    buyer_tel : '0102234556',
		    //buyer_addr : '${purchaserMemberVo.m_phonenumber}',
		    //buyer_postcode : '123-456',
		    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		}, function(rsp) {
			var msg="";
			
		    if ( rsp.success ) {
		        msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '유저 ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		       	//alert(msg);
		    } else {
		        msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		});//IMP.request_pay
	
	});
// ------------------------------------------이니시스 결제 Script--------------------------------------------
// 	if($("#getDeli").attr("checked") == "checked"){
// 		$("#getDeil_detail").css("display" , "");
// 	}

// 택배로 받기
$("#getDeli").click(function(){
	if(document.getElementById('getDeli').checked){
		$("#getDeli_detail").css("display" , "");
		$("#getDirect_detail").css("display" , "none");
		
		$("#btnPurchase").css("display" , "");
		$("#btnSendMessage").css("display" , "none");
	}
// 	console.log("ok");
});
	
// 직접 수령하기
$("#getDirect").click(function(){
	if(document.getElementById('getDirect').checked){
		$("#getDirect_detail").css("display" , "");
		$("#getDeli_detail").css("display" , "none");
		
		$("#btnPurchase").css("display" , "none");
		$("#btnSendMessage").css("display" , "");
	}
});

}); // main function

</script>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8" >
			<%@ include file="../include/header_mainCatagories.jsp"%>
		<br>
		</div>
		<div class="col-md-2"></div>
	</div>
<div class="DetailDiv" style="padding-left: 25%;">
<section class="DetailSection">
<h1>주문서</h1>
<hr>
<br>
<br>
<h4>주문상품내용</h4>
<hr>
<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>주문상품명</th>
						<th>주문 내용</th>
						<th>판매자명</th>
						<th>가격</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="productVo" items="${productList}">
					<tr>
						<td>${productVo.p_name}</td>
						<td>	
							<c:if test="${fn:length(productVo.p_content) > 10}">
								<a href="/page/content?p_no=${productVo.p_no}">${fn:substring(productVo.p_content,0,20)}...</a>
							</c:if>
						</td>
						<td>${productVo.p_seller}<span>님</span></td>
						<td>${productVo.p_price}<span>원</span></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>	
	<br>
	<br>
	<h4>물품 수령 방식</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>	
						<th>
							<input type="radio" id="getDirect" name="delivery">직접 수령&nbsp;&nbsp;&nbsp;<input id="getDeli" type="radio" name="delivery">택배 수령
						</th>
						<th>
							
						</th>
						<th>
							
						</th>												
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						</td>
						<td>

						</td>
						<td>
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
		<div id="getDeli_detail" style="display:none;">
	
	<h4>배송지 정보 입력</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>						
						<th>이름</th>												
						<th>주소</th>												
						<th>연락처</th>
						<th>배송 메세지</th>												
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td>
							<label>주문자 이름:</label>
							<input placeholder="성함을 입력하시오"/>
						</td>
						<td>
							<label>주소:</label>
							<input placeholder="우편번호 입력"/><button>우편번호 검색</button><br>
							<input placeholder="주소를 입력하시오"/>&nbsp;&nbsp;<input placeholder="상세주소를 입력하시오"/>						
						</td>
						<td>
							<label>연락처:</label>
							<input type="tel" placeholder="연락처를 입력하시오"/>
						</td>
						<td>
							<label>배송메세지:</label>
							<input placeholder="택배 기사님께 부탁할 사항을 입력하시오"/>(<span></span>/50자)
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	
	<br>
	<br>
	<h4>결제정보</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>결제정보입력</th>
						<th></th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<form>
								<input type="radio" name="cardPayment" value="cardPayment">신용/체크카드
								&nbsp;&nbsp;<input type="radio" name="bankPayment" value="bankPayment">무통장입금
								&nbsp;&nbsp;<input type="radio" name="phonePayment" value="phonePayment">휴대폰결제
							</form>
						</td>
						<td></td>						
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
</div>

<div id="getDirect_detail" style="display:none;">
	<h4>판매자에게 직접 구매하기</h4>
	<hr>
	
	<textarea cols="30" rows="5" class="form-control">
	                                                     판매자에게 남길 메시지를 적어 주세요.
	-------------------------------------------------구매 양식-------------------------------------------------
						    구매한 물품 이름 : 
								구매자 명 : 
							    남길 메시지 :
								</textarea>
								<br>
</div>
<br>
	<div id="purchaseForm_btnGroup" style="float:right;">
		<button id="btnPurchase" class="btn btn-success" style="display:none">결제하기</button> &nbsp;
		<button id="btnSendMessage" class="btn btn-success" style="display:none">메시지 보내기</button>
		<a style="float:right;" href="/page/content?p_no=${productVo.p_no}" class="btn btn-danger">취소</a>
	</div>
</section>
<aside class="DetailAside">
</aside>
</div>