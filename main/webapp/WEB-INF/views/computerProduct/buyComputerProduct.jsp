<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProduct_css.css" %>
<%@ include file="../include/header.jsp"%>

<script src="/resources/js/computerScript.js"></script>
<script>
$(function(){
	var price = "${buyComputerVo.c_com_price}";	
	var c_com_product = "${buyComputerVo.c_com_name}";
	var c_com_seller = "${buyComputerVo.c_com_seller}";
	var m_id = "${sessionScope.memberVo.m_id}";
	var p_e_no = "";
	var w_id = "";
	var answer_status = "";
	console.log("m_id:" + m_id);
	var priceFinal = "";
	var index = "";
	var comment_no = "";
	var explain_content = "";
	var inputBuyFormSendData = $(".inputBuyFormSendData");
	var searchBuyFormSendData = $(".searchBuyFormSendData");
	
	//제품 최종 가격 정하기
	$("#confirmPrice").click(function() {
		var productNumber = $("#productNumber").val();
		console.log("productNumber:" + productNumber);
		priceFinal = price * productNumber;
		console.log("priceFinal:" + priceFinal);
		$("#finalPrice").text(priceFinal + "원");		
	});
	
	//상품정보 나타내기
	$("#detailProductExpain").click(function() {
		$("#inquireControll").hide();
		$("#commentTable").hide();
		$("#productExplainTable").hide();
		$("#productExplain").text("상품내용:" + "${buyComputerVo.c_com_content}");
		$("#productExplain").show();
	});
	
	//구매후기 리스트 나타내기
	$("#buyAfter").click(function() {
		$("#inquireControll").hide();
		$("#productExplain").hide();
		$("#productExplainTable").hide();
		$("#commentTable > tbody").empty();
		var indexAfter = 1;
		var url = "/computerProductComment/commentShow";
		var p_no = "${buyComputerVo.p_no}";
		var sendData = {
				"p_no" : p_no
			};		
		$.post(url,sendData, function(data) {
			$.each(data, function() {				
				var tr = $("#trTable").find("tr").clone();
				tr.find("td").eq(0).text(indexAfter);
				tr.find("td").eq(1).text(this.c_com_comment_content);
				tr.find("td").eq(2).text(this.c_com_comment_writer);
				tr.find("td").eq(3).text(changeDateString(this.c_com_comment_regdate));
				if("${sessionScope.memberVo.m_id}" == this.c_com_comment_writer){			
					tr.find("td").eq(4).find("button");
					tr.find("td").eq(5).find("button");			
					}else{
						tr.find("td").eq(4).empty();
						tr.find("td").eq(5).empty();				
					}
				tr.find("td").eq(6).text(this.c_com_comment_no);
				$("#commentTable").append(tr);
				indexAfter++;
			});			
		});
		$("#commentTable").show();
	});
	
	//상품문의 리스트 나타내기
	$("#inquireProduct").click(function() {
		$("#inquireControll").show();
		var indexInquire = 1;
		$("#commentTable").hide();
		$("#productExplain").hide();
		$("#productExplainTable > tbody").empty();
		var url = "/computerProductComment/inquireShow/${buyComputerVo.p_no}";
		$.get(url, function(data) {
			$.each(data, function() {				
				var tr = $("#productExplainTrTable").find("tr").clone();
				answer_status = this.p_e_answer_status;
				tr.find("td").eq(0).text(indexInquire);
				tr.find("td").eq(1).text(this.p_e_answer_status);
				tr.find("td").eq(2).text(this.p_e_inquiry_status);
				tr.find("td").eq(3).text(this.p_e_title);
				tr.find("td").eq(4).text(this.p_e_id);
				tr.find("td").eq(5).text(changeDateString(this.p_e_regdate));
				tr.find("td").eq(6).text(this.p_e_no);
				if(c_com_seller == m_id){
					if(answer_status == "답변예정"){
						var btnER = $("#btnExplainRefDiv").find("button").clone();
						tr.find("td").eq(7).append(btnER);
					}else{
						tr.find("td").eq(7).append("답변됨");
					}					
				}else{					
				tr.find("td").eq(7).text("답변권한 없음");
				}
				if((this.p_e_id == m_id) || (c_com_seller == m_id)){
					tr.find("td").eq(8).text(this.p_e_re);
					w_id = this.p_e_id;
				}else{
					tr.find("td").eq(8).text("");
				}
				$("#productExplainTable").append(tr);
				indexInquire++;
			});
		});
			
		$("#productExplainTable").show();
		
	});
	
	//구매후기 수정하기 버튼 클릭
	$("#commentTable").on("click", ".btnCommentModify", function(){	
		comment_no = $(this).parent().parent().find("td").eq(6).text();
		console.log("comment_no:" + comment_no);
		$("#modal-modify").trigger("click");		
	});
	
	//구매후기 수정
	$("#updateAfterBuyProduct").click(function(){				
		var updateInput = $("#updateInput").val();
		console.log("c_com_comment_content:" + updateInput);
		var url = "/computerProductComment/updateRefContent";
		var sendData = {
			"c_com_comment_content" : updateInput,			
			"c_com_comment_no" : comment_no
		};
		$.post(url, sendData, function(data) {
			if(data == "success"){
				alert("후기 내용 변경 성공");
			}
		});		
	});
	
	//구매후기 삭제
	$("#commentTable").on("click", ".btnCommentDelete", function(){
		comment_no = $(this).parent().parent().find("td").eq(6).text();
		console.log("comment_no:" + comment_no);
		var url = "/computerProductComment/deleteRef";
		var sendData = {							
				"c_com_comment_no" : comment_no,
				"c_com_product"    : c_com_product
			};
			$.post(url, sendData, function(data) {
				if(data != null){
					alert("선택 후기 삭제 성공");
					$("#buyAfterKey").text(data);
				}
			});
	});
	
	//상품문의 보이기
	$("#inquireControll").on("click", "#inquireProductWrite", function(){
		if((m_id != "") && (m_id != c_com_seller)){
			$("#modal-inquireModal").trigger("click");
		}else if(m_id == ""){
			alert("로그인 하시오");
		}else if(m_id == c_com_seller){
			alert("판매자는 작성할 수 없습니다");
		}else{
			alert("무슨 경우인지 모름");
		}					
	});
	
	//상품문의 검색
	$("#inquireControll").on("click", "#searchInquireButton", function(){
		var indexInquire = 1;
		var search = $("#searchInquireListSearch").val();
		console.log("search:" + search);
		var buySelectInquireListSearchOption = $("#buySelectInquireListSearchOption option:selected").val();
		console.log("buySelectInquireListSearchOption:" + buySelectInquireListSearchOption);			
		var c_com_name = "${buyComputerVo.c_com_name}";
		var url = "/computerProductComment/searchInquireExplain";
		var sendData = {
			"p_e_title"	 : search,
			"p_e_inquiry_status" : buySelectInquireListSearchOption,
			"p_e_product"		: c_com_name
		};
		$("#productExplainTable > tbody").empty();
		$.post(url,sendData,function(data){
			$.each(data, function() {
				answer_status = this.p_e_answer_status;
				var tr = $("#productExplainTrTable").find("tr").clone();
				tr.find("td").eq(0).text(indexInquire);
				tr.find("td").eq(1).text(this.p_e_answer_status);
				tr.find("td").eq(2).text(this.p_e_inquiry_status);
				tr.find("td").eq(3).text(this.p_e_title);
				tr.find("td").eq(4).text(this.p_e_id);
				tr.find("td").eq(5).text(changeDateString(this.p_e_regdate));
				tr.find("td").eq(6).text(this.p_e_no);
				if(c_com_seller == m_id){
					if(answer_status == "답변예정"){
						var btnER = $("#btnExplainRefDiv").find("button").clone();
						tr.find("td").eq(7).append(btnER);
					}else{
						tr.find("td").eq(7).append("답변됨");
					}	
				}else{					
				tr.find("td").eq(7).text("답변권한 없음");
				}
				if((this.p_e_id == m_id) || (c_com_seller == m_id)){
					tr.find("td").eq(8).text(this.p_e_re);
					w_id = this.p_e_id;
				}else{
					tr.find("td").eq(8).text("");
				}
				
				$("#productExplainTable").append(tr);
				indexInquire++;
			});	
		});
		$("#productExplainTable").show();
		
	});
	
	//상품문의 기입
	$("#buySelectModalConfirm").click(function(){
		var p_e_contents = $("#p_e_contents").val();
		console.log("p_e_contents:" + p_e_contents);
		var buySelectModalVal = $("#buySelectModal option:selected").val();
		console.log("buySelectModalVal:" + buySelectModalVal);
		var inquireWriter = $("#getInquireId").val();		
		console.log("inquireWriter:" + inquireWriter);
		var getInquireProduct = $("#getInquireProduct").val();
		console.log("getInquireProduct:" + getInquireProduct);
		var url = "/computerProductComment/insertInquireExpain";
		var sendData = {
				"p_e_title" : p_e_contents,
				"p_e_id"	: inquireWriter,
				"p_e_inquiry_status" : buySelectModalVal,
				"p_e_product"        : getInquireProduct
		};
		
			$.post(url,sendData,function(data){
				if(data != null){
					alert("상품문의 사항 전달 성공");
					$("#inquireKey").text(data);
				}
			});		
	});
	
	//구매하기
	$("#buyProduct").click(function(){
		console.log("구매하기 버튼 클릭됨.");
		var price = parseInt($("#finalPrice").text());
		console.log("price:" + price);
		var seller = "${buyComputerVo.c_com_seller}";
		console.log("seller:" + seller);
		var productNum = $("#productNumber").val();
		console.log("productNum:" + productNum);
		var productName = "${buyComputerVo.c_com_name}";
		console.log("productName:" + productName);
		var p_no = "${buyComputerVo.p_no}";
		console.log("p_no:" + p_no);
		var sendMethod = $("#buySelectMenu option:selected").val();
		console.log("sendMethod:" + sendMethod);
		if(m_id == ""){
			alert("로그인 하시오");
		}else{
			if(m_id != c_com_seller){
				if(price == "" || productNum == "0"){
					alert("내용정보 불충분");
				}else{
					searchBuyFormSendData.find("input").eq(0).val(price);
					searchBuyFormSendData.find("input").eq(1).val(seller);
					searchBuyFormSendData.find("input").eq(2).val(productNum);
					searchBuyFormSendData.find("input").eq(3).val(productName);
					searchBuyFormSendData.find("input").eq(4).val(sendMethod);
					searchBuyFormSendData.find("input").eq(5).val(p_no);
					searchBuyFormSendData.find("input").eq(6).val(m_id);
					$("#frmBuyFormSendData").submit();
				}		
			}else{
				alert("판매자가 본인의 상품을 구입할 수 없습니다");
			}
			
		}			
	});
	
	//장바구니에 담기
	$("#putBasket").click(function(){
		var current_id = "${sessionScope.memberVo.m_id}";
		console.log("current_id:" + current_id);
		var p_no = "${buyComputerVo.p_no}";
		console.log("p_no:" + p_no);
		
		var url = "/buyComputerProduct/putBasketProduct";
		
		var sendData = {
				"m_id" 	: current_id,
				"p_no"	: p_no
		};
		if(current_id == null || current_id == ""){
			alert("로그인 하시오.");
		}else{
			$.post(url,sendData,function(data){
				if(data == "success"){
					alert("해당 상품을 장바구니에 추가하였습니다.");
				}
			});
		}		
	});
	
	//선호도 증가
	$("#iLikeThisProduct").click(function(){
		var c_com_name = "${buyComputerVo.c_com_name}";
		var c_com_no = "${buyComputerVo.c_com_no}";
		var url = "/computerProductComment/sendForGetPurchaseLike";
		var sendData = {
				"productName" : c_com_name,
				"c_com_no"	  : c_com_no
				
		};
		if(m_id != ""){
			$.post(url,sendData,function(data){
				if(data == "fail"){
					alert("다시 클릭하시오");
					
				}else{
					alert("선호도 상승");
					$("#likeValue").text(data);
					$("#likeValueProgress").val(data);
				}
			});
		}else{
			alert("중고 동네 회원만 가능합니다");
		}		
	});	
	
	//상품문의 답변하기
	$("#productExplainTbody").on("click", ".btnExplainRef", function(){
		p_e_no = $(this).parent().parent().find("td").eq(6).text();		
		console.log("p_e_no:" + p_e_no);
		
		var ref_content = "";
		ref_content = prompt("상품문의에 대한 답변을 작성하시오","");
		console.log("ref_content:" + ref_content);
		
		if(ref_content == ""){
			alert("답변을 작성하시오");
		}else{
			alert("전송");
			var url = "/computerProductComment/explainRef";
			var sendData = {							
					"p_e_no" 		: p_e_no,
					"ref_content"   : ref_content
				};
				$.post(url, sendData, function(data) {
					if(data == "success"){
						alert("답변성공");						
					}else if(data == "fail"){
						alert("답변실패");
					}					
				});
		}		
	});
});
</script>
<form role="form" id="frmBuyFormSendData" action="/buyComputerProduct/openBuyComputerProductDetail" method="post">
<div class="form-group searchBuyFormSendData" style="display:none;">
	<input type="text" name="price" value=""/>
	<input type="text" name="seller" value=""/>
	<input type="text" name="productNum" value=""/>
	<input type="text" name="productName" value=""/>
	<input type="text" name="sendMethod" value=""/>
	<input type="number" name="p_no" value=""/>
	<input type="text" name="m_id" value=""/>
