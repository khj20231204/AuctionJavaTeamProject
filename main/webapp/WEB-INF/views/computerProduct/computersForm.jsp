<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/computersForm_css.css" %>
<%@ include file="../include/header.jsp"%>
<script src="/resources/js/computerScript.js"></script>
<script>
$(function() {
	var inputConfirm = "";
	var inputCheckbox = $(".checkB");
	var inputCheckForm = $("#divData");
	var backList = $(".backList");
	var detailSearchFormFind = $(".detailSearchFormFind");
	var searchInComputerInfo = $(".searchInComputerInfo");
	var searchInComputerPriceSend = $(".searchInComputerPriceSend");
	var searchInComputerPriceForm = $(".searchInComputerPriceForm");
	var searchInComputerById = $(".searchInComputerById");
	var findIdSearchFormFind = $(".findIdSearchFormFind");	

	//체크박스 체크된 값 컨트롤러로 보내기
	$("#checkboxSearch").click(function() {
		inputCheckForm.empty();		
		for(var i = 0; i<6; i++){
			if(inputCheckbox.find("input").eq(i).is(":checked") == true){
				var indexCheckBox = "check"+ i + "no";
				console.log("indexCheckBox:"+ indexCheckBox);
				var input = inputCheckbox.find("input").eq(i).clone();
				input.attr("name",indexCheckBox);
				inputCheckForm.append(input);			
			}
		}
		if((inputCheckbox.find("input").eq(0).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(1).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(2).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(3).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(4).is(":checked") == false)
			&& (inputCheckbox.find("input").eq(5).is(":checked") == false)			
			){
			alert("체크항목 없음");	
		}else{			
		$("#frmData").submit();
		}						
	});
	
	//뒤로가기 기능
	$("#computersBack").click(function() {		
		inputCheckForm.empty();		
 		for(var i = 0; i<6; i++){
 			var indexCheckBox = "check"+i + "no";
 			var input = backList.find("input").eq(i).clone();
 			var inputVal = backList.find("input").eq(i).val();
 			if(inputVal != null){
 			var nthNum = inputVal.length;
 			console.log("inputValLength:" + nthNum);	
 			var nthNumSubstring = inputVal.substring(0,nthNum-1);
 			console.log("input:" + input);
 			console.log("inputVal:" + inputVal);
 			console.log("inputValLengthSubstring:" + nthNumSubstring);
 			
 			input.attr("name",indexCheckBox);
			
 			input.attr("value", nthNumSubstring);
 			inputCheckForm.append(input);
 			}
 		}
 		for(var i = 0; i<6; i++){
 			var inputConfirmValue = backList.find("input").eq(i).val();
 			console.log("inputConfirmValue:" + inputConfirmValue);
 			if(inputConfirmValue != ""){
 				inputConfirm = inputConfirmValue;
 				console.log("inputConfirm:" + inputConfirm);
 			}
 		} 		
 		if(inputConfirm != ""){
 			var nth = inputConfirm.length;
 			console.log("nth:" + nth);
 	 		if(nth < 4){
 	 				alert("뒤로 갈수  없음");	
 	 			}else{
 	 				$("#frmData").submit(); 	 			
 	 			}	
 		}	
	});
	
	//제품이름으로 검색
	$("#detailSearch").click(function() {
		searchInComputerInfo.empty();
		var inputName = detailSearchFormFind.find("input").clone();
		var inputVal = detailSearchFormFind.find("input").val();
		console.log("inputVal:"+ inputVal);
		searchInComputerInfo.append(inputName);
		for(var i = 0; i<6; i++){
			var searchIndex = "search"+i + "no";
 			var input = backList.find("input").eq(i).clone();
 			console.log("searchIndex_name:" + searchIndex);
 			input.attr("name",searchIndex);
 			searchInComputerInfo.append(input);
		}
		if(inputVal == ""){
			alert("검색어를 입력하시오.");
		}else{
			
 		$("#frmSearchData").submit();
		}
		});

	//판매자 아이디로 제품 검색
	$("#findIdSearch").click(function() {
		searchInComputerById.empty();
		var ByIdFindInput = findIdSearchFormFind.find("input").clone();
		var IdVal = findIdSearchFormFind.find("input").val();		
		console.log("IdVal:" + IdVal);
		searchInComputerById.append(ByIdFindInput);
		for(var i = 0; i<6; i++){
			var byIdIndex = "byId" + i + "no";
 			var input = backList.find("input").eq(i).clone();
 			console.log("byIdIndex_name:" + byIdIndex);
 			input.attr("name",byIdIndex);
 			searchInComputerById.append(input);
		}
		if(IdVal == ""){
			alert("판매자 아이디를 입력하시오.");
		}else{
			
 		$("#frmSearchById").submit();
		}
	});

	//가격대로 제품검색
	$("#detailPrice").click(function() {
		searchInComputerPriceSend.empty();
		var inputName1 = searchInComputerPriceForm.find("input").eq(0).clone();
		var inputName2 = searchInComputerPriceForm.find("input").eq(1).clone();
		var inputValue1 = searchInComputerPriceForm.find("input").eq(0).val();
		var inputValue2 = searchInComputerPriceForm.find("input").eq(1).val();
		console.log("inputValue1:" + inputValue1);
		console.log("inputValue2:" + inputValue2);
		searchInComputerPriceSend.append(inputName1);
		searchInComputerPriceSend.append(inputName2);
		for(var i = 0; i<6; i++){
			var searchIndex = "search"+ i + "no";
 			var input = backList.find("input").eq(i).clone();
 			console.log("searchIndex_price:" + searchIndex);
 			input.attr("name",searchIndex);
 			searchInComputerPriceSend.append(input);
		}
		if(inputValue1 == "" || inputValue2 == ""){
			alert("가격대를 입력하시오.");
		}else{	
		if(inputValue1 <= inputValue2){
			
  		$("#frmSearchPrice").submit();
		}else{
			alert("시작가격이 마지막 가격보다 작거나 같아야 합니다.");
		}
		}
	});
	
	//최근본 상품리스트 숨기기
	$("#computerFavorProduct > li > a").bind({ 
		"mouseover" : function() {   
			$("#computerFavorProduct > li > ul").hide(); 
			$(this).next().show(); 			
		},
		
		"mouseout" : function() { 
			$("#computerFavorProduct > li > ul").hide();			
		}
	});

	//최근본 상품리스트 보이기
	$("#computerFavorProduct > li > ul").on("mouseover" ,function(){
		$(this).show();
	});	

	//최근본 상품리스트 숨기기-
	$("#computerFavorProduct > li > ul").on("mouseout" ,function(){
		$(this).hide(); 
	});

	//상품 정보 보이기
	$(".showProductInfo").click(function() {
	 	alert("제품설명 모달창을 띄움니다");	 	
	 	var p_no = $(this).attr("data-pno");
	 	console.log("p_no:" + p_no);
		var url = "/computerProduct/detailComputerForm/" + p_no;
		$.get(url, function(data) {
			console.log("data:" + data);
			var tr0 = $("#productInfoTrTable").find("tr").eq(0);
			var tr1 = $("#productInfoTrTable").find("tr").eq(1);
			var tr2 = $("#productInfoTrTable").find("tr").eq(2);
			var tr3 = $("#productInfoTrTable").find("tr").eq(3);
			var tr4 = $("#productInfoTrTable").find("tr").eq(4);
			
			tr0.find("td").eq(1).text(data.c_com_name);
			tr1.find("td").eq(1).text(data.c_com_seller);
			tr2.find("td").eq(1).text(data.c_com_content);
			tr3.find("td").eq(1).text(data.c_com_price + "원");			
			tr4.find("td").eq(1).text(changeDateString(data.c_com_regdate));			
		});
		$("#modal-Info").trigger("click");
	});	
});
</script>
	<div class="row">
		<div class="col-md-12">
