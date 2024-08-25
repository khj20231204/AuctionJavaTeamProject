<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="/resources/css/sidebar.css" />

<script>
$(function(){
	// ------------------------------------ 옆면에 아우터 이벤트 시작 ---------------------------------- 
	//메인으로
	/*
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
	if('${sidebarNO}' != null){//내상품에선 이 이벤트가 없어진다
		
		if('${sidebarNO}' != 'no'){
			
			$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseover" , function(){
				$(".sidebar__nav > li:eq(3) > ul").show();
			});
		
			$(".sidebar__nav > li:eq(3) > a , .sidebar__submenu:eq(3)").on("mouseout" , function(){
				$(".sidebar__nav > li:eq(3) > ul").hide();
			});
		}
	}
	// 내가 주문한 내역
	$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(4) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(4) > a , .sidebar__submenu:eq(4)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(4) > ul").hide();
	});
	
	// 결제된 내 상품 내역 
	$(".sidebar__nav > li:eq(5) > a , .sidebar__submenu:eq(5)").on("mouseover" , function(){
		$(".sidebar__nav > li:eq(5) > ul").show();
	});
	
	$(".sidebar__nav > li:eq(5) > a , .sidebar__submenu:eq(5)").on("mouseout" , function(){
		$(".sidebar__nav > li:eq(5) > ul").hide();
	});
	/* ------------------------------------ 옆면에 아우터 이벤트 끝 ---------------------------------- */
});

</script>

<!-- aside 시작 -->
<aside class="sidebar">
	<nav>
		<ul class="sidebar__nav">
		 <!-- 메인 -->
			<li>
				<a href="/auction/auctionMain" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/main_blue.png"/></i>
					<span class="sidebar__nav__text">메인으로</span>
				</a>
					
			</li>
		
		 <!-- 판매 상품 -->
		 <c:if test="${sidebarRegisterListNO != 'no'}">
			<li>
				<a href="/auction/auctionResisterList" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/myitem_blue.png"/></i>
					<span class="sidebar__nav__text">판매 상품</span>
				</a>
			</li>
		</c:if>
		<!-- 구매 상품 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/btnPurchaser.png"/></i>
					<span class="sidebar__nav__text">구매 상품</span>
				</a>
			</li>
		 <!--내가 주문한 내역 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/order_blue.png"/></i>
					<span class="sidebar__nav__text">내가 결제한 상품 내역</span>
				</a>
			</li>
		<!-- 결제된 내 상품 내역 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/receive_order_blue.png"/></i>
					<span class="sidebar__nav__text">결제된 내 상품 내역
						<c:if test="${sidebarCount > 0 }">
							<span style="color:red">(${sidebarCount})</span>
						</c:if>
					</span>
				</a>
			</li>
		<!-- 상품 등록 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/btnRegister.png"/></i>
					<span class="sidebar__nav__text">상품 등록</span>
				</a>
			</li>
		<!-- 관심상품 -->
			<li>
				<a href="#" class="sidebar__nav__link">
					<i class=""><img class="sidebar__img" src="/resources/auctionImage/favorite_blue.png"/></i>
					<span class="sidebar__nav__text">관심상품</span>
				</a>
			</li>
		<!-- 끝 -->
		</ul>
	</nav>
</aside>
<!-- aside 끝 -->
