<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>

<style>
#btnReply {
	background: darkgray;
    color: black;
    border: 0;
}
#btnList {
	background: darkgray;
    color: black;
    border: 0;
}

</style>


<head>
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
				<c:if test="${type=='receive'}">
					<a id="btnReply" class="btn btn-success" href="/sellproduct/replyMessageForm?msg_no=${messageVo.msg_no }">답장하기</a>
				</c:if>
				
				<a id="btnList" class="btn btn-primary" href="/sellproduct/messageList?m_id=${sessionScope.memberVo.m_id}">목록</a>
		</div>
		
			<div class="list-group" style="padding-top: 3%;">
				<a href="#" class="list-group-item list-group-item-action">
					상품이름 : ${messageVo.msg_productName} <span style="float:right;">${messageVo.msg_sendDate}</span>
					</a>
				<div class="list-group-item">
					<c:choose>
						<c:when test="${type == 'send'}">
							받은 사람      :   ${messageVo.msg_receiver}
						</c:when>
						<c:otherwise>
							보낸 사람 : ${messageVo.msg_sender}
						</c:otherwise>
					</c:choose>
				</div>
				<div class="list-group-item">
					<p class="list-group-item-text">
					내용<hr><br>
					<textarea rows="7" cols="170" style="border:0;" readonly>
						${messageVo.msg_content}
					</textarea>
					</p>
				</div>
			</div>
				<br>
			
		</div>

		<div class="col-md-2"></div>
	</div>



</body>
</html>