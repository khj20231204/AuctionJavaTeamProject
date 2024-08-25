<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="../include/header.jsp"%>
<%@ include file="/resources/css/whitegoods.css" %>
<style>
.product-etc ul li{
	list-style-type: disc
}
.product-etc table ul li{
	font-size: 12px;
}
.product-etc table .tbls{
	background-color: #ccc;
	font-size: 15px;
}
.product-etc .sellerData .tbls{
	font-size:13px;
	width:10%;
	text-align: left;
}
.product-etc .sellerData .tblsval{
	font-size:13px;
	width:40%;
	text-align: left;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function scrollMove(seq){
	var offset = $(".product-" + seq).offset();
	$('html, body').animate({scrollTop : offset.top}, 400);
}
	$(function(){
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop();
			var reviewTop = $(".product-review").offset().top;
			var qnaTop = $(".product-qna").offset().top;
			var etcTop = $(".product-etc").offset().top;
			if(scrollTop > 766){
				$(".tab").addClass("tab-dock-top");
				$(".tab").removeClass("tab");
			
			} else {
				$(".tab-dock-top").addClass("tab");
				$(".tab-dock-top").removeClass("tab-dock-top");
			}
		});
		
		$("#btnQnaInsert").click(function(){
			var insert = $("#review_insert").val();
			if(insert==""){
				alert("상품 문의 내용을 입력해주세요.");
				return false;
			}
			
			var url = "";
			var sendData={
					"":insert
			}
			$.get(url, sendData, function(data){
				console.log(data);
			});
			location.reload();
		});
		
		var memberVo = "${sessionScope.memberVo.m_id}";
		$("#btnCart").click(function(){
			if(memberVo == ""){
				alert("로그인이 필요한 작업입니다.");
			} else {
				var url = "/cart/cartInput";
				var sendData = {
						"p_no": $("#btnCart").attr("data-pno")
				}
				$.get(url, sendData, function(data){
					console.log(data.trim());
					if(data.trim() == "success"){
						alert("상품이 장바구니에 담겼습니다.");
					} else if(data.trim() == "fail"){
						alert("이미 존재하는 상품입니다.");
					} else if(data.trim() == "member"){
						alert("로그인이 필요한 작업입니다.");
					}
				});
			}
		});
	});
</script>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<%@ include file="../include/header_mainCatagories.jsp"%>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8 productshow show1">
<br>
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
<!-- 
	<div style="text-align: right;">
			<c:if test="${sessionScope.memberVo.m_id == whitegoodsVo.w_seller}">
				<div>
					<a class="btn btn-success btn-xs" href="/whitegoods/whitegoodsUpdate/${whitegoodsVo.w_no}">수정하기</a>
					<a class="btn btn-danger btn-xs" href="/whitegoods/whitegoodsDelete/${whitegoodsVo.w_no}">삭제하기</a>
				</div>
			</c:if>
		</div>
-->
<div class="prod-image" data-global-banner-fold="">
	<div id="repImageContainer" class="prod-image-container">
		<img class="prod-image__detail" src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${whitegoodsVo.w_thumbimg}"
			alt="detail image"/>
	</div>
</div>


		<div class="prod-buy-header">
		    <h2 class="prod-buy-header__title">${whitegoodsVo.w_name}</h2>
		</div>
	    <div class="prod-price-container">
		    <div class="prod-price">
				<span class="total-price prod-major-price">
					<strong>${whitegoodsVo.w_price}<span class="price-unit">원</span></strong>
				</span>
			</div>
		</div>
		<div class="prod-vendor-container without-coach" >
			<div class="prod-vendor with-delivery-vendor">
		        <div class="prod-sale-vendor">
		                판매자: <a class="prod-sale-vendor-name" href="#">${whitegoodsVo.w_seller}</a>
		        </div>
		    </div>
		</div>
		
		<div class="prod-buy-footer ">
			<div class="prod-onetime-order " style="">
				<button class="prod-cart-btn" id="btnCart" data-pno="${whitegoodsVo.p_no}">장바구니 담기</button>
				<button class="prod-buy-btn"><span class="prod-buy-btn__txt">바로구매</span></button>
			</div>
		</div>
	</div>
