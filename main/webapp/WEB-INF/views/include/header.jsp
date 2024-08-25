<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="/resources/css/header_css.css" %>
<%@ include file="/resources/css/loginForm_css.css" %>
<%@ include file="/resources/css/footer_css.css"%>
<%@ include file="/resources/css/memberVoInfoForm_css.css"%>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- <link type="text/css" rel="stylesheet" href="/resources/css/header_css.css"> -->

<script>

function goSearch() {
	$("#btnSearch").trigger("click");
}

function addressSearch() {
	$("#modalAddrFind").trigger("click");
}

$(function(){
	$("#lblAllCategory , .allCategory_ul").on("mouseover" , function(){
		$(".allCategory_ul").show();
	});
	$("#lblAllCategory , .allCategory_ul").on("mouseout" , function(){
		$(".allCategory_ul").hide();
	});	

	var msg = "${msg}";
	if (msg == "loginSuccess") {
		alert("로그인 성공");
	}else if (msg == "loginFail") {
		alert("로그인 실패");
	}else if (msg == "changePwSuccess") {
		alert("비밀번호 변경 성공");
	}else if (msg == "changePwFail") {
		alert("비밀번호 변경 실패(아이디가 잘못되었는지 확인하시오)");
	}else if (msg == "nonBuyerLoginSuccess"){
		alert("비회원으로 입장 하셨습니다.");
	}else if (msg == "logoutSuccess"){
		alert("로그아웃 되었습니다.");
	}else if (msg == "idIsNull"){
		alert("해당 아이디는 존재하지 않는 아이디 입니다.");
	}
	
	// 검색 버튼
	$("#btnSearch").click(function(){
		var searchName = $("#txtSearch").val();
			console.log(searchName);
		var url = "/page/search?searchName=" + searchName;	
		location.href = url;
		
	});
	
	// 내 주변 매물 찾기 버튼
	$("#selectAddr").click(function() {
		var roadAddress = $("#sample4_roadAddress").val();
		var detailAddress = $("#sample4_detailAddress").val();
		
		var url = "/page/mapSearch?roadAddress=" + roadAddress + "&detailAddress=" + detailAddress;
		location.href = url;
	});
}); // main function	

	function modalTrigger () {
		$("#modalAddr").trigger("click");
}


	 function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var roadAddr = data.roadAddress; // 도로명 주소 변수
	                var extraRoadAddr = ''; // 참고 항목 변수

	                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                    extraRoadAddr += data.bname;
	                }
	                // 건물명이 있고, 공동주택일 경우 추가한다.
	                if(data.buildingName !== '' && data.apartment === 'Y'){
	                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                }
	                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                if(extraRoadAddr !== ''){
	                    extraRoadAddr = ' (' + extraRoadAddr + ')';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('sample4_postcode').value = data.zonecode; // 우편번호
	                document.getElementById('sample4_roadAddress').value = roadAddr; // 도로명 주소
	                
	                if (roadAddr == ""){
	  	              document.getElementById('sample4_roadAddress').value = data.jibunAddress; // 참고항목
	                }
	                
	                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
	                if(roadAddr !== ''){
	                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
	                } else {
	                    document.getElementById("sample4_extraAddress").value = '';
	                }

	                var guideTextBox = document.getElementById("guide");
	                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
	                if(data.autoRoadAddress) {
	                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
	                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
	                    guideTextBox.style.display = 'block';

	                } else if(data.autoJibunAddress) {
	                    var expJibunAddr = data.autoJibunAddress;
	                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
	                    guideTextBox.style.display = 'block';
	                } else {
	                    guideTextBox.innerHTML = '';
	                    guideTextBox.style.display = 'none';
	                }
	            }
	        }).open();
	    }
</script>

