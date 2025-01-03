<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String inputYn = request.getParameter("inputYn");
	String roadFullAddr = request.getParameter("roadFullAddr");
	String roadAddrPart1 = request.getParameter("roadAddrPart1"); //도로명 주소
	String engAddr = request.getParameter("engAddr"); //영어 주소
	String jibunAddr = request.getParameter("jibunAddr"); //지번 주소
	String zipNo = request.getParameter("zipNo"); //우편번호
	String addrDetail = request.getParameter("addrDetail"); //사용자가 직접 입력
%>

<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="../include/header.jsp"%>
<!-- 달력 스타일 시트 시작 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker3.standalone.min.css"/>
<!-- 달력 스타일 시트 끝 -->

<!-- 달력 스크립트 시작 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script> 
<!-- 달력 스크립트 끝 -->
<script type="text/javascript" src="/resources/js/auctionJS.js" charset="UTF-8"></script>

<style>

input[type=text]{
	text-align:center;
	border-left-width:0;
	border-right-width:0;
	border-top-width:0;
	border-bottom-width:1;
}
</style>

<script>
$(function(){
	/*
	이미지x 버튼을 누르지 않고 파일만 추가하고 취소버튼을 눌렀을 때
	이미지x 버튼을 누르지 않고 파일만 추가 후 수정버튼을 눌렀을 때
	이미지x 버튼을 누르고 취소버튼를 눌렀을 때
	이미지x 버튼을 누르고 수정버튼을 눌렀을 때
	이미지x 버튼을 누르고 파일 추가 후 취소버튼을 눌렀을 때
	이미지x 버튼을 누르고 파일 추가 후 수정버튼을 눌럿을 때
	-> 파일은 실시간으로 바로바로 지우고 삽입한다, 수정버튼을 눌렀을 땐 이미지 삭제든 추가든 아무런 조치가 없다
	*/
	
	//------------------------ 달력 시작 ---------------------------------//
	$('#txtDatePicker').datepicker({ 
		format: 'yyyy-mm-dd',
		language : 'kr',
		todayHighlight : true,
		todayBtn : 'linked'
	}).on("changeDate", function(e){
		console.log(e.date);//Wed Jan 06 2021 00:00:00 GMT+0900 
		var dateStr = e.date.toString();
		//console.log("dateStr:"+dateStr);
		var date = dateStr.substring(0,15);
		console.log("date:"+date);
		var dates = date.split(" ");
		//dates[1] month, dates[2] day dates[3] year
		$("#e_year").val(dates[3]);
		$("#e_month").val(dates[1]);
		$("#e_day").val(dates[2]);
	});
	//------------------------ 달력 끝 ---------------------------------//
		
	//이미지 추가 했을 때
	$("#fileDrop").on("dragenter dragover", function(e) {
		e.preventDefault();
	});//fileDrop	

	$("#fileDrop").on("drop", function(e) {
		e.preventDefault();
		
		$("#lblFileNameCheckError").hide();
		
		//var nextPNO = $(this).attr("data-nextPNO"); 수정은 nextPNO필요없다
	
		var file = e.originalEvent.dataTransfer.files[0]; //드래그한 파일에 대한 객체 정보를 가지고 있다
		//html의 form객체를 만들어서 여기에 이미지를 추가해서 통째로 ajax로 넘긴다
		//e인 이벤트 값중 원본 이벤트값에 접근
		//dataTransfer : dragdrop이나 drop 이벤트를 한 파일에 접근

		var formData = new FormData(); //키-쌍으로 이루어지면 서버에 데이터를 전송하기 위한 객체
		formData.append("file", file);
		var p_no = $("#p_no").val();
		//alert("p_no:"+p_no);
		
		//var url = "/furniture/uploadAjax/"+p_no;//pno에 해당하는 폴더 만든다
		var url = "/auction/ModifyAddImg/"+p_no;
				
		$.ajax({
			"processData" : false,
			"contentType" : false,
			"method" : "post",
			"url" : url,
			"data" : formData,
			"success" : function(data) {
				
				if(data != "false"){//이미지 파일이면 실행
					console.log("fileDrop에서 data:"+data)
					var divUploaded = $("#uploadList").prev().clone();
					var img = divUploaded.find("img");
					img.attr("src","/furniture/displayImage?imageName=" + data);
					
					var radio = divUploaded.find("input[name='radioMainImg']");
					radio.attr("value",data);
					
					$("#uploadList").append(divUploaded);
					divUploaded.show();
				}else{//이미지 파일이 아니면 에러메세지보여주기
					$("#lblFileNameCheckError").show();
				}
			}
		});//ajax
	});//fileDrop

	//x버튼을 눌러 삭제시
	$("#uploadList").on("click",".a_times", function(){
		//alert("dsf");
		var that = $(this);
		var filePathName = that.next().attr("value");
		var p_no = $("#p_no").val();
		console.log(filePathName)
		
		var sendData = {
			"filePathName" : filePathName,
			"p_no" : p_no
		};
		
		var url="/auction/ModifyDelImg";
		/*한꺼번에
		S3에서 파일 삭제
		DB에서 파일 삭제
		폴더에서 파일 삭제*/
		
		$.get(url, sendData, function(result){
			if(result=="success"){
				that.parent().remove();
				alert("해당 파일 삭제함");
			}
		});
	});//a_times
	
	//submit 시작---------------------------------------------------
	$("#btnSubmit").click(function(){//등록 버튼 클릭시
		
		//영어 월을 숫자 월로 입력
		var engMonth = $("#e_month").val();
		console.log("engMonth:"+engMonth);
		var month;
		
		if(engMonth>=1 && engMonth <=12){//수정이기 때문에 앞에 달을 가져오면 engMonth가 숫자가 되어있다
			month = engMonth;
		}else{
			month = changeMonth(engMonth);
		}
		
		console.log("month:"+month);
		$("#e_month").val(month);
		//초를 통일해서 입력하기 위해서
		var e_second = parseInt((Math.random() * 59)+1);
		$("#e_second").val(e_second);
		
		/*
		//이미지 입력
		var div = $("#uploadList > .divUploaded"); // > : 자식에서 찾아라
		파일 드래그드롭에 x버튼을 눌렀을 때 이미 이미지파일들은 폴더,db,s3에서 추가, 삭제가 끝났다
		여기선 이미 추가된 목록에서 라디오버튼으로 메인 이미지파일만 선택해서 db에 update시켜주면 된다
		div.each(function(index){//img이름 가져온다
			//console.log("index:"+index);
			var radio = $(this).find("#radioMainImg")
			var filename = radio.attr("value");
			
			var html = "<input type='hidden' name='images["+index+"]' value='"+filename+"'>";
			$("#modifyForm").prepend(html);
		});*/
		
		//메인 이미지 결정
		var radioValue = $("input[name=radioMainImg]:checked").val();//main이미지 이름 가져오기
		console.log("radioValue:"+radioValue);
		
		if(radioValue == null || radioValue == "undefined"){
			alert("메인 이미지를 선택하세요");
		}else{
			var htmlMainImgName = "<input type='hidden' name='main_img_name' value='"+radioValue+"'>"
			$("#modifyForm").prepend(htmlMainImgName);
			
			$("#modifyForm").submit();
		}
	});	
	//submit 끝---------------------------------------------------
	
	//--------------------------------------------- 주소  ----------------------------------------------------------//
	$("#addrFindAuction").click(function(e) {//주소 찾기 버튼
		e.preventDefault();
		$("#modalAddrAuction").trigger("click");
	});
	
	//모달에서 주소 찾기 
	$("#modalAddrFindAuction").click(function() {
		var keyword = $("#moadlTxtAddrAuction").val();
		
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
				htmlStr += "<table style='border:1;width:300px'>";
				$(jsonStr.results.juso).each(function() {
					htmlStr += "<tr><td style='text-align:center;font-size:15px;font-family:verdana;padding:2px'><a href='#' class='roadAddrPart1' data-zip='"+this.zipNo+"'>" + this.roadAddrPart1 + "</a></td><tr>";
					htmlStr += "<tr><td style='text-align:center;font-size:13px;font-family:verdana;font-color:gray;margin-bottom:4px'>" + this.jibunAddr + "<hr></td><tr>";
					//htmlStr += "<td>" + this.zipNo + "</td>";
				});
				htmlStr += "</table>";
				$("#list").html(htmlStr);
				}
			});//ajax
		});//addrFind

			
		$("#list").on("click",".roadAddrPart1", function(){//모달에서 주소 링크 클릭시 값 넘기기
			var roadAddr = $(this).text();
			var jibunAddr = $(this).parent().parent().next().next().children().text();//닫는tr-> /tr 도 요소에 포함. next()에 포함시킨다
			var zip = $(this).attr("data-zip");
			//console.log("zip:"+zip);
			$("#spanZip").text(zip);
			$("#spanRoadAddr").text(roadAddr);
			$("#spanjibundAddr").text(jibunAddr);
			$("#txtjibundAddrDetail").val("");
			
			$("#zip").val(zip);
			$("#road_address").val(roadAddr);
			$("#jibun_address").val(jibunAddr);
			
			$("#btnModalCloseAuction").trigger("click");
		});//list지번
		
});//function

