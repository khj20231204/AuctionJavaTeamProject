<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/css/auctionPurchaseSelected_css.css" %>
<%@ include file="../include/header.jsp"%>

<%
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); //도로명 주소
	String engAddr = request.getParameter("engAddr"); //영어 주소
	String jibunAddr = request.getParameter("jibunAddr"); //지번 주소
	String zipNo = request.getParameter("zipNo"); //우편번호
	String addrDetail = request.getParameter("addrDetail"); //사용자가 직접 입력
%>

<link rel="stylesheet" href="/resources/css/sidebar.css" />

<script type="text/javascript" src="/resources/js/auctionJS.js" charset="UTF-8"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style type="text/css">

.titleTdMiddle{
    padding-top: 30px;
}

</style>


<script>
$(function(){

	var IMP = window.IMP;
	IMP.init('${ImPortkey}');

	$("#payment").click(function(){

		//$("#orderForm").submit();
		
		var name = $("#orderer_name").val();
		var price = $("#order_price").val();
		var tel= $("#phonenumber").val();
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '중고 동네 결제시스템',
		    amount : price,
		    buyer_email : '',
		    buyer_name : name,
		    buyer_tel : tel,
		    buyer_addr : '울산 남구 옥동',
		    buyer_postcode : '123456',
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
		       	
		       	$("#imp_uid").val(rsp.imp_uid);
		       	$("#merchant_uid").val(rsp.merchant_uid);
		       	$("#card_approval_number").val(rsp.apply_num);
		       	alert("결제 성공적으로 이루어졌습니다");
		       	
		       	$("#orderForm").submit();
		       	
		       	result = true;
		    } else {
		    	alert("결제 실패");
		    	
		        msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		        
		        result = false;
		    }
		});//IMP.request_pay	
	});
	
	//배송 메세지 
	$("#order_msg").keydown(function(){
		//alert("df");
		var msg = $(this).val();
		console.log(msg);
		var len = msg.length;
		console.log(len)
		$("#stringLengthSpan").text(len);
	});
	
	//주문자명 이름 변경 버튼을 눌렀을 때
	$("#btnChangeName").click(function(){
		$("#orderer_name").val("");
		$("#orderer_name").prop("readonly", false);
	});
	
	//연락처 변경 버튼을 눌렀을 때
	$("#btnChangeNumber").click(function(){
		var num = m_phonenumber.value;
		if(num == 0){
			alert("번호를 선택하세요");
			return;
		}
		
		var firstNum = num;
		var middleNum = $("#txtMiddlePhoneNumber").val()
		var finalNum = $("#txtFinalPhoneNumber").val();
		
		$("#spanFirstNumber").text(firstNum);
		$("#spanMiddleNumber").text(middleNum);
		$("#spanFinalNumber").text(finalNum);
		
		var phone = num + $("#txtMiddlePhoneNumber").val() + $("#txtFinalPhoneNumber").val();
		$("#phonenumber").val(phone);
		
		$("#divChangePhone").show();
		$("#divPhone").hide();
	});
	
	var msg4MiddleNum = "";
	//전화번호 가운데 숫자 4개이하
	$("#txtMiddlePhoneNumber").keydown(function(e){
	
		var msg = $(this).val();
		var len = msg.length;
		//alert(len);
		if(len <= 3){
			msg4MiddleNum = $(this).val();
		}else{
			$(this).val(msg4MiddleNum);
		}
	});
	
	var msg4FinalNum = "";
	//전화번호 가운데 숫자 4개이하
	$("#txtFinalPhoneNumber").keydown(function(e){
	
		var msg = $(this).val();
		var len = msg.length;
		//alert(len);
		if(len <= 3){
			msg4FinalNum = $(this).val();
		}else{
			$(this).val(msg4FinalNum);
		}
	});
	
	//--------------------------------------------- 주소 시작 ----------------------------------------------------------//
	$("#btnFindAddr").click(function(e) {//주소 찾기 버튼
		e.preventDefault();
		$("#modalAddrAuction").trigger("click");
	});
	
	//모달에서 주소 찾기 
	$("#modalAddrFindAuction").click(function() {
		var keyword = $("#moadlTxtAddrAuction").val();
		
		var dataAddr = {
			currentPage : "1",
			countPerPage : "1000",
			resultType : "json",
			confmKey : "devU01TX0FVVEgyMDIwMTIyNzEyMzcyMzExMDU5NDU=",
			keyword : keyword
		};

		$.ajax({
			url : "https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do" //인터넷망
			,
			type : "post"
			//,data:$("#form").serialize()
			,
			data : dataAddr,
			dataType : "jsonp",
			crossDomain : true,
			success : function(jsonStr) {
				$("#list").html("");
				var htmlStr = "";
				htmlStr += "<table style='border:1;width:300px'>";
				$(jsonStr.results.juso).each(function() {
					htmlStr += "<tr><td style='text-align:center;font-size:15px;font-family:verdana;padding:2px'><a href='#' class='roadAddrPart1' data-zip='"+this.zipNo+"'>" + this.roadAddrPart1 + "</a></td><tr>";
					htmlStr += "<tr><td style='text-align:center;font-size:13px;font-family:verdana;font-color:gray;margin-bottom:4px'>" + this.jibunAddr + "<hr></td><tr>";
					//htmlStr += "<td>" + this.zipNo + "</td>";
				});
				htmlStr += "</table>";
				$("#list").html(htmlStr);
				}
			});//ajax
		});//addrFind

		$("#list").on("click",".roadAddrPart1", function(){//모달에서 주소 링크 클릭시 값 넘기기
			var roadAddr = $(this).text();
			var jibunAddr = $(this).parent().parent().next().next().children().text();//닫는tr-> /tr 도 요소에 포함. next()에 포함시킨다
			var zip = $(this).attr("data-zip");
			alert("도로:"+roadAddr+" ,지번:"+jibunAddr);
			//console.log("zip:"+zip);
 			$("#zip").val(zip);
 			$("#road_address").val(roadAddr);
 			$("#jibun_address").val(jibunAddr);
 			$("#detail_address").val("");
			
			$("#detail_address").prop("readonly",false);
			
			$("#btnModalCloseAuction").trigger("click");
		});
	//--------------------------------------------- 주소 끝 ----------------------------------------------------------//

});

