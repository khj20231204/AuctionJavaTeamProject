<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css"> -->

<link type="text/css" rel="stylesheet" href="/resources/css/auctionBootstrap.css">

<%@ include file="../include/header.jsp"%>

<script>
$(function(){
	$(".pull-right").click(function(){
		var orderId = $(this).attr("data-orderId");
		var delivery_company = $(this).parent().find(".selectDelivery_company").val();//.next().next().next().next().next().next().next().next().next().val();
		var delivery_number = $(this).parent().find(".txtDelivery_number").val();//find는 자손중에서 찾는다
		
		if(delivery_number == "" || delivery_number === null){
			alert("송장번호를 입력하세요");
		}else{
			$("#order_id").val(orderId);
			$("#delivery_company").val(delivery_company);
			$("#delivery_number").val(delivery_number);
			
			$("#formDelivery").submit();
		}
	});
});
</script>



<div class="container-fluid">

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><%@ include file="auctionHeader.jsp"%></div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row">
		<div class="col-md-2"></div>
			<div class="col-md-8">
				<div><div style="float:left"><img src="/resources/auctionImage/receive_order_blue.png" style="height:40px;width:40px"></div><h1>배송할 상품</h1></div>
			<!-- ------------------------------------------------------------------------------- -->
			<div class="containerMy" style="margin-top:50px">
				<div class="row">
					<div class="span12">
						<ul class="thumbnails">
						<c:forEach var="deliveryVo" items="${deliveryList}">
							<li class="span9 clearfix" style="margin-bottom: 25px;">
								<div class="thumbnail clearfix">
									<img src="/furniture/displayImage?imageName=${deliveryVo.main_img_name}" alt="ALT NAME"
										class="pull-left span2 clearfix" style='margin-right: 10px;height:110px;width:100px;margin-left: 7px;'>
									<div class="caption" class="pull-left">
									
										<c:choose>
											<c:when test="${deliveryVo.delivery_status == 'N'}">
											<a href="#" class="btn btn-primary icon pull-right" data-orderId="${deliveryVo.order_id}">배송 완료</a>
											</c:when>
											<c:otherwise>
												<div style="color:red;font-size:13px"><b>배송 완료</b></div>
											</c:otherwise>
										</c:choose>
										<h4>
											<a href="/auction/auctionSelected?p_no=${deliveryVo.p_no}">${deliveryVo.p_title}</a>
										</h4>
										<small><b>주문자:</b>${deliveryVo.orderer_name}</small> <small><b>연락처:</b>${deliveryVo.phonenumber}</small><br>
										<small><b>주소:</b>${deliveryVo.road_address} ${deliveryVo.detail_address}</small><br>
										<small><b>남길말:</b>${deliveryVo.order_msg}</small>
										<hr>
										<small><b>승인번호:</b>${deliveryVo.card_approval_number}</small>
										<c:choose>
										<c:when test="${deliveryVo.delivery_status == 'N'}">
										<select class="selectDelivery_company" style="font-size:12px;width: 116px;padding-bottom: 0px;height: 24px;padding-top: 0px;padding-left: 0px;padding-right: 0px;border-right-width: 1px;margin-left: 120px;">
											<option value="cj대한통운">cj대한통운</option>
											<option value="한진택배">한진택배</option>
											<option value="현대택배">현대택배</option>
											<option value="로젠택배">로젠택배</option>
											<option value="KG로지스">KG로지스</option>
										</select>
										<input type="text" placeholder="송장 번호를 입력하세요" class="txtDelivery_number" style="padding-left: 0px;margin-left: 20px;margin-top: 9px;">
										</c:when>
										<c:otherwise>
											<small style="padding-left: 133px;"><b>택배사:</b>${deliveryVo.delivery_company}</small><small style="color:red;padding-left: 60px;">송장번호:${deliveryVo.delivery_number}</small>
										</c:otherwise>
										</c:choose>
									</div>
								</div>
							</li>
						</c:forEach>	
						</ul>
					</div>
				</div>
			</div>
			<!-- ------------------------------------------------------------------------------- -->	
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->

<form id="formDelivery" action="/auction/deliveryInfo">
	<input type="hidden" id="delivery_company" name="delivery_company">
	<input type="hidden" id="delivery_number" name="delivery_number">
	<input type="hidden" id="order_id" name="order_id">
</form>

</div>


