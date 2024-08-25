<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/resources/css/bootstrap.jsp"%>
<%@ include file="include/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f42f1c15c87cece3983e493bec86605d&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f42f1c15c87cece3983e493bec86605d"></script>
<script>
	$(function() {
		
		var url = "/page/sellProductData";
		
		$.get(url, function(data){
			
			
			$.each(data, function(){
				
				
// 				console.log(this.road_address);
				var p_no = this.p_no;
				var p_name = this.p_name;
				var p_seller = this.p_seller;
				var p_price = this.p_price;
				var p_img = this.p_thumbimg; 
				console.log(p_img);
 			
				var geocoder2 = new kakao.maps.services.Geocoder();
				// 주소로 좌표를 검색합니다
				geocoder2.addressSearch(this.road_address, function(result, status) {

				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
				    	 
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker3 = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });

				        var iwRemoveable = true;
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:300px;text-align:center;padding:6px 0;">' +"상품이름 : <a href='/page/content?p_no="+p_no+"'>" + p_name +"</a><br>판매자 : "+ p_seller + "<br>가격 : " + p_price +'</div>',
				            removable : iwRemoveable
				        });
				        
				      

				        kakao.maps.event.addListener(marker3, 'click', function(){
				        	infowindow.open(map, marker3);
				        });
				        
				        
				    } 
				});    
				
				// 사이드에 마크 리스트 넣기
				$(".side_addr_list").parent().show();
				
				// 원본 복사 (display:none)
				var side_addr_list = $(".side_addr_list").eq(0).clone();
				
				// 이미지
				side_addr_list.find("img").attr("src" , "/resources/image/product/" + p_img);
				
				// 상품명
				side_addr_list.find("a").eq(0).text(p_name);
				side_addr_list.find("a").eq(0).attr("href" , "/page/content?p_no=" + p_no);
				
				// 판매자
				side_addr_list.find("a").eq(1).text(p_seller);
				
				// 주소
				side_addr_list.find("a").eq(2).text(this.road_address);
				
				// 가격
				side_addr_list.find("span").text(p_price + "원");
				$(".side_addr_list").parent().append(side_addr_list);
				
			}); // each
			
				$(".side_addr_list").eq(0).hide();
			
		});
		
		$("#btnCoordinate").click(function() {	
			modalTrigger();
		});
		
		//메인으로 돌아가기
		$("#goToTeam").click(function() {
			location.href = "/";
		});
		
		// 좌표 값 가져오기
		var data_Address = $("#address").attr("data-Address");
			console.log("data_Address : " + data_Address); // 검색한 주소
		
		var arr_data_addr = new Array();
			
		// 주소 값 가져와서 위도 경도로 변환
		$(".addr_list").each(function(){
			var data_addr = $(this).attr("data-addr"); //등록된 상품들 주소
			console.log("data_addr : " + data_addr);
			arr_data_addr.push(data_addr);
		});
			
			console.log(arr_data_addr);
	
		
//-------------------------------------------- 카카오 지도 api ------------------------------------------	
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 2 // 지도의 확대 레벨
	    };

	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
    {
        content: '<div>카카오</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    },
    {
        content: '<div>카카오</div>', 
        latlng: new kakao.maps.LatLng(33.450705, 126.570677)
    }
];


	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    

	    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	    function makeOverListener(map, marker, infowindow) {
	        return function() {
	            infowindow.open(map, marker);
	        };
	    }

	    // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	    function makeOutListener(infowindow) {
	        return function() {
	            infowindow.close();
	        };
	    }
	}
// -----------------------------------------검색한 주소 마커 생성------------------------------------------------	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(data_Address, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker2 = new kakao.maps.Marker({
	            map: map,
	            position: coords,
	            image: markerImage
	        });

	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">검색한 주소</div>'
	        });
	        infowindow.open(map, marker2);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	});    
		
	}); // main function
	/* ==================================== 네이버 지도 소스 코드 끝 ======================================= */
</script>
</head>
<body>
<div class="col-md-2"></div>
<div class="col-md-8" style="padding-left: 20%;">
<%@ include file="include/header_mainCatagories.jsp"%>
</div>
<div class="col-md-2"></div>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-8">
					
					<!-- 사이드 마커 리스트 -->
						<h3 style="padding-left: 6%;">검색된 상품 목록</h3>
						<div style="position:absolute; display:none; text-align:center;">
							<div class="side_addr_list" style="border-bottom:1px solid gainsboro;">
								<img style="height:190px;" alt="상품이미지" src=""><br>
								<a href="#" id="addr_ProductName" type="text"></a><br>
								<span id="addr_ProductPrice"></span><br>
								<a id="addr_Seller" type="text"></a><br>
								<a id="addr_Address" type="text"></a><br>
							</div>
						</div>
					<!-- 사이드 마커 리스트 END -->
					
					<div id="map" style="top : 20%; width:53%; height:440px; left:51%;"></div>
					
						<div style="position: absolute; left: 63%; top: 3%">
						검색한 주소 : <input type="text" id="txtAddress" name="txtAddress" value="${roadAddress}">
						</div>
					</div>
					
					<div class="col-md-4">
						<br>
						<br>
						<button class="btn btn-primary" type="button" id="btnCoordinate">주소 재검색하기</button>
						<br>
						<input type="hidden" id="address" data-address="${roadAddress}"/>
						
							<c:forEach var="road_address" items="${addr_list}">
								<input type="hidden" class="addr_list" data-addr="${road_address.road_address}"/>
							</c:forEach>
							
							
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>