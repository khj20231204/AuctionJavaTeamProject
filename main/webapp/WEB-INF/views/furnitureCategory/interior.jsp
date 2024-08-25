	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>


<script>
$(function(){
	var SIZE=4;
	
	$(".btnMore").click(function(){
		
		var url = "/furniture/getFurnitureInteriorAddList?num="+SIZE;
		SIZE += 2;
		
		$(".productList").hide();
		
		$.get(url,function(data){
			$("#divSecondShow").empty();
			$.each(data, function(){
				var ul = $("#divFirstShow").find("ul").clone();
				
				ul.find("li").eq(0).find("img").attr("src","../resources/furnitureImages/"+this.interior_thumbimg);
				ul.find("li").eq(1).find("a").text(this.interior_name);
				ul.find("li").eq(1).find("span").text(this.interior_price);
				ul.find("li").eq(2).find("a").text(this.interior_seller);
				
				$("#divSecondShow").append(ul);
			});//$.each
			$("#divSecondShow").show();
		});//.get
	});//.btnMore
});

</script>

<body>

<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
	
<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
<div class="col-md-2"></div>

<div class="col-md-8">
	<div class="lblHOT">
	  <div class="neon">HOT ITEM</div>
</div>

</div>
<div class="col-md-2"></div>

<!------------------------------------------ 상품 리스트 ---------------------------------------->
		<div style="padding-top: 150px;">
			<div class="row listMain">
			
					<ul class="nav nav-tabs listMenu">
						<li class="nav-item"><a class="nav-link" href="#">전체</a></li>
						<li class="nav-item"><a class="nav-link" href="#">백화점</a></li>
						<li class="nav-item"><a class="nav-link" href="#">중고</a></li>
						<li class="nav-item"><a class="nav-link" href="#">기타</a></li>
					</ul>
				<!-- 처음 로드 될때 보여주는 div -->
				<div class="col-md-8 productList">
					<c:forEach begin="0" end="1" step="1" var="FurnitureInteriorVo" items="${list}">	
						<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="../resources/furnitureImages/${FurnitureInteriorVo.interior_thumbimg}"></a></li>
							<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#">${FurnitureInteriorVo.interior_name}<br></a><span id="price">${FurnitureInteriorVo.interior_price}</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${FurnitureInteriorVo.interior_seller}</a></li>
						</ul>
					</c:forEach>
				</div> 
				
				<!-- foreach없이 복사해서 쓸 div -->
				<div class="col-md-8" id="divFirstShow" style="display:none">
					<ul class="nav nav-pills list">
						<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;"></a></li>
						<li class="nav-item" style="width:360px;"><a class="nav-link productName" href="#"><br></a><span id="price"></span>원<br> 무료배송</li>
						<li class="nav-item"><a class="nav-link seller"></a></li>
					</ul>
				</div> 
				
				<div class="col-md-8 divSecondShow " id="divSecondShow" style="display:none"></div>
				
				<div class="col-md-2"></div>
			</div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
	</div>
</div>
	

<!------------------------------------------ 페이지네이션 ---------------------------------------->
<br>
<div class="row">
	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			더보기  <span class="arrow"><img src="../resources/image/arrow.PNG"/></span>
		</div>
	</div>
</div>
</body>