<a id="modal-Info" href="#modal-container-Info" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>
			<div class="modal fade" id="modal-container-Info" role="dialog" aria-labelledby="myLargeModalLabe" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								제품설명창
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<div class="row">
		<div class="col-md-12" style="right:61px">							
			<table class="table">
				<thead>
					<tr>
						<th>
							목차
						</th>
						<th>
							내용
						</th>
					</tr>					
				</thead>
				<tbody id="productInfoTrTable">
					<tr>
						<td>
							제품명:
						</td>
						<td>
							
						</td>
					</tr>						
					<tr>
												
						<td>
							판매자:
						</td>
						<td>
														
						</td>
					</tr>						
					<tr>
												
						<td>
							제품설명:
						</td>
						<td>
														
						</td>
					</tr>						
					<tr>	
						<td>
							가격:
						</td>
						<td>
							
						</td>
					</tr>					
					<tr>	
						<td>
							올린 날짜:
						</td>
						<td>
							
						</td>
					</tr>									
				</tbody>
			</table>
			</div>
			</div>		
						</div>
						<div class="modal-footer">							 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>	
			</div>
			</div>		
<div style="display: none;" id="cate_no_form">
<input type="text" name="cate_no_form" value="${cate_no_list}"/>
</div>	
<div class="row">
		<div class="col-md-2"></div>
<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
	</div>
	<div class="col-md-2"></div>
</div>			
		<br>
		<br>		
