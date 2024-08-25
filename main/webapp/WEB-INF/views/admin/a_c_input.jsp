<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../include/admin_header.jsp" %>
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
		
		var msg= "${msg}";
		if(msg == "category_input_success"){
			alert("카테고리가 추가되었습니다.");
		}
		
		//대분류 선택
		$("#large").on("change",function(){
			var selected = $("#large option:selected").val();
// 			console.log(selected);
			var url = "/admin/getCategoryList";
			var sendData = {
					"cate_ref":selected
			}
			if($("#categoryLevel").val() != "2"){
				$.get(url, sendData, function(data){
					$("#middle > option").remove();
					$("#small > option").remove();
					$("#middleDiv").show();
					
					var startclone = $("#clMiddle").find("option").eq(0).clone();
					$("#middle").append(startclone);
					for(var v = 0; v < data.length; v++){
						var clone = $("#clMiddle").find("option").eq(0).clone();
						clone.val(data[v].cate_no);
						clone.text(data[v].cate_name);
						$("#middle").append(clone);
					}
				});
			}
		});
		
		//중분류 선택
		$("#middle").on("change", function(){
			var selected = $("#middle option:selected").val();
			console.log(selected);
			var url = "/admin/getCategoryList";
			var sendData = {
					"cate_ref":selected
			}
			
			if($("#categoryLevel").val() != "3"){
				$.get(url, sendData, function(data){
					$("#small > option").remove();
					$("#smallDiv").show();
					
					var startClone = $("#clSmall").find("option").eq(0).clone();
					$("#small").append(startClone);
					for(var v = 0; v<data.length; v++){
						var clone = $("#clSmall").find("option").eq(0).clone();
						if(data[v].name != "기타"){
							clone.val(data[v].cate_no);
							clone.text(data[v].cate_name);
						} else {
							clone.val("");
							clone.text("기타");
						}
						$("#small").append(clone);
					}
				});
			}
		});
		
		
		
	/* 버튼 클릭 시 해당 레벨의 카테고리 추가하도록 띄움 */
		$("#btnLargeInput").click(function(){
			$("#insertName").show();
			$("#categoryLevel").val("1");
			$("#largeDiv").hide();
			$("#middleDiv").hide();
			$("#smallDiv").hide();
		});
		
		$("#btnMiddleInput").click(function(){
			$("#insertName").show();
			$("#categoryLevel").val("2");
			$("#largeDiv").show();
			$("#middleDiv").hide();
			$("#smallDiv").hide();
		});
		
		$("#btnSmall1Input").click(function(){
			$("#insertName").show();
			$("#categoryLevel").val("3");
			$("#largeDiv").show();
			$("#middleDiv").show();
			$("#smallDiv").hide();
		});
		
		$("#btnSmall2Input").click(function(){
			$("#insertName").show();
			$("#categoryLevel").val("4");
			$("#largeDiv").show();
			$("#middleDiv").show();
			$("#smallDiv").show();
		});
		
		//등록 버튼 클릭 시
		$("#btnCategoryInsert").click(function(){
			var categoryLevel = $("#categoryLevel").val();
			var large = $("#large option:selected").val();
			var middle = $("#middle option:selected").val();
			var small = $("#small option:selected").val();

			if(categoryLevel == 1){
				$("#cate_ref").val(null);
			} else if(categoryLevel == 2){
				$("#cate_ref").val(large);
			} else if(categoryLevel == 3){
				$("#cate_ref").val(middle);
			} else if(categoryLevel == 4){
				$("#cate_ref").val(small);
			}
			
			if($("#cate_name").val() == ""){
				alert("카테고리 이름을 입력해주세요.");
				return false;
				if(categoryLevel >= 2){
					if($("#cate_ref").val()==""){
						alert("카테고리를 모두 선택해주세요.");
					}
				}
			}
			
			if($("#cate_ref").val()==""){
				alert("카테고리를 선택해주세요.");
				return false;
			}
			
			$("#frmCategoryInsert").attr("action", "/admin/categoryInsert");
			$("#frmCategoryInsert").submit();
		})
	});
</script>

<div class="row">
	<div class="col-md-5"></div>
	<div class="col-md-3">
		<a class="btn btns" href="/admin/adminCategory">이전 화면으로</a>
		<a class="btn btns" href="/admin/adminForm">관리자 메인 화면으로</a>
	</div>
	<div class="col-md-4"></div>
</div>

<div class="row">
	<div class="col-md-12" style="text-align: center">
		<button type="button" id="btnLargeInput">대분류 추가</button>
		<button type="button" id="btnMiddleInput">중분류 추가</button>
		<button type="button" id="btnSmall1Input">소분류1 추가</button>
		<button type="button" id="btnSmall2Input">소분류2 추가</button>
	</div>
</div>

<div class="row">
	<div class="col-md-12" style="text-align: center;">
		<form id="frmCategoryInsert" method="get">
			<input type="hidden" id="categoryLevel">
			<div style="display: none;">
				<label>카테고리2</label>
				<select id="clMiddle">
					<option value="">선택하세요
				</select>
			</div>		
			<div class="form-group" style="display: none;">
				<label>카테고리3</label>
				<select id="clSmall">
					<option value="">선택하세요
				</select>
			</div>
			
			<div id="largeDiv" style="display: none;">
				<label>카테고리1</label>
				<select id="large">
					<option value="">선택하세요
					<c:forEach var="CategoryVo" items="${firstCategoryList}">
						<option value="${CategoryVo.cate_no}">${CategoryVo.cate_name}
					</c:forEach>
				</select>
			</div>
		
			<div id="middleDiv" style="display: none;">
				<label>카테고리2</label>
				<select id="middle">
				</select>
			</div>
							
			<div id="smallDiv" style="display: none;">
				<label>카테고리3</label>
				<select id="small">
				</select>
			</div>

			<input type="hidden" name="cate_ref" id="cate_ref">
			
			<div id="insertName" style="display: none;">
				<label>추가할 카테고리 이름</label>
				<input type="text" name="cate_name" id="cate_name">
			</div>
			<button type="button" id="btnCategoryInsert">등록</button>
		</form>
	</div>
</div>