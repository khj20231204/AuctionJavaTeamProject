<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
	href="https://cdn.materialdesignicons.com/4.9.95/css/materialdesignicons.min.css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto&display=swap" />
<link rel="stylesheet" href="/resources/css/styles.css" />
<link rel="stylesheet" href="/resources/css/sidebar.css" />
<%@ include file="/resources/css/whitegoods.css"%>
<%@ include file="../include/header.jsp"%>

<script>
$(function(){

	$(".showOtherCategory").on("mouseover", function(){
		var cate_no = $(this).attr("data-cateno");
		var url="/whitegoods/whitegoodsCate";
		var sendData = {
				"w_cate_no":cate_no
		};
		
		$.get(url, sendData, function(data){
			$("#tab-cont").show();
			var that = $("#divcateList");
			that.empty();
			$.each(data,function(){
				var a = "<a href='/whitegoods/whitegoodsPage/" + this.cate_no + "' class='showOtherProductList'>";
				a += this.cate_name;
				a += "</a>";
				
				that.append(a);
			});
		});
	});
}); // main function
</script>
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>

<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
			<div id="tab-menu">
				<div id="tab-btn">
					<ul>
						<c:forEach var="CategoryVo" items="${firstCategoryList}">
							<li><a href="#" class="showOtherCategory" data-cateno="${CategoryVo.cate_no}">${CategoryVo.cate_name}</a></li>
						</c:forEach>
					</ul>
				</div>
				  
				<div id="tab-cont" style="display: none;">
					<div id="divcateList">
						<a href="#" class="showOtherProductList"></a>
					</div>
				</div>
			</div>

<!------------------------------------------ 상품 리스트 ---------------------------------------->
		<div style="padding-top: 150px;">
			
			<div class="row listMain">
					
				<div class="col-md-2"></div>
				<div class="col-md-8 whitegoodsList">
				
					<c:forEach var="whitegoodsVo" items="${WhitegoodsList}">
						<ul class="nav nav-pills list">
							<li class="nav-item"><a class="nav-link" href="/whitegoods/detailWhitegoods/${whitegoodsVo.w_no}"><img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${whitegoodsVo.w_thumbimg}" style="width:140px; height:200px;"/></a></li>
							<li class="nav-item"><a class="nav-link productName" href="/whitegoods/detailWhitegoods/${whitegoodsVo.w_no}">${whitegoodsVo.w_name}<br></a><span id="price">${whitegoodsVo.w_price}</span>원<br> 무료배송</li>
							<li class="nav-item"><a class="nav-link seller">${whitegoodsVo.w_seller}</a></li>
						</ul>
					</c:forEach>
				</div>
				<div class="col-md-2"></div>
			</div>
		</div>
<!------------------------------------------ 상품 리스트 ---------------------------------------->
	</div>
	<div class="col-md-2"></div>
</div>
		


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
<!-- -------------------------------------- 페이지네이션 ------------------------------------- -->