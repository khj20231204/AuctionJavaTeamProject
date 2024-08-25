<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<%@ include file="/resources/css/auction_css.css" %>
<script type="text/javascript" src="/resources/js/auctionJS.js" charset="UTF-8"></script>

<style>
div.uxb-keypoint{margin:14px 0 0 11px;}
div.uxb-keypoint ul{margin-top:5px;}
div.uxb-keypoint ul li{margin-bottom:4px;padding-left:6px;color:#999;font-size:11px;letter-spacing:-1px;background:url(//pics.auction.co.kr/common/bl_84.gif) no-repeat left 4px;}
div.datanamedf{width:976px;border:2px solid #c1c1c1;}
div.datanamedf p{text-align:center;padding:8px 0;color:#222;font-size:11px;letter-spacing:-1px;}
.mtxs{margin-top:10px;}
div.bsellerinfo{width:100%;padding:10px 0 6px;border-top:2px solid #F6F6F6;display:table;}
/* 2013-03-20 eun */
div.bsellerinfo table{margin-left:3px;}
*html div.bsellerinfo table{display:inline;}
div.bsellerinfo table th,
div.bsellerinfo table td{font-size:11px;color:#666;line-height:1.35em;padding:3px 0;}
div.bsellerinfo table th{text-align:left;letter-spacing:-0.1em;padding-left:6px;background:url('//pics.auction.co.kr/css/frame/img/icn_dot08.gif') no-repeat 0 7px;}
div.bsellerinfo table td{padding-left:8px;background:url('//pics.auction.co.kr/css/frame/img/bg_colon01.gif') no-repeat 0 6px;}
div.bsellerinfo table td.best-seller{padding:0;background:url('//pics.auction.co.kr/css/frame/img/bg_vipbselrinfovdl.gif') no-repeat;}
div.bsellerinfo div{width:170px;text-align:center;}
div.bsellerinfo div img{margin:0 2px 0 3px;}
div.bsellerinfo div strong{display:block;margin:4px 0;letter-spacing:-1px;}
div.bsellerinfo div.before-odrer{border:2px solid #c1c1c1;padding:8px 0;width:976px;font-family:Dotum, '돋움';letter-spacing:-1px;color:#222;}
div.ckescrow{width:100%;margin-bottom:10px;background:url('//pics.auction.co.kr/css/frame/img/bg_roundbox_line.gif') repeat-y;}
/* //2013-03-20 eun */
div.ckescrow div.rdt{background:url('//pics.auction.co.kr/css/frame/img/bg_roundbox_bgt.gif') no-repeat;}
div.ckescrow div.rdb{font-size:11px;color:#666;line-height:1.35em;padding:8px 0 7px 14px;letter-spacing:-0.1em;background:url(//pics.auction.co.kr/css/frame/img/bg_roundbox_bgb.gif) no-repeat 0 100%;}
div.ckescrow span{letter-spacing:0;}
div.ckescrow img {vertical-align:-4px;margin-left:7px;}
div.ckescrow p{margin-top:4px;}
h4.btmh{padding:0 0 8px 14px;border-bottom:1px solid #E1E1E1;}
.mtl{margin-top:25px;}
ul.cautionlist{padding:9px 0 6px 8px;border-top:2px solid #F6F6F6;}
ul.cautionlist li.c1,
ul.cautionlist li.c2,
ul.cautionlist li.c3{font-size:11px;color:#666;line-height:1.35em;padding:0 5px 4px 6px;background:url(//pics.auction.co.kr/css/frame/img/icn_dot09.gif) no-repeat 0 5px;}
ul.cautionlist li.c4{color:#222;padding:0 0 0 6px;background:url(//pics.auction.co.kr/css/frame/img/icn_dot09.gif) no-repeat 0 5px;}
ul.cautionlist li a{color:#666;text-decoration:underline;padding-left:15px;background:url(//pics.auction.co.kr/css/frame/img/icn_caution.gif) no-repeat;}
ul.cautionlist li.c4,
ul.cautionlist li a{letter-spacing:-0.1em;}
ul.cautionlist li.c3{font-size:11px;color:#666;line-height:1.35em;padding:0 5px 4px 6px;background:url(//pics.auction.co.kr/css/frame/img/icn_dot09.gif) no-repeat 0 5px;}
</style>
<script>

var countDown=[];

$(function(){
	
	$(document).ready(function() { 
		$(".divCountDown").each(function(index){
			/* ---상품 유저와 로그인 유저가 같으면 입찰과 장바구니 버튼을 감춘다 --*/
			var urlUserCheck = "/auction/userCheck";
			var seller = $("#seller").val();
			var data = {
					"seller" : seller
			}
			
			$.get(urlUserCheck, data, function(e){
				console.log("e:"+e);
				if(e == "same"){
					$(".collaspsePrice").hide();
				}
			});
			/* --------------- 끝 ------------------------ */
			
			//마감 날짜와 시간을 가져온다
			var e_year = $(this).next().val();
			var e_month = $(this).next().next().val();
			var e_day = $(this).next().next().next().val();
			var e_hour = $(this).next().next().next().next().val();
			var e_minute = $(this).next().next().next().next().next().val();
			var e_second = $(this).next().next().next().next().next().next().val();
			//var e_second = parseInt((Math.random() * 59)+1);
			//console.log("e_year:"+e_year+" ,e_month:"+e_month+" ,e_day:"+e_day+" ,e_hour:"+e_hour+" e_minute:"+e_minute);
			//console.log("second:"+second);
			
			//현재 날짜를 얻어온다
			var today = new Date();
			var nowYear = today.getFullYear(); // 년도 	
			var nowMonth = today.getMonth() + 1;  // 월
			var nowDate = today.getDate();  // 날짜
			//var nowDay = today.getDay();  // 요일
			var nowHour = today.getHours(); // 시
			var nowMinute = today.getMinutes();  // 분
			var nowSecond = today.getSeconds();  // 초
			
			var resultYear, resultMonth, resultDdate, resultHhour, resultMinute, resultSecond;
			
			//마감 날짜와 현재 날짜를 계산한다
			resultYear = e_year - nowYear;
			resultMonth = e_month - nowMonth;
			resultDate = e_day - nowDate;
			resultHour = e_hour - nowHour;
			resultMinute = e_minute - nowMinute;
			resultSecond = e_second - nowSecond;

			var addMonth = 12;
			var addDate = new Date(nowYear, nowMonth-1, 0).getDate();
			var addHour = 24;
			var addMinute = 60;
			var addSecond = 60;

			console.log("마이너스 계산 전 resultYear:"+resultYear+" ,resultMonth:"+resultMonth+" ,resultDate:"+resultDate+" ,resultHour:"+resultHour+" ,resultMinute:"+resultMinute+" resultSecond:"+resultSecond);
			
			//-----------초 시작---------------------------------------------------------------------------------------//
			if(resultSecond<0){//잡을 땐 < 일 때마다
				if(resultMinute<=0){//값을 가져올 땐 <= 일 때마다
					if(resultHour<=0){
						if(resultDate<=0){
							if(resultMonth<=0){
								if(resultYear<=0){
									resultYear = 0;
									resultMonth = 0;
									resultDate = 0;
									resultHour = 0;
									resultMinute = 0;
									resultSecond = 0;
								}else{//resultYear >= 0
									resultYear--;
									resultMonth += addMonth;
									resultDate += addDate;
									resultHour += addHour;
									resultMinute += addMinute;
									resultSecond += addSecond;
								}
							}else{//resultMonth >= 0
								resultMonth--;
								resultDate += addDate;
								resultHour += addHour;
								resultMinute += addMinute;
								resultSecond += addSecond;
							}
						}else{//resultDate >= 0
							resultDate--;
							resultHour += addHour;
							console.log("resultHour:"+resultHour);
							resultMinute += addMinute;
							resultSecond += addSecond;
						}
					}else{//resultHour >= 0
						resultHour--;
						resultMinute += addMinute;
						resultSecond += addSecond;
					}
				}else{
					resultMinute--;
					resultSecond += addSecond;
				}
			}
			//-----------초 끝---------------------------------------------------------------------------------------//
			//-----------분 시작---------------------------------------------------------------------------------------//
			if(resultMinute<0){
				if(resultHour<=0){
					if(resultDate<=0){
						if(resultMonth<=0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								resultDate += addDate;
								resultHour += addHour;
								resultMinute += addMinute;
								//resultSecond += 60;
							}
						}else{//resultMonth >= 0
							resultMonth--;
							resultDate += addDate;
							resultHour += addHour;
							resultMinute += addMinute;
							//resultSecond += 60;
						}
					}else{//resultDate >= 0
						resultDate--;
						resultHour += addHour;
						console.log("resultHour:"+resultHour);
						resultMinute += addMinute;
						//resultSecond += 60;
					}
				}else{//resultHour >= 0
					resultHour--;
					resultMinute += addMinute;
					//resultSecond += 60;
				}
			}
			//-----------분 끝---------------------------------------------------------------------------------------//
			//-----------시간 시작---------------------------------------------------------------------------------------//
				if(resultHour<0){
					if(resultDate<=0){
						if(resultMonth<=0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								resultDate += addDate;
								resultHour += addHour;
								//resultMinute += 59;
								//resultSecond += 60;
							}
						}else{//resultMonth >= 0
							resultMonth--;
							resultDate += addDate;
							resultHour += addHour;
							//resultMinute += 59;
							//resultSecond += 60;
						}
					}else{//resultDate >= 0
						resultDate--;
						resultHour += addHour;
						console.log("resultHour:"+resultHour);
						//resultMinute += 59;
						//resultSecond += 60;
					}
				}
			//-----------시간 끝---------------------------------------------------------------------------------------//
			//-----------일 시작---------------------------------------------------------------------------------------//
					if(resultDate<0){
						if(resultMonth<=0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								resultDate += addDate;
								//resultHour += 59;
								//resultMinute += 59;
								//resultSecond += 60;
							}
						}else{//resultMonth >= 0
							resultMonth--;
							resultDate += addDate;
							//resultHour += 59;
							//resultMinute += 59;
							//resultSecond += 60;
						}
					}
			//-----------일 끝---------------------------------------------------------------------------------------//
			//-----------월 시작---------------------------------------------------------------------------------------//
						if(resultMonth<0){
							if(resultYear<=0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}else{//resultYear >= 0
								resultYear--;
								resultMonth += addMonth;
								//resultDate += lastDate;
								//resultHour += 59;
								//resultMinute += 59;
								//resultSecond += 60;
							}
						}
			//-----------월 끝---------------------------------------------------------------------------------------//
			//-----------년 끝---------------------------------------------------------------------------------------//
							if(resultYear<0){
								resultYear = 0;
								resultMonth = 0;
								resultDate = 0;
								resultHour = 0;
								resultMinute = 0;
								resultSecond = 0;
							}
			//-----------년 끝---------------------------------------------------------------------------------------//
			console.log("마이너스 계산 후 resultYear:"+resultYear+" ,resultMonth:"+resultMonth+" ,resultDate:"+resultDate+" ,resultHour:"+resultHour+" ,resultMinute:"+resultMinute+" resultSecond:"+resultSecond);
			
			//마감 날짜와 현재 시간을 뺀 값을 this값에 넣는다 
			$(this).text(resultHour+":"+resultMinute+":"+resultSecond);
			$(this).next().val(resultYear);
			$(this).next().next().val(resultMonth);
			$(this).next().next().next().val(resultDate);
			
			//전부0이면 바로 입찰 종료를 보여준다
			if(resultHour==0 && resultMinute==0 && resultSecond==0){
				//$("#stopTimer").trigger("click");
				//alert("전부 00");
				//$(".collaspsePrice").hide();
				$(".collaspsePrice").hide();
				$(".divBidEnd").show();
				stopCountIndex(index);
			}
			
			//입력된 텀 시간을 불러와서 카운드 다운한다
			var that = $(this);
			var deadline = $(this).next().next().next().next().next().next().next().val();
			//alert("deadline:"+deadline);
			if(deadline == 'N'){
				//alert("deadline 안쪽");
				countDown[index] = setInterval(function(){
					
					var year = that.next().val();
					var month = that.next().next().val();
					var date = that.next().next().next().val();
					
					var indexCatch = index;//임버터를 멈추게 하기 위해서 index를 따로 저장
					var timeValue = that.text().trim();
					var timeArray = timeValue.split(":");
					//console.log("time:"+time);
	 				var hour = parseInt(timeArray[0]);
	 				var minute = parseInt(timeArray[1]);
	 				var second = parseInt(timeArray[2]);
	
					if(second<=0){
						if(minute>0){
							minute--;
							second += addSecond;
							console.log("minute에서 뺀다-------------date:"+date+" ,hour:"+hour+" ,minute:"+minute+" ,second:"+second);
						}else{
							if(hour>0){
								hour--;
								minute += (addMinute-1);//second에 1을 넘겨줘야하기 때문에 -1 해준다(60이 아니라 59이다)
								second += addSecond;
							}else{
								if(date>0){
									date--;
									that.next().next().next().val(date);
									hour += (addHour-1);
									minute += (addMinute-1);
									second += addSecond;
									console.log("date에서 뺀다------------------------date:"+date+" ,hour:"+hour+" ,minute:"+minute+" ,second:"+second);
								}else{
									if(month>0){
										month--;
										that.next().next().val(month);
										date += (addDate-1);
										that.next().next().next().val(date);
										hour += (addHour-1);
										minute += (addMinute-1);
										second += addSecond;
									}else{
										if(year>0){
											year--;
											that.next().val(year);
											month += (addMonth-1);
											that.next().next().val(month);
											date += (addDate-1);
											that.next().next().next().val(date);
											hour += (addHour-1);
											minute += (addMinute-1);
											second += addSecond;
										}else{
											year = 0;
											month = 0;
											date = 0;
											hour = 0;
											minute = 0;
											second = 0;
										}
									}
								}
							}
						}
					}else{
						second--;
					}
					
					console.log("index:"+index+" ,hour:"+hour+" ,minute:"+minute+" ,second:"+second);
	
					//goBid인 입찰버튼을 눌렀을 때 쿠키에 남은 시간을 저장한 걸 가지고온다-------------------쿠키에서 값 가져오기------------------------------ 
					var p_no = $("#p_no").val();
					
					var twoDigitHour = makeTwoDigit(hour);
					var twoDigitMinute = makeTwoDigit(minute);
					var twoDigitSecond = makeTwoDigit(second);
					
					that.text(twoDigitHour+":"+twoDigitMinute+":"+twoDigitSecond);
					
					if(twoDigitHour==0 && twoDigitMinute==0 && twoDigitSecond==0 && date==0 && month==0 && year==0){
					//-------------------------------- 종료되면 입찰 진행-------------------------------//
						//$("#stopTimer").trigger("click");
						//alert("전부 00");
						$(".collaspsePrice").hide();
						$(".divBidEnd").show();
						stopCountIndex(indexCatch);
						
						var width = $(window).width();
						var height = $(window).height();
						
						//화면을 가리는 레이어의 사이즈 조정
						$(".screenBlock").width(width);
						$(".screenBlock").height(height);
						
						//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도)
						$(".screenBlock").fadeTo(500, 0.3);
						
						//팝업 레이어 보이게
						var loadingDivObj = $("#screenDiv");
					    loadingDivObj.css({
					    	'position': 'fixed',
					    	'left': '50%',
					    	'top': '50%'
					    	});
					    loadingDivObj.css({
					    	'margin-left': -loadingDivObj.outerWidth() / 2 + 'px',
					    	'margin-top': -loadingDivObj.outerHeight() / 2 + 'px'
					    	}); 
					    loadingDivObj.fadeIn(500);
					    
					   
						setTimeout(function(){
							var p_no = $("#p_no").val();
							location.href="/auction/timeOverAutoCommit?p_no="+p_no;
						},5000)
					//-------------------------------- 종료되면 입찰 진행-------------------------------//			
					}
				},1000);
			}else{
				that.text("00:00:00");
			}
		});	
		
	});//document.ready
	
	$("#stopTimer").click(function(){
		var len = $(".divCountDown").length;
		console.log("len:"+len);
		for(var i=0 ; i<len ; i++){
			clearInterval(countDown[i]);			
		}
	});//stopTimer
	
	
	/*입찰하기 버튼을 눌렀을 때
	1. 로그인이 안 되어있다
	1-1. 제품 유저인 경우 - collaspsePrice 안보이 게 한다
	1-2. 제품 유저가 아닌 경우 - 입찰하기와 좋아하기 가능
	2. 로그인이 되어있다
	2-1. 제품 유저인 경우 - collaspsePrice 안보이 게 한다
	2-2. 제품 유저가 아닌 경우 - 입찰하기와 좋아하기 가능
	*/
	
	$("#btnBid").click(function(e){//입찰 버튼을 눌렀을 때
		//alert("df");
		var that = $(this);
	
		var urlLoginCheck = "/auction/logInCheck";
		$.get(urlLoginCheck, function(data){
			console.log(data);
			if(data == "LogOut"){//로그인 되어있지 않으면
				console.log("logout");
				$("#modaLoginAuction").trigger("click");//로그인 페이지로 모달 창
			}else{
				console.log("login");
				
				//상품 유저와 로그인 유저가 같으면 입찰과 장바구니 버튼을 감춘다
				var urlUserCheck = "/auction/userCheck";
				var seller = $("#seller").val();
				var data = {
						"seller" : seller
				}
				
				$.get(urlUserCheck, data, function(e){//로그인 상태면 로그인 유저와 상품 유저를 비교
					//console.log("e:"+e);
					if(e == "same"){
						$(".collaspsePrice").hide();//같으면 토글이 안되고
					}else{//다르면 토글이 가능하게 한다
						//$("#insertBidForm").submit();
						that.attr("href","#bidCollapse");
						that.attr("id","not");
					}
				});
			}
		});
	});//btnBid
		
	$("#btnLogin").click(function(){//모달에서 로그인 버튼
		var m_id = $("#txtId").val();
		var m_pass = $("#txtPw").val();
		
		//alert("id:"+m_id+" ,pw:"+m_pass);
		var url = "/auction/logIn";
		var data = {
				"m_id" : m_id,
				"m_pass" : m_pass
		};
		
		$.get(url, data, function(e){
			console.log(e);
			if(e == "loginFali"){
				alert("로그인 실패");
			}else{
				//헤더부분 로그아웃 변경하기	
				alert("로그인 성공");
				$("#btnClose").trigger("click");
				
				//상품 유저와 로그인 유저가 같으면 입찰과 장바구니 버튼을 감춘다
				var urlUserCheck = "/auction/userCheck";
				var seller = $("#seller").val();
				var data = {
						"seller" : seller
				}
				
				$.get(urlUserCheck, data, function(e){
					console.log("e:"+e);
					if(e == "same"){
						$(".collaspsePrice").hide();
					}
				});
			}
		});
	});
	
	$("#goBid").click(function(){

		var bidPrice = $("#txtBidPrice").val().trim();
		var maxPrice = "${maxPrice}";
		console.log("bidPrice:"+bidPrice+" ,maxPrice:"+maxPrice);
		
		if(maxPrice >= bidPrice){		
			alert("가격은 "+maxPrice+" 이상");
		}else{
			$("#bidPrice").val(bidPrice);
			
			//2분 이내이면 더하기 2분을 한다
			var timeValue = $(".divCountDown").text();
			//var time = timeMakeArray(timeValue);//시간 차이를 배열로 자른 후 분을 가지고 온다
			var timeArray = timeValue.split(":");
			$("#remindMinute").val(timeArray[1]);
			
			/*redirect로 입찰controller에서 넘기기 때문에 쿠키에 연장 값을 가지고 있다고해도
			최초 db expiration테이블에서 서버값을 가져오기 때문에 쿠키를 쓰려면
			계속 값을 저장해야 한다
			if(time[1] <= 5){//분이 2보다 작으면 실행
				var value = (time[1]+5)+":add";
				var p_no = $("#p_no").val();
				console.log("goBid time[1]:"+time[1]+" ,value:"+value+" ,p_no:"+p_no);
				$.cookie(p_no, value);//add를 추가해서 리다이렉트시 null값을 넣고 한번만 읽게한다				
			}*/
			
			$("#insertBidForm").submit();
		}
	});//goBid
	
	//관심 상품 클릭시 로그인과 모달창 띄우기
	$("#btnFavorite").click(function(){
		
		var url = "/auction/CheckMidOfFavorite";
		
		$.get(url, function(data){//data가 m_id가 된다
			
			if(data == "fail"){
				$("#modaLoginAuction").trigger("click");//로그인 페이지로 모달 창
				return;
			}
		
			url = "/auction/auctionFavorite";
			var p_no = $("#p_no").val();
			
			var sendData = {
					"m_id" : data,
					"p_no" : p_no
			};
			
			$.get(url, sendData, function(result){
				if(result == "fail"){
					alert("이미 관심 상품에 있습니다");
				}else{
					$("#modalFavorite").trigger("click");
					//alert("관심 상품 넣기");
				}
			});
		});
		
		//관심상품 등록만 하기
		$("#modalFavoriteSave").click(function(){
			
			var url="/auction/auctionFavoriteSave";
			var p_no = $("#p_no").val();
			
			var sendData = {
					"p_no" : p_no
			};		
			
			$.get(url, sendData, function(data){
				if(data == "success"){
					$("#modalClose").trigger("click");
				}
			});	
		});
		
		//관심상품 등록 후 이동
		$("#modalFavoriteSaveMove").click(function(){
			var url="/auction/auctionFavoriteSave";
			var p_no = $("#p_no").val();
			
			var sendData = {
					"p_no" : p_no
			};		
			
			$.get(url, sendData, function(data){
				if(data == "success"){
					location.href="/cart/cartPage";
				}
			});	
		});
		
		
		/* ---------------------------------- 
		var width = $(window).width();
		var height = $(window).height();
		
		//화면을 가리는 레이어의 사이즈 조정
		$(".screenBlock").width(width);
		$(".screenBlock").height(height);
		
		//화면을 가리는 레이어를 보여준다 (0.5초동안 30%의 농도의 투명도)
		$(".screenBlock").fadeTo(500, 0.3);
		
		//팝업 레이어 보이게
		var loadingDivObj = $("#screenDiv");
	       loadingDivObj.css("top", ($(document).height()/2)-75);
	       loadingDivObj.css("left",($(document).width()/2)-150);
	       loadingDivObj.fadeIn(500);
		 ---------------------------------- */
	});
	
	 //esc키 누르면 화면 잠김 해제
	  $(document).keydown(function(event){
		if(event.which=='27'){
			$("#screenDiv").fadeOut(300);
			$(".screenBlock").fadeOut(1000);
		}
	  });
	 
	 //윈도우가 resize될때마다 screenBlock를 조정
	 $(window).resize(function(){
		var width = $(window).width();
		var height = $(window).height();
		$(".screenBlock").width(width).height(height);
	});
});//function

/*
function makeTwoDigit(num){
	var len = num.toString().length;
	console.log("makeTwoDigit len:"+len);
	if(len < 2){
		num = "0"+num;
	}
	return num;
}*/

function stopCountIndex(indexCatch){
	clearInterval(countDown[indexCatch]);
}
</script>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8"><%@ include file="auctionHeader.jsp"%></div>
		<div class="col-md-2"></div>
	</div>
	
	<div class="row">
		<div class="col-md-2">
<!-- 		<button type="button" id="stopTimer">타이머종료</button>	 -->
		</div>
		<div class="col-md-8">
			<table class="table">
				<tbody>
					<!-- 이미지랑 세부내용 tr 시작 -->
					<tr>
						<td>
							<!-- 이미지랑 세부내용 안에 새로운 테이블 시작 -->
								<div class="col-md-12">
									<table class="table" border="1">
										<tbody>
											<tr>
												<td rowspan=5 style="width: 326px;height: 326px;"><img src="/furniture/displayImage?imageName=${selectedItem.main_img_name}" class="img-class" style="height: 300px; width: 300px;"></td>
												<td colspan=2 style="text-align:center;vertical-align:middle">${selectedItem.p_title}</td>
											</tr>
											<tr class="table-active">
												<td style="vertical-align:middle"><small style="padding-right: 10px;">현재가</small>${selectedItem.present_price}<small>원</small></td>
												<td style="vertical-align:middle"><small style="padding-right: 10px;">즉구가</small>${selectedItem.instant_price}<small>원</small></td>
											</tr>
											<tr class="table-success">
												<td style="vertical-align:middle"><small style="padding-right: 10px;">입찰수</small>${bidCount}<small>명</small></td>
												<td style="vertical-align:middle"><small style="padding-right: 10px;">입찰가격</small><b>${maxPrice}<small>원</small></b></td>
											</tr>
											<tr class="table-warning">
												<td style="vertical-align:middle"><small style="padding-right: 10px;">남은시간</small></td>
												<td style="vertical-align:middle">
													<div class="divCountDown" style="color:red"></div>
													<input type="hidden" class="resultYear" value="${selectedItem.e_year}">
													<input type="hidden" class="resultMonth" value="${selectedItem.e_month}">
													<input type="hidden" class="resultDate" value="${selectedItem.e_day}">
													<input type="hidden" class="countDown_hour" value="${selectedItem.e_hour}">
													<input type="hidden" class="countDown_minute" value="${selectedItem.e_minute}">
													<input type="hidden" class="countDown_second" value="${selectedItem.e_second}">
													<input type="hidden" class="deadline" value="${selectedItem.deadline}">
												</td>
											</tr>
											<tr class="table-danger">
												<td style="vertical-align:middle"><small style="padding-right: 10px;">종료일</small></td>
												<td style="vertical-align:middle">${selectedItem.e_day}<small>일 </small><fmt:formatNumber value="${selectedItem.e_hour}" pattern="00"/>:<fmt:formatNumber value="${selectedItem.e_minute}" pattern="00"/></td>
											</tr>
										</tbody>
									</table>
								</div>
							<!-- 이미지랑 세부내용 안에 새로운 테이블 끝 -->
						</td>
					</tr>
					<!-- 이미지랑 세부내용 tr 끝 -->

					<!-- 버튼 tr 시작 -->
					<tr class="table-active">
						<td>
							<div class="divBidEnd" style="display:none">
								<h1>입찰 기간이 종료 되었습니다</h1>
							</div>
				<!-------------------------------------- 입찰하기 collapse group 시작 -------------------------------------------->
								<div class="col-md-12 divBidCollapse" style="padding-left: 0px;padding-right: 0px;">
										<div id="card-385137">
											<div class="card collaspsePrice">
												<button type="button" class="btn btn-sm btn-outline-danger" id="btnFavorite">관심상품</button>
												
												<div class="card-header">
													 <a class="card-link" data-toggle="collapse" data-parent="#card-385137" id="btnBid" href="#">입찰하기</a>
												</div>
												<div id="bidCollapse" class="collapse hide">
													<div class="card-body">
													가격은  ${maxPrice} 이상 : <input type="text" id="txtBidPrice">
														<button type="button" id="goBid">입찰</button>
													</div>
												</div>
											</div>
											<div class="card">
												<div class="card-header">
													 <a class="card-link" data-toggle="collapse" data-parent="#card-385137" href="#bidListCollapse">입찰현황</a>
												</div>
												<div id="bidListCollapse" class="collapse hide">
													<div class="card-body">
													<!-- ---------------------------- 입찰 현황 테이블 시작-------------------------------- -->
												<div class="row">
													<div class="col-md-12">
														<table class="table">
															<thead>
																<tr>
																	<th>구매자</th>
																	<th>판매자</th>
																	<th>입찰 가격</th>
																	<th>입찰일</th>
																</tr>
															</thead>
															<tbody>
															<c:forEach var="bidList" items="${tempBidList}">
																<tr>
																	<td>${bidList.temp_purchaser_id}</td>
																	<td>${bidList.temp_seller_id}</td>
																	<td>${bidList.temp_bid_price}</td>
																	<td><fmt:formatDate value="${bidList.temp_bid_date}" pattern="YYYY-MM-dd HH:mm:ss"/> </td>
																</tr>
															</c:forEach>
															</tbody>
														</table>
													</div>
												</div>
												<!-- ---------------------------- 입찰 현황 테이블 끝-------------------------------- -->
													</div>
												</div>
											</div>
										</div>
									</div>
				<!-------------------------------------- 입찰하기 collapse group 끝 -------------------------------------------->
						</td>
					</tr>
					<!-- 버튼 tr 끝 -->

					<!-- 세부 이미지랑 설명 tr 시작 -->
					<tr>
						<td style="text-align:center">
							<c:forEach var="image" items="${selectedImg}">
								<div>
								<img src="/furniture/displayImage?imageName=${image.img_name}" class="img-class" style="height: 200px; width: 200px;">
								</div>
								<br>
							</c:forEach>
							${selectedItem.p_content}
						</td>
					</tr>
					<!-- 세부 이미지랑 설명 tr 끝 -->
				</tbody>
			</table>
			
			<hr>			
			
			<!-- 옥션 글 시작 -->
			<div style="margin-left: 80px;">
			<div class="uxb-keypoint">
				<p><img src="http://pics.auction.co.kr/itempage/txt_keypoint.gif" alt="알아두세요"></p>
				<ul>
					<li class="first">중고동네의 결제시스템을 이용하지 않고 <strong>판매자의 계좌로 상품대금을 송금</strong>하는 등의 
						방법으로 <strong>직거래</strong>를 하는경우, 상품을 받지못하는 등의<br><strong>피해가 발생</strong>할 수 
						있습니다. 직거래로 인한 피해 발생시, <strong>중고동네는 일체의 책임을 지지않습니다.</strong></li>
				</ul>
			</div>
			<div class="datanamedf mtxs" style="width:812Px;">
			<p  style="width: 803px;">중고동네에 등록된 판매상품과 상품의 내용은 중고동네가 아닌 개별 판매자가 등록한 것으로서, 중고동네는 중개시스템만 제공하며 그 등록내용에 대하여 일체의 책임을 지지 않습니다.</p>
			</div>			
			<div class="bsellerinfo">
				<table>
					<colgroup>
						<col style="width:11%"><col style="width:17%"><col style="width:14%"><col style="width:17%"><col style="width:14%"><col style="width:27%">
					</colgroup>
					<tr>
						<td>해당 판매자는 개인 판매자이므로 결제 이후 마이중고동네에서 판매자 정보 확인이 가능합니다.</td>
					</tr>
				</table>
			</div>
			<div class="ckescrow"><div class="rdt"><div class="rdb">
				<strong>중고동네 에스크로 결제대금 예치업등록</strong><span>: 02-006-00008</span>
				<img src="http://pics.auction.co.kr/itempage/btn_ckescrow.gif" alt="서비스 가입사실 확인">
				<p>중고동네는 전자금융거래법에 따라 금융위원회에 결제대금 예치업을 등록하였으며, 중고동네에 등록한 모든 입점판매자는 자동적으로 동 서비스에 가입하였습니다.</p>
			</div></div></div>
			<!-- 판매자 정보 //-->
			<h4 class="btmh mtl"><img src="http://pics.auction.co.kr/itempage/tit_cautionlist.gif" alt="주의사항"></h4>
			<ul class="cautionlist">
				<li class="c3"><strong>전자상거래 등에서의 소비자보호에 관한 법률</strong>에 의거하여 미성년자가 체결한 계약은 법정대리인이 동의하지 않은 경우 본인 또는 법정대리인이 취소할 수 있습니다.</li>
				<li class="c3">중고동네에 등록된 판매상품과 상품의 내용은 판매자가 등록한 것으로 중고동네에서는 그 등록내역에 대하여 일체의 책임을 지지 않습니다.</li>
			</ul>
			</div>
			<!-- 옥션 글 끝 -->
					
		</div>
		<div class="col-md-2"></div>
	</div><!-- 외부 row -->
<form id="insertBidForm" action="/auction/insertAuctionTempBid" method="get">
<input type="hidden" id="seller" name="seller" value="${selectedItem.seller}">
<input type="hidden" id="p_no" name="p_no" value="${selectedItem.p_no}">
<input type="hidden" id="bidPrice" name="bidPrice">
<input type="hidden" id="remindMinute" name="remindMinute">
</form>

</div><!-- 외부 container -->

<!-- 로딩 이미지 시작 -->
<div class='screenBlock'></div>
<div id="screenDiv">
	<span style="margin-bottom:40px">입찰 처리 중</span>
	<div class="loadingBox">
		
  		<div class="loadingBar"></div>
	</div>
</div>
<!-- 로딩 이미지 끝 -->

<!-- 로그인 모달 창 시작-->
<div class="col-md-12">
	<a id="modaLoginAuction" href="#modal-container-525134" role="button"
		class="btn" data-toggle="modal" style="display:none">로그인</a>

	<div class="modal fade" id="modal-container-525134" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">로그인</h5>
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				
				<div class="modal-body">
					<div><input type="text" id="txtId" placeholder="아이디" style="font-size:14px;width:200px"></div>
					<br>
					<div><input type="password" id="txtPw" placeholder="비밀번호" style="font-size:14px;width:200px"></div>
				</div>
				
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="btnLogin">로그인
					</button>
					<button type="button" id="btnClose" class="btn btn-secondary" data-dismiss="modal">취소</button>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 로그인 모달 창 끝 -->
<!-- 관심 상품 모달 시작 -->
<div class="col-md-12">
	<a id="modalFavorite" href="#modal-container-355530" role="button"
		class="btn" data-toggle="modal" style="display:none">관심 상품</a>

	<div class="modal fade" id="modal-container-355530" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="myModalLabel">관심 상품 등록</h5>
					<button type="button" class="close" data-dismiss="modal" id="modalClose">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
					관심 상품으로 등록했습니다
				</div>
				
			 	<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="modalFavoriteSave">닫기
					</button>
					<button type="button" class="btn btn-secondary" id="modalFavoriteSaveMove">관심상품으로</button>
				</div> 
			</div>
		</div>
	</div>
</div>
<!-- 관심 상품 모달 끝 -->

<%-- <%@ include file="../include/footer.jsp"%> --%>