</script>

<!--  주소 찾기 모달 시작 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modalAddrAuction" href="#modalAddr-container-auction" role="button"
				class="btn" data-toggle="modal" style="display:none">주소 찾기</a>
			
			<div class="modal fade" id="modalAddr-container-auction" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
					
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">주소 입력</h5>
							<button type="button" id="btnModalCloseAuction" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						
						<div class="modal-body"> 
							<div>
								<input type="text" style="width:300px;margin-bottom:15px;font-size:15px" placeholder="주소를 입력하시오" id="moadlTxtAddrAuction" onkeydown="enterSearch();">
								<a href="#" id="modalAddrFindAuction"><img src="/resources/auctionImage/addrFind.png"></a>
							</div>
								<div id="list" style="padding-bottm:20px"></div>
								<!-- 검색 결과 리스트 출력 영역 -->
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  주소 찾기 모달 끝 -->

<!-- <div class="row"> -->
<%-- 	<div class="col-md-2"><%@ include file="auctionSideBar.jsp"%></div> --%>
<%-- 		<div class="col-md-8" ><%@ include file="../include/header_mainCatagories.jsp"%><br></div> --%>
<!-- 	<div class="col-md-2"></div> -->
<!-- </div> -->


<div class="container-fluid">
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8"><%@ include file="auctionHeader.jsp"%></div>
	<div class="col-md-2"></div>
</div>

<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div class="DetailDiv">

		<form role="form" name="orderForm" id="orderForm" action="/auction/auctionPaymentCompleteShowForm">
			<input type="hidden" name="seller" id="seller" value="${auctionSoldVo.seller}">
			<input type="hidden" name="purchaser" id="purchaser" value="${memberVo.m_id}">
<!-- 			<input type="hidden" name="orderer_name" value=""> text로 입력-->
			<input type="hidden" name="phonenumber" id="phonenumber" value="${memberVo.m_phonenumber}">
<%-- 			<input type="hidden" name="order_date" value="${nowDate}"> 결제 날짜는 폼에 보여주기만 하고 insert는 db의 sysdate로 한다--%>
<!-- 			<input type="hidden" name="order_price" value=""> text로-->
			<input type="hidden" name="imp_uid" id="imp_uid">
			<input type="hidden" name="merchant_uid" id="merchant_uid">
			<input type="hidden" name="card_approval_number" id="card_approval_number">
<!-- 			<input type="hidden" name="purchase_confirm" value=""> 디폴트 n -->
<!-- 			<input type="hidden" name="order_msg" value=""> text로 입력-->
			<input type="hidden" name="p_no" value="${auctionSoldVo.p_no}">
			<input type="hidden" name="main_img_name" value="${auctionSoldVo.main_img_name}">
			<input type="hidden" name="sold_price" value="${auctionSoldVo.sold_price}">
			<input type="hidden" name="p_no" value="${auctionSoldVo.p_no}">
			<input type="hidden" name="p_title" value="${auctionSoldVo.p_title}">
			
		<section class="DetailSection">
		<span class="mainTitle">주문서</span>
		<hr><br><br><h4>주문상품내용</h4><hr>
		<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>
									주문상품명
								</th>
