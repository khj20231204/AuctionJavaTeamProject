<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>


<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<%@ include file="/resources/css/clothes.css"%>

<br>

<!------------------------------------------ 상품 리스트 ---------------------------------------->

	<div class="col-md-2"></div>
		<div class="col-md-8">
		
			<div>
				<ul class="nowMenu">
					<li><a href="/">홈 </a>></li>
					<li><a style="color:red;" href="/clothes/102">여성의류</a></li>
				</ul>
			</div>
			
			
		</div>
	<div class="col-md-2"></div>


		<div style="padding-top: 150px;">
			<div class="row listMain" style="position:relative;left:15%;">

				<div class="col-md-8 productList">
				
					<ul class="nav nav-pills list" style="display:none;">
						<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/blouese.jpg"/></a></li>
						<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">제넌 블라우스 (3color)기상캐스터협찬<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/blouse.jpg"/></a></li>
						<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">제넌 블라우스 (3color)기상캐스터협찬<br></a><span id="price">59,900</span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller">판매자</a></li>
					</ul>
					
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
	</div>
</div>
		
		<div class="col-md-2"></div>


<!------------------------------------------ 페이지네이션 ---------------------------------------->
<br>
<div class="row">
	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			<a href="#" class="a_More">더보기  <span class="arrow"><img src="/resources/image/arrow.PNG"/></span></a>
			<input type="hidden" id="morePage" name="morePage"/>
		</div>

	</div>
</div>