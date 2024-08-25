	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="include/header.jsp"%>

<script>
$(function(){
	var msg = "${msg}";
	if(msg == "upload"){
		alert("상품이 등록되었습니다.");
	} else if(msg == "inquirySuccess"){
		alert("1:1 문의를 정상적으로 전송했습니다.");
	}
	//더 보기 버튼
	$(".divMore").click(function(e){		
		e.preventDefault();
	var startNum = $(".list").length;
		
		console.log(startNum);
		
	var url = "/page/morePage";
	var sendData = {
		"startNum" : startNum	
	};
		$.get(url, sendData, function(data){
			$.each(data, function(){
// 				console.log(data);
				var ul = $(".productList > ul:eq(0)").clone();
					ul.find("img").eq(0).attr("src" ,"resources/image/" + this.p_thumbimg);  // 썸네일
					ul.find("a").eq(1).text(this.p_name);  // 상품이름
					ul.find("span").eq(0).text(this.p_price);  // 상품가격
					ul.find("a").eq(2).text(this.p_seller);  // 판매자
					ul.find("a").eq(1).attr("href" , "/page/content?p_no=" + this.p_no)
					ul.css("display" , "");
// 				 $(".productList > ul:eq(0)").remove();
					$(".productList").append(ul);
			});
// 			startNum = startNum + 3;
		});
		
	});
	
	// 메인 카테고리 스크롤 이동 시에 따라오기
	$(window).scroll(function() {
		var position = $(window).scrollTop(); // 현재 스크롤 위치
// 		console.log(position);
		
		// 현재 스크롤 위치가 200이 넘어가면
		if(position >= 200) {
			// 기존 클래스 제거 
			$("#borderAllCategory").removeClass("borderAllCategory");
			
			// 새 클래스 추가
			$("#borderAllCategory").addClass("borderAllCategory_scroll");
			
			// 검색 창 생성
			$("#divSearch_Form").show();
			$("#main-menu").append($("#li_ScrollSearch"));
			
		} else if (position <= 200) {
			
			// 새 클래스 제거
			$("#borderAllCategory").removeClass("borderAllCategory_scroll");
			
			// 기존 클래스 추가
			$("#borderAllCategory").addClass("borderAllCategory");
			
			// 검색 창 제거
			$("#divSearch_Form").hide();
			$("#main-menu").remove($("#li_ScrollSearch"));
			
		}
		
		// 스크롤 값 1000 넘어가면
		if (position >= 900) {
			
			// 배너 클래스 제거 및 추가
			$("#divBanner").removeClass("divBanner");
			
			$("#divBanner").addClass("divBanner_scroll");
			
		} else if (position <= 900) {
			$("#divBanner").removeClass("divBanner_scroll");
			$("#divBanner").addClass("divBanner");
			
		}
 		
		
		
	});
	
}); // main function


</script>


<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
	
<div class="row">
	<div class="col-md-12 borderAllCategory" id="borderAllCategory">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="include/header_mainCatagories.jsp"%>
</div>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->

	</div>
</div>
		<div class="col-md-2">
		</div>

			<div class="row">
				<div class="col-md-12">
					<div class="carousel slide" id="carousel-849276" data-interval="4000">
						<ol class="carousel-indicators">
							<li data-slide-to="0" data-target="#carousel-849276"></li>
							<li data-slide-to="1" data-target="#carousel-849276"></li>
							<li data-slide-to="2" data-target="#carousel-849276"
								class="active"></li>
						</ol>
						<div class="carousel-inner">
						
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap First"
									src="/resources/image/mainimage1.jpg" />
							</div>
							
							<div class="carousel-item">
								<img class="d-block w-100" alt="Carousel Bootstrap Second"
									src="/resources/image/mainimage2.jpg" />
								<div class="carousel-caption">
									<h4>14 Color / free 니트 </h4>
									<p id="carousel-detail"><span id="carousel-discount">30%</span><strike id="txtStrike">69,900원</strike>48,900원</p>
								</div>
							</div>
							
							<div class="carousel-item active">
								<img class="d-block w-100" alt="Carousel Bootstrap Third"
									src="/resources/image/mainimage3.jpg" />
								<div class="carousel-caption">
									<h4>ROG G512LI-HN061 10세대 게이밍 최종 102만 특가</h4>
									<p id="carousel-detail"><span id="carousel-discount">5%</span><strike id="txtStrike">1,209,480</strike>1,149,000원</p>
								</div>
							</div>
						</div>
						<a class="carousel-control-prev" href="#carousel-849276"
							data-slide="prev"><span class="carousel-control-prev-icon"></span>
							<span class="sr-only">Previous</span></a> <a
							class="carousel-control-next" href="#carousel-849276"
							data-slide="next"><span class="carousel-control-next-icon"></span>
							<span class="sr-only">Next</span></a>
					</div>
			</div>
					
					<!------------------------------------------ 상품 리스트 ---------------------------------------->
					
	<div class="col-md-2">
	
		<!-- 배너1 -->
			<div class="divBanner" id="divBanner"> 
				<div class="banner_contents">
					<img src="resources/image/banner.PNG"/>
				</div> 
			</div>	
	</div>
					
		<div style="padding-top: 40px;">
			<div class="row listMain">
					
			</div>
				<div class="col-md-8 productList" style="left: 25%;">
					
					<!-- 히든(복사) 데이터 -->
					<ul class="nav nav-pills list" style="display:none;">
							<li class="nav-item"><a class="nav-link" href="/page/content?p_no=${all_list.p_no}"><img style="width:225px; height:225px;" src="resources/image/${all_list.p_thumbimg}"/></a></li>
							<li class="nav-item" style="width:365px;"><a class="nav-link productName" href="/page/content?p_no=${all_list.p_no}">${all_list.p_name}<br></a><span id="price">${all_list.p_price }</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${all_list.p_seller}</a></li>
					</ul>
					
					<!-- 전체 상품 목록(7개만) -->
				<c:forEach var="all_list" items="${selectAll_List}">
					<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="/page/content?p_no=${all_list.p_no}"><img style="width:225px; height:225px;" src="resources/image/${all_list.p_thumbimg}"/></a></li>
							<li class="nav-item" style="width:365px;"><a class="nav-link productName" href="/page/content?p_no=${all_list.p_no}">${all_list.p_name}<br></a><span id="price">${all_list.p_price }</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${all_list.p_seller}</a></li>
					</ul>
				</c:forEach>
					
					
				</div>
				
				<div class="col-md-2">
					
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
					
				</div>
			</div>


<!------------------------------------------ 더보기 버튼 ---------------------------------------->
<br>
<div class="row">
	<div class="col-md-12 btnMore">
		<div class="form-control divMore">
			<a href="#" class="a_More">더보기  <span class="arrow"><img src="resources/image/arrow.PNG"/></span></a>
			<input type="hidden" id="morePage" name="morePage"/>
		</div>

	</div>
</div>
<!--------------------------------------- 더보기 버튼 END---------------------------------------->


	<!-- 스크롤 내리면 생기는 검색 창 -->		
<li id="li_ScrollSearch">
	<div id="divSearch_Form">
		<input type="text" id="scroll_txtsearch" name="txtSearch" class="scroll_txtsearch" placeholder="검색어" onkeypress="if(event.keyCode==13){goSearch()}"/>
		<button type="button" id="btnSearch"><i class="fas fa-search"></i></button>
	</div>
</li>



