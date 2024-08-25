/**
 * imageScript
 */

function changeDateString(timestamp){
	var d = new Date(timestamp);
	var year = d.getFullYear();
	var month = make2digits(d.getMonth() + 1);
	var date = make2digits(d.getDate());
	var hour = make2digits(d.getHours());
	var minute = make2digits(d.getMinutes());
	var second = make2digits(d.getSeconds());
	
	return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second
}

function make2digits(num){
	if(num < 10){
		num = "0" + num;
	}
	return num;
}

function isImage(fileName){
	var dotIndex = fileName.lastIndexOf(".");
	var extName = fileName.substring(dotIndex+1);
	var upper = extName.toUpperCase();
	if(upper == "PNG" || upper == "JPG" || upper == "GIF"){
		return true;
	} else {
		return false;
	}
}