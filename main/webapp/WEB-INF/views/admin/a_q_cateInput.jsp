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
<script>
	$(function(){
		//대분류 추가 버튼
		$("#largeCateInput").click(function(){
			$("#qa_cate_level").val("1");
			$("#largeCategory").hide();
			$("#cate_name_input").show();
		});
		
		//중분류 추가 버튼
		$("#middleCateInput").click(function(){
			$("#qa_cate_level").val("2");
			$("#largeCategory").show();
			$("#cate_name_input").show();
		});
		
		//중분류 클릭 시 대분류 카테고리 선택
		$("#largeCategory").on("change", function(){
			$("#qa_cate_ref").val($(this).val());
		});
		
		//등록 버튼
		$("#btnQACateInsert").on("click",function(){
			var level = $("#qa_cate_level").val();
			if(level == 1){
				$("#qa_cate_ref").val(null);
			}
			
			if(level=="0"){
				alert("분류를 선택해주세요.");
				return false;
			}
			
			if(level== 2){
				if($("#qa_cate_ref").val() == "0"){
					alert("카테고리를 선택해주세요.");
					return false;
				}
			}
			var title = $("#qa_cate_name").val();
			if(title==""){
				alert("카테고리 명을 입력해주세요.");
				return false;
			}
			$("#frmCateInput").submit();
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
			<button type="button" id="largeCateInput">대분류 추가</button>
			<button type="button" id="middleCateInput">중분류 추가</button>
			<form id="frmCateInput" action="/admin/QandACategoryInputRun" method="get">
				<label id="largeCateSelect" style="display: none;"></label>
				<select id="largeCategory" style="display: none;">
					<option value="">선택하세요</option>
					<c:forEach var="QACateVo" items="${firstQACategory}">
						<option value="${QACateVo.qa_cate_no}">${QACateVo.qa_cate_name}</option>
					</c:forEach>
				</select>
				
				<input type="hidden" id="qa_cate_level" value="0">
				<input type="hidden" id="qa_cate_ref" name="qa_cate_ref" value="0">
				<div id="cate_name_input" style="display: none">
				<label>카테고리 이름</label>
				<input type="text" id="qa_cate_name" name="qa_cate_name">
				</div>
				<div>
					<button type="button" id="btnQACateInsert">등록</button>
				</div>
			</form>
		</div>
		<div class="col-md-3"></div>
	</div>
</div>