<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="../include/header.jsp"%>

<style>
.tabTitle{
	font-family: verdana;
	font-size:16px;
/* 	text-shadow: 1px 1px 1px rgba(0,0,0,0.2); */
}

.card{
 height: 500px;
 width: 250px;
}

.card-title{
	text-align: center;
    font-size: 16px;
    font-weight: 700;
   	font-family: verdana;
    vertical-align: middle;
    margin:30px;
}

.card-text{
	font-family: verdana;
	font-size:14px;
}

</style>

<script type="text/javascript">
$(function(){
	
	$("#bidingItem").click(function() {//tab1클릭시
		$("#bidingItemContent").show();
		$("#bidingFinishItemContent").hide();
		$("#registerItemContent").hide();
		//$("#purchaseBidingItemContent").hide();
	});
	
	$("#bidingFinishItem").click(function() {//tab2클릭시
		$("#bidingItemContent").hide();
		$("#bidingFinishItemContent").show();
		$("#registerItemContent").hide();
		//$("#purchaseBidingItemContent").hide();
	});

	$("#registerItem").click(function() {//tab3클릭시
		$("#bidingItemContent").hide();
		$("#bidingFinishItemContent").hide();
		$("#registerItemContent").show();
		//$("#purchaseBidingItemContent").hide();
	});
	
	$(".btnDelAuction").click(function(e){
		e.preventDefault();
		var p_no = $(this).attr("data-pno");
		location.href="/auction/auctionDelete?p_no="+p_no;
	});
	
});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
			<div class="col-md-8"><div><%@ include file="auctionHeader.jsp"%></div></div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
			
			<div><div style="float:left;"><img src="/resources/auctionImage/myitem_blue.png" height="40px"></div><h1>판매 상품</h1></div>
			<!-- tab 시작 -->
				<div class="row">
					<div class="col-md-12" style="margin-top:50px;text-align:center">
						<div class="tabbable" id="tabs-222970"> 
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active tabTitle" href="#tab1" data-toggle="tab" id="bidingItem">입찰 중인 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab2" data-toggle="tab" id="bidingFinishItem">입찰 종료된 상품</a></li>
								<li class="nav-item"><a class="nav-link tabTitle" href="#tab3" data-toggle="tab" id="registerItem">낙찰된 상품</a></li>
							</ul>
							<div class="tab-content"><!-- 탭 큰 틀 시작 -->
							<!-- tab 입찰 중인 상품 시작-->
								<div class="tab-pane active" id="bidingItemContent">
									<!--------------------------------- tab1 입찰 중인 상품 div 시작 ------------------------------------>
										<div class="row">
											<div class="col-md-12" style="margin-top:30px;">
											<div class="row">
				
											<c:forEach var="bidingList" items="${bidingList}" >
											<div class="col-md-4 tabMd3" style="margin-bottom: 10px;padding-bottom: 20px;">
												<div class="card" style="width: 290px;height: 530px;">
														<a href="/auction/auctionSelected?p_no=${bidingList.p_no}">
														<img src="/furniture/displayImage?imageName=${bidingList.main_img_name}" class="img-class" style="height:200px;">
														</a>
														<div class="card-block">
														<h5 class="card-title" style="margin-right: 43px;">${bidingList.p_title}</h5>
														<p class="card-text">현재가:${bidingList.present_price}</p>
														<p class="card-text">즉구가:${bidingList.instant_price}</p>
														<p class="card-text">등록일:${bidingList.r_year}/${bidingList.r_month}/${bidingList.r_day}</p>
														<p class="card-text">마감일:${bidingList.e_year}/${bidingList.e_month}/${bidingList.e_day}</p>
														<p class="card-text">
															<a class="btn btn-outline-primary" href="/auction/auctionModify?p_no=${bidingList.p_no}">수정</a>
															<a class="btn btn-outline-danger btnDelAuction" href="#" data-pno="${bidingList.p_no}">삭제</a>
														</p>
													</div>
												</div>
											</div>
											</c:forEach>
												</div>
											</div>
										</div>
										<!--------------------------------- tab1 입찰 중인 상품 div 끝 -------------------------------------->
								</div>
							<!-- tab 입찰 중인 상품 끝-->
							<!-- tab 입찰 종료된 상품 시작 -->
								<div class="tab-pane" id="bidingFinishItemContent">
									<!--------------------------------- tab2 입찰 종료된 상품 div 시작 -------------------------------------->
											<div class="row">
											<div class="col-md-12" style="margin-top:30px;">
											<div class="row">
				
											<c:forEach var="bidingFinishList" items="${bidingFinishList}" >
											<div class="col-md-4 tabMd3" style="margin-bottom: 10px;padding-bottom: 20px;">
												<div class="card">
														<a href="/auction/auctionSelected?p_no=${bidingFinishList.p_no}">
														<img src="/furniture/displayImage?imageName=${bidingFinishList.main_img_name}" class="img-class" style="height:200px;">
														</a>
													<div class="card-block">
														<h5 class="card-title">${bidingFinishList.p_title}</h5>
														<p class="card-text">현재가:${bidingFinishList.present_price}</p>
														<p class="card-text">즉구가:${bidingFinishList.instant_price}</p>
														<p class="card-text">등록일:${bidingFinishList.r_year}/${bidingFinishList.r_month}/${bidingFinishList.r_day}</p>
														<p class="card-text">마감일:${bidingFinishList.e_year}/${bidingFinishList.e_month}/${bidingFinishList.e_day}</p>
														<p>
														<!-- 경매 종료는 수정 버튼이 필요없다 -->
															<a class="btn btn-outline-danger btnDelAuction" href="#" data-pno="${bidingFinishList.p_no}">삭제</a>
														</p>
													</div>
												</div>
											</div>
											</c:forEach>
				
												</div>
											</div>
										</div>
										<!--------------------------------- tab2 입찰 종료된 상품 div 끝 -------------------------------------->
								</div>
							<!-- tab 입찰 종료된 상품 끝 -->
							<!-- tab 낙찰된 상품 시작 -->
								<div class="tab-pane" id="registerItemContent">
									<!--------------------------------- tab3 낙찰된 상품 div 시작 ------------------------------------>
					
										<div class="row">
											<div class="col-md-12" style="margin-top:30px;">
											<div class="row">
				
											<c:forEach var="auctionSoldVo" items="${soldList}" >
											<div class="col-md-4 tabMd3" style="margin-bottom: 10px;padding-bottom: 20px;">
												<div class="card">
														<a href="/auction/auctionSelected?p_no=${auctionSoldVo.p_no}">
														<img src="/furniture/displayImage?imageName=${auctionSoldVo.main_img_name}" class="img-class" style="height:200px;">
														</a>
													<div class="card-block">
														<h5 class="card-title">${auctionSoldVo.p_title}</h5>
														<p class="card-text">거래된가격:${auctionSoldVo.sold_price}</p>
														<p class="card-text">처음가격:${auctionSoldVo.present_price}</p>
														<p class="card-text">구매자:${auctionSoldVo.purchaser}</p>
														<p class="card-text">등록일:${auctionSoldVo.r_year}/${auctionSoldVo.r_month}/${auctionSoldVo.r_day}</p>
														<p class="card-text">낙착일:<fmt:formatDate value="${auctionSoldVo.bid_date}" pattern="YYYY/MM/dd HH:mm:ss"/>  </p>
<!-- 														<p> -->
<!-- 															<a class="btn btn-outline-primary" href="#">수정</a>  -->
<!-- 															<a class="btn btn-outline-danger" href="#">삭제</a> -->
<!-- 														</p> -->
													</div>
												</div>
											</div>
											</c:forEach>
				
												</div>
											</div>
										</div>					
					
										<!--------------------------------- tab3 거래된 상품 div 끝 -------------------------------------->
								</div>
							<!-- tab 낙찰된 상품 끝 -->
							</div><!-- 탭 큰 틀 닫기 -->
						</div>
					</div>
				</div><!-- tab 끝-->
 			<div class="col-md-3"></div>
		</div><!-- 외부 md-8 -->
	</div><!-- 외부 row -->
</div>