</script>

<!--  주소 찾기 모달 시작 -->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<a id="modalAddrAuction" href="#modalAddr-container-auction" role="button"
				class="btn" data-toggle="modal" style="display:none">주소 찾기</a>
			
			<div class="modal fade" id="modalAddr-container-auction" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
					
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">주소 입력</h5>
							<button type="button" id="btnModalCloseAuction" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						
						<div class="modal-body"> 
							<div>
								<input type="text" style="width:300px;margin-bottom:15px;font-size:15px" placeholder="주소를 입력하시오" id="moadlTxtAddrAuction">
								<a href="#" id="modalAddrFindAuction"><img src="../resources/image/addrFind.png"></a>
							</div>
								<div id="list" style="padding-bottm:20px"></div>
								<!-- 검색 결과 리스트 출력 영역 -->
						</div>
						
						<div class="modal-footer">
							<button type="button" class="btn btn-outline-success btn-sm" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!--  주소 찾기 모달 끝 -->

<div class="container-fluid">
	<div class="row">
	<div class="col-md-2"></div>
		<div class="col-md-8">
		<%@ include file="auctionHeader.jsp"%>
			<div class="col-md-2"></div>
			<div class="col-md-12">
				<form role="form" name="modifyForm" id="modifyForm" action="/auction/auctionModifyRun">    
	
				<input type='hidden' name='p_no' id='p_no' value='${auctionSellVo.p_no}'>
				
				<input type='hidden' name='e_year' id='e_year' value='${auctionSellVo.e_year}'>
				<input type='hidden' name='e_month' id='e_month' value='${auctionSellVo.e_month}'>
				<input type='hidden' name='e_day' id='e_day' value='${auctionSellVo.e_day}'>
				<input type='hidden' name='e_second' id='e_second'>
				
				<input type="hidden" name="zip" id="zip" value='${auctionSellVo.zip}'>
				<input type="hidden" name="road_address" id="road_address" value='${auctionSellVo.road_address}'>
				<input type="hidden" name="jibun_address" id="jibun_address" value='${auctionSellVo.jibun_address}'>
				
					<div class="form-group">
						<label for="p_title">상품명</label> <input
							type="text" class="form-control" id="p_title" name="p_title" value="${auctionSellVo.p_title}"/>
					</div>
					
					<div class="form-group">
						<label for="present_price">경매 금액</label> <input
							type="text" class="form-control" id="present_price" name="present_price" value="${auctionSellVo.present_price}"/>
					</div>
					
					<div class="form-group">
						<label for="instant_price">즉구가</label> <input
							type="text" class="form-control" id="instant_price" name="instant_price" value="${auctionSellVo.instant_price}"/>
					</div>
					
					<div class="form-group">
						<label for="p_content">상품설명</label> 
						<textarea class="form-control" id="p_content" name="p_content">${auctionSellVo.p_content}</textarea>
					</div>
					
					<!-- 마감일 입력 -->
					<label for="datetimepicker1">경매기한</label>
					<!-- -------------------- 달력 입력 시작 ------------------------------------- -->
					<input type="text" id="txtDatePicker" value="${auctionSellVo.e_year}-${auctionSellVo.e_month}-${auctionSellVo.e_day}">
					시간:<input type="text" id="txtHour" name='e_hour' style="width:40px" value="${auctionSellVo.e_hour}">
					분:<input type="text" id="txtMinute" name='e_minute' style="width:40px" value="${auctionSellVo.e_minute}">
					<!-- --------------------- 달력 입력 끝 ------------------------------------ -->
														
					<!-- 파일 추가 시작 -->
					<div>
						<label>첨부할 파일 드로그 하세요(메인 사진에 체크하세요)</label>
						<label id="lblFileNameCheckError" style="color:red;display:none">(이미지 파일만 추가하세요)</label>
						<div id="fileDrop" data-nextPNO="${nextPNO}"></div>
						<!-- 여기에 파일을 드래그 드롭 -->
					</div>
					
					<div class="divUploaded" style="display: none;float:left;">
						<!-- 추가한 그림 크기와 옆에 x추가 -->
						<img height="50px" width="50px" /> <a href="#" class="a_times">&times;</a>
						<input type="radio" name="radioMainImg" id="radioMainImg">
					</div>
					
					<div id="uploadList">
					<c:forEach var="img" items="${imgModify}">
						<div class="divUploaded" style="float:left;">
						<!-- 추가한 그림 크기와 옆에 x추가 -->
						<img src="/furniture/displayImage?imageName=${img.img_name}" height="50px" width="50px" /> 
						<a href="#" class="a_times">&times;</a>
						<input type="radio" name="radioMainImg" id="radioMainImg" value="${img.img_name}">
					</div>
					</c:forEach>
					
					</div>
					<!-- 파일 추가 끝 -->
					
					<br clear="left">
					<br>
					<div>
						<label style="padding-right:10px">직구를 원하시면 주소를 입력하세요</label>
						<a href="#" id="addrFindAuction"><img src="../resources/image/addrFind.png"></a>
					<br>
						
					<!-- 주소 찾기 시작 -->
					우편번호:<span id="spanZip" style="padding-left:10px"></span><br/>
					<span id="spanRoadAddr">${auctionSellVo.road_address}</span><br>
					<span id="spanjibundAddr">${auctionSellVo.jibun_address}</span><br>
					<input type="text" style="width:140px;" placeholder="상세주소" id="txtjibundAddrDetail" name="detail_address" value="${auctionSellVo.detail_address}"/>
					
					<!-- 주소 찾기 끝-->
					</div>
					
					<br>
					<button type="button" class="btn form-control btn-warning" id="btnSubmit">등록</button>
				</form>
			</div><!-- 내부 md8-->
			<div class="col-md-2"></div><!-- 내부 md2 -->
		</div><!-- 외부 md8 -->
	<div class="col-md-2"></div><!-- 외부 md2 -->
	</div><!-- 외부 row -->
</div><!-- 외부  fluid -->