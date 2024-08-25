<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav id="mainNav" role="navigation" style="margin-top: 20px;">
  <ul id="main-menu" style="padding-bottom:48px;">
  
  	<!-- 전체 카테고리  -->	
  	<li>&#8801;</li>

  <!-- 메인 카테고리 목록 -->
	<li><a href="/auction/auctionMain" style="padding-right: 10px;"><span style="color:red; font-weight:bold;">메인으로</span></a></li>
	<li><a href="/auction/auctionSellList" style="padding-right: 10px;">판매 상품</a></li>
	<li><a href="/auction/auctionPurchaseList" style="padding-right: 10px;">구매 상품</a></li>
	<li><a href="/auction/auctionPaymentList" style="padding-right: 10px;">결제한 상품 내역</a></li>
	<li><a href="/auction/auctionDeliveryList" style="padding-right: 10px;">배송할 상품 내역
		<c:if test="${sessionScope.deliveryCount > 0 }">
			<span style="color:red">(${sessionScope.deliveryCount})</span>
		</c:if>
		</a></li>
	<li><a href="/auction/auctionResisterList" style="padding-right: 10px;">상품 등록</a></li>
	<li><a href="/cart/cartPage" style="padding-right: 10px;">관심 상품</a></li>
  </ul>
</nav>
