<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

<style>

#tabs-277268 {
    padding-top: 5%;
    width: 100%;
    position: relative;
}

#div_receive table thead tr th , #div_send table thead tr th {
	background : gainsboro;
}

</style>
<script type="text/javascript">
$(function(){
	$(".receive").click(function(){
			$("#div_send").hide();	
			$("#div_receive").show();
			
			$(this).css("border-top" , "2px solid gainsboro");
			$(this).css("border-left" , "2px solid gainsboro");
			$(this).css("border-right" , "2px solid gainsboro");
			
			$(".send").css("border-top" , "");
			$(".send").css("border-left" , "");
			$(".send").css("border-right" , "");
			
	});
	
	$(".send").click(function(){
			$("#div_send").show();	
			$("#div_receive").hide();
			
			$(this).css("border-top" , "2px solid gainsboro");
			$(this).css("border-left" , "2px solid gainsboro");
			$(this).css("border-right" , "2px solid gainsboro");
			
			$(".receive").css("border-top" , "");
			$(".receive").css("border-left" , "");
			$(".receive").css("border-right" , "");
			
			
	});
});


</script>


<head>
<meta charset="UTF-8">
<title>내 메시지함</title>
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
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<h4 style="padding-top:8%">내 메시지함 </h4><hr>
		
			<div class="tabbable" id="tabs-277268">
				<ul class="nav nav-tabs">
				
					<li class="nav-item receive">
						<a class="nav-link active" href="#tab1" data-toggle="tab">받은 메시지</a>
					</li>
					
					<li class="nav-item send">
						<a class="nav-link" href="#tab2" data-toggle="tab">보낸 메시지</a>
					</li>
					
				</ul>
				<div class="tab-content">
				
				<!-- 받은 메시지함 -->
					<div class="tab-pane active" id="div_receive">
						<table class="table table-bordered table-hover table-sm">
							<thead>
								<tr>
									<th><input type="checkbox" id="allCheckBox_parent"></th>
									<th>보낸사람</th>
									<th>상품이름</th>
									<th>내용</th>
									<th>받은날짜</th>
									<th>읽은날짜</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="receive" items="${receive_MessageList}">
									<tr>
										<td><input type="checkbox" id="allCheckBox_child"></td>
										<td>${receive.msg_sender }</td>
										<td>${receive.msg_productName}</td>
										<td><c:choose>
												<c:when test="${fn:length(receive.msg_content) > 15}">
													<a href="/sellproduct/messageContent?msg_no=${receive.msg_no}&type=receive">${fn:substring(receive.msg_content.trim() , 0 , 15)}...</a> 
												</c:when>
												<c:otherwise>
													${receive.msg_content }
												</c:otherwise>
											</c:choose>
										</td>
										<td>${receive.msg_sendDate }</td>
										<td>${receive.msg_readDate }</td>
									</tr>
								</c:forEach>
							</tbody>
							
						</table>
					</div>
					
				<!-- 보낸 메시지함 -->
					<div class="tab-pane" id="div_send">
					
						<table class="table table-bordered table-hover table-sm">
							<thead>
								<tr>
									<th><input type="checkbox" id="allCheckBox_parent"></th>
									<th>받은사람</th>
									<th>상품이름</th>
									<th>내용</th>
									<th>보낸날짜</th>
									<th>읽은날짜</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="send" items="${send_MessageList}">
									<tr>
										<td><input type="checkbox" id="allCheckBox_child"></td>
										<td>${send.msg_receiver}</td>
										<td>${send.msg_productName}</td>
										<td><c:choose>
												<c:when test="${fn:length(send.msg_content) > 15}">
													<a href="/sellproduct/messageContent?msg_no=${send.msg_no}&type=send">${fn:substring(send.msg_content.trim() , 0 , 20)}...</a>
												</c:when>
												<c:otherwise>
													${send.msg_content }
												</c:otherwise>
											</c:choose>
										</td>
										<td>${send.msg_sendDate }</td>
										<td>${send.msg_readDate }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-2">
		</div>
	</div>


</body>
</html>