</div>
<div id="btfTab" class="tab">
    <ul class="tab-titles">
        <li name="detail" onclick="scrollMove('detail')">상품상세</li>
        <li name="review" onclick="scrollMove('review')">상품평 <span class="product-tab-review-count"></span></li>
        <li name="qna" onclick="scrollMove('qna')">상품문의</li>
        <li name="etc" onclick="scrollMove('etc')">배송/교환/반품 안내</li>
    </ul>
    <ul class="tab-contents">
        <li class="product-detail">
        	<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8 productshow show2">
					<c:if test="${productImgList.size() != 0}">
					<c:forEach var="productImgVo" items="${productImgList}">
						<div class="imgProduct">
							<img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${productImgVo}" style="width:260px; height: 300px;">
						</div>
					</c:forEach>
					<hr>
					</c:if>
					<div class="content">
						${whitegoodsVo.w_content}
					</div>
			
				</div>
			<div class="col-md-2"></div>
		</div>
		</li>
		<hr>
		<li class="product-review">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>상품평</p>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					
					<table class="table">
						<tbody>
							<c:forEach var="ReviewVo" items="${reviewList}">
							<tr>
								<td>${ReviewVo.m_id}</td>
								<td>${ReviewVo.review_reg}</td>
							</tr>
							<br>
							<tr>
								<td colspan="2">${ReviewVo.review_content}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
		</li>
		<hr>
		<li class="product-qna">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div>
						<p>상품 문의</p>
					</div>
					<div>
						<input type="text" id="review_insert" class="form-control" required>
						<button type="button" id="btnQnaInsert">등록</button>
					</div>
					<table class="table">
						<thead>
							<tr>
								<th>문의 내용</th>
								<th>문의자</th>
								<th>문의일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="WhitegoodsQnaVo" items="${productQna}">
							<tr>
								<td>${WhitegoodsQnaVo.wqa_content}</td>
								<td>${WhitegoodsQnaVo.m_id}</td>
								<td>${WhitegoodsQnaVo.wqa_reg}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-md-2"></div>
			</div>
		</li>
		<hr>
		<li class="product-etc">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<p>배송/반품 안내</p>
				</div>
				<div class="col-md-2"></div>
			</div>
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-10">
					<p>교환/반품 안내</p>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="tbls">교환/반품 비용(왕복비용)</td>
								<td>
									5000원<br>
									-단, 고객 변심의 경우에만 발생<br>
									-도서산간 및 일부 지역 추가비용 발생
								</td>
							</tr>
							<tr>
								<td class="tbls">교환/반품 신청 기준일</td>
								<td>
									<ul>
										<li>&#32;단순 변심에 의한 교환/반품은 제품 수령 후 7일 이내까지만 가능(배송비용과 교환/반품비용 왕복배송비 고객부담)</li>
										<li>&#32;상품 내용이 표시, 광고의 내용과 다른 경우에는 상품을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 가능</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					<br>
					<p>교환/반품 제한사항</p>
					<ul>
						<li>주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
						<li>상품 포장을 개봉하여 사용, 또는 설치 완료되어 상품의 가치가 훼손된 경우(단, 내용 확인을 위한 포장 개봉의 경우는 예외)</li>
						<li>고객의 사용, 시간경과, 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</li>
						<li>세트상품의 일부 사용, 구성품을 분실하였거나 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
						<li>모니터 해상도 차이로 인해 색상이나 이미지가 달라, 고객이 단순 변심으로 교환/반품을 무료로 요청하는 경우</li>
						<li>제조사의 사정(신모델 출시 등) 및 부품 가격 변동 등에 의해 무료 교환/반품으로 요청하는 경우</li>
					</ul>
					<br>
					<p>&#8251;각 상품별로 아래와 같은 사유로 취소/반품이 제한될 수 있습니다.</p>
					<table class="table table-bordered">
						<tbody>
							<tr>
								<td class="tbls">의류/잡화/수입명품</td>
								<td>
									<ul>
										<li>상품의 택(TAG) 제거, 라벨 및 상품 훼손, 구성품 누락으로 상품의 가치가 현저히 감소된 경우</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="tbls">계절상품/식품/화장품</td>
								<td>
									<ul>
										<li>신선냉동 식품의 단순변심의 경우</li>
										<li>뷰티 상품 이용 시 트러블(알러지, 붉은 반점, 가려움, 따가움)이 발생하는 경우,<br>
										 진료확인서 및 소견서 등을 증빙하면 환불이 가능(제반비용 고객부담)</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="tbls">전자/가전/설치상품</td>
								<td>
									<ul>
										<li>설치 또는 사용하여 재판매가 어려운 경우, 액정이 있는 상품의 전원을 켠 경우</li>
										<li>상품의 시리얼 넘버 유출로 내장된 소프트웨어의 가치가 감소한 경우(내비게이션, OS시리얼이 적힌 PMP)</li>
										<li>홀로그램 등을 분리, 분실, 훼손하여 상품의 가치가 현저히 감소하여 재판매가 불가할 경우(노트북, 데스크탑 PC 등)</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="tbls">자동차용품</td>
								<td>
									<ul>
										<li>상품을 개봉하여 장착한 이후 단순변심인 경우</li>
									</ul>
								</td>
							</tr>
							<tr>
								<td class="tbls">CD/DVD/GAME/BOOK</td>
								<td>
									<ul>
										<li>복제가 가능한 상품의 포장 등을 훼손한 경우</li>
									</ul>
								</td>
							</tr>
						</tbody>
					</table>
					
					<p>판매자 정보</p>
					<table class="table table-bordered sellerData">
						<tbody>
							<tr>
								<td class="tbls">상호/대표자</td>
								<td class="tblsval">${sellingMember.m_id}</td>
								<td class="tbls">email</td>
								<td class="tblsval">${sellingMember.email}</td>
							</tr>
							<tr>
								<td class="tbls">연락처</td>
								<td colspan="3" class="tblsval">${sellingMember.m_phonenumber}</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="col-md-1"></div>
			</div>
		</li>
    </ul>
</div>
<br>
<br>
<br>
<br>
<br>