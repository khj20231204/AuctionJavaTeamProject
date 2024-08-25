<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/admin_header.jsp"%>
<style>
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
<h1>Q&A 작성</h1>
<script>
	$(function(){
		$("#firstQACategory").change(function(){
			var selected = $("#firstQACategory option:selected").val();
			var url="/admin/adminQACategorySelect";
			var sendData={
					"qa_cate_no":selected
			}
			$.get(url, sendData, function(data){
				var startClone = $("#secondQACategory").find("option").eq(0).clone();
				$("#secondQACategory> option").remove();
				$("#secondQACategory").append(startClone);
				for(var  v = 0; v < data.length; v++){
					var clone = $("#secondQACategory").find("option").eq(0).clone();
					clone.val(data[v].qa_cate_no);
					clone.text(data[v].qa_cate_name);
					$("#secondQACategory").append(clone);
				}
			})
		});
		
		$("#btnSubmit").on("click", function(){
			var first = $("#firstQACategory option:selected").val();
// 			console.log(first);
			var second = $("#secondQACategory option:selected").val();
// 			console.log(selected);
			var qa_cate_no = $("#qa_cate_no").val(second);
// 			console.log(qa_cate_no);
			var q_content = $("#q_content").val();
			var a_content = $("#a_content").val();
			
			if(first=="00"){
				alert("카테고리를 선택해주세요.");
				return false;
			}
			
			if(second == "00"){
				alert("카테고리를 선택해주세요.");
				return false;
			}
			if(q_content == ""){
				alert("질문을 입력해주세요.");
				return false;
			}
			if(a_content == ""){
				alert("답변을 입력해주세요");
				return false;
			}
			
			$("#frmQAInsert").submit();
		});
	});
</script>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-3">
			<a class="btn btns" href="/admin/adminQandAMain">이전 페이지</a>
			<a class="btn btns" href="/admin/adminForm">관리자 페이지 홈으로</a>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">
			<form role="form" id="frmQAInsert" action="/admin/adminQAInsert">
				<select id="firstQACategory">
					<option value="00">선택하세요</option>
					<c:forEach var="QACateVo" items="${firstQACategory}">
						<option value="${QACateVo.qa_cate_no}">${QACateVo.qa_cate_name}</option>
					</c:forEach>
				</select>
				
				<select id="secondQACategory">
					<option value="00">선택하세요</option>
				</select>
				<div class="form-group">
					<label for="q_content"> 질문 </label>
					<input type="text" name="q_content" class="form-control" id="q_content" required/>
				</div>

				<div class="form-group">
					<label for="a_content"> 답변 </label>
					<textarea name="a_content" class="form-control" id="a_content" required></textarea>
				</div>
				
				<input type="hidden" name="qa_cate_no" id="qa_cate_no">
				<button type="button" class="btn btn-primary" id="btnSubmit">
					등록
				</button>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>