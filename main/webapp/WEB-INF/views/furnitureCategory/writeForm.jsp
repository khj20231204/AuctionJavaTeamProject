<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>

<style>
#fileDrop {
	width: 60%;
	height: 100px;
	background-color: white;
	border: 4px dashed #c8d7ff;
}


.modal.modal-center {
  text-align: center;
}

@media screen and (min-width: 768px) { 
  .modal.modal-center:before {
    display: inline-block;
    vertical-align: middle;
    content: " ";
    height: 100%;
  }
}

.modal-dialog.modal-fullsize {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.modal-dialog.modal-center {
  display: inline-block;
  text-align: left;
  vertical-align: middle; 
}

.modal-dialog.modal-80size {
  width: 80%;
  height: 80%;
  margin: 0;
  padding: 0;
}

.modal-content.modal-fullsize {
  height: auto;
  min-height: 100%;
  border-radius: 0;
}

.modal-content.modal-80size {
  height: auto;
  min-height: 80%;
}


</style>

<%
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); //도로명 주소
	String engAddr = request.getParameter("engAddr"); //영어 주소
	String jibunAddr = request.getParameter("jibunAddr"); //지번 주소
	String zipNo = request.getParameter("zipNo"); //우편번호
	String addrDetail = request.getParameter("addrDetail"); //사용자가 직접 입력
%>

<script>
	$(function() {
		$("#fileDrop").on("dragenter dragover", function(e) {
			e.preventDefault();
			console.log(e);
		});//fileDrop	

		$("#fileDrop").on(
				"drop",
				function(e) {
					e.preventDefault();

					var file = e.originalEvent.dataTransfer.files[0]; //드래그한 파일에 대한 객체 정보를 가지고 있다
					console.log(file);
					//html의 form객체를 만들어서 여기에 이미지를 추가해서 통째로 ajax로 넘긴다

					var formData = new FormData();
					formData.append("file", file);

					var url = "/furniture/uploadAjax";

					$.ajax({
						"processData" : false,
						"contentType" : false,
						"method" : "post",
						"url" : url,
						"data" : formData,
						"success" : function(data) {
							console.log(data);
							var divUploaded = $("#uploadList").prev().clone();
							var img = divUploaded.find("img");
							console.log(img);
							img
									.attr("src",
											"/furniture/displayImage?imageName="
													+ data);

							$("#uploadList").append(divUploaded);
							divUploaded.show();
						}
					});//ajax
				});//fileDrop

		$("#addrFind").click(function() {
			$("#modalAddr").trigger("click");
		});
		
		//모달에서 주소 찾기 
		$("#modalAddrFind").click(function() {
			
			var keyword = $("#moadlTxtAddrSearch").val();
			console.log("moadlTxtAddrSearch:"+moadlTxtAddrSearch);
			
			var dataAddr = {
				currentPage : "1",
				countPerPage : "1000",
				resultType : "json",
				confmKey : "devU01TX0FVVEgyMDIwMTIyNzEyMzcyMzExMDU5NDU=",
				keyword : keyword
			};

			$.ajax({
				url : "https://www.juso.go.kr/addrlink/addrLinkApiJsonp.do" //인터넷망
				,
				type : "post"
				//,data:$("#form").serialize()
				,
				data : dataAddr,
				dataType : "jsonp",
				crossDomain : true,
				success : function(jsonStr) {
					$("#list").html("");
					var htmlStr = "";
					htmlStr += "<table border='1'>";
					$(jsonStr.results.juso).each(function() {
						htmlStr += "<tr>";
						htmlStr += "<td><a href='#' id='roadAddrPart1' class='roadAddrPart1'>" + this.roadAddrPart1 + "</a></td>";
						htmlStr += "<td>" + this.jibunAddr + "</td>";
						htmlStr += "<td>" + this.engAddr + "</td>";
						htmlStr += "<td>" + this.zipNo + "</td>";
						htmlStr += "</tr>";
					});
					htmlStr += "</table>";
					$("#list").html(htmlStr);
				}
			});//ajax
		});//addrFind

		$("#list").on("click",".roadAddrPart1", function(){
			var roadAddr = $(this).parent().parent().find("td").eq(0).text();
			var jibunAddr = $(this).parent().parent().find("td").eq(1).text();
			var zip = $(this).parent().parent().find("td").eq(3).text();
			
			$("#txtroadAddr").val(roadAddr);
			$("#txtZip").val(zip);
			$("#txtjibundAddr").val(jibunAddr);
			$("#btnModalClose").trigger("click");
		});
	});//function	

	function enterSearch() {
		var evt_code = (window.netscape) ? ev.which : event.keyCode;
		//alert(evt_code);
		if (evt_code == 13) { //아스키코드 13은 엔터, 엔터를 치면 검색  
			event.keyCode = 0;
			getAddr();
		}
	}
</script>
<!-- window.open을 post로 보낼 때 필요  
<form name="popForm">
    <input type="hidden" name="cmd" value="openPop" />
    <input type="hidden" name="testval" />
</form>
<!-- 주소 폼 -->

<!-- 파일 추가 시작 -->
<div>
	<lable>첨부할 파일 드로그</lable>
	<div id="fileDrop"></div>
	<!-- 여기에 파일을 드래그 드롭 -->
</div>

<div class="divUploaded" style="display: none; float: left">
	<!-- 추가한 그림 크기와 옆에 x추가 -->
	<img height="50px" width="50px" /> <a href="#" class="a_times">&times;</a>
</div>

<div id="uploadList"></div>
<!-- 파일 추가 끝 -->

<!-- 주소 찾기 시작 -->
우편번호:
<input type="text" id="txtZip">
<a href="#" id="addrFind"><img src="../resources/image/addrFind.png"></a>
<br>
<input type="text" id="txtroadAddr">
<input type="text" id="txtjibundAddr">

<!--  주소 찾기 모달 시작 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modalAddr" href="#modalAddr-container" role="button"
				class="btn" data-toggle="modal" style="display:none">주소 찾기</a>
<!-- "modal-dialog modal-fullsize modal-center" -->
			<div class="modal fade" id="modalAddr-container" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-xl" role="document">
					<div class="modal-content">
					
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">주소 헤더</h5>
							<button type="button" id="btnModalClose" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						
						<div class="modal-body"> 
							<input type="search" id="moadlTxtAddrSearch" placeholder="주소를 입력해 주세요" onkeydown="enterSearch();">
							<a href="#" id="modalAddrFind"><img src="../resources/image/addrFind.png"></a>
							
								<div id="list"></div>
								<!-- 검색 결과 리스트 출력 영역 -->
							</form>
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary">주소선택</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>

				</div>

			</div>

		</div>
	</div>
</div>
<!--  주소 찾기 모달 끝 -->
<!-- 주소 찾기 끝-->
<%@ include file="../include/footer.jsp"%>
