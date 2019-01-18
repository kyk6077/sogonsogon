$(function(){
	//마커 보여줄 윈도우
	var infowindow = new daum.maps.InfoWindow({zIndex:1});
	//지도에 표시된 마커 객체 배열
	var markers = [];
	
	//기본 Map 생성
	var container = document.getElementById('map');
	var options = {
			center: new daum.maps.LatLng(37.5612032,126.9751701),
			level: 3
	};
	var map = new daum.maps.Map(container, options);
	//Map 생성 끝
	
	//장소 검색 객체 , 키워드로 장소 검색
	var ps = new daum.maps.services.Places();
	
	ps.keywordSearch('도서관',placesSearchCB);
	
	//검색 ajax 수정
	$('#search_place_btn').click(function(){
		var search_name = $('#search_name').val();
		if(search_name==null||search_name==''){
			alert('검색어를 입력해주세요');
		}else{
			$.ajax({
				url: 'https://dapi.kakao.com/v2/local/search/keyword.json',
				data: {query:search_name},
				type: 'GET',
				headers: {'Authorization': 'KakaoAK 2adcf985fd056dd9b8a628e688d0d2f9'},
				success: function(data){
					for(var i=0;i<markers.length;i++){
						markers[i].setMap(null);
					}
					setBoundMarker(data.documents);
					
					/* console.log(data);
					for(var i=0;i<data.documents.length;i++){
						alert('id : '+data.documents[i].id+' place_name : '+data.documents[i].place_name+' phone : '+data.documents[i].phone+' address_name : '+data.documents[i].address_name+' x : '+data.documents[i].x+' y : '+data.documents[i].y+' place_url : '+data.documents[i].place_url);
					} */
						
				},
				error : function() {
					alert('Fail!!');
				}
			});
		}
	});
	
	function placesSearchCB(data,status,pagination){
		if(status ===daum.maps.services.Status.OK){
			 setBoundMarker(data);
		}
		
	}
		
	//마커 표시 , 설정
	function displayMarker(place){
		
		var position = new daum.maps.LatLng(place.y,place.x);
		var marker = new daum.maps.Marker({
			map: map,
			position: position
		});
		
		var infohtml = '<div class="infowindow"><div class="infowindow_top"><a class="info_name" href="#">'+place.place_name+'</a>';
		infohtml = infohtml + '<span class="info_close_btn">X</span></div><div class="infowindow_middle"><p class="info_phone">Phone : '+place.phone+'</p>';
		infohtml = infohtml + '<p class="info_main_address">'+place.address_name+'</p>';
		infohtml = infohtml + '<p class="info_place_url">'+place.place_url+'</p>';
		infohtml = infohtml + '</div><div class="infowindow_bottom"><button class="infowindow_comments_btn">Review</button></div></div>';
		infohtml.trim();
		
		//마커 클릭 이벤트
		daum.maps.event.addListener(marker, 'click', function(){
			map.panTo(position),
			infowindow.setContent(infohtml),
			infowindow.open(map,marker);
			
			//X 클릭시 정보창 닫기
			$('.info_close_btn').click(function(){
				infowindow.close();
			});
		});
		
		
		
		markers.push(marker);
		
	}
	
	//검색 결과를 기준으로 맵 설정
	function setBoundMarker(data){
		var bounds = new daum.maps.LatLngBounds();
		 
		for (var i=0; i<data.length; i++) {
			displayMarker(data[i]);
	     	bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
	    }    
		
		//test
		/* for(var i=0;i<data.length;i++){
			alert('id : '+data[i].id+' place_name : '+data[i].place_name+' phone : '+data[i].phone+' address_name : '+data[i].address_name+' x : '+data[i].x+' y : '+data[i].y+' place_url : '+data[i].place_url);
		} */
		
		//검색된 장소 위치를 기준으로 지도 범위를 재설정
		map.setBounds(bounds);
	}
	
});