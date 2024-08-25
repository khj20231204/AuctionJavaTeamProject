<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<script type="text/javascript" src="/resources/js/auctionJS.js" charset="UTF-8"></script>

<style>
.img-class {
    width: 200px; height: 200px;
}

.firstTd { 
    padding-right: 20px;
    padding-bottom: 35px; 
    padding-left: 20px; 
}

.secondTable{ 
	height: 400px; 
	border-top: 1px solid #f4f4f4; 
	border-left: 1px solid #f4f4f4; 
	border-right: 1px solid #f4f4f4; 
}

.titleTd{
	font-size: 14px;
    font-weight: 400;
    font-family: noto sans;
    vertical-align: middle;
}

.priceTd{
  	font-size: 14px;
    font-weight: 400;
    font-family: noto sans;
    vertical-align: middle;
}

.edateTd{
  	font-size: 14px;
    font-weight: 400;
    font-family: noto sans;
    vertical-align: middle;
}

.timeTd{
  	font-size: 14px;
    font-weight: 400;
    font-family: noto sans;
    vertical-align: middle;
}

</style>

<script type="text/javascript">

$(function(){
	
	var countDown=[];
	
	$(document).ready(function() { 
		$(".divCountDown").each(function(index){
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
			
			//마감 날짜와 현재 시간을 뺀 값을 this값에 넣는다 
			$(this).text(resultHour+":"+resultMinute+":"+resultSecond);
			$(this).next().val(resultYear);
			$(this).next().next().val(resultMonth);
			$(this).next().next().next().val(resultDate);
			
			//입력된 텀 시간을 불러와서 카운드 다운한다
			
			var that = $(this);
			var deadline = $(this).next().next().next().next().next().next().next().val();
			
			if(deadline == 'N'){
				countDown[index] = setInterval(function(){
					
					var year = that.next().val();
					var month = that.next().next().val();
					var date = that.next().next().next().val();
					//console.log("addDate:"+addDate+" ,year:"+year+" ,month:"+month+" ,day:"+date);
		
					var timeValue = that.text();
					//console.log("timeValue:"+timeValue);
					var timeArray = timeValue.split(":");
					//console.log(timeArray[0]+" ,"+ timeArray[1]);
					var hour = timeArray[0].trim();
					var minute = timeArray[1].trim();
					var second = timeArray[2].trim();
	 				
					console.log("index:"+index+" ,hour:"+hour+" ,minute:"+minute+" ,second:"+second);
					
					if(second<=0){
						if(minute>0){
							minute--;
							second += addSecond;
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
					
					console.log("index:"+index+"hour:"+hour+" ,minute:"+minute+" ,second:"+second);
					
					var twoDigitHour = makeTwoDigit(hour);
					var twoDigitMinute = makeTwoDigit(minute);
					var twoDigitSecond = makeTwoDigit(second);
					console.log("twoDigitSecond:"+twoDigitSecond);
					
					that.text(twoDigitHour+":"+twoDigitMinute+":"+twoDigitSecond);
				},1000);
			}else{
				that.text("00:00:00");
			}
		});	
		
	});//document.ready
	
	$("#stopTimer").click(function(){
		var len = $(".divCountDown").length;
		//console.log("len:"+len);
		for(var i=0 ; i<len ; i++){
			clearInterval(countDown[i]);			
		}
	});

	/*요소값을 배열로 받아온다
	var objCount=[];
	$("#startTimer").click(function(){
		var divCount = $(".divCountDown").toArray();
		
		for(var i=0 ; i<divCount.length ; i++){
			objCount.push(divCount[i].innerHTML);
			//console.log("objCount[]:"+objCount[i].text());
		}
		
		console.log(objCount[0]);
	});*/
	
	$(".auctionSelect").click(function(e){
		e.preventDefault();
		var pno = $(this).attr("data-pno");
		//console.log($(this).attr("data-pno"));
		
		location.href="/auction/auctionSelected?p_no="+pno;
		//location.href="/auction/auctionSelected";
	});
	
	$("#dsf").click(function(){
		alert("df");
	});
});//function

// function makeTwoDigit(num){
// 	console.log("makeTwoDigit num:"+num);
// 	var len = num.toString().length;
// 	console.log("makeTwoDigit len:"+len);
// 	if(len < 2){
// 		num = "0"+num;
// 	}
// 	return num;
// }

</script>
<input type="hidden" id="hiddenDate">
<!--------------------------------------- 메인 카테고리 목록 -------------------------------------->
<div class="container-fluid">
<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
		<div><%@ include file="auctionHeader.jsp"%></div> 
	</div>	
<!--------------------------------------- 메인 카테고리 목록  END----------------------------------->
	<div class="col-md-2">
<!-- 	<button type="button" id="stopTimer">타이머종료</button>	 -->
<!-- 	<a href="/auction/excercise">연습</a> -->
	</div>
</div>	
<div class="row">
<div class="col-md-2"></div>
		<div class="col-md-8" >
	 	<table border=0>
	 		<c:forEach var="auctionSellVo" items="${list}" varStatus="status">
	 		<c:if test="${(status.count-1) % 4 == 0}">
	 			<tr><!-- 4개 넘어서면 tr추가 -->
			</c:if>
			
	 			<td class="firstTd"><!-- 4개까진 td 추가 -->
	
	 				<table border=1 class="secondTable">
						<tr>
							<td>
								<a href="#" class="auctionSelect" data-pno="${auctionSellVo.p_no}"><img src="/furniture/displayImage?imageName=${auctionSellVo.main_img_name}" class="img-class"></a><br>
								<img alt="경매" src="http://pics.auction.co.kr/listing/used/2014/icon_auc.png">
							</td>
						</tr>
						<tr>
							<td class="titleTd">${auctionSellVo.p_title}</td>
						</tr>			 				
						<tr>
							<td class="priceTd">${auctionSellVo.present_price}원</td>
						</tr>
						<tr>
							<td class="edateTd">${auctionSellVo.seller} 마감시간:${auctionSellVo.e_month}/${auctionSellVo.e_day} ${auctionSellVo.e_hour}:${auctionSellVo.e_minute}</td>
						</tr>
						<tr>
							<td>
								<div class="divCountDown timeTd" style="color:red"></div>
								<input type="hidden" class="resultYear" value="${auctionSellVo.e_year}">
								<input type="hidden" class="resultMonth" value="${auctionSellVo.e_month}">
								<input type="hidden" class="resultDate" value="${auctionSellVo.e_day}">
								<input type="hidden" class="countDown_hour" value="${auctionSellVo.e_hour}">
								<input type="hidden" class="countDown_minute" value="${auctionSellVo.e_minute}">
								<input type="hidden" class="countDown_second" value="${auctionSellVo.e_second}">
								<input type="hidden" class="deadline" value="${auctionSellVo.deadline}">											
							</td>
						</tr>
	 				</table>
				
	 			</td><!-- 4개까진 td 추가 -->
			
			<c:if test="${status.count%4 == 0}">
	 			</tr><!-- 4개 넘어서면 tr추가 -->
	 		</c:if>
	 		</c:forEach>
	 	</table>
	</div><!-- col-md-8 -->
<div class="col-md-2"></div>
</div><!-- row -->
</div>
<%-- <%@ include file="../include/footer.jsp" %> --%>

