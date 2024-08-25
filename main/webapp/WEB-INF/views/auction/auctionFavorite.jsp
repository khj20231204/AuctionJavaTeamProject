<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="../include/header.jsp"%>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2">
		</div>
		<div class="col-md-8">
			<div class="col-md-2">
			</div>
			<div class="col-md-8">
			<%@ include file="auctionHeader.jsp"%>
				<!-- 시작 -->
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-12">
							<ul>
								<li class="list-item">
									<table>
										<tr>
											<td>체크</td>
											<td>그림</td>
											<td>상품명</td>
											<td>현재가</td>
											<td>입찰수</td>
											<td>판매자</td>
											<td>마감시간</td>
										</tr>
										<tr>
											<td>체크 포문</td>
											<td>그림 포문</td>
											<td>상품명 루프</td>
											<td>현재가</td>
											<td>입찰수</td>
											<td>판매자</td>
											<td>마감시간 포문</td>
										</tr>
										<tr>
											<td colspan='7'>삭제</td>
<!-- 											<td>그림</td> -->
<!-- 											<td>상품명</td> -->
<!-- 											<td>현재가</td> -->
<!-- 											<td>입찰수</td> -->
<!-- 											<td>판매자</td> -->
<!-- 											<td>마감시간</td> -->
										</tr>
									</table>
								</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- 끝 -->
			</div><!-- 내부 md-8 -->
			<div class="col-md-2"></div><!-- 내부 md-2 -->
		</div><!-- 외부 md-8 -->
		<div class="col-md-2"></div><!-- 외부 md-2 -->
	</div><!-- 외부 row -->
</div>
    