</div>
</form>

<div class="row">
		<div class="col-md-12">
			 <a id="modal-modify" href="#modal-container-modify" role="button" style="display: none;" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-modify" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog inputModifyModal" role="document">
					<div class="modal-content inputModifyModal">
						<div class="modal-header inputModifyModal">
							<h5 class="modal-title" id="myModalLabel">
								구매후기 수정 폼
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body inputModifyModal">
							<label>구매후기 내용 수정</label>	
						<input type="text" class="form-control" id="updateInput" name="c_com_comment_content" placeholder="구매후기 내용 수정사항"/>
						<input type="text" style="display: none;" id="getId" value="${buyComputerVo.c_com_seller}"/>
						</div>
						<div class="modal-footer">
							<button type="button" id="updateAfterBuyProduct" class="btn btn-primary">
								변경
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-inquireModal" href="#modal-container-inquireModal" role="button"  style="display: none;" class="btn" data-toggle="modal">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-inquireModal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								상품문의 작성
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<div class="row">
		<div class="col-md-12" style="right:31px">
						<select id="buySelectModal">
							<option value="상품문의" selected="selected">상품문의</option>
							<option value="배송">배송</option>
							<option value="교환">교환</option>
							<option value="반품/취소/환불">반품/취소/환불</option>
							<option value="기타">기타</option>
						</select>								
						<input type="text" class="form-control" name="p_e_contents" id="p_e_contents" placeholder="상품문의 사항 작성"/>
						<input type="text" style="display: none;" id="getInquireId" value="${sessionScope.memberVo.m_id}"/>
						<input type="text" style="display: none;" id="getInquireProduct" value="${buyComputerVo.c_com_name}"/>
						</div>
						</div>
						</div>
						<div class="modal-footer">							 
							<button type="button" id="buySelectModalConfirm" class="btn btn-primary">
								작성완료
							</button> 
							<button type="button" id="buySelectModalCancle" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
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
<div id="btnExplainRefDiv" style="display: none;">
<button type="button" class="btn btn-xs btn-primary btnExplainRef">답변</button>
</div>
<div class="row">
<div class="col-md-12">
<div class="buycomputersFormDiv">
<nav class="buyleftupnav">
</nav>
<header class="buyheader">
<div class="row">
		<div class="col-md-12">
			<nav>
				<ol class="breadcrumb">
					<li class="breadcrumb-item">
						컴퓨터
					</li>
					<li class="breadcrumb-item">
						${indexName[2]}
					</li>
					<li class="breadcrumb-item">
						${indexName[1]}
					</li>
					<li class="breadcrumb-item">
						${indexName[0]}
					</li>
				</ol>
			</nav>
		</div>
	</div>
