<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="cs" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/resources/css/bootstrap.jsp" %>
<%@ include file = "include/header.jsp" %>
<%-- <%@ include file = "include/header_mainCatagories.jsp" %> --%>

 <title>회원가입</title>
    	<link href="<cs:url value='/resources/css/member_join.css'/>" rel="stylesheet" type="text/css" >	
    	<script src="<cs:url value="/resources/js/MemberSignup.js"/>"></script>	
    		 
    	<style>
    	ul{
		   list-style:none;
		   }
		
		.align-center { text-align: center; }
    	</style>
		<!-- 자바스크립트 시작 -->
		<script type="text/javascript">
		
		//-------------------------------------------- 아이디 처리 ---------------------------------------------------//
		
		function FocusIn_IDForm(obj){ //포커스가 아이디 텍스트에 들어오면 처리
			if(obj.value == '아이디'){
				obj.value="";
			}
		}//FocusIn_IDForm
		
		function FocusOut_IDForm(obj) { //포커스가 아이디 텍스트를 벗어나면 처리
			$(obj).removeClass('focus');
			CheckIDValidation(obj);
		}//FocusOut_IDForm
		
		function CheckIDValidation(obj){ //아이디 체크
			var current = $('.info-enter .info-cont .enter-id');
			current.removeClass('incorrect');
			current.removeClass('usable');
			$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
			$('.info-enter .info-cont ul .enterid_area .txt01').hide();
			$('.info-enter .info-cont ul .enterid_area .txt02').hide();

			if (obj.value == '')
			{
				$("#idBlankChk").show();
				$('.info-enter .info-cont ul .enterid_area .enter-guide').show();
				return;
			}
			
			if (!CheckID(obj, false, $('.info-enter .info-cont ul .enterid_area .txt02').get(0))) {
				$('.enter-id').addClass('incorrect');
				$('.info-enter .info-cont ul .enterid_area .txt02').show();				
				return;
			}	
		}//CheckIDValidation
		
		function CheckID(TextBoxControl, valueReset, messageControl) //아이디 유효성 체크
		{
			inputValue = TextBoxControl.value.replace(/ /g, "") ;
			if (inputValue.length ==0)
			{
				messageControl.innerHTML ="사용자 아이디를 입력하세요.";	// 실제로는 노출되지 않는다.
				if(valueReset){TextBoxControl.value="";}
				//TextBoxControl.focus();
				return false;
			}
			//1.입력값체크
			if(inputValue.replace(/[A-Za-z0-9]/g,"").length!=0){
				messageControl.innerHTML ="아이디는 영문, 숫자만 사용하실 수 있습니다.";
				if(valueReset){TextBoxControl.value="";}
				//TextBoxControl.focus();
				return false;
			}
		
			//1.공백문자체크
			if(TextBoxControl.value.indexOf(' ') >= 0)
			{
				messageControl.innerHTML = "아이디에 띄어쓰기는 사용할 수 없습니다.";
				TextBoxControl.value = TextBoxControl.value.replace(/ /g, "") ;
				//TextBoxControl.focus();
	
				return false;
			}

			//2.길이체크
			if (inputValue.length < 4 || inputValue.length > 12) {
				messageControl.innerHTML ="아이디는 4~12자를 사용해 주세요.";
				if(valueReset){TextBoxControl.value="";}
				//TextBoxControl.focus();
				return false;
			}
			return true;
		}//CheckID
		
		//-------------------------------------------- 비밀번호 처리 ---------------------------------------------------//
		
		function FocusIn_PwdForm(obj){ //패스워드 입력창에 포커스 이동시
		
			$(obj).removeClass('focus');
			$(obj).removeClass('passwordInfoImg');
//  			$('.info-enter .info-cont ul .enterid_area .enter-guide').hide();
		}//FocusIn_PwdForm
		
		function validatePasswordType(objPassWord){ //패스워드 입력창에서 키보들 땔 때
			//	if(document.getElementById('cb_password').checked)				// 확인 체크박스에 표시되어있으면 리턴
			//		return;
				var current = $('#m_pass');

				var resultType = objPw.getType(objPassWord); //MemberSignup.js
				current.removeClass('incorrect');
				current.removeClass('usable');
				$('.info-enter .info-cont ul .enterpw_area .enter-guide').show();
				$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
				$("#password_err").hide();

				var id = $('#m_id').val();

				if ($(objPassWord).val() == ""){
					$("#lb_confirm_pwd").css("font-weight","normal");
					return;
				}

				if (resultType != "" && resultType !="21" && resultType !="31"){
					current.addClass('incorrect');
					//$("#cb_password").attr("disabled",true);
					$("#lb_confirm_pwd").css("font-weight","normal");
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').hide();
					$("#password_err").show();
					
					var message;
					switch (resultType) {
						case "00":
							message = "안전한 사용을 위해 " + passwordType + "자 이상 입력해주세요";
							break;
						case "01":
							message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
							break;
						case "02":
							message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
							break;
						case "03":
							message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
							break;
						case "04":
							message = "연속되는 문자와 숫자를 사용하실 수 없습니다.";
							break;
						case "05":
							message = "동일한 문자, 숫자를 반복해서 사용하실 수 없습니다.";
							break;
						case "11":
							message = "안전한 사용을 위해 숫자만 사용할 수 없습니다.";
							break;
						case "12":
							message = "안전한 사용을 위해 영문만 사용할 수 없습니다.";
							break;
						case "13":
							message = "안전한 사용을 위해 특수문자만 사용할 수 없습니다.";
							break;
					}
					$("#password_err").text(message);
				}else {
					current.addClass('usable');
					$("#lb_confirm_pwd").css("font-weight","bold");
					//$("#cb_password").attr("disabled",false);
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
					$('.info-enter .info-cont ul .enterpw_area .txt01').show();
					$("#password_err").hide();
					var message;
					switch (resultType) {
						case "21":
							message = "사용가능한 적정수준의 비밀번호입니다.";
							break;
						case "31":
							message = "매우 안전한 비밀번호 입니다.";
							break;						
					}
					$('.info-enter .info-cont ul .enterpw_area .txt01').text(message);
				} //if				
			}//validatePasswordType
			
			function FocusOut_PwdForm(obj) { //포커스가 패스워드 입력창을 벗어나면 실행
				if(!$(obj).hasClass("usable")){
					$(obj).addClass("passwordInfoImg");
				}else{
					$('.info-enter .info-cont ul .enterpw_area .enter-guide').hide();
				}									
			}//FocusOut_PwdForm
			
			function CheckPasswordConfirm() {
				var passwdObj = $("#m_pass");
				var passwdConfirmObj = $("#m_pass_confirm");
				var errDisplayObj = $('#password_confirm_err');
				
				passwdConfirmObj.removeClass("incorrect");
				passwdConfirmObj.removeClass("usable");

				if (!passwdConfirmObj.val() || passwdConfirmObj.val().length == 0) {
					errDisplayObj.text("비밀번호를 재입력해주세요.");
					errDisplayObj.show();
					
					passwdConfirmObj.addClass("incorrect");
				}
				else if (passwdObj.val() != passwdConfirmObj.val()) {
					errDisplayObj.text("비밀번호가 일치하지 않습니다.");
					errDisplayObj.show();

					passwdConfirmObj.addClass("incorrect");
					passwdConfirmObj.val("");
				} else {
					passwdConfirmObj.addClass("usable");
					$("#password_confirm_accord").show();
					errDisplayObj.hide();
				}
			}//CheckPasswordConfirm

			// 비밀번호 도움
			function OpenPasswordGuide(){
				window.open("/resources/passwordHelp.html","MsgWindow", "toolbar=no,location=0,titlebar=no,directories=0,status=no,menubar=0,scrollbars=yes,copyhistory=0");
			}

			//-------------------------------------------- 전화번호 처리 ---------------------------------------------------//
			function CheckNumberWithKeyupEvent(obj){ //전화번호 뒷자리 키 입력시 처리부분
// 				$("#btnPhoneConfirm").hide(); //보내기버튼
				$("#divPhoneConfirm").hide(); //입력 텍스트와 확인 버튼
				$("#lblPhoneConfirmResult").hide(); //"인증완료" 라벨 부분
				
				var keycode = event.keyCode;
				
 				//console.log("keycode:"+keycode);
				if( !((48 <= keycode && keycode <=57) || (96 <= keycode && keycode <=105 ) ||
							keycode == 13 || keycode == 46 || keycode == 8 || keycode == 32 || keycode == 9) ){
					//alert("숫자만 입력 가능합니다. 다시 입력해주세요");
					$(obj).val("");
				
				}else{ //전화번호 가운데와 끝이 4자리 이면 본인 인증 보이기
					
					var number_2 = $("#m_phonenumber2").val();
					var length_2 = number_2.length;
					
					var number_3 = $("#m_phonenumber3").val();
					var length_3 = number_3.length;
					
					if(length_2 == 4 && length_3 == 4){
						$("#btnPhoneConfirm").show();
					}
				}
			}
			
			//------------------------------------------------- 내가 추가 -------------------------------------//
			$(function(){
				
			// 모두 선택
				$("#chkAll").click(function(){
				var chkVal = $("#chkAll").prop("checked");
				console.log(chkVal);
				
				if(chkVal == true) {
					$("input[name=chk]").prop("checked" , true);
				} else if (chkVal == false) {
					$("input[name=chk]").prop("checked" , false);
				}
				
				});
				
				$("#btnCancle").click(function() { // 취소 버튼 클릭 시
					location.href = "/";
				});
			// 모두 선택
			
				/*
				전화는 문자를 보내고 확인 버튼을 누르면 결과값을 hidden에 넣어놓고
				메일은 인증 버튼을 누르면 입력된 메일로 인증 메일만 보내고
				인증확인은 가입 버튼을 눌렀을 때 비동기로 확인 한다
				*/
				$("#btnSubmit").click(function(){//회원가입 버튼 클릭시
					
					var m_name = $("#m_name").val();
					var m_pass = $("#m_pass").val();
					var m_phonenumber1 = $("#m_phonenumber1").val();
					var m_phonenumber2 = $("#m_phonenumber2").val();
					var m_phonenumber3 = $("#m_phonenumber3").val();
					
					var email1 = $("#email1").val();
					var email2 = $("#email2").val();
					
					//console.log("m_name:"+m_name+" ,m_pass:"+m_pass+" ,m_phonenumber1:"+m_phonenumber1+" ,m_phonenumber2:"+m_phonenumber2+" ,m_phonenumber3:"+m_phonenumber3+" ,email1:"+email1+" ,email2:"+email2);
					
					var email2Array = subStringEmail(email2);
					var checkid = $("#emailConfirmResult").attr("data-checkid"); 
					
					if(m_name=="" || m_pass=="" || m_phonenumber1=="" || m_phonenumber2==""|| m_phonenumber3=="" || email1=="" || email2=="") {
						alert("누락된 항목이 있습니다");
					}else if(checkid == null || checkid==""){
						$("#spanMailSend").text("메일 인증이 필요합니다");
						$("#spanMailSend").show();
					}else{
						//누락된 항목이 없으면
						//전화 인증 확인
						var phoneConfirmResult = $("#phoneConfirmResult").attr("result-phone");
						if(phoneConfirmResult != "success"){
							$("#btnPhoneConfirm").show();
							$("#divPhoneConfirm").hide();
							$("#lblPhoneConfirmResult").text("문자 인증이 필요합니다");
							$("#lblPhoneConfirmResult").show();
							return;
						}
						//메일 인증 확인 시작-----------------------------
						//email 도메인 쪼개기, natista@naver.com 비동기로 넘길 때 . 뒤를 못 넘긴다 그래서 짤라서 따로 넘긴다
						var email2Array = subStringEmail(email2);
						//이메일 인증 여부 비동기로 호출
						var url = "/join/emailStatusConfirm/"+email1+"/"+email2Array[0]+"/"+email2Array[1]+"/"+checkid;
						$.get(url,function(data){
							//console.log(data);
							if(data == "success"){
								//alert("success");
								$("#form").submit();
							}else{
								$("#spanMailSend").text("메일 인증이 필요합니다");
								$("#spanMailSend").show();
							}
						});//get
						//메일 인증 확인 끝-----------------------------
					}
				});//btnSubmit
		
				var smsCount;
				$("#btnPhoneConfirm").click(function(){ //휴대폰 문자로 본인 인증
					
					var m_phonenumber1 = $("#m_phonenumber1").val();
					var m_phonenumber2 = $("#m_phonenumber2").val();
					var m_phonenumber3 = $("#m_phonenumber3").val();
					
					var phoneNumber = m_phonenumber1 + m_phonenumber2 + m_phonenumber3;
					
					var url = "/join/phoneConfirm/"+phoneNumber;
					
					$.get(url, function(data){
						console.log("sms 인증 번호:"+data);
						$("#btnConfimNumber").attr("data-sms",data);
					})
					
					$("#lblPhoneConfirmResult").hide(); //"인증완료" 라벤 부분
					$("#txtPhoneConfirm").val(""); //문자 인증 숫자 입력 텍스트
					$("#divPhoneConfirm").show(); //문자 인증 숫자 텍스트와 확인, 시간 카운드 div
					$(this).text("다시 보내기");
					smsCount = setInterval(function() { //문자보내고 옆에 시간 카운트
						countNum()
					}, 1000);
				});//btnPhoneConfirm
				
				var minute = 5;
				var second = 60;
				var count = 0;
				function countNum(){ //문자입력시 옆에 카운트다운
					count++;
					if(count == 1){
						minute = 2;
						second=60;
					}else if(count == 60){
						minute = 1;
						second=60;
					}else if(count == 120){
						minute = 0;
						second=0;
						clearInterval(smsCount);
					}
					
					if(second>0 && second<10){
						$("#lblCount").text(minute + ":0" + second--);
					}else{
						$("#lblCount").text(minute + ":" + second--);
					}
					
				}//countNum
				
				$("#btnConfimNumber").click(function(){ //전화 문자보내고 나서 옆에 확인 버튼
					var smsUser = $("#txtPhoneConfirm").val(); //가입자가 입력한 번호
					var smsSend = $(this).attr("data-sms"); //컨트롤로에서 받아온 번호
					
					//console.log("smsUser:"+smsUser+" ,smsSend:"+smsSend);
					if(smsUser == smsSend){
						clearInterval(smsCount);	
						$("#btnPhoneConfirm").hide();
						$("#divPhoneConfirm").hide();
						
						$("#phoneConfirmResult").attr("result-phone","success");
						
						$("#lblPhoneConfirmResult").text("인증 완료");
						$("#lblPhoneConfirmResult").show();
					}else{
						alert("인증번호가 다릅니다");
					}
				});//btnConfimNumber
				
				$("#btnEmailConfirm").click(function(){ //메일 인증버튼으로 메일을 보낸다
					var email_name = $("#email1").val();
					var email2 = $("#email2").val();
					console.log("email_name:"+email_name+" ,email2:"+email2)
					
					if(email_name != "" && email2 != ""){
					//natista@naver.com 비동기로 넘길 때 . 뒤를 못 넘긴다 그래서 짤라서 따로 넘긴다
					var email2Array = subStringEmail(email2);
					//console.log("email2Array[0]"+email2Array[0]); //도메인 앞 부분
					//console.log("email2Array[1]"+email2Array[1]); //도메인 뒷 부분
					var url = "/join/emailConfirm/"+email_name+"/"+email2Array[0]+"/"+email2Array[1];
					
					$.get(url,function(data){
						//console.log("메일 checkid:"+data);
						$("#spanMailSend").text("메일을 확인하세요")
						$("#spanMailSend").show();
						//메일을 보내고 만든 checkid의 값을 data로 받아서 가입버튼을 눌렀을 때 비동기로 보내준다
						$("#emailConfirmResult").attr("data-checkid",data); 
					});
					}
				
				});//

				
				function subStringEmail(email2){ //메일 도메인 부분 짜르기
					var email2Array = new Array();
					
					var length = email2.length;
					var length_dot = email2.lastIndexOf(".");
					var email2_forward = email2.substring(0, length_dot);
					var email2_back = email2.substring(length_dot+1, length);
					//console.log("email2_forward:"+email2_forward+" ,email2_back:"+email2_back);
					
					email2Array.push(email2_forward);
					email2Array.push(email2_back);
					
					return email2Array;
				}
				
			});//function
		</script>

     <form name="form" method="get" action="/join/joinRun" id="form">
		<div id="wrap" class="kcc_wrap">
			<div class="joinTitle">회원가입</div>
			<div id="min_width">		
				<div id="body">					
					<div class="info-enter">
						<div class="inner">
            <!-- [D] 이미지 변경 726.2014-11-13 -->
            			<h3></h3>
						<div class="info-cont">
						
							<ul>
							<!-- 이름 -->
								<li class="entername_area">
									<label class="lblMemberinfo">이름*</label>
									<input name="m_name" type="text" id="m_name" class="enter-name placeholder" maxlength="12" value="이름"  title="이름" placeholder="이름" onfocus="if(this.value == &#39;이름&#39;) this.value = &#39;&#39;"/>
								</li> 
								
							<!-- 아이디 -->
								<li class="enterid_area">
									<label class="lblMemberinfo">아이디*</label>
									<input name="m_id" type="text" id="m_id" placeholder="아이디" maxlength="12" value="아이디" class="enter-id placeholder" onblur="FocusOut_IDForm(this)" onfocus="FocusIn_IDForm(this);" title="아이디" />
									<!-- 사용가능한 아이디인 경우 input에 class="usable" 추가, 아이디가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<!--p id="tickcount">tickcount =</p-->
									<p class="enter-guide">띄어쓰기 없이 영문과 숫자를 혼합하여 4~12자를 사용할 수 있습니다.</p>
									<p class="txt01" style="display:none">사용가능한 아이디입니다.</p><!-- 사용가능한 아이디인 경우 -->
									<p class="txt02" id="idBlankChk" style="display:none">아이디를 넣어주세요.</p><!-- 아이디가 조건에 맞지않는 경우 -->
								</li>
								
							<!-- 패스워드 -->	
								<li class="enterpw_area">	
									<label class="lblMemberinfo">비밀번호*</label>						
									<input name="m_pass" type="password" id="m_pass" class="passwordInfoImg" onfocus="FocusIn_PwdForm(this);"
									maxlength="15" onkeyup="validatePasswordType(this);" onblur="FocusOut_PwdForm(this)" title="비밀번호 입력" />													
									<!-- 비밀번호가 안전한 경우 input에 class="usable" 추가, 비밀번호가 조건에 맞지않는 경우 class="incorrect" 추가 -->
									<span class="pw-guide"><a href="#" onclick="OpenPasswordGuide();" title="새창으로 열림">비밀번호 도움말</a></span><!-- 2013-06-20 eun -->
									<p class="enter-guide" id="pwGide">안전한 사용을 위해 영문, 숫자, 특수문자 조합 6~15자를 사용해 주세요.</p>
									<p class="txt01" style="display:none">완벽한 비밀번호 입니다.</p><!-- 비밀번호가 안전한 경우 -->
									<p class="txt02" style="display:none" id="password_err">유추하기 쉬운 비밀번호 입니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
								</li>
								
							<!-- 패스워드 확인 -->	
								<li class="enterpw_area_conform">
									<label class="lblMemberinfo">비밀번호 확인*</label>																
									<input type="password" onblur="CheckPasswordConfirm();" maxlength="15" title="방금 입력한 비밀번호와 같은 비밀번호를 한번 더 입력해주세요" 
										   value="" class="enter-pw enter-repw" id="m_pass_confirm">
									<p style="display:none" class="txt02" id="password_confirm_err">비밀번호가 일치하지 않습니다.</p><!-- 비밀번호가 조건에 맞지않는 경우 -->
									<p style="display:none" class="txt01" id="password_confirm_accord">비밀번호가 일치합니다</p>																																				
								</li>
							
							<!-- 휴대폰 인증 -->	
								<li>
									<label class="lblMemberinfo">휴대전화</label>
									<span id="mobile_tel1_span">
									<select name="m_phonenumber1" id="m_phonenumber1" class="styleSelect" title="휴대폰 앞자리 선택" style="width:123px">
										<option value="휴대폰 번호 선택">휴대폰 번호 선택</option>
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="0130">013</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>									
									</select>
									</span>
									<input type="text" id="mobile_tel1_temp" style="width:123px; display:none" title="선택된 휴대폰 앞자리" />
									<span class="dash">-</span> 
									<input name="m_phonenumber2" type="text" id="m_phonenumber2" style="width:123px;" maxlength="4" title="휴대폰 중간자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" /> <span class="dash">-</span> 
									<input name="m_phonenumber3" type="text" id="m_phonenumber3" style="width:123px;" maxlength="4" title="휴대폰 뒷자리 입력" onkeyup="CheckNumberWithKeyupEvent(this);" />
									<label id="lblPhoneConfirmResult" style="display:none;font-color:red"></label>
									<button type="button" id="btnPhoneConfirm" style="font-size:14px;width:100px;">본인 인증</button>
								</li>
								
							<!-- 휴대전화 인증 입력-->
								<li>
									<span id="divPhoneConfirm" style="margin-left:40px;display:none"> 
										인증번호 : <input type="text" id="txtPhoneConfirm">
										<button type="button" id="btnConfimNumber" style="border:none;font-size:14px;width:43px">확인</button>
										<label id="lblCount"></label>
									</span>
								</li>
								
							<!-- 이메일 -->
								<li>
									<label class="lblMemberinfo">이메일</label>	
									<input name="email1" type="text" id="email1" placeholder="이메일" class="placeholder" style="width:120px;" title="이메일" />
									<span class="gol">@</span> 
									<select name="email2" id="email2"  class="styleSelect" style="width:130px;">
										<option value="">선택</option>
										<option value="naver.com">naver.com</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="daum.net">daum.net</option>
										<option value="nate.com">nate.com</option>
										<option value="gmail.com">gmail.com</option>
										<option value="direct_input">직접입력</option>
									</select>	
									<button type="button" style="width:90px" id="btnEmailConfirm">메일인증</button>	 
								</li>
								<li>
									<span id="spanMailSend" style="display:none">메일을 보냈습니다</span>
								</li>
							</ul>
							</div><!-- info-cont -->
						</div><!-- inner -->
					</div><!-- info-enter -->
				</div><!-- body -->			
			</div><!--min-width -->
		</div><!--wrap -->
<!-------------------------------------------------------------------------------------------------------->		
            <ul class="join_box">
                <li class="checkBox check01">
                    <ul class="clearfix">
                        <li>이용약관, 개인정보 수집 및 이용,
                            위치정보 이용약관(선택), 프로모션 안내
                            메일 수신(선택)에 모두 동의합니다.</li>
                        <li class="checkAllBtn">
                            <input type="checkbox" name="chkAll" id="chkAll" class="chkAll">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check02">
                    <textarea name="" id="">
	■ 수집하는 개인정보 항목
	
	회사는 회원가입, 상담, 서비스 신청 등등을 위해 아래와 같은 개인정보를 수집하고 있습니다.
	ο 수집항목 : 이름 , 생년월일 , 성별 , 로그인ID , 비밀번호 , 비밀번호 질문과 답변 , 자택 전화번호 , 자택 주소 , 휴대전화번호 ,
	이메일 , 직업 , 회사명 , 부서 , 직책 , 회사전화번호 , 취미 , 결혼여부 , 기념일 , 법정대리인정보 , 서비스 이용기록 , 접속 로그 
	
	ο 개인정보 수집방법 : 홈페이지(회원가입) , 서면양식
					
	■ 개인정보의 수집 및 이용목적
					
	회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다.
					
	ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공 , 구매 및 요금 결제 , 물품배송 또는 청구지 등 발송
	ο 회원 관리
	회원제 서비스 이용에 따른 본인확인 , 개인 식별 , 연령확인 , 만14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인 
	ο 마케팅 및 광고에 활용
	접속 빈도 파악 또는 회원의 서비스 이용에 대한 통계
                    
       				</textarea>
                    <ul class="clearfix">
                        <li>이용약관 동의(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk"> 
                        </li>
                    </ul>
                </li>
                <li class="checkBox check03">
 
                    <textarea name="" id="">
	제1조(목적)

이 약관은 바이슬림(이하 “회사”라 한다)이 운영하는 인터냇 쇼핑쇼핑몰(바이슬림)이하 “쇼핑쇼핑몰”이라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 쇼핑쇼핑몰과 이용자의 권리․의무 및 책임사항을 규정함을 목적으로 합니다.

 ※「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다.」

 

제2조(정의)

① “쇼핑몰”이란 바이슬림 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 쇼핑몰을 운영하는 사업자의 의미로도 사용합니다.

② “이용자”란 “쇼핑몰”에 접속하여 이 약관에 따라 “쇼핑몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.

③ ‘회원’이라 함은 “쇼핑몰”에 회원등록을 한 자로서, 계속적으로 “쇼핑몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.

④ ‘비회원’이라 함은 회원에 가입하지 않고 “쇼핑몰”이 제공하는 서비스를 이용하는 자를 말합니다.

⑤ ‘적립금’이라 함은 쇼핑몰이 회원과의 거래에 부수적으로 제공하는 것으로, 회원은 쇼핑몰과의 물품 등의 거래 시 적립금을 금전과 같이 사용할 수 있으며, 쇼핑몰이 이를 운영하는 제도를 “적립금제도”라고 말합니다.

⑥ ‘쿠폰’이라 함은 쇼핑몰이 회원과의 거래에 부수적으로 제공하는 것으로, 회원은 쇼핑몰과의 물품 등의 거래 시 쿠폰을 할인혜택으로 함께 사용할 수 있으며, 쇼핑몰이 이를 운영하는 제도를 “쿠폰제도”라고 말합니다.

⑦ ‘예치금’이라 함은 쇼핑몰이 회원과의 거래에서 주문취소 등의 결제대금 환불, 초과입금 차액 환불 등으로 발생한 금액을 현금대신 임시지급(적립)하여 현금과 동일하게 사용이 가능한 것을 말합니다.

⑧ '회원등급'이라 함은 쇼핑몰이 회원과의 거래에 부수적으로 제공하는 서비스로, 실 결제금액에 따라 추가 할인율을 부여하는 것을 말합니다.

 

제3조 (약관 등의 명시와 설명 및 개정)

① “쇼핑몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호․모사전송번호․전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 쇼핑몰의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.

② “쇼핑몰은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회․배송책임․환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.

③ “쇼핑몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.

④ “쇼핑몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 쇼핑몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "쇼핑몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.

⑤ “쇼핑몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “쇼핑몰”에 송신하여 “쇼핑몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.

⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.

 

제4조(서비스의 제공 및 변경)

① “쇼핑몰”은 다음과 같은 업무를 수행합니다.

1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결

2. 구매계약이 체결된 재화등의 배송

3. 기타 “쇼핑몰”이 정하는 업무

② “쇼핑몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.

③ “쇼핑몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 즉시 통지합니다.

④ 전항의 경우 “쇼핑몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “쇼핑몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.


제5조(서비스의 중단)

① “쇼핑몰”은 컴퓨터 등 정보통신설비의 보수점검․교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.

② “쇼핑몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “쇼핑몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.

③ 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “쇼핑몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “쇼핑몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “쇼핑몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “쇼핑몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.



제6조(회원가입)

① 이용자는 “쇼핑몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.

② “쇼핑몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.

1. 가입신청자가 이 약관 제7조제3항에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 다만 제7조제3항에 의한 회원자격 상실 후 3년이 경과한 자로서 “쇼핑몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.

2. 등록 내용에 허위, 기재누락, 오기가 있는 경우

3. 기타 회원으로 등록하는 것이 “쇼핑몰”의 기술상 현저히 지장이 있다고 판단되는 경우

③ 회원가입계약의 성립 시기는 “쇼핑몰”의 승낙이 회원에게 도달한 시점으로 합니다.

④ 회원은 회원가입 시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “쇼핑몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.

 

제7조(회원 탈퇴 및 자격 상실 등)

① 회원은 “쇼핑몰”에 언제든지 탈퇴를 요청할 수 있으며 “쇼핑몰”은 즉시 회원탈퇴를 처리합니다.

② 회원이 다음 각 호의 사유에 해당하는 경우, “쇼핑몰”은 회원자격을 제한 및 정지시킬 수 있습니다.

 1. 가입 신청 시에 허위 내용을 등록한 경우

 2. “쇼핑몰”을 이용하여 구입한 재화 등의 대금, 기타 “쇼핑몰”이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우

 3. 다른 사람의 “쇼핑몰” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래 질서를 위협하는 경우

 4. “쇼핑몰”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우

  - ‘쇼핑몰’에 대한 근거 없는 허위 사실을 유포하여 명예를 실추하는 경우

  - 하자가 없는 상품을 상습적 반품, 취소하는 경우

  - 상품평 또는 게시판에 불량글을 등록하는 경우

  - ‘쇼핑몰’직원에게 폭언, 협박, 성희롱 등으로 인해 업무를 방해하는 경우

  - 소비자원이 고시간 소비자분쟁해결기준을 초과하는 과도한 보상을 상습적으로 요구하는 경우

③ “쇼핑몰”이 회원 자격을 제한․정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정되지 아니하는 경우 “쇼핑몰”은 회원자격을 상실시킬 수 있습니다.

④ “쇼핑몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.



제8조(회원에 대한 통지)

① “쇼핑몰”이 회원에 대한 통지를 하는 경우, 회원이 “쇼핑몰”과 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.

② “쇼핑몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “쇼핑몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.

 

제9조(구매신청 및 개인정보 제공 동의 등)

① “쇼핑몰”이용자는 “쇼핑몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “쇼핑몰”은 이용자가 구매신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.

 1. 재화 등의 검색 및 선택

 2. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력

 3. 약관내용, 청약철회권이 제한되는 서비스, 배송료․설치비 등의 비용부담과 관련한 내용에 대한 확인

 4. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시 (예, 마우스 클릭)

 5. 재화등의 구매신청 및 이에 관한 확인 또는 “쇼핑몰”의 확인에 대한 동의

 6. 결제방법의 선택

② “쇼핑몰”이 제3자에게 구매자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)

③ “쇼핑몰”이 제3자에게 구매자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.

  

제10조 (계약의 성립)

① “쇼핑몰”은 제9조와 같은 구매신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.

 1. 신청 내용에 허위, 기재누락, 오기가 있는 경우

 2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우

 3. 기타 구매신청에 승낙하는 것이 “쇼핑몰” 기술상 현저히 지장이 있다고 판단하는 경우

② “쇼핑몰”의 승낙이 제12조제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.

③ “쇼핑몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.                    
                    
       				</textarea>
                    <ul class="clearfix">
                        <li>개인정보 수집 및 이용에 대한 안내(필수)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
                </li>
                <li class="checkBox check03">
 
                    <textarea name="" id="">	여러분을 환영합니다.
                    
	① 네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다.
	
 	② 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는
 	
	    네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 
	    
	    유익한 정보를 포함하고 있습니다.
       </textarea>
                    <ul class="clearfix">
                        <li>위치정보 이용약관 동의(선택)</li>
                        <li class="checkBtn">
                            <input type="checkbox" name="chk">
                        </li>
                    </ul>
                </li>
               
            </ul>

<!-------------------------------------------------------------------------------------------------------->		
		
		<div class="btnjoin">
		
				<button type="button" id="btnSubmit" class="btn btn-outline-primary btn-lg" style="width:125px;margin-right:50px">가입</button>
				<button type="button" id="btnCancle" class="btn btn-outline-danger btn-lg" style="width:125px;margin-right:130px">취소</button>
				<input type="hidden" id="phoneConfirmResult">
				<input type="hidden" id="emailConfirmResult">
		</div>	
		
	</form> 
	
	
<%@ include file="include/footer.jsp"%>