<!-- 								<th> -->
<!-- 									상품수량 -->
<!-- 								</th> -->
								<th>
									판매자명
								</th>
								<th>
									배송비
								</th>
								<th>
									가격
								</th>
								<th>
									주문날짜
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td style="width:500px;">
									<img src="/furniture/displayImage?imageName=${auctionSoldVo.main_img_name}" style="width:60px;height:60px;vertical-align:middle">
									<a href="/auction/auctionSelected?p_no=${auctionSoldVo.p_no}">
									${auctionSoldVo.p_title}
									</a>
								</td>
								<td style="vertical-align:middle">
									${auctionSoldVo.seller}님
								</td>
								<td style="vertical-align:middle">
									<span>2500원</span>
								</td>
								<td style="vertical-align:middle">
									${auctionSoldVo.sold_price}원
								</td>
								<td style="vertical-align:middle">
<%-- 									<fmt:formatDate pattern="yyyy-MM-DD"  value="${auctionSoldVo.bid_date}"/> --%>
									${nowDate}
								</td>
							</tr>					
						</tbody>
					</table>
				</div>
			</div>	
			<br>
			<br>
			<h4>주문자 정보 수정</h4>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>
								<th>주문자 확인</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<td><label>주문자명:</label> <input placeholder="주문자 기입"
								name="orderer_name" id="orderer_name"
								value="${memberVo.m_name}" readonly /></td>
							<td>
								<div class="checkbox">
									<label> <input type="checkbox"
										id="chkBoxContinueName" /> 입력한 주문자명으로 다음에도 사용하기
									</label>
								</div>
							</td>
							<td>
								<button type="button" id="btnChangeName">이름변경</button>
							</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
			<br>
			<br>
			<h4>배송지 정보 입력</h4>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<thead>
							<tr>																		
								<th>
									주소
								</th>												
								<th>
									연락처
								</th>
								<th colspan='2'>
									배송 메세지
								</th>												
							</tr>
						</thead>
						<tbody>
							<tr>						
								<td>
									<button type="button" id="btnFindAddr">검색</button><br>							
								</td>
								<td>
									<label>연락처:</label>
									<select name="m_phonenumber" id="m_phonenumber" style="width:60px">	
										<option value="0">번호</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>									
									</select>
									<input type="text" style="width:90px" id="txtMiddlePhoneNumber">
									<input type="text" style="width:90px" id="txtFinalPhoneNumber">
									<button type="button" id="btnChangeNumber">변경</button>
								</td>
								<td colspan='2'>
									<input placeholder="택배 기사님께 부탁할 사항을 입력하시오" type="text" id="order_msg" name="order_msg" style="width:100%"/>(<span id="stringLengthSpan"></span>/50자)
								</td>
							</tr>					
						</tbody>
						<!-- 주소 추가 시작-->
						<tbody>
							<tr>						
								<td style="text-align:center">
									<input type="text" id="zip" name="zip" value="${auctionSoldVo.zip}" style="border:none" readonly>						
								</td>
								<td style="text-align:center">
									<input type="text" id="road_address" name="road_address" value="${auctionSoldVo.road_address}" style="border:none" readonly> /
									<input type="text" id="jibun_address" name="jibun_address" value="${auctionSoldVo.jibun_address}" style="border:none" readonly>
								</td>
								<td style="text-align:center">
									상세 주소 : <input type="text" id="detail_address" name="detail_address" value="${auctionSoldVo.detail_address}" style="width:90px;text-align:center" readonly>
								</td>
								<td style="width: 300px;text-align:center">
									<div id="divChangePhone" style="display:none"><span id="spanFirstNumber"></span>-<span id="spanMiddleNumber"></span>-<span id="spanFinalNumber"></span></div>
									<div id="divPhone">${memberVo.m_phonenumber}</div>
								</td>
							</tr>					
						</tbody>
						<!-- 주소 추가 끝 -->
					</table>
				</div>
			</div>
			<br>
			<br>
			<h4>결제 금액</h4>
			<hr>
			<div class="row">
				<div class="col-md-12" style="height: 104px;">
					<table class="table" style="text-align:center">
						<tr>
							<td>
								상품 금액
							</td>
							<td></td>
							<td>
								배송비
							</td>
							<td></td>
							<td>
								최종 결제 금액
							</td>
						</tr>
						<tr>
							<td>
 								<span style="font-size:30px">${auctionSoldVo.sold_price}</span>
 								원
							</td>
							<td>+</td>
							<td>
								<span style="font-size:30px">2500</span>원
							</td>
							<td style="vertical-align:middle">=</td>
							<td style="vertical-align:middle">
								<input type="text" name="order_price" id="order_price" style="font-size:30px;color:red;border:none;width:100px" value="${auctionSoldVo.sold_price + 2500}" readonly>원
							</td>
						</tr>
					</table>
				</div>
			</div>
			<hr>
			<br>
			<br>
			<h4>결제하기</h4>
			<hr>
			<div class="row">
				<div class="col-md-12">
					<table class="table">
						<tr>
							<td>
								<button type="button" id="payment" class="btn btn-md active disabled btn-outline-danger btn-block">
									결제하기
								</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</section>
		</form>
		
	</div>
	</div>
	<div class="col-md-2"></div>
</div>
</div>