</header>
<aside class="buyrightupaside">
</aside>
<nav class="buyleftnav">
<table style="display: none;" id="trTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td>
					<button type="button"
							class="btn btn-xs btn-primary btnCommentModify">수정</button>
					</td>
					<td>
					<button type="button"
							class="btn btn-xs btn-warning btnCommentDelete">삭제</button>
					</td>
					<td style="display: none;"></td>					
				</tr>
			</table>
<table style="display: none;" id="productExplainTrTable">
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>					
					<td style="display: none;"></td>					
					<td></td>					
					<td></td>					
				</tr>
			</table>
</nav>
<nav class="buynav">
<c:choose>
<c:when test="${buyComputerVo.c_com_pic == null}">
<img src="/resources/computerImage/default.png" style="width:400px; height:300px;"/>
</c:when>
<c:otherwise>												
<img src="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${buyComputerVo.c_com_pic}" style="width:400px; height:300px;"/>
</c:otherwise>
</c:choose>
</nav>
<aside class="buyaside">
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							${buyComputerVo.c_com_name}
						</th>						
						<th>
							<button id="iLikeThisProduct">좋아요</button>
						</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<span>${buyComputerVo.c_com_price}</span>원
						</td>
						<td>
						</td>						
					</tr>
					<tr>
						<td>
							컴퓨터 카테고리내에서의 구매율:(<span>${productBuyPercentage}</span>)&percnt;
							<div>
							<progress value="${productBuyPercentage}" max="100"></progress>
							</div>
						</td>
						<td>
						</td>						
					</tr>					
					<tr>
						<td>
							상품수량선택:&nbsp;
							<input id="productNumber" type="number" min="0" max="100" step="1" value="0"/>
							<button type="button" id="confirmPrice">결정</button>
						</td>
						<td>
						</td>						
					</tr>
					<tr>
						<td>
							총 상품금액:<span id="finalPrice">0원</span>
						</td>
						<td>
						</td>						
					</tr>
					<tr>
						<td>
							<select id="buySelectMenu">
							<option value="택배무료배송" selected="selected">택배무료배송</option>
							<option value="직접방문수령">직접방문수령</option>
							<option value="퀵서비스">퀵서비스</option>
						</select>
						</td>
						<td>
						</td>						
					</tr>
					<tr>
						<td>
							컴퓨터 카테고리내에서의 선호도:(<span id="likeValue">${productBuyLike}</span>)&percnt;
							<div>
							<progress id="likeValueProgress" value="${productBuyLike}" max="100"></progress>
							</div>
						</td>
						<td>
						</td>
					</tr>
					<tr>
						<td>
							<button type="button" id="putBasket">장바구니</button>
							<button type="button" id="buyProduct">구매하기</button>
						</td>
						<td>
						</td>						
					</tr>
				</tbody>
			</table>
		</div>
	</div>			
