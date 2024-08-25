<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>
    
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<link rel="stylesheet" href="/resources/css/sidebar.css" /> 

<script type="text/javascript">
$(function(){
	/*
	실제 거래가 이루어지려면 이니시스 관리자 홈페이지에 접속해서 가맹점 등록 후 가맹점 ID를 아이앰포트에 넣어줘야 한다
	중고거래 가입자 만다 가맹점 ID를 가지고 있어야 한다
	*/
	var IMP = window.IMP; // 생략가능
	IMP.init('${ImPortkey}');
	
	$(".payment").click(function(){
		
		var sold_price = $(this).parent().parent().next().next().find("td").eq(0).find("span").text();
		
		IMP.request_pay({
		    pg : 'inicis', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '주문명:결제테스트',
		    amount : sold_price,
		    buyer_email : '${purchaserMemberVo.email}',
		    buyer_name : '${purchaserMemberVo.m_id}',
		    buyer_tel : '${purchaserMemberVo.m_phonenumber}',
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
		       	
		       	$("#txtId").text(rsp.imp_uid);
		       	$("#txtUserId").text(rsp.merchant_uid);
		       	$("#txtPrice").text(rsp.paid_amount);
		       	$("#txtCardNum").text(rsp.apply_num);
		    } else {
		        msg = '결제에 실패하였습니다.';
		        msg += '에러내용 : ' + rsp.error_msg;
		    }
		});//IMP.request_pay	
		
		$(this).parent().hide();
	    $(this).parent().next().show();
	});
	
	/* ------------------------------------ 옆면에 아우터 이벤트 시작 ---------------------------------- */
	//메인으로
	$(".sidebar__nav > li:eq(1) > a , .sidebar__submenu:eq(1)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(1) > ul").show();	
	});
	
	$(".sidebar__nav > li:eq(1) > a , .sidebar__submenu:eq(1)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(1) > ul").hide();	
	});
	
	// 관심상품
	$(".sidebar__nav > li:eq(2) > a , .sidebar__submenu:eq(2)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(2) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(2) > a , .sidebar__submenu:eq(2)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(2) > ul").hide();
	});
	
	//내상품
	$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(3) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(3) > ul").hide();
	});
	
	/* 주문내역
	$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(4) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(4) > ul").hide();
	});
	/* ------------------------------------ 옆면에 아우터 이벤트 끝 ---------------------------------- */
});//function

</script>
<br><br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><!-- 외부 md8 -->
			<div class="col-md-2"></div>
			<div class="col-md-12">
								
				<c:forEach var="purchaserList" items="${purchaserList}" >
				<table border='1'>
					<tr>
						<td>입찰 날짜:<span>${purchaserList.bid_date}</span></td>
						<td rowspan='3'><img src="/furniture/displayImage?imageName=${purchaserList.main_img_name}" class="img-class" style="height:200px;"></td>
						<td rowspan='2'>${purchaserList.p_title}</td>
						<!-- 결제 전 버튼 시작 -->
						<td rowspan='3' class="tdPaymentBefore"><a href="#" class="payment"><img src="/resources/auctionImage/btn_payment.png"></a></td>
						<!-- 결제 전 버튼 끝 -->
						
						<!-- 결제 완료 테이블 시작-->
						<td rowspan='3' class="tdPaymentAfter" style="display:none">
							<h1>결제가 완료 되었습니다</h1>
							<table>
								<tr>
									<td>고유ID</td>
									<td>유저ID</td>
									<td>결제 금액</td>
									<td>카드 승인번호</td>
								</tr>
								<tr>
									<td id="txtId">고유ID</td>
									<td id="txtUserId">유저ID</td>
									<td id="txtPrice">결제 금액</td>
									<td id="txtCardNum">카드 승인번호</td>
								</tr>
							</table>
						</td>
						<!-- 결제 완료 테이블 끝 -->
						
					</tr>
					<tr>
						<td>최초금액:<span>${purchaserList.present_price}</span></td>
				<!-- 												<td>이미지</td> -->
				<!-- 												<td>제목</td> -->
				<!-- 												<td>결제버튼</td> -->
					</tr>
					<tr>
						<td>낙찰금액:<span class="classSold_price">${purchaserList.sold_price}</span></td>
				<!-- 												<td>이미지</td> -->
						<td>판매자:<span>${purchaserList.seller}</span></td>
				<!-- 												<td>결제버튼</td> -->
					</tr>
				</table>
				</c:forEach>
						
			</div><!-- 외부 md8 -->
			<div class="col-md-2"></div><!-- 내부 md2 -->
		</div><!-- 외부 md8 -->
		<div class="col-md-2"></div><!-- 외부 md2 -->
	</div>
</div>

<!-- 
<h1>결제가 완료 되었습니다</h1>
<table>
	<tr>
		<td>고유ID</td>
		<td>유저ID</td>
		<td>결제 금액</td>
		<td>카드 승인번호</td>
	</tr>
	<tr>
		<td id="txtId">고유ID</td>
		<td id="txtUserId">유저ID</td>
		<td id="txtPrice">결제 금액</td>
		<td id="txtCardNum">카드 승인번호</td>
	</tr>
</table>
<button type="button" id="btnPayListCheck">창닫기</button>
 -->

<!-- aside 시작 -->
<aside class="sidebar">
	<nav>
		<ul class="sidebar__nav">
		 <!-- 메인 -->
			<li>
				<a href="/auction/auctionMain" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/main3.png"/></i>
					<span class="sidebar__nav__text">메인으로</span>
				</a>
					<ul class="sidebar__submenu">
					</ul>
			</li>
		 <!-- 관심상품 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/favorite2.png"/></i>
					<span class="sidebar__nav__text">관심상품</span>
				</a>
			</li>
		 <!-- 내상품 -->
			<li>
				<a href="/auction/auctionResisterList" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/myitem2.png"/></i>
					<span class="sidebar__nav__text">내상품</span>
				</a>
			</li>
		 <!-- 주문내역 -->
<!-- 			<li> -->
<!-- 				<a href="/auction/auctionPurchaseSelected?url=auctionPurchaseSelected" class="sidebar__nav__link"> -->
<!-- 					<i class=""><img class="sidebar__img" src="/resources/auctionImage/order3.png"/></i> -->
<!-- 					<span class="sidebar__nav__text">주문 하기</span> -->
<!-- 				</a> -->
<!-- 			</li> -->
		</ul>
	</nav>
</aside>
<!-- aside 끝 -->

</body>
</html>