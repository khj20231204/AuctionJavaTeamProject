/**
 * 
 */

//날짜 계산
function changeDateString(timestamp){
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = make2digits(d.getMonth() + 1);
	var date = make2digits(d.getDate());
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	var second = make2digits(d.getSeconds());
	
	return year + "-" + month + "-" + date + "-" + hour + ":" + minute + ":" + second;
	
}

function make2digits(num){
	if(num < 10){
		num = "0" + num;
	}
	return num;
}
