<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css"> -->
<link type="text/css" rel="stylesheet" href="/resources/css/auctionBootstrap.css">

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="../include/header.jsp"%>

<style>
.titlePadding{
	padding-right:5px;
	padding-left:5px;
}
</style>
<script>
$(function(){
	$(".pull-right").click(function(){
		var orderId = $(this).attr("data-orderId");
		$("#orderId").val(orderId);
		$("#modalOpen").trigger("click");
	});	
	
	$("#modalSave").click(function(){
		
		var orderId = $("#orderId").val();
		
		location.href="/auction/auctionPurchaseConfirm?orderId="+orderId;
		
		$("#modalClose").trigger("click");
	})
});
</script>

<input type="hidden" id="orderId">

<!-- ----------------------------------구매확정 모달 창 시작--------------------------------------------- -->
<div class="container">
	<div class="row">
	<div id="myModal" class="modal fade in">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" style="width: 252px;">
                    <h4 class="modal-title">구매 확인 창</h4>
                </div>
                <div class="modal-body" style="width: 338px;left: 13.547;padding-left: 0px;">
                    <h4>구매 확인을 누르시겠습니까</h4>
                    <small>구매 확인을 하면 결제 대금이 판매자에게로 넘어갑니다</small>
                </div>
                <div class="modal-footer">
                    <div class="btn-group">
                    	<button class="btn btn-primary" id="modalSave"><span class="glyphicon glyphicon-check"></span>확인</button>
                        <button class="btn btn-danger" data-dismiss="modal" id="modalClose"><span class="glyphicon glyphicon-remove"></span>취소</button>
                    </div>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dalog -->
    </div><!-- /.modal -->
<a data-toggle="modal" id="modalOpen" href="#myModal" class="btn btn-primary" style="display:none"></a>
	</div>
</div>
<!-- ----------------------------------구매확정 모달 창 끝--------------------------------------------- -->		
		
<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><%@ include file="auctionHeader.jsp"%></div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row">
		<div class="col-md-2"></div>	
			<div class="col-md-8">
			<div><div style="float:left"><img src="/resources/auctionImage/btnPurchaser.png"  style="height:40px"></div><h1>결제한 상품</h1></div>

<!-- ----------------------------------------------------  -->				
			<div class="containerMy" style="margin-top:50px">
				<div class="row">
					<div class="span12">
						<ul class="thumbnailsMy">
						<c:forEach var="payListVo" items="${payList}">
							<li class="span5 clearfix">
								<div class="thumbnail clearfix" style="width:480px;height:180px">
									<img src="/furniture/displayImage?imageName=${payListVo.main_img_name}" alt="ALT NAME"
										class="pull-left span2 clearfix" style='margin-right: 9px;width:120px;height:130px;margin-left: 0px;padding-top: 10px;'>
									<div class="caption" class="pull-left" style="width:464px;height:130px;padding-right: 5px;padding-left: 4px;">
										<c:choose>
											<c:when test="${payListVo.purchase_confirm == 'N'}">
												<a href="#" class="btn btn-primary icon  pull-right" data-orderId="${payListVo.order_id}">구매확정</a>
											</c:when>
											<c:otherwise>
												<div style="color:red;family:verdana"><b>구매확정</b></div>
											</c:otherwise>
										</c:choose>
										<h4>
										<c:choose>
											<c:when test="${fn:length(payListVo.p_title) > 14}"><!-- 제목이 14이상이면 ...으로 표시 -->
												<a href="#" style="font-size:20px">${fn:substring(payListVo.p_title,0,14)}...</a>
											</c:when>
											<c:otherwise>
												<a href="#" style="font-size:20px">${payListVo.p_title}</a>
											</c:otherwise>
										</c:choose>
										</h4>
										<small><b class="titlePadding">주소:</b>${payListVo.road_address} ${payListVo.detail_address}</small><br>	
										<small><b class="titlePadding">우편번호:</b>${payListVo.zip} <b class="titlePadding">판매자:</b>${payListVo.seller}<br></small>
										<small><b class="titlePadding">결제일:</b><fmt:formatDate value="${payListVo.order_date}" pattern="yyyy/MM/dd"/></small> <small><b>승인번호: </b>${payListVo.card_approval_number}</small>
									</div>
									<hr style="margin-bottom: 5px;margin-top: 15px;">
									<div style="text-align:center;vertical-align:middle">
										<c:if test="${payListVo.delivery_status == 'Y'}">
											<small><b>택배사: </b>${payListVo.delivery_company}</small> <small><b>송장번호: </b><span style="color:red">${payListVo.delivery_number}</span></small>
										</c:if>
									</div>
								</div>
							</li>
						</c:forEach>
						
						</ul>
						
					</div>
				</div>
			</div>	
<!-- ----------------------------------------------------- -->				
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>