<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/resources/css/bootstrap.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
    <title>간단한 지도 표시하기</title>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=8io5mp0l3f"></script>
    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=83bfuniegk&amp;submodules=panorama,geocoder,drawing,visualization"></script>
    <script>
   
    $(function(){
    
    	$("#searchAddr").click(function(){
    		var addr = $("#txtAddress").val();
    		console.log("addr:"+addr);
    		searchAddressToCoordinate(addr);
    	});
    	
    	/*
    	var lat1 = new naver.maps.LatLng(37.3595316, 127.1052133); //경도, 위도 만들기
    	var maker = new naver.maps.Marker(lat1); //마커 생성
    	//lat1의 위치에 마크 추가
		var marker = new naver.maps.Marker({            	   
			position: new naver.maps.LatLng(lat1),
			map: map   
		});
    	*/
    	//map란 이름으로  map만들기
    	//lat 위도 34, lng 경도 127
    	var lat1 = new naver.maps.LatLng(36.3595316, 127.1052133); //경도, 위도 만들기
    	//var maker = new naver.maps.Marker(lat1); //마커 생성
    	console.log("lat1:"+lat1);
    	var map = new naver.maps.Map("map", {
    	    center: new naver.maps.LatLng(lat1),
    	    zoom: 3,
    	    mapTypeControl: true
    	});
    	
    	
    	naver.maps.Event.addListener(map, 'click', function(e) { //클릭했을 때 마크이동
	            marker.setPosition(e.coord);
		});
	
		//var points = [[127.1117463,36.3565081],[127.1078195,35.3543931],[127.1041619,37.3572927]];
		var points = [[36.3565081,127.1117463],[36.5543931,127.1078195],[36.9572927,127.1041619]];
		
		var marker = new naver.maps.Marker({            	   
			position: new naver.maps.LatLng(lat1),
			map: map   
		});
		
		var size = points.length;
		console.log("size:"+size);
		var markers = new Array(size);
		var lat = new Array(size);
		for(var i=0 ; i<points.length ; i++){
			lat[i] = new naver.maps.LatLng(points[i][0],points[i][1]);
			console.log("lat:"+lat);
			markers[i] = new naver.maps.Marker({            	   
				position: new naver.maps.LatLng(lat[i]),
				map: map   
			});
			console.log("markers[i]:"+markers[i]);
		}
		
    	var infoWindow = new naver.maps.InfoWindow({
    	    anchorSkew: true
    	});

    	map.setCursor('pointer');
    	
    	function searchCoordinateToAddress(latlng) {

    	    infoWindow.close();

    	    naver.maps.Service.reverseGeocode({ //좌표->주소 검색(reversegeocode) 
    	        coords: latlng,
    	        orders: [
    	            naver.maps.Service.OrderType.ADDR,
    	            naver.maps.Service.OrderType.ROAD_ADDR
    	        ].join(',')
    	    }, function(status, response) {
    	        if (status === naver.maps.Service.Status.ERROR) {
    	            return alert('Something Wrong!');
    	        }

    	        var items = response.v2.results,
    	            address = '',
    	            htmlAddresses = [];
				
    	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) { //0:지번, 1:도로명
    	            item = items[i];
    	            address = makeAddress(item) || '';
    	            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';
					console.log("reverseGeocode에서 address("+i+"):"+address);
    	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
    	        }
				//latlng에 마크추가				
    	        var marker = new naver.maps.Marker({            	   
    	       		position: new naver.maps.LatLng(latlng),
    	           	map: map   
    	        });
    	        
    	        infoWindow.setContent([
    	            '<div style="padding:10px;min-width:200px;line-height:150%;">',
    	            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
    	            htmlAddresses.join('<br />'),
    	            '</div>'
    	        ].join('\n'));
    	        //infoWindow.open(map, latlng);
    	        
    	    });
    	}
    		
    	//주소->좌표 검색(geocode)
    	function searchAddressToCoordinate(address) { //주소를 입력받는다
    	    naver.maps.Service.geocode({ //주소를 좌표로
    	        query: address
    	    }, function(status, response) {
    	        if (status === naver.maps.Service.Status.ERROR) {
    	            return alert('Something Wrong!');
    	        }

    	        if (response.v2.meta.totalCount === 0) {
    	            return alert('totalCount' + response.v2.meta.totalCount);
    	        }

    	        var htmlAddresses = [],
    	            item = response.v2.addresses[0],
    	            point = new naver.maps.Point(item.x, item.y); //주소를 좌표로 받아오는 point
					console.log("주소를 좌표롤 받아오는 point:"+point);
    	               	            	            
    	        if (item.roadAddress) {
    	            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
    	        }

    	        if (item.jibunAddress) {
    	            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
    	        }

    	        if (item.englishAddress) {
    	            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
    	        }
				
    	   		infoWindow.setContent([
    	            '<div style="padding:10px;min-width:200px;line-height:150%;">',
    	            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
    	            htmlAddresses.join('<br />'),
    	            '</div>'
    	        ].join('\n'));
				
    	   	 var marker = new naver.maps.Marker({            	   
 	       		position: new naver.maps.LatLng(point),
 	           	map: map   
 	        });
    	   		
    	        map.setCenter(point);
    	        //infoWindow.open(map, point);
    	    });
    	}

    	function initGeocoder() {
    	    if (!map.isStyleMapReady) {
    	        return;
    	    }
			
    	    map.addListener('click', function(e) {
    	    	
    	    	console.log("e.coord:"+e.coord);
    	        searchCoordinateToAddress(e.coord);
    	    });

    	    $('#address').on('keydown', function(e) {
    	        var keyCode = e.which;

    	        if (keyCode === 13) { // Enter Key
    	            searchAddressToCoordinate($('#address').val());
    	        }
    	    });

    	    $('#submit').on('click', function(e) {
    	        e.preventDefault();

    	        searchAddressToCoordinate($('#address').val());
    	    });

    	    searchAddressToCoordinate('정자동 178-1');
    	}

    	//--------------------------- 주소를 만드는 부분 시작 ----------------------------------------//
    	function makeAddress(item) { //시, 구, 동, 면, 읍 으로 주소를 만든다
    	    if (!item) {
    	        return;
    	    }

    	    var name = item.name,
    	        region = item.region,
    	        land = item.land,
    	        isRoadAddress = name === 'roadaddr';

    	    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

    	    if (hasArea(region.area1)) {
    	        sido = region.area1.name;
    	    }

    	    if (hasArea(region.area2)) {
    	        sigugun = region.area2.name;
    	    }

    	    if (hasArea(region.area3)) {
    	        dongmyun = region.area3.name;
    	    }

    	    if (hasArea(region.area4)) {
    	        ri = region.area4.name;
    	    }

    	    if (land) {
    	        if (hasData(land.number1)) {
    	            if (hasData(land.type) && land.type === '2') {
    	                rest += '산';
    	            }

    	            rest += land.number1;

    	            if (hasData(land.number2)) {
    	                rest += ('-' + land.number2);
    	            }
    	        }

    	        if (isRoadAddress === true) {
    	            if (checkLastString(dongmyun, '면')) {
    	                ri = land.name;
    	            } else {
    	                dongmyun = land.name;
    	                ri = '';
    	            }

    	            if (hasAddition(land.addition0)) {
    	                rest += ' ' + land.addition0.value;
    	            }
    	        }
    	    }

    	    return [sido, sigugun, dongmyun, ri, rest].join(' ');
    	}

    	function hasArea(area) {
    	    return !!(area && area.name && area.name !== '');
    	}

    	function hasData(data) {
    	    return !!(data && data !== '');
    	}

    	function checkLastString (word, lastString) {
    	    return new RegExp(lastString + '$').test(word);
    	}

    	function hasAddition (addition) {
    	    return !!(addition && addition.value);
    	}
    	//--------------------------- 주소를 만드는 부분 끝 ----------------------------------------//
    	
    	naver.maps.onJSContentLoaded = initGeocoder;
    	naver.maps.Event.once(map, 'init_stylemap', initGeocoder);
    });
    
    $("#goToTeam").click(function(){
    	location.href="map";
    })
  	
	
    
    </script>
</head>
<body>
<div id="map" style="width:500px;height:500px;"></div>

<script>
/*
var mapOptions = {
    center: new naver.maps.LatLng(35.5383773, 129.3113596), //경도, 위도
    zoom: 13 //높을수록 확대
};

var map = new naver.maps.Map('map', mapOptions);
*/
</script>
<form action="/getAddress" method="get">
	주소 입력:<input type="text" id="txtAddress" name="txtAddress">
	<button type="button" id="searchAddr">전송</button>
	<button type="button" id="goToTeam">프로젝트로</button>
</form>
</body>
</html>