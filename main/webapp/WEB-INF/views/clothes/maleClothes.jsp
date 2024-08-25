<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto&display=swap" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="stylesheet" href="/resources/css/sidebar.css" />
<%@ include file="/resources/css/computersForm_css.css" %>
<%@ include file="../include/header.jsp"%>

<style>
	
.aside_ad{
	width:100%;
	padding-top: 100%;
}

</style>

<div class="row">
	<div class="col-md-2">
	
	<aside class="aside_ad">
<br>
<a href="https://ulsankh.step.or.kr/page/lms" target="_blank" title="kh 정보교육원 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/khBanner.mp4" type="video/mp4">
</video>
</a>
<br>
<br>
<br>
<br>
<br>
<a href="https://www.samsung.com/sec/" target="_blank" title="삼성 레드 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/red.mp4" type="video/mp4">
</video>
</a>
<br>
<br>
<br>
<br>
<br>
<a href="https://www.netflix.com/kr/" target="_blank" title="넷플릭스 광고동영상입니다.">
<video class="asideBanner" autoplay loop controls muted>
	<source src="/resources/bannerVideo/netflix.mp4" type="video/mp4">
</video>
</a>
</aside>
	
	</div>
		<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<%@ include file="/resources/css/clothes.css"%>

<script>
$(function(){	
	var tabBtn = $("#tab-btn > ul > li");     //각각의 버튼을 변수에 저장
	var tabCont = $("#tab-cont > div");       //각각의 콘텐츠를 변수에 저장	
	var tabCont_a = $("#tab-cont > div > a");
	//컨텐츠 내용을 숨겨주세요!
	tabCont.hide().eq(0).show();

	tabBtn.click(function(){
	  var target = $(this);         //버튼의 타겟(순서)을 변수에 저장
	  var index = target.index();   //버튼의 순서를 변수에 저장
	  tabBtn.removeClass("active");    //버튼의 클래스를 삭제
	  target.addClass("active");       //타겟의 클래스를 추가
	  tabCont.css("display","none");
	  tabCont.eq(index).css("display","block");
	});
	
	tabCont_a.click(function(){
		var url = "/subCategory_link"
		$.get(url , sendData , function(data){
			
		});
	});	
}); // main function

</script>

<br>

<!------------------------------------------ 상품 리스트 ---------------------------------------->

<div class="row">

	<div class="col-md-2"></div>
		<div class="col-md-8">
				<ul class="nowMenu">
					<li><a style="color:red;" href="/clothes/101?cate_no=101">남성의류</a></li>
					
				</ul>
				<div id="tab-menu">
				
			<!-- 메인 카테고리 받아오기 -->				 
				  <div id="tab-btn">
				    <ul>
				      <c:forEach var="mainCategory" items="${mainCategory}">
				      <li><a href="#">${mainCategory.cate_name }</a></li>
				    </c:forEach>
				    </ul>
				  </div>
			<!-- 메인 카테고리 받아오기 END -->				 
				  
			<!-- 서브 카테고리 받아오기 (이중 forEach) -->				 
				  <div id="tab-cont">
				<c:forEach var="subCategoryList" items="${subCategory}">
					<div>
						<c:forEach var="subCategoryList" items="${subCategoryList}">
							<a href="/clothes/101?cate_no=${subCategoryList.cate_no}">${subCategoryList.cate_name}</a>
						</c:forEach>
					</div>
				</c:forEach>
			<!-- 서브 카테고리 받아오기 END -->				 
				
				  </div>
				</div>
				 
				 
		</div>
		<div class="col-md-2"></div>
</div>
		<div style="padding-top: 150px;">
			<div class="row listMain" style="position:relative;left:15%;">
				<div class="col-md-8 productList">
					
<!-- 					<select style="float:right;"> -->
<!-- 						<option>가격</option> -->
<!-- 						<option>이름</option> -->
<!-- 					</select> -->
					
						<c:forEach var="male" items="${list}">
					<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="#"><img style="width:225px; height:225px;" src="/resources/image/product/${male.p_thumbimg }"/></a></li>
							<li class="nav-item" style="width:372px;"><a class="nav-link productName" href="/page/content?p_no=${male.p_no}">${male.p_name }<br></a><span id="price">${male.p_price }</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${male.p_seller}</a></li>
					</ul>
						</c:forEach>
				</div>
			</div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
	</div>
</div>
		
		<div class="col-md-2">
		</div>


<!------------------------------------------ 페이지네이션 ---------------------------------------->
<!-- <br> -->
<!-- <div class="row"> -->
<!-- 	<div class="col-md-12 btnMore"> -->
<!-- 		<div class="form-control divMore"> -->
<!-- 			<a href="#" class="a_More">더보기  <span class="arrow"><img src="/resources/image/arrow.PNG"/></span></a> -->
<!-- 			<input type="hidden" id="morePage" name="morePage"/> -->
<!-- 		</div> -->

<!-- 	</div> -->
<!-- </div> -->

