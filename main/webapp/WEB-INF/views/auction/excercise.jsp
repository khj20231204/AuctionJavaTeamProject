<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<link type="text/css" rel="stylesheet" href="/resources/css/auctionBootstrap.css">

<%@ include file="../include/header.jsp"%>

주문배송 세션에 만들기
관심상품 옥션 보고
주문하기, 수정하기는 옆에 사이드바 살리고
결제완료 -> 배송 정보 입력

<style>
.mb-60 {
    margin-bottom: 60px;
}
.services-inner {
    border: 2px solid #48c7ec;
    margin-left: 35px;
    transition: .3s;
}
.our-services-img {
    float: left;
    margin-left: -36px;
    margin-right: 22px;
    margin-top: 28px;
}
.our-services-text {
    padding-right: 10px;
}
.our-services-text {
    overflow: hidden;
    padding: 28px 0 25px;
}
.our-services-text h4 {
    color: #222222;
    font-size: 18px;
    font-weight: 700;
    letter-spacing: 1px;
    margin-bottom: 8px;
    padding-bottom: 10px;
    position: relative;
    text-transform: uppercase;
}
.our-services-text h4::before {
    background: #ec6d48 none repeat scroll 0 0;
    bottom: 0;
    content: "";
    height: 1px;
    position: absolute;
    width: 35px;
}
.our-services-wrapper:hover .services-inner {
    background: #fff none repeat scroll 0 0;
    border: 2px solid transparent;
    box-shadow: 0px 5px 10px 0px rgba(0, 0, 0, 0.2);
}
.our-services-text p {
    margin-bottom: 0;
}
p {
    font-size: 14px;
    font-weight: 400;
    line-height: 26px;
    color: #666;
    margin-bottom: 15px;
}
</style>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<%@ include file="auctionHeader.jsp"%>
				<!-- 시작 -->
				<div class="container">
					<h2>OUR SERVICES</h2>
					<div class="row">
						<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12">
							<div class="our-services-wrapper mb-60">
								<div class="services-inner">
									<div class="our-services-img">
									</div>
									<div class="our-services-text">
										<h4>business growth</h4>
										<p>Proin varius pellentesque nuncia tincidunt ante. In id
											lacus</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 끝 -->
			</div><!-- 내부 md-8 -->
			<div class="col-md-2"></div><!-- 내부 md-2 -->
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>
