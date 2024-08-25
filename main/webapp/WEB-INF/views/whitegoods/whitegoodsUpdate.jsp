<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
#fileDrop{
	width:80%;
	height: 80px;
	margin: auto;
	border: 1px solid; 
}
</style>
<script src="/resources/js/imageScript.js"></script>
<script>
$(function(){
	//이미지 등록창 띄우는 버튼
	$("#btnImgDrop").click(function(){
		$("#fileDrop").show();
	});
	
	//파일 업로드 시킬 칸 위에 마우스 올릴때
	$("#fileDrop").on("dragenter dragover", function(e){
		e.preventDefault();
	});
	
	//파일 업로드 시킬 칸 위에 파일 놓을 때
	$("#fileDrop").on("drop", function(e){
		e.preventDefault();
		var file = e.originalEvent.dataTransfer.files[0];
		
		var formData = new FormData();
		formData.append("file", file);
		var url="/sellproduct/uploadedFile";
		
		$.ajax({
			"processData":false,
			"contentType":false,
			"method" : "post",
			"url" : url,
			"data":formData,
			"success":function(data){
// 				console.log(data);
				var underbarIndex = data.lastIndexOf("_");
				var front = data.substring(0, underbarIndex + 1);
				var rear = data.substring(underbarIndex + 1);
				var fileName = front + rear;
				
				var div = $("#uploadedList").prev().clone();
				div.attr("data-filename", data);
				var img = div.find("img");
				if(isImage(rear)){
					img.attr("src", "http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/" + data);
					var span = div.find("span");
					span.text(fileName.substring(fileName.lastIndexOf("_") + 1));
					
					$("#uploadedList").append(div);
					div.show();
				}
				
				$("input[name=p_thumbimg]").attr("value", data);
			}
		});
	});
	
	//첨부파일 삭제(x) 클릭
	$("#uploadedList").on("click", ".a_times", function(e){
		e.preventDefault();
		var filename = $(this).parent().attr("data-filename");
		var url = "/sellproduct/deleteAjax";
		var that = $(this);
		var formData = new FormData();
		formData.append("filename",filename);
		
		$.ajax({
			"processData":false,
			"contentType":false,
			"method" : "post",
			"url" : url,
			"data":formData,
			"success":function(data){
// 				console.log(data);
				if(data == "success"){
					that.parent().remove();
				}
			}
		});
	});
	
	//상품등록 버튼
	$("#btnUpdate").on("click", function(){
		var div = $("#uploadedList > .divUploaded");
		div.each(function(index){
			var filename = $(this).attr("data-filename");
			var html = "<input type='hidden' name='img_name' value='" + filename + "'/>";
			$("#frmUpdate").prepend(html);
		});
// 		return false;
		$("#frmUpdate").submit();
	});
});
</script>

${whitegoodsVo}
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" id="frmUpdate" action="/whitegoods/whitegoodsUpdateRun" method="post" enctype="multipart/form-data">
				<input type="hidden" name="w_no" id="w_no" value="${whitegoodsVo.w_no}">
				<input type="hidden" name="p_no" id="p_no" value="${whitegoodsVo.p_no}">
				<input type="hidden" name="w_thumbimg" id="w_thumbimg" value="${whitegoodsVo.w_thumbimg}">
				<div class="form-group">
					<label for="w_name">상품명</label>
					<input name="w_name" type="text" class="form-control" id="w_name" value="${whitegoodsVo.w_name}"/>
				</div>
				
				<input type="hidden" name="cate_no" value="${whitegoodsVo.cate_no}">
				
				<div class="form-group">
					<label for="w_price">판매가</label>
					<input name="w_price" type="number" class="form-control" id="w_price" value="${whitegoodsVo.w_price}"/>
				</div>
				
				<div class="form-group">
					<label for="w_content">상품 설명</label>
					<textarea class="form-control" id="w_content" name="w_content">${whitegoodsVo.w_content}</textarea>
				</div>
				
				<div class="form-group">
					<label for="w_thumbimg">대표이미지 선택</label>
					<input type="file" class="form-control-file" name="file" id="file" value="http://teamptbucket.s3.ap-northeast-2.amazonaws.com/goods/${whitegoodsVo.w_thumbimg}"/>
					<p class="help-block">
						대표이미지는 한장만 선택 가능합니다.
					</p>
				</div>
				
				<div class="form-group">
					<label for="">상품 이미지</label><br>
					<p class="help-block">
						기존 이미지를 추가하지 않는 경우 이미지가 삭제될 수 있습니다.
					</p>
					<button type="button" id="btnImgDrop">업로드</button>
					<div id="fileDrop" style="display: none"></div>
				</div>
				
				<div class="divUploaded" style="display: none;">
					<img src="/resources/image/default.png" height="100"><br>
					<span>default.png</span>
					<a href="#" style="cursor: pointer;" class="a_times">&times;</a>
				</div>

				<div id="uploadedList">
					
				</div>

				<button type="button" id="btnUpdate" class="btn btn-primary">
					Submit
				</button>
			</form>
		</div>
	</div>
</div>