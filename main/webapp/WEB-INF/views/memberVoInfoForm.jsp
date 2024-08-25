<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>

<br>
<br>
<br>
<br>
<br>
<script>	
$(function() {
	var secretCodeNum = "";
	var memberPoint = "${memberVoInfo.m_point}";
	
	//멤버 등급 나타내기
	if((memberPoint >= 0) && (memberPoint < 5000)) {
		$("#memberGrade").text("일반회원");
	} else if((memberPoint >= 5000) && (memberPoint < 10000)) {
		$("#memberGrade").text("골드회원");
	} else if(memberPoint >= 10000) {
		$("#memberGrade").text("VIP");
	} // if
	
	

		
	});
		
}); // $(function())	
</script>
<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">

<div class="memberVoInfoClass">
	<nav class="leftMemberVoInfoNav">
		<div>
			<h1></h1>
		</div>
	</nav>
	<nav class="memberVoInfoNav">
				
				<form role="form" class="memberVoInfoFormHeader">
					<div class="form-group">
						<h1 class="memberVoInfoFormFontHead">
							회원정보<a>&nbsp;&nbsp;&nbsp;</a>
							
						</h1>
						<a style="float:right;" href="/sellproduct/messageList?m_id=${memberVoInfo.m_id}" class="btn btn-success">메시지 함</a>
					</div>
					<div class="form-group">
								<table class="table memberVoInfoFormTable memberVoInfoFormFont">
									<tbody>
										<tr>
											<td>아이디</td>
											<td>${memberVoInfo.m_id}</td>
										</tr>
										<tr>
											<td>비밀번호</td>
											<td>${memberVoInfo.m_pass}</td>
										</tr>
										<tr>
											<td>성명</td>
											<td>${memberVoInfo.m_name}</td>
										</tr>
										<tr>
											<td>전화번호</td>
											<td>${memberVoInfo.m_phonenumber}</td>
										</tr>
										<tr>
											<td>이메일</td>
											<td>${memberVoInfo.email}</td>
										</tr>
										<tr>
											<td>포인트</td>
											<td>${memberVoInfo.m_point}</td>
										</tr>
										<tr>
											<td>회원 등급</td>
											<td><span id="memberGrade"></span></td>
										</tr>
										</tbody>
									</table>
								</div>
					</form>
		</nav>
	</div>
</div>
	<div class="col-md-2"></div>
</div>


	<div class="row">
		<div class="col-md-12">
	<aside class="memberVoInfoAside">
		<c:choose>
			<c:when test="${not empty sessionScope.sendProductBoughtInfoVo}">
				<h1>주문상품내용</h1>
				<hr>
				<br>
				<br>
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead>
								<tr>
									<th>주문상품명</th>
									<th>상품수량</th>
									<th>판매자명</th>
									<th>배송방식</th>
									<th>가격</th>
									<th>주문날짜</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${sessionScope.sendProductBoughtInfoVo.productName}</td>
									<td>${sessionScope.sendProductBoughtInfoVo.productNum}<span>개</span>
									</td>
									<td>${sessionScope.sendProductBoughtInfoVo.seller}<span>님</span>
									</td>
									<td>${sessionScope.sendProductBoughtInfoVo.sendMethod}</td>
									<td>${sessionScope.sendProductBoughtInfoVo.price}<span>원</span>
									</td>
									<td><span>${sessionScope.sendProductBoughtInfoVo.todayValueYear}</span>-
										<span>${sessionScope.sendProductBoughtInfoVo.todayValueMonth}</span>-
										<span>${sessionScope.sendProductBoughtInfoVo.todayValueDate}</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<br>
				<br>
				<h3>구매내역정보</h3>
				<hr>
				<br>
				<div class="row">
					<div class="col-md-12">
						<table class="table">
							<thead>
								<tr>
									<th>결제방식</th>
									<th>연락처</th>
									<th>전달사항</th>
									<th>우편번호</th>
									<th>주소</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>${sessionScope.sendProductBoughtInfoVo.radioVal}</td>
									<td>
										${sessionScope.sendProductBoughtInfoVo.memberOfTelephone}</td>
									<td>
										${sessionScope.sendProductBoughtInfoVo.messageForDriver}</td>
									<td>${sessionScope.sendProductBoughtInfoVo.postcode}</td>
									<td>${sessionScope.sendProductBoughtInfoVo.roadAddress}<span>-</span>
										${sessionScope.sendProductBoughtInfoVo.extraAddress}<span>-</span>
										${sessionScope.sendProductBoughtInfoVo.detailAddress}
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:when>
			<c:when test="${empty sessionScope.sendProductBoughtInfoVo}">
				<h1 id="noneBuyProduct">구매한 상품이 없습니다</h1>
			</c:when>
		</c:choose>
	</aside>
		</div>
	</div>
	<aside class="rightMemberVoInfoAside">
		<div>
			<h1></h1>
		</div>
	</aside>
