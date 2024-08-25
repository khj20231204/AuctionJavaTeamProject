<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
table{
	border:1px;
}

table,tr, td, th{
	border-bottom:1px solid gray;
 	padding-top:30px; 
 	padding-bottom:30px; 
 	text-align:center; 
 	font-style:verdana; 
 	border-collapse:collapse; 
}
td,th{
	padding-left:20px;
	padding-right:20px;
}
button{
	margin-left:10px;
	margin-right:10px;
}
</style>
    
<script>
$(function(){
	$("#btnMain").click(function(){
		location.href="/auction/auctionMain";
	})
	
	$("#btnPayList").click(function(){
		location.href="/auction/auctionPaymentList";	
	});
	
})
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<table border=1>
				<tr>
					<td colspan='4'><img src="/resources/auctionImage/title_complete_step.gif"></td>
<!-- 						<td>2</td> -->
<!-- 						<td>3</td> -->
<!-- 						<td>4</td> -->
				</tr>
				<tr>
<!-- 					<td></td> -->
					<td style="text-align:center" colspan='4'><img src="/resources/auctionImage/txt_order.gif"></td>
<!-- 					<td></td> -->
				</tr>
				<tr>
				<!-- 주문 내역 테이블 시작 -->
					<td colspan='4'>
						<table style="width:100%">
						<thead>
							<tr><th><img src="/resources/auctionImage/icon_order_pd.gif"></th><th>판매자명</th><th>배송비</th><th>가격</th></tr>
						</thead>
						<tbody>
							<tr style="text-align:center" >
								<td>
									<img src="/furniture/displayImage?imageName=${auctionSoldVo.main_img_name}" style="width:60px;height:60px;vertical-align:middle">
									${auctionSoldVo.p_title}
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
							</tr>					
						</tbody>
						</table>
					</td>
					<!-- 주문 내역 테이블 끝 -->
				</tr>
				<tr>
				<!-- 배송지 정보 시작 -->
					<td style="padding-left:100px;padding-top:0px;">
						<table>
							<tr>
								<td colspan='2'><img src="/resources/auctionImage/icon_oder_price.gif"></td>
							</tr>
							<tr>
								<td>총 결제 금액</td>
								<td>${auctionOrderVo.order_price}</td>
							</tr>
							<tr>
								<td>상품 금액</td>
								<td>${auctionSoldVo.sold_price}원</td>
							</tr>
							<tr>
								<td>배송비</td>
								<td>2500원</td>
							</tr>
							<tr>
								<td><a href="/auction/auctionMain"><img src="/resources/auctionImage/btn_order_main.gif"></a></td>
								<td><a href="/auction/auctionPaymentList"><img src="/resources/auctionImage/btn_order_delivery.gif"></a></td>
							</tr>
						</table>
					</td>
					<!-- 배송지 정보 끝-->
					<!-- 결제 금액 시작 -->
					<td colspan='3' style="padding-left:50px">
						<table>
							<tr>
								<td colspan='2'><img src="/resources/auctionImage/icon_order_addr.gif"></td>
							</tr>
							<tr>
								<td>이름</td><td>${auctionOrderVo.orderer_name}</td>
							</tr>
							<tr>
								<td>결제번호</td><td>${auctionOrderVo.card_approval_number}</td>
							</tr>
							<tr>
								<td>상점ID</td><td>${auctionOrderVo.merchant_uid}</td>
							</tr>
							<tr>
								<td>주소</td><td>${auctionOrderVo.road_address}</td>
							</tr>
							<tr>
								<td>상세주소</td><td>${auctionOrderVo.detail_address}</td>
							</tr>
							<tr>
								<td>남기고 싶은 말</td><td>${auctionOrderVo.order_msg}</td>
							</tr>
						</table>
					</td>
					<!-- 결제 금액 끝 -->
				</tr>
			</table>
			<div style="padding-top:50px;text-align:center">
			</div>
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>