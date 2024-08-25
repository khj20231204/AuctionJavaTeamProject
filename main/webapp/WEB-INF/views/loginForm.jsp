<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> --%>
<%@ include file="include/header.jsp"%>

<br>
<br>
<br>
<br>
<br>

<script>
	$(function() {
		var msg = "${msg}";
		if(msg == "inquiryFail"){
			alert("로그인이 필요한 기능입니다.");
		}
		var secretNum = "";
		// 	아이디 찾기 모달창 클릭
		$("#findID").click(function() {
			$("#modal-210594").trigger("click");
		});
		// 	비밀번호 찾기 모달창 클릭
		$("#findPW").click(function() {
			$("#modal-3000").trigger("click");
		});
		// 	비회원 모달창 클릭
		$("#nonBuyerLogin").click(function() {
			$("#modal-nonBuyer").trigger("click");
		});
		// 	비회원 로그인 하기
		$("#nonBuyerLoginModal").click(function() {
			$("#submitNonBuyer").trigger("click");
		});


		// 아이디를 찾기 위해 등록된 이메일로 보내기
		$("#btnEmailIdSendForId").click(function() {
			var to = $("#to").val();
			console.log("e_mailFindForInfo:" + to);

			var url = "/email/sendEmailForFindId";
			var sendData = {
				"to" : to
			};

			$.ajax({
				"dataType" : "text",
				"method" : "post",
				"url" : url,
				"data" : sendData,
				"success" : function(data) {
					console.log("data:" + data);
					if (data == "success") {
						alert("아이디 전송");
						$("#btnEmailIdSendClose").trigger("click");

					} else if (data == "fail") {
						alert("아이디 전송실패");
					}
				}

			});
		});
		
		// 비밀번호를 찾기 위해 등록된 이메일로 보내기
		$("#btnEmailIdSendForPw").click(function() {
			var m_id = $("#m_id_find_pw").val();
			var to = $("#toRe").val();
			var url = "/email/sendEmailForFindPw";
			var sendData = {
				"to" : to,
				"m_id" : m_id
			};
			$.post(url, sendData, function(data) {
				console.log("e_mailFindForInfo:" + data[0]);
				if (data[0] == "success") {
					alert("비밀번호 전송");
					$("#btnEmailPwSendClose").trigger("click");
					secretNum = data[1];
					console.log("data[1]:" + data[1]);
					$("#changePwModal").trigger("click");
				} else if (data[0] == "fail") {
					alert("비밀번호 전송실패");
				}
			});
		});

		// 비밀번호 변경
		$("#btnChangePw").click(function() {
			var m_id = $("#m_id_change").val()
			var secretNumAgain = $("#secretNumAgain").val();
			var m_pass_new = $("#m_pass_new").val();
			var m_pass_re = $("#m_pass_re").val();

			var url = "/login/changePw";
			var sendData = {
				"m_id" : m_id,
				"m_pass_new" : m_pass_new
			};
			if (m_pass_new == m_pass_re) {
				if (secretNum == secretNumAgain) {
					$.post(url, sendData, function(data) {
						if (data == "success") {
							alert("비밀번호 변경 성공");
							$("#btnChangePwClose").trigger("click");
						} else if (data == "fail") {
							alert("비밀번호 변경 실패(아이디를 제대로 입력하시오)");
						}
					});

				} else {
					alert("인증코드 불일치");
				}
			} else {
				alert("변경할 비밀번호가 불일치");
			}

		});
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modal-nonBuyer" href="#modal-container-123574" role="button"
				class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>

			<div class="modal fade" id="modal-container-123574" role="dialog"
				aria-labelledby="myLargeModalLabe" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content loginHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title loginFont" id="myModalLabel">비회원으로 로그인 하시겠습니까?(비회원은 물건을 구입할 수 없습니다.)</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<form role="form" class="loginHeader" action="/login/nonBuyerRun"
							method="get" style="display: none;">
						<input type="number" class="form-control" id="non_buyer" name="non_buyer"
								  style="display: none;"/>
								  <button type="submit" id="submitNonBuyer"></button>
						</form>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-primary" id="nonBuyerLoginModal">비회원 로그인</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">닫기</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<a id="modal-210594" href="#modal-container-210594" role="button"
				class="btn" data-toggle="modal" style="display: none;">Launch
				demo modal</a>

			<div class="modal fade" id="modal-container-210594" role="dialog"
				aria-labelledby="myLargeModalLabe" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content loginHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title loginFont" id="myModalLabel">아이디 찾기 폼
							</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<div class="row">
		<div class="col-md-12" style="right:61px">
							<input type="email" class="form-control" id="to" name="to"
								placeholder="등록된 e-mail를 입력하시오" required="required"/>
								</div>
								</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								id="btnEmailIdSendForId">등록된 이메일로 받아보기</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="btnEmailIdSendClose">닫기</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<a id="modal-3000" href="#modal-container-3000" role="button"
				class="btn" data-toggle="modal" style="display: none;">Launch
				demo modal</a>

			<div class="modal fade" id="modal-container-3000" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content loginHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title loginFont" id="myModalLabel">비밀번호 찾기
								폼</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<div class="row">
		<div class="col-md-12" style="right:31px">
							<input type="text" class="form-control" id="m_id_find_pw"
								name="m_id" placeholder="아이디를 입력하시오" required="required" /> 
							<input type="email" class="form-control" id="toRe" name="to"
								placeholder="등록된 e-mail를 입력하시오" required="required" />
						</div>
						</div>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-primary"
								id="btnEmailIdSendForPw">등록된 이메일로 받아보기</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="btnEmailPwSendClose">닫기</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<a id="changePwModal" href="#modal-container-123574123" role="button"
				class="btn" data-toggle="modal" style="display: none;">Launch
				demo modal</a>

			<div class="modal fade" id="modal-container-123574123" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content loginHeaderModal">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">새 비밀번호</h5>
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
						<div class="row">
		<div class="col-md-12" style="right:31px">
							<input type="text" class="form-control" id="m_id_change"
								name="m_id" placeholder="아이디를 입력하시오" required="required" /> <input
								type="text" class="form-control" id="secretNumAgain"
								name="secretNumAgain" placeholder="인증코드를 입력하시오"
								required="required" /> <input type="password" class="form-control"
								id="m_pass_new" name="m_pass_new" placeholder="변경할 패스워드를 입력하시오"
								required="required" /> <input type="password" class="form-control"
								id="m_pass_re" name="m_pass_re" placeholder="변경할 패스워드를 다시 입력하시오"
								required="required" />
						</div>
						</div>
						</div>
						<div class="modal-footer">

							<button type="button" class="btn btn-primary" id="btnChangePw">
								비밀번호 바꾸기</button>
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal" id="btnChangePwClose">닫기</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>

	<div class="row">
		<div class="col-md-12">
			<form role="form" class="loginHeader" action="/login/loginRun"
				method="post">
				
				<div class="form-group">

					<h1 class="loginFontHead">로그인 폼</h1>

				</div>
				<div class="form-group">

					<label for="m_id" class="loginFont"> 아이디 </label> <input
						type="text" class="form-control" id="m_id" name="m_id"
						placeholder="아이디를 입력하시오" value="${cookie.saveId.value}"
						required="required" />
				</div>
				<div class="form-group">

					<label for="m_pass" class="loginFont"> 비밀번호 </label> <input
						type="password" class="form-control" id="m_pass" name="m_pass"
						placeholder="비밀번호를 입력하시오" required="required" />
				</div>

				<div class="checkbox">

					<label class="loginFont"> <input type="checkbox"
						name="saveId"
						<c:if test="${not empty cookie.saveId.value}">checked</c:if> />
						아이디 체크
					</label> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a> <a type="button"
						class="loginFont" id="findID">아이디 찾기</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a type="button" class="loginFont" id="findPW">비밀번호 찾기</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a type="submit" class="loginFont" href="/join/joinForm">회원가입</a> <a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
					<a type="button" class="loginFont" id="nonBuyerLogin">비회원 주문조회</a>
				</div>
				<button type="submit" class="btn btn-primary loginFont">
					로그인</button>
					<br>
				<small>질문 : Tel. 010-111-1111</small>
			</form>

		</div>
	</div>
</div>