</aside>
<aside class="buyrightaside">
</aside>
<nav class="buyleftdownnav">
</nav>
<footer class="buyfooter">
<ul class="nav nav-tabs breadcrumb">
<li class="nav-item"><button id="detailProductExpain">상세설명</button></li>&nbsp;&nbsp;&nbsp;
<li class="nav-item"><button id="buyAfter">구매후기(<span id="buyAfterKey">${computerCommentCount}</span>)</button></li>&nbsp;&nbsp;&nbsp;
<li class="nav-item"><button id="inquireProduct">상품문의(<span id="inquireKey">${productExplainCount}</span>)</button></li>
</ul>
</footer>
<aside class="buyrightdownaside">
</aside>
<nav class="buyleftbeneathdownnav">
</nav>
<footer class="buybeneathfooter">
<div class="row">
	<div class="col-md-12">
			<p style="display: none;" id="productExplain">				
			</p>
		</div>	
	</div>
	<div class="row">
	<div class="col-md-12">
			<table class="table" id="commentTable" style="display: none;">
				<thead>
					<tr>
						<th>댓글번호</th>
						<th>댓글내용</th>
						<th>작성자</th>
						<th>날짜</th>
						<th></th>
						<th></th>						
						<th></th>						
					</tr>
				</thead>
				<tbody id="tableTbody">
				</tbody>
			</table>		
	</div>