<form class="backList" style="display: none;">
<c:forEach var="cate_no_list" items="${cate_no_confirm}">	
<input type="text" name="${cate_no_list}" value="${cate_no_list}"/>
</c:forEach>
</form>
<form role="form" id="frmSearchData" action="/computerProduct/computersFormSearch" method="post">
<div class="form-group searchInComputerInfo" style="display: none;">
</div>
</form>
<form role="form" id="frmSearchPrice" action="/computerProduct/computersFormSearchPrice" method="post">
<div class="form-group searchInComputerPriceSend" style="display: none;">
</div>
</form>
<form role="form" id="frmSearchById" action="/computerProduct/computersFormSearchById" method="post">
<div class="form-group searchInComputerById" style="display: none;">
</div>
</form>
<div class="computersFormDiv">
<nav class="navUp">
<div class="dropdown">
	<a class="dropdown-toggle" style="cursor: pointer;"
			data-toggle="dropdown">컴퓨터 카테고리 중 최근 결제한 상품</a>
		<div class="dropdown-menu" aria-labelledby="dropdownMenuButton"
							style="background-color: #eeddcc">
		
		<a class="dropdown-item" href="#">
		<c:choose>
	
			<c:when test="${not empty cookie.productAName.value}">
				${cookie.productAName.value}
			</c:when>			
			<c:otherwise>
				
			</c:otherwise>
			
		</c:choose>
		</a>		
		</div>
		</div>	
</nav>
<header class="header">
<c:if test="${categoryInfo != null}">
<label class="computerFormListMenu">전체</label>&nbsp<button id="checkboxSearch" class="btn btn-warning btn-xs">검색</button>
&nbsp<button id="computersBack" class="btn btn-warning btn-xs">뒤로</button>
<ul class="nav nav-tabs computerFormListMenuItem">
<c:forEach var="CategoryVo" items="${categoryInfo}">
<li class="nav-item checkB">&nbsp;&nbsp;&nbsp;${CategoryVo.cate_name}
&nbsp<input type="checkbox" name="${CategoryVo.cate_no}" value="${CategoryVo.cate_no}"/>
</li>
</c:forEach>
</ul>
</c:if>
<form id="frmData" action="/computerProduct/computersFormCheck" method="post">
	<div id="divData" style="display:none;">		
	</div>
</form>
</header>
<aside class="asideUp">
<a href="http://www.auction.co.kr/" target="_blank" title="제휴사이트입니다.">
<img src="/resources/bannerImage/auction.png" alt="제휴사이트" class="asideUpBanner"/>
</a></aside>
<nav class="navLeft">
<span>현재 상품 건수:</span>&nbsp;&nbsp;(<span>${listNumber}</span>)&nbsp;<span>건</span>
<br>
<br>
<form role="form">
<div class="form-group detailSearchFormFind">					 
<label>
결과내 검색
</label>
<input type="text" id="c_com_name" class="form-control" placeholder="검색어를 입력하시오" name="c_com_name" required="required"/>
<button type="button" id="detailSearch" class="btn btn-xs btn-warning">
검색
</button>
</div>				
</form>			
<br>
<br>			
<br>			
<form role="form">
<div class="form-group searchInComputerPriceForm">					 
<label>
가격대
</label>
<input type="number" name="firstPrice" class="form-control" placeholder="시작 가격" required="required"/>
~
<input type="number" name="lastPrice" class="form-control" placeholder="나중 가격" required="required"/>
<button type="button" id="detailPrice" class="btn btn-xs btn-warning">
검색
</button>
</div>				
</form>
<br>	
<br>	
<br>
<form role="form">
<div class="form-group findIdSearchFormFind">					 
<label>
판매자를 통한 상품검색
</label>
<input type="text" id="c_com_seller" class="form-control" placeholder="판매자 아이디를 입력하시오" name="c_com_seller" required="required"/>
<button type="button" id="findIdSearch" class="btn btn-xs btn-warning">
검색
</button>
</div>				
</form>		
</nav>
<section class="section">
<div class="col-md-12">
	<c:forEach var="ComputerVo" items="${computerList}">	
						<table class="computerTable">
							<thead class="computerThead">
								<tr>
									<th>
										상품이미지								
									</th>
									<th>
										상품명								
									</th>
									<th>
										판매자								
									</th>
									<th>
										가격								
									</th>
									<th>
										구매								
									</th>									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>									
										<c:choose>
											<c:when test="${ComputerVo.c_com_pic == null}">
												<img src="/resources/computerImage/default.png" style="width:150px; height:150px;"/>
											</c:when>
										<c:otherwise>												
												<img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${ComputerVo.c_com_pic}" style="width:150px; height:150px;"/>
											</c:otherwise>
										</c:choose>										
									</td>
									<td>
										${ComputerVo.c_com_name}&nbsp;&nbsp;<button type="button" class="showProductInfo" data-pno="${ComputerVo.p_no}">상세보기</button>
									</td>
									<td>
										${ComputerVo.c_com_seller}
									</td>
									<td>
										<span id="price">${ComputerVo.c_com_price}</span>원
									</td>
									<td>
										<a href="/computerProduct/buyComputerProduct/${ComputerVo.p_no}">상품구매하기</a>
									</td>									
								</tr>
							</tbody>			
						</table>
						<hr>
					</c:forEach>
				</div>
</section>
<aside class="aside">
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