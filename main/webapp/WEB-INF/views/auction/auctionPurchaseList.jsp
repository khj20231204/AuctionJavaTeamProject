<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
.tablePurchase{
	margin-bottom: 24px;
	width: 800px; 
	height: 150px;
}

.tdPurchase{
	border-right-width: 3px;
	width: 300px;
	font-size:14px;
    padding-left: 17px;
	
}

.tabTitle{
	font-family: verdana;
	font-size:16px;
/* 	text-shadow: 1px 1px 1px rgba(0,0,0,0.2); */
}

.tabMd3{
	padding:20px;
}

table{
	font-family: verdana;
	text-align:center;
	vertical-align:middle;
}

input[type=text]{
	text-align:center;
	border-left-width:0;
	border-right-width:0;
	border-top-width:0;
	border-bottom-width:1;
}
</style>

<script type="text/javascript">

$(function(){
	$("#purchaseBidingItem").click(function(){
		$("#purchaseBidingItemContent").show();
		$("#purchaseItemContent").hide()
		//$("#registerItemContent").hide();
	});
	
	$("#purchaseItem").click(function() {//tab4클릭시
		$("#purchaseBidingItemContent").hide();
		$("#purchaseItemContent").show()
		//$("#registerItemContent").hide();
	})
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><%@ include file="auctionHeader.jsp"%></div>
		<div class="col-md-2"></div>
	</div>
		
	<div class="row">	
		<div class="col-md-3"></div>
		<div class="col-md-6">
		
		<div><div style="float:left"><img src="/resources/auctionImage/btnPurchaser.png" height="40px"></div><h1>구매 상품</h1></div>
			<!-- tab 시작 -->
			<div class="row">
				<div class="col-md-12" style="margin-top:50px;text-align:center">
					<div class="tabbable" id="tabs-222970">
						<ul class="nav nav-tabs">
							<li class="nav-item"><a class="nav-link active tabTitle" href="#tab1" data-toggle="tab" id="purchaseBidingItem">입찰한 상품</a></li>
							<li class="nav-item"><a class="nav-link tabTitle" href="#tab2" data-toggle="tab" id="purchaseItem">낙찰된 상품</a></li>
						</ul>
						<div class="tab-content"><!-- 탭 큰 틀 시작 -->
						<!-- tab 내가 입찰 한 상품 시작-->
							<div class="tab-pane active" id="purchaseBidingItemContent">
								<!--------------------------------- tab1 내가 입찰 한 상품 div 시작 -------------------------------------->
								<div class="tab-pane tabMd12" style="margin-top:30px;" id="purchaseBidingItemContent">
									<c:forEach var="tempPno" items="${tempBidingPno}">
										<table border='1' style="color:gray;width:802px;margin-bottom:40px;box-shadow:5px 5px 5px 5px gray"><!-- 여기서 테이블 한개 조건 들어가고 -->
											<tr>
												<c:forEach var="tempImg" items="${tempBidingImg}">
													<c:if test="${tempImg.p_no == tempPno }">
														<th style="width:104px"><img src="/furniture/displayImage?imageName=${tempImg.main_img_name}" class="img-class" style="width:100px"></th>
													</c:if>
												</c:forEach>
												<c:forEach var="tempTitle" items="${tempBidingTitle}">
													<c:if test="${tempTitle.p_no == tempPno }">
														<th style="width:540px"><a href="/auction/auctionSelected?p_no=${tempTitle.p_no}">${tempTitle.p_title}</a></th>
														<th>${tempTitle.seller}</th>
													</c:if>
												</c:forEach>
											</tr>
											<c:forEach var="tempbiding" items="${tempBiding}">
												<c:if test="${tempbiding.p_no == tempPno}">
													<tr><!-- 여기서 입찰 목록 조건 들어간다 -->
														<td colspan='2' style="vertical-align:middle;height: 60px;font-family:verdana;"><fmt:formatDate value="${tempbiding.temp_bid_date}" pattern="yyyy/MM/dd HH:mm:ss"/></td>
														<td>${tempbiding.temp_bid_price}원</td>
													</tr>
												</c:if>
											</c:forEach>
										</table>
										<hr style="border-top:1px;soild;border:black">
									</c:forEach>
								</div>
								<!--------------------------------- tab1 내가 입찰 한 상품 div 끝 -------------------------------------->
							</div>
						<!-- tab 내가 입찰 한 상품 끝-->
						<!-- tab 구매한 상품 시작 -->
							<div class="tab-pane tabMd12" style="margin-top:30px;" id="purchaseItemContent">
								<!---------------------------------- tab2 구매한 상품 div 시작 ------------------------------------>
								<c:forEach var="auctionSoldVo" items="${purchaserList}" >
								<table border='1' style="color:gray;width:802px;margin-bottom:40px;box-shadow:5px 5px 5px 5px gray">
									<tr>
										<td class="tdPurchase">입찰일:<fmt:formatDate value="${auctionSoldVo.bid_date}" pattern="YYYY/MM/dd HH:mm:ss"/></td>
										<td rowspan='3' style="width:150px">
										<a href="/auction/auctionSelected?p_no=${auctionSoldVo.p_no}">
										<img src="/furniture/displayImage?imageName=${auctionSoldVo.main_img_name}" class="img-class" style="width:100%">
										</a>
										</td>
										<td class="tdPurchase">${auctionSoldVo.p_title}</td>
									</tr>
									<tr>
										<td class="tdPurchase">최초금액:<span>${auctionSoldVo.present_price}</span></td>
<!-- 												<td>이미지</td> -->
<!-- 												<td>제목</td> -->
										<td class="tdPurchase">판매자:<span>${auctionSoldVo.seller}</span></td>
									</tr>
									<tr>
										<td class="tdPurchase">낙찰금액:<span>${auctionSoldVo.sold_price}</span></td>
<!-- 												<td>이미지</td> -->
										 <td class="tdPurchase" style="padding:0px; height: 45px;text-align:center">
										 
											 <c:set var="exist" value="off" /><!-- 변수 선언 -->
											 <c:forEach var="auctionOrderVo" items="${auctionOrder}"><!-- 주문 테이블을 돌린다 -->
												<c:if test="${auctionOrderVo.p_no == auctionSoldVo.p_no}">
													<c:set var="exist">on</c:set><!-- 주문에 있으면 exist를 변경 -->
												</c:if>
											 </c:forEach>
											 
											 <c:choose>
											 <c:when test="${exist == 'off'}"><!-- off면 출력 -->
											 <a href="/auction/auctionPurchaseSelected/${auctionSoldVo.p_no}">
												 	<img src="/resources/auctionImage/btn_payment.png" style="height:45px;width:80%;cursor:pointer">
												 </a>
											</c:when>
											<c:otherwise>
											 	결제 완료
											</c:otherwise>
											</c:choose>
												 
										</td>
									</tr>
								</table>
								</c:forEach>
								<!---------------------------------- tab2 구매한 상품 div 끝 ------------------------------------>
							</div><!-- tab 구매한 상품 끝 -->
						</div><!-- 탭 큰 틀 닫기 -->
					</div>
				</div>
			</div><!-- tab 끝-->
		</div><!-- 외부 md-8 -->
		<div class="col-md-3"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>
    