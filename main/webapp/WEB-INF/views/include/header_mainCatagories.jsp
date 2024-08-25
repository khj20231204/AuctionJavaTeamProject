<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>
$(function(){
	
	// 내 주변 매물 찾기 시 주소 모달창 띄우기
	$("#divPlace").click(function() {
		modalTrigger();
	});
	
// 	$(".menuLink , .submenu").bind({
// 		"mouseover" : function() {
// 			$("#carousel-849276").css("margin-top", "50px");
// 		},
// 		"mouseout" : function() {
// 			console.log("out");
// 			$("#carousel-849276").css("margin-top", "0px");
// 		}
// 	});
	
	// 메인 카테고리 마우스 기능 정의
	$("#main-menu > li > a").bind({  // 메인 카테고리 여러가지 기능 정의
		"mouseover" : function() {   // 메인 카테고리에 마우스 오버 일 때
			$("#main-menu > li > ul").hide(); // 전체 서브 메뉴 숨기기
			$(this).next().show(); // 메인 카테고리 오버한것의 서브 메뉴만 보이기
			
		},
		
		"mouseout" : function() { // 메인 카테고리 마우스 아웃 일 때
			$("#main-menu > li > ul").hide(); // 전체 서브메뉴 숨기기
			
		}
	});
	
	// 서브메뉴에 마우스 오버 일 때
	$("#main-menu > li > ul").on("mouseover" ,function(){
		$(this).show(); // 서브메뉴 보이기
	});
	
	// 서브메뉴에 마우스 아웃 일 때
	$("#main-menu > li > ul").on("mouseout" ,function(){
		$(this).hide(); // 서브메뉴 숨기기
	});
	
});
</script>

<nav id="mainNav" role="navigation">
  <ul id="main-menu">
  
  	<!-- 전체 카테고리  -->	
  	<li style="width:160px;"><a href="#" id="allCategory">&#8801;</a>
    	<ul class="sub-menu" style="top: 60%;position: absolute;left: 50%;width: 200px;display: none;">
				<li><a href="#" class="submenuLink">전체 카테고리</a></li>
				<li><a href="#" class="submenuLink">전체 카테고리</a></li>
    	</ul>
    </li>
  	
  	
  	<!-- 베스트 아이템  -->	
  	<li>
	  <a class="neon" href="/page/best">HOT ITEM</a>
	</li>
  
  <!-- 메인 카테고리 목록 -->
	<li>
		<a id="divPlace" href="#"><span style="color:red; font-weight:bold;">내 주변 매물 찾기</span></a>
	</li>
	
   <c:forEach var="CategoryVo" items="${sessionScope.firstCategory}">
   	<li><a href="#">${CategoryVo.cate_name}</a>
      <ul class="sub-menu">
      
     	 <c:forEach var="subCategoryVo" items="${sessionScope.AllCategory}">
			<c:if test="${subCategoryVo.cate_ref == CategoryVo.cate_no}">
				<li><a href=
					<c:choose>
					
						<c:when test="${CategoryVo.cate_no == 10}">
						"/clothes/${subCategoryVo.cate_no}?cate_no=${subCategoryVo.cate_no}"
						</c:when>
						
						<c:when test="${CategoryVo.cate_no == 20}">
						"/furniture/${subCategoryVo.cate_no}"
						</c:when>
						
						<c:when test="${CategoryVo.cate_no == 30}">
						"/whitegoods/whitegoodsPage/${subCategoryVo.cate_no}"
						</c:when>
						
						<c:when test="${CategoryVo.cate_no == 50}">
						"/computerProduct/computersForm/${subCategoryVo.cate_no}"
						</c:when>
						<c:otherwise>
						"#"
						</c:otherwise>
					</c:choose>
					 
				 class="submenuLink">${subCategoryVo.cate_name}</a></li>
				</c:if>
		 	</c:forEach>
     	  </ul>
    	</li>
   	 </c:forEach>
   	 
   	 
  	</ul>
</nav>
