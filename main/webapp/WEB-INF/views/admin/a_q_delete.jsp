<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<style>
.cate_name{
	width:200px;
	font-size:15px;
	text-align: center;
}
.cate_btn{
	text-align:center;
	width:60px;
}
.btns{
	width:200px;
}
a.btns{
	-webkit-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-moz-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-ms-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	-o-transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	transition: all 200ms cubic-bezier(0.390, 0.500, 0.150, 1.360);
	display: block;
	text-decoration: none;
	border-radius: 4px;
	float:left;
}

a.btns:hover {
	color: rgba(255, 255, 255, 0.85);
	box-shadow: rgba(30, 40, 200, 0.7) 0 0px 0px 40px inset;
}
</style>
<script>
	$(function(){
		
		var msg = "${msg}";
		if(msg == "qa_update_success"){
			alert("Q&A가 수정되었습니다.");
		}
		
		$(".btnShow").on("click", function(){
			var that = $(this).parent().parent().next();
			that.toggle();
		});
		
		$(".btnDelete").on("click", function(e){
			e.preventDefault();
			var qa_no = $(this).attr("data-qano");
			var url="/admin/QandADeleteRun";
			var sendData = {
					"qa_no":qa_no
			}
			$.get(url, sendData, function(data){
				if(data.trim() == "success"){
					alert("삭제되었습니다.");
					location.reload();
				}
			});
		});
	});
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1>고객센터 Q&amp;A 수정/삭제</h1>
		</div>
	<div class="col-md-4"></div>
	</div>

	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
			<a class="btn btns" href="/admin/adminQandAMain">이전 페이지</a>
			<a class="btn btns" href="/admin/adminForm">관리자 페이지 홈으로</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<table class="table">
				<tbody>
				<c:forEach var="QandAVo" items="${QA_UDList}">
					<tr>
						<c:forEach var="QACateVo" items="${QACategory}">
							<c:if test="${QandAVo.qa_cate_no == QACateVo.qa_cate_no}">
								<td class="cate_name">${QACateVo.qa_cate_name}</td>
							</c:if>
						</c:forEach>
						<td class="cate_content">${QandAVo.q_content}</td>
						<td class="cate_btn"><button type="button" class="btnShow">+</button></td>
						<td class="btns">
							<a href="/admin/qaUpdate/${QandAVo.qa_no}" class="btn btns btnUpdate" data-qano="${QandAVo.qa_no}">수정</a>
							<a href="#" class="btn btns btnDelete" data-qano="${QandAVo.qa_no}">삭제</a>
						</td>
					</tr>
					<tr style="display: none;">
						<td class="cate_name">답변</td>
						<td class="cate_content">${QandAVo.a_content}</td>
						<td class="cate_btn"></td>
						<td class="btns"></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
	</div>
</div>