<body>
 	<div class="container-fluid header_body">
	
		<div class="row">
		
			<!--top-header -->
			<div class="col-md-12 topHeader">
				<div class="col-md-2"></div>
				
					<div class="col-md-8">
					<a href="/auction/auctionMain" class="btn btn-link topHeader-button">경매사이트로</a>
					<c:choose>														
						<c:when test="${empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a href="/login/loginForm" type="submit" class="btn btn-link topHeader-button">로그인</a>
							<a href="/join/joinForm" type="button" class="btn btn-link topHeader-button">회원가입</a>
						</c:when>							
						<c:when test="${not empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a href="/logout" type="submit" class="btn btn-link topHeader-button">로그아웃</a>
						</c:when>
						<c:when test="${empty sessionScope.memberVo && not empty sessionScope.nonBuyer}">
							<a href="/logout" type="submit" class="btn btn-link topHeader-button">비회원 로그아웃</a>
						</c:when>
						
					</c:choose>						
					<a href="/cart/cartPage" class="btn btn-link topHeader-button">장바구니</a>
					<a href="/service/serviceMain" class="btn btn-link topHeader-button">고객 센터</a>
	
					<c:if test="${sessionScope.memberVo.admin_check == 1}">
						<a href="/admin/adminForm" class="btn btn-link topHeader-button">관리자 페이지</a>
					</c:if>

					<c:choose>
						<c:when test="${empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a class="btn btn-link topHeader-button">회원정보 없음</a>
						</c:when>							

						<c:when test="${not empty sessionScope.memberVo && empty sessionScope.nonBuyer}">
							<a class="btn btn-link topHeader-button" href="/login/memberVoInfoForm">${sessionScope.memberVo.m_id}님 반갑습니다.</a>
							<a href="/sellproduct/sellproductMain" type="button" class="btn btn-link topHeader-button">판매하기</a>
						</c:when>
						<c:when test="${empty sessionScope.memberVo && not empty sessionScope.nonBuyer}">
							<a class="btn btn-link topHeader-button">비회원 신분이십니다.</a>							
						</c:when>
					</c:choose>

						
						<!-- 검색 창 -->		
					<div class="container-1">
						<input type="text" id="txtSearch" name="txtSearch" class="txtSearch" placeholder="검색어" onkeypress="if(event.keyCode==13){goSearch()}"/>
						<button type="button" id="btnSearch"><i class="fas fa-search"></i></button>
					</div>
						
					</div>
					
				<div class="col-md-2"></div>
			</div>
			
			<div class="col-md-2"></div>
			<div class="col-md-8">
			
			<!--  전체 카테고리 보이기 --> 
				<br>
								
					
			<!-- Home 버튼 -->		
				<div class="divHome">
					<a type="button" href="/" class="btn btn-link btnHome">중고 동네</a>
				</div>
				<br>
				<br>
				
<!--------------------------------------- 전체 카테고리 메뉴 ----------------------------------------->

					</div>
				<div class="col-md-2"></div>
		</div>
		
<!-------------------------------------- 주변 매물 찾기 모달 창 --------------------------------------->
		<div class="row">
		<div class="col-md-12">
			<a id="modalAddr" href="#modalAddr-container" role="button"
				class="btn" data-toggle="modal" style="display:none">주소 찾기</a>
<!-- "modal-dialog modal-fullsize modal-center" -->
			<div class="modal fade" id="modalAddr-container" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl" role="document">
					<div class="modal-content">
					
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">지역으로 매물 찾기</h5>
							<button type="button" id="btnModalClose" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						
						<div class="modal-body"> 
							<div id="searchAddr">
								<input type="text" id="sample4_postcode" placeholder="우편번호">
								<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							</div>
							<div id="mainAddr">
								<div id="roadAndextraAddr">
									<input type="text" id="sample4_roadAddress" placeholder="도로명주소">
									<input type="text" id="sample4_extraAddress" placeholder="참고항목"><br>
									<span id="guide" style="color:#999;display:none"></span>
								</div>
									<input type="text" id="sample4_detailAddress" placeholder="상세주소">
							</div>
						</div>
						
						<div class="modal-footer jusoChange">
							<button type="button" class="btn btn-primary" id="selectAddr">주소 선택</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
<!----------------------------------- 주변 매물 찾기 모달 창 END --------------------------------------->
</div>

