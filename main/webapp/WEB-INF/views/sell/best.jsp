<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!DOCTYPE html>
<html>

<style>
.img-class {
    width: 200px; height: 200px;
}

.firstTd {
    padding-right: 20px;
    padding-top: 0px;
    padding-bottom: 35px;
    padding-left: 20px;
}

.secondTable{
	height: 400px;
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


<div class="col-md-8">
			<div class="lblHOT" style="padding-left: 20%; top:50px;">
			
			<div style="padding-bottom:8%">
				<span style="font-size: 30px; color:red;">BEST<br></span>
			</div>	
			
			 	<table>
			 		<c:forEach var="best" items="${list}" varStatus="status">
			 		<c:if test="${(status.count-1) % 4 == 0}">
			 			<tr><!-- 4개 넘어서면 tr추가 -->
					</c:if>
					
			 			<td class="firstTd"><!-- 4개까진 td 추가 -->

			 				<table border=1 class="secondTable">
								<tr>
									<td>
										<a href="/page/content?p_no=${best.p_no}" class="auctionSelect" data-pno="${best.p_no}"><img src="/resources/image/${best.p_thumbimg}" class="img-class"></a>
										<img alt="경매" src="/resources/image/best.gif">
									</td>
								</tr>
								<tr>
									<td id="best_name">${best.p_name}</td>
								</tr>			 				
								<tr>
									<td id="best_price">${best.p_price}원</td>
								</tr>
								<tr>
									<td style="font-size:15px">${best.p_seller}</td>
								</tr>
			 				</table>
						
			 			</td><!-- 4개까진 td 추가 -->
					
					<c:if test="${status.count%4 == 0}">
			 			</tr><!-- 4개 넘어서면 tr추가 -->
			 		</c:if>
			 		</c:forEach>
			 	</table>
			</div>
		</div>


</body>
</html>