</div>
<div class="row">
		<div class="col-md-12">
		<div>
		<ul class="nav nav-tabs breadcrumb" id="inquireControll" style="display: none;">
		<li class="nav-item"><input placeholder="문의내용 입력" id="searchInquireListSearch" type="text"/><button type="button" id="searchInquireButton">검색</button></li>&nbsp;&nbsp;&nbsp;
		<li class="nav-item">						 
				<select id="buySelectInquireListSearchOption">
							<option value="상품문의" selected="selected">상품문의</option>
							<option value="배송">배송</option>
							<option value="교환">교환</option>
							<option value="반품/취소/환불">반품/취소/환불</option>
							<option value="기타">기타</option>
						</select>			
			</li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
		<li class="nav-item"><button id="inquireProductWrite">상품문의</button></li>
		</ul>
		</div>	
			<table class="table" id="productExplainTable" style="display: none;">
				<thead>
					<tr>
						<th>번호</th>
						<th>답변상태</th>
						<th>문의유형</th>
						<th>문의내용</th>
						<th>작성자</th>
						<th>작성일자</th>												
						<th style="display: none;"></th>																	
						<th></th>																	
						<th>답변내용</th>												
					</tr>
				</thead>
				<tbody id="productExplainTbody">
				</tbody>
			</table>
		</div>	
</div>
</footer>
<aside class="buyrightbeneathdownaside">
</aside>
</div>
</div>
</div>