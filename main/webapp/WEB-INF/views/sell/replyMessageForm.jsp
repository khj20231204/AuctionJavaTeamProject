<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>


<!DOCTYPE html>
<html>

<style>
#btnList {
	background: darkgray;
    color: black;
    border: 0;
}

</style>


<head>

<script>

$(function(){
	$("#btnSend").click(function(){
		console.log("ok");
		var url = "/sellproduct/message";
		var replyProductName = $("#replyProductName").val();
		// 답장 보내는 사람
		var msg_sender = "${messageVo.msg_receiver}";
		
		// 답장 받는 사람
		var msg_receiver = "${messageVo.msg_sender}";
		
		var replyContent = $("#replyContent").val();
		
		var sendData = {
			"replyProductName" : replyProductName,	
			"msg_sender" : msg_sender,
			"msg_receiver" : msg_receiver,
			"replyContent" : replyContent
		};
		
		$.post(url, sendData , function(data){
			console.log(data);
		});
	});
	
});

</script>

<meta charset="UTF-8">
<title>베스트 12</title>
</head>


<body>

<div class="row">
	<div class="col-md-12 borderAllCategory" id="borderAllCategory">
	<div class="col-md-2"></div>
		<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
</div>
<br>
	</div>
</div>

	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
		
		<div style="margin-top: 5%;">
			<button id="btnSend" class="btn btn-primary">보내기</button>
			<a id="btnList" class="btn btn-primary" href="/sellproduct/messageList?m_id=${sessionScope.memberVo.m_id}">목록</a>
		</div>
		
			<div class="list-group" style="padding-top: 3%;">
				<a href="#" class="list-group-item list-group-item-action">
					<input id="replyProductName" class="form-control" type="text" placeholder="상품 이름 : ${messageVo.msg_productName}"> <span style="float:right;"></span>
					</a>
				<div class="list-group-item">
					답장 보낼 아이디 : ${messageVo.msg_sender}
				</div>
				<div class="list-group-item">
					<p class="list-group-item-text">
					내용<hr><br>
					<textarea id="replyContent" rows="7" cols="170" style="border:0;"></textarea>
					</p>
				</div>
			</div>
				<br>
			
		</div>

		<div class="col-md-2"></div>
	</div>



</body>
</html>