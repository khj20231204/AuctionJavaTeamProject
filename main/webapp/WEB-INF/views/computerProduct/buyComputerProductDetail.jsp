<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="/resources/css/buyComputerProductDetail_css.css" %>
<%@ include file="../include/header.jsp"%>

<script>
setInterval(function(){
    
    var timer = new Date();
    var h = timer.getHours();
    var m = timer.getMinutes();
    var s = timer.getSeconds();
    document.getElementById('clock').innerHTML = h + "시-" + m + "분-" + s + "초";
},1000);

var todayValueYear = "";
var todayValueMonth = "";
var todayValueDate = "";
var today = new Date();//오늘 날짜//내 컴퓨터 로컬을 기준으로 today에 Date 객체를 넣어줌
var date = new Date();//today의 Date를 세어주는 역할
function prevCalendar() {//이전 달
// 이전 달을 today에 값을 저장하고 달력에 today를 넣어줌
//today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
//getMonth()는 현재 달을 받아 오므로 이전달을 출력하려면 -1을 해줘야함
 today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
 buildCalendar(); //달력 cell 만들어 출력 
}

function nextCalendar() {//다음 달
    // 다음 달을 today에 값을 저장하고 달력에 today 넣어줌
    //today.getFullYear() 현재 년도//today.getMonth() 월  //today.getDate() 일 
    //getMonth()는 현재 달을 받아 오므로 다음달을 출력하려면 +1을 해줘야함
     today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
     buildCalendar();//달력 cell 만들어 출력
}
function buildCalendar(){//현재 달 달력 만들기
    var doMonth = new Date(today.getFullYear(),today.getMonth(),1);
    //이번 달의 첫째 날,
    //new를 쓰는 이유 : new를 쓰면 이번달의 로컬 월을 정확하게 받아온다.     
    //new를 쓰지 않았을때 이번달을 받아오려면 +1을 해줘야한다. 
    //왜냐면 getMonth()는 0~11을 반환하기 때문
    var lastDate = new Date(today.getFullYear(),today.getMonth()+1,0);
    //이번 달의 마지막 날
    //new를 써주면 정확한 월을 가져옴, getMonth()+1을 해주면 다음달로 넘어가는데
    //day를 1부터 시작하는게 아니라 0부터 시작하기 때문에 
    //대로 된 다음달 시작일(1일)은 못가져오고 1 전인 0, 즉 전달 마지막일 을 가져오게 된다
    var tbCalendar = document.getElementById("calendar");
    //날짜를 찍을 테이블 변수 만듬, 일 까지 다 찍힘
    var tbCalendarYM = document.getElementById("tbCalendarYM");
    //테이블에 정확한 날짜 찍는 변수
    //innerHTML : js 언어를 HTML의 권장 표준 언어로 바꾼다
    //new를 찍지 않아서 month는 +1을 더해줘야 한다. 
     tbCalendarYM.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월"; 

     /*while은 이번달이 끝나면 다음달로 넘겨주는 역할*/
    while (tbCalendar.rows.length > 2) {
    //열을 지워줌
    //기본 열 크기는 body 부분에서 2로 고정되어 있다.
          tbCalendar.deleteRow(tbCalendar.rows.length-1);
          //테이블의 tr 갯수 만큼의 열 묶음은 -1칸 해줘야지 
        //30일 이후로 담을달에 순서대로 열이 계속 이어진다.
     }
     var row = null;
     row = tbCalendar.insertRow();
     //테이블에 새로운 열 삽입//즉, 초기화
     var cnt = 0;// count, 셀의 갯수를 세어주는 역할
    // 1일이 시작되는 칸을 맞추어 줌
     for (i=0; i<doMonth.getDay(); i++) {
     /*이번달의 day만큼 돌림*/
          cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
          cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
     }
    /*달력 출력*/
     for (i=1; i<=lastDate.getDate(); i++) { 
     //1일부터 마지막 일까지 돌림
          cell = row.insertCell();//열 한칸한칸 계속 만들어주는 역할
          cell.innerHTML = i;//셀을 1부터 마지막 day까지 HTML 문법에 넣어줌
          cnt = cnt + 1;//열의 갯수를 계속 다음으로 위치하게 해주는 역할
      if (cnt % 7 == 1) {/*일요일 계산*/
          //1주일이 7일 이므로 일요일 구하기
          //월화수목금토일을 7로 나눴을때 나머지가 1이면 cnt가 1번째에 위치함을 의미한다
        cell.innerHTML = "<font color=#F79DC2>" + i
        //1번째의 cell에만 색칠
    }    
      if (cnt%7 == 0){/* 1주일이 7일 이므로 토요일 구하기*/
          //월화수목금토일을 7로 나눴을때 나머지가 0이면 cnt가 7번째에 위치함을 의미한다
          cell.innerHTML = "<font color=skyblue>" + i
          //7번째의 cell에만 색칠
           row = calendar.insertRow();
           //토요일 다음에 올 셀을 추가
      }
      /*오늘의 날짜에 노란색 칠하기*/
      if (today.getFullYear() == date.getFullYear()
         && today.getMonth() == date.getMonth()
         && i == date.getDate()) {
          //달력에 있는 년,달과 내 컴퓨터의 로컬 년,달이 같고, 일이 오늘의 일과 같으면
        cell.bgColor = "#FAF58C";//셀의 배경색을 노랑으로         
       }
     }
}

function getByTodayValue(){
	todayValueYear = today.getFullYear();
	todayValueMonth = today.getMonth() + 1;
	todayValueDate = today.getDate();
}

function computer_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('computer_postcode').value = data.zonecode; // 우편번호
            document.getElementById('computer_roadAddress').value = roadAddr; // 도로명 주소
            
            if (roadAddr == ""){
	              document.getElementById('computer_roadAddress').value = data.jibunAddress; // 참고항목
            }
            
            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("computer_extraAddress").value = extraRoadAddr;
            } else {
                document.getElementById("computer_extraAddress").value = '';
            }

            var guideTextBox = document.getElementById("guide");
            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
            if(data.autoRoadAddress) {
                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                guideTextBox.style.display = 'block';

            } else if(data.autoJibunAddress) {
                var expJibunAddr = data.autoJibunAddress;
                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                guideTextBox.style.display = 'block';
            } else {
                guideTextBox.innerHTML = '';
                guideTextBox.style.display = 'none';
            }
        }
    }).open();
}

$(function(){
	getByTodayValue();
	$("#buyYear").text(todayValueYear);
	$("#buyMonth").text(todayValueMonth);
	$("#buyDate").text(todayValueDate);
	var price = "${buyComputerInfo.price}";
	var seller = "${buyComputerInfo.seller}";
	var productNum = "${buyComputerInfo.productNum}";
	var productName = "${buyComputerInfo.productName}";
	var sendMethod = "${buyComputerInfo.sendMethod}";
	var m_id = "${sessionScope.memberVo.m_id}";
	var m_point = "${m_point}";
	console.log("m_point:" + m_point);
	var cPrice = "";
	
	//멤버 등급에 따라 할인하기
	if((m_point >= 0)  && (m_point < 5000)){		
		$("#gradePrice").text("할인가 없음");
		cPrice = price;
	}else if((m_point >= 5000) && (m_point < 10000)){
		cPrice = price * 0.9;
		console.log("cPrice:" + cPrice);
		$("#gradePrice").text("골드회원은 10% 할인하여 " + cPrice + "원");
	}else if(m_point >= 10000){
		cPrice = price * 0.7;
		console.log("cPrice:" + cPrice);
		$("#gradePrice").text("VIP는 30% 할인하여 " + cPrice + "원");
	}
	console.log("todayValueYear:" + todayValueYear);
	console.log("todayValueMonth:" + todayValueMonth);
	console.log("todayValueDate:" + todayValueDate);
	var postcode = "";
	var roadAddress = "";
	var extraAddress = "";
	var detailAddress = "";
	
	//주소 모달창 켜기
	$("#searchJuso").click(function() {
		$("#computer_postcode").val("");
		$("#computer_roadAddress").val("");
		$("#computer_extraAddress").val("");
		$("#computer_detailAddress").val("");
		$("#modalAddrByComputer").trigger("click");
	});
	
	//주소 서버에 저장
	$("#selectAddrComputer").click(function() {		
		postcode = $("#computer_postcode").val();
		roadAddress = $("#computer_roadAddress").val();
		extraAddress = $("#computer_extraAddress").val();
		detailAddress = $("#computer_detailAddress").val();
		console.log("postcode:" + postcode);
		console.log("roadAddress:" + roadAddress);
		console.log("extraAddress:" + extraAddress);
		console.log("detailAddress:" + detailAddress);
		$("#btnModalCloseComputer").trigger("click");
		alert("서버에 저장되었습니다.");
		$("#spanAdressNum").text(postcode);
		$("#spanRoadAdress").text(roadAddress);
		$("#spanRef").text(extraAddress);
		$("#detailAdress").text(detailAddress);
		$("#addrTable").show();
	});
	var m_id = "${sessionScope.memberVo.m_id}";
	var m_pass = "${sessionScope.memberVo.m_pass}";
	var p_no = "${buyComputerInfo.p_no}";
	var memberOfTelephone = "";
	var messageForDriver = "";
	
	//휴대폰 번호 및 배송기사에게 전달할 메세지 서버에 저장
	$("#pushMessageAndTel").click(function(){
		var messageForDriverBefore = $("#messageForDriver").val();		
		var m_length = messageForDriverBefore.length;
		var memberOfTelephone1 = $("#memberOfTelephone1").val();
		var memberOfTelephone2 = $("#memberOfTelephone2").val();
		var memberOfTelephone3 = $("#memberOfTelephone3").val();
		var mt_length1 = memberOfTelephone1.length;
		var mt_length2 = memberOfTelephone2.length;
		var mt_length3 = memberOfTelephone3.length;
		if((m_length == 0) || (mt_length1 == 0) || (mt_length2 == 0) || (mt_length3 == 0)){
			alert("제대로 기입하십시오");
			$("#stringLengthSpan").text(m_length);
		}else{
			if((m_length != 0) && (mt_length1 != 0) && (mt_length2 != 0) && (mt_length3 != 0)
					&& (m_length < 51) && (mt_length1 < 4) && (mt_length2 < 5) && (mt_length3 < 5)){
				$("#stringLengthSpan").text(m_length);
				memberOfTelephone = memberOfTelephone1 + memberOfTelephone2 + memberOfTelephone3;		
				messageForDriver = messageForDriverBefore;
				alert("서버에 기입되었습니다");	
			}else{
				alert("글자수를 초과하였거나 올바른 연락처가 아닙니다");
				$("#stringLengthSpan").text(m_length);
			}	
		}
			
		console.log("memberOfTelephone:" + memberOfTelephone);
		console.log("messageForDriver:" + messageForDriver);			
	});
	
	//결제하기
	$("#buyProduct").click(function(){
		$("#modal-purchaseRef").trigger("click");
		if(m_id != ""){	
		if((postcode != "") && (roadAddress != "") && (extraAddress != "") && (detailAddress != "")){
		if((memberOfTelephone != "") && (messageForDriver != "")){		
		var isConfirm = confirm("정말 구매하시겠어요?");
		if(isConfirm == true){
			var radioVal = $('input[name="Payment"]:checked').val();					
			alert("주문합니다.");
			var urlSendNum = "/buyComputerProduct/sendForGetPurchasePercentage";
			var productNum = "${buyComputerInfo.productNum}";
			var productName = "${buyComputerInfo.productName}";
			var seller = "${buyComputerInfo.seller}";
			var sendDataSendNum = {
				"productNum" : productNum,
				"productName" : productName,
				"seller"      : seller
			};
			$.post(urlSendNum,sendDataSendNum, function(data) {
				if(data == "success"){
					
				}else{
					alert("실패");
				}
			});
			
			console.log("radioVal:" + radioVal);
			console.log("memberOfTelephone:" + memberOfTelephone);
			console.log("messageForDriver:" + messageForDriver);			
			console.log("postcode:" + postcode);
			console.log("roadAddress:" + roadAddress);
			console.log("extraAddress:" + extraAddress);
			console.log("detailAddress:" + detailAddress);
			console.log("p_no:" + p_no);
			console.log("m_id:" + m_id);

			var urlSendProductInfo = "/buyComputerProduct/sendProductInfoBought";
			var sendDataSendProductInfo = {
					"price"					: cPrice,
					"seller"				: seller,
					"productNum"			: productNum,
					"productName"			: productName,
					"sendMethod"			: sendMethod,
					"radioVal"    			: radioVal,
					"memberOfTelephone"     : memberOfTelephone,
					"messageForDriver"      : messageForDriver,					
					"postcode"	    		: postcode,
					"roadAddress"   		: roadAddress,
					"extraAddress"  		: extraAddress,		
					"detailAddress" 		: detailAddress,
					"p_no"					: p_no,
					"m_id"					: m_id,
					"todayValueYear"		: todayValueYear,
					"todayValueMonth"		: todayValueMonth,
					"todayValueDate"		: todayValueDate
			};
 			$.post(urlSendProductInfo,sendDataSendProductInfo, function(data) {
				if(data != null){
					
					alert("개인정보 폼에 구매내역이 저장되었고 포인트가 " + data + "만큼 증가하였습니다");
				}else if(data == "fail"){
					alert("포인트 증가 실패");
				}
 			});
		}else{
			alert("다른 상품도 둘러보세요.");
		}		
		}else{
			alert("배송메세지와 연락처를 기입하시오");
		}
		}else{
			alert("주소를 모두 찾아 기입하시오");
		}
		}else{
			alert("로그인 하시오");
		}
		
	});

	//주문자 이름 바꾸기
	$("#changeMemberNameButton").click(function(){
		
		if($("#changeMemberName").is(":checked") == true){
			alert("주문자 변경 체크박스 체크됨");	
			
			if(m_id != ""){
				alert("접속됨");	
				var buyerName = $("#buyerName").val();
				console.log("buyerName:" + buyerName);
				if(buyerName != ""){
					var m_pass_confirm = "";
					m_pass_confirm = prompt("비밀번호를 확인하겠습니다.","");
					console.log("m_pass_confirm:" + m_pass_confirm);							
								
					var url = "/buyComputerProduct/changeBuyerName";												
					
					if(m_pass_confirm == m_pass){
						alert("비밀번호 일치");
						var sendData ={
								"buyerName" : buyerName,
								"m_id" : m_id,
								"m_pass" : m_pass
							};
						$.post(url,sendData, function(data) {
							if(data == "success"){
								alert("성공");
							}else{
								alert("실패");
							}
						});
						
					}else{
						alert("비밀번호 불일치");
					}
				}else{
					alert("주문자 변경정보를 기입하시오");
				}
				
			}else{
				alert("미접속됨");
			}			
		}else{
			alert("미체크");
		}
	});	

	//구매후기 작성
	$("#purchaseRefInputsButton").click(function(){
		var c_com_comment_content = $("#c_com_comment_content").val();
		
		var url = "/buyComputerProduct/insertProductRef";
		
		var sendData ={
				"productName" 			: productName,
				"m_id" 					: m_id,
				"c_com_comment_content" : c_com_comment_content				
			};
		if(m_id != ""){
			if(c_com_comment_content != ""){
				$.post(url,sendData, function(data) {
					if(data == "success"){
						alert("성공");
					}else{
						alert("실패");
					}
				});
			}else{
				alert("기입사항을 입력하시오");
			}			
		}else{
			alert("로그인 하시오");
		}		
	});
});
</script>
<div class="row">
		<div class="col-md-2"></div>
<div class="col-md-8" >
<%@ include file="../include/header_mainCatagories.jsp"%>
<br>
	</div>
	<div class="col-md-2"></div>
</div>
<div class="row">
		<div class="col-md-12">
			 <a id="modal-purchaseRef" href="#modal-container-purchaseRef" role="button" class="btn" data-toggle="modal" style="display:none">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-purchaseRef" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">
								구매후기 작성하시겠습니까?
							</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<div id="purchaseRefInputs">
									<input type="text" id="c_com_comment_content" name="c_com_comment_content" placeholder="내용을 기입하시오"/>									
								</div>
						</div>
						<div class="modal-footer">
							 
							<button type="button" id="purchaseRefInputsButton" class="btn btn-primary">
								작성
							</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">
								닫기
							</button>
						</div>
					</div>					
				</div>				
			</div>			
		</div>
	</div>
<div class="row">
		<div class="col-md-12">
			<a id="modalAddrByComputer" href="#modalAddr-container-computer" role="button"
				class="btn" data-toggle="modal" style="display:none">주소 찾기</a>
			<div class="modal fade" id="modalAddr-container-computer" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">					
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabelComputer">배송지 주소 찾기</h5>
							<button type="button" id="btnModalCloseComputer" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>						
						<div class="modal-body"> 
							<div id="searchAddrComputer">
								<input type="text" id="computer_postcode" placeholder="우편번호">
								<input type="button" onclick="computer_execDaumPostcode()" value="우편번호 찾기"><br>
							</div>
							<div id="mainAddr">
								<div id="roadAndextraAddr">
									<input type="text" id="computer_roadAddress" placeholder="도로명주소">
									<input type="text" id="computer_extraAddress" placeholder="참고항목"><br>
									<span id="guide" style="color:#999;display:none"></span>
								</div>
									<input type="text" id="computer_detailAddress" placeholder="상세주소">
							</div>
						</div>						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="selectAddrComputer">서버에 저장해둠</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
<div class="col-md-12">
<div class="DetailDiv">
<nav class="DetailNav">    
<table id="calendar" align="center">
    <tr><!-- label은 마우스로 클릭을 편하게 해줌 -->
        <td><label onclick="prevCalendar()"><</label></td>
        <td align="center" id="tbCalendarYM" colspan="5">
        yyyy년 m월</td>
        <td><label onclick="nextCalendar()">>            
        </label></td>
    </tr>
    <tr>
        <td align="center">일</td>
        <td align="center">월</td>
        <td align="center">화</td>
        <td align="center">수</td>
        <td align="center">목</td>
        <td align="center">금</td>
        <td align="center">토</td>
    </tr> 
</table>
<script language="javascript" type="text/javascript">
    buildCalendar();
</script>
</nav>
<section class="DetailSection">
<h1>주문서</h1>
<hr>
<br>
<br>
<h4>주문상품내용</h4>
<hr>
<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							주문상품명
						</th>
						<th>
							상품수량
						</th>
						<th>
							판매자명
						</th>
						<th>
							배송방식
						</th>
						<th>
							가격
						</th>
						<th>
							멤버 등급에 따른 할인 가격
						</th>
						<th>
							주문날짜
						</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							${buyComputerInfo.productName}
						</td>
						<td>
							${buyComputerInfo.productNum}<span>개</span>
						</td>
						<td>
							${buyComputerInfo.seller}<span>님</span>
						</td>
						<td>
							${buyComputerInfo.sendMethod}
						</td>
						<td>
							${buyComputerInfo.price}<span>원</span>
						</td>
						<td>
							<span id="gradePrice"></span>
						</td>
						<td>
							<span id="buyYear"></span>-<span id="buyMonth"></span>-<span id="buyDate"></span>
						</td>
					</tr>					
				</tbody>
			</table>
		</div>
	</div>	
	<br>
	<br>
	<h4>주문자 정보 수정</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							주문자 확인
						</th>
						<th>
							
						</th>
						<th>
							
						</th>
																		
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
							<label>주문자명:</label>
							<input placeholder="주문자 기입" name="buyerName" id="buyerName"/>							
						</td>
						<td>
						<div class="checkbox">
							<label> <input type="checkbox" id="changeMemberName"/>
						입력한 주문자명으로 회원정보 변경하기</label>
						</div>
						</td>
						<td>
						<button type="button" id="changeMemberNameButton">변경</button>
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<br>
	<h4>배송지 정보 입력</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>																		
						<th>
							주소
						</th>												
						<th>
							연락처
						</th>
						<th>
							배송 메세지
						</th>												
						<th>
							
						</th>												
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td>
						<label>주소넣기:</label>
						<button type="button" id="searchJuso">검색</button><br>							
						</td>
						<td>
						<label>연락처:</label>
						<input type="text" placeholder="첫번호" id="memberOfTelephone1"/>-
						<input type="text" placeholder="둘째번호" id="memberOfTelephone2"/>-
						<input type="text" placeholder="셋째번호" id="memberOfTelephone3"/>
						</td>
						<td>
						<label>배송메세지:</label>
						<input placeholder="택배 기사님께 부탁할 사항을 입력하시오" type="text" id="messageForDriver"/>(<span id="stringLengthSpan"></span>/50자)
						</td>
						<td>						
						<button type="button" id="pushMessageAndTel">기입</button><br>							
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-12">
			<table class="table" style="display: none;" id="addrTable">
				<thead>
					<tr>																		
						<th>
							우편번호
						</th>												
						<th>
							도로명주소
						</th>
						<th>
							참고항목
						</th>												
						<th>
							상세주소
						</th>												
					</tr>
				</thead>
				<tbody>
					<tr>						
						<td>
							<span id="spanAdressNum"></span>						
						</td>
						<td>
							<span id="spanRoadAdress"></span>
						</td>
						<td>
							<span id="spanRef"></span>
						</td>
						<td>						
							<span id="detailAdress"></span>							
						</td>												
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
	<br>
	<h4>결제정보</h4>
	<hr>
	<div class="row">
		<div class="col-md-12">
			<table class="table">
				<thead>
					<tr>
						<th>
							결제정보입력
						</th>
						<th>
							결제하기
						</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
						<form>
							<input type="radio" name="Payment" value="신용/체크카드" checked="checked">신용/체크카드
							&nbsp;&nbsp;<input type="radio" name="Payment" value="무통장입금">무통장입금
							&nbsp;&nbsp;<input type="radio" name="Payment" value="휴대폰결제">휴대폰결제
						</form>
						</td>
						<td>
							<button type="button" id="buyProduct">결제하기</button>
						</td>						
					</tr>					
				</tbody>
			</table>
		</div>
	</div>
</section>
<aside class="DetailAside">
<h1>현재시간:</h1>
<h1 id="clock"></h1>
</aside>
</div>
</div>
</div>