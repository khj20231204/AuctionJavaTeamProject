/**
 * 
 */

//-- 시간 한자리를 두자리로 --//
function makeTwoDigit(num){
	var len = num.toString().length;
	console.log("makeTwoDigit len:"+len);
	if(len < 2){
		num = "0"+num;
	}
	return num;
}

//--- 엔터키 ---//
function enterSearch() {
	var evt_code = (window.netscape) ? ev.which : event.keyCode;
	//alert(evt_code);
	if (evt_code == 13) { //아스키코드 13은 엔터, 엔터를 치면 검색  
		event.keyCode = 0;
		//getAddr();
	}
}//enterSearch

function changeMonth(engMonth){//datepicker의 요일 영어를 숫자로 변화
	var upperMonth = engMonth.toUpperCase();
	
	switch(upperMonth){
	case 'JAN':
		return 1;
	case 'FEB':
		return 2;
	case 'MAR':
		return 3;
	case 'APR':
		return 4;
	case 'MAY':
		return 5;
	case 'JUN':
		return 6;
	case 'JUL':
		return 7;
	case 'AUG':
		return 8;
	case 'SEP':
		return 9;
	case 'OCT':
		return 10;
	case 'NOV':
		return 11;
	case 'DEC':
		return 12;
	}
}//changeMonth