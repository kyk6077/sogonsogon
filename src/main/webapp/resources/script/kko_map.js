
	//마커 보여줄 윈도우
	var infowindow = new daum.maps.InfoWindow({zIndex:2});
	var hoverinfowindow = new daum.maps.InfoWindow({zIndex:1});
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
	
	var target_id = null;
	var target_position;
	var review_on = false;
	
	var curPage = 0;
	var totalPage = 0;
	
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
	
	//인포윈도우 review 보기 버튼
	$('#map').on('click','.infowindow_comments_btn',function(){
		$('.container_comments_View').show();
		$('.infowindow_bottom').hide();
		var center = map.getCenter();
		resizeMap('550px');
		map.panTo(target_position);
		review_on = true;
		getReviewList(true);
	});
	
	//마커 표시 , 설정
	function displayMarker(place){
		
		var position = new daum.maps.LatLng(place.y,place.x);
		var marker = new daum.maps.Marker({
			map: map,
			position: position,
			clickable:true,
			title:place.id
		});
		
		marker.setTitle(place.id);
		
		var infohtml = '<div class="infowindow"><div class="infowindow_top"><strong class="info_name">'+place.place_name+'</strong>';
		infohtml = infohtml + '<span class="info_close_btn">X</span></div><div class="infowindow_middle"><p class="info_phone">Phone : '+place.phone+'</p>';
		infohtml = infohtml + '<p class="info_main_address">'+place.address_name+'</p>';
		infohtml = infohtml + '<a class="info_place_url" target="_blank" href="'+place.place_url+'">'+place.place_url+'</a>';
		infohtml = infohtml + '</div><div class="infowindow_bottom"><button class="infowindow_comments_btn" title="'+place.id+'">Review</button></div></div>';
		
		//마커 클릭 이벤트
		daum.maps.event.addListener(marker, 'click', function(){
			
			map.panTo(position);
			infowindow.setContent(infohtml);
			infowindow.open(map,marker);
			
			target_position = position;
			
			target_id = marker.getTitle();
			if($('.container_comments_View').css('display') != 'none' && review_on){
				//list 여기서 ajax로 보내고 리뷰 클릭시에도 보냄 함수로 정리해서 쓰자.
				getReviewList(true);
				$('.infowindow_bottom').hide();
				
			}
			
			//X 클릭시 정보창 닫기
			$('#map').on('click','.info_close_btn',function(){
				infowindow.close();
			});
			
		});
		
		
		//리뷰 닫기 이벤트
		$('#list_close').on('click',function(){
			$('.container_comments_View').hide();
			$('.infowindow_bottom').show();
			resizeMap('1100px');
			map.panTo(target_position);
			review_on = false;
		});
		
		var hover_info = '<div class="hoverinfowindow" style="padding:5px;">'+place.place_name+'</div>';
		// 마커 마우스 오버 시 장소 이름 인포윈도우 표시 이벤트
		daum.maps.event.addListener(marker, 'mouseover', function() {	  
			hoverinfowindow.setContent(hover_info);
			hoverinfowindow.open(map, marker);
		});

		//마커 마우스 아웃 시 인포윈도우 제거 이벤트
		daum.maps.event.addListener(marker, 'mouseout', function() {
			hoverinfowindow.close();
		});
		
		/*place_name*/
		markers.push(marker);
		
	}
	
	
	//처음 들어갈떄 total page 가져오는건데 ajax 비동기여서 밑에께 먼저 실행됨 고쳐야됨!!!!***
	function getReviewList(first){
		/*if(first){
			curPage = 0;
			$.ajax({
				url:"./reviewTotalPage",
				type:"POST",
				data:{
					target_num:target_id
				},success:function(data){
					console.log(data);
					totalPage = data;
				},error:function(){
					alert('카운트실패');
				}
			})
			
		}*/
		
		if(first){
			curPage = 0;
		}
		
		if(totalPage>curPage || first){
			$.ajax({
				url:"./reviewList",
				type:"GET",
				data:{
					target_num:target_id,
					curPage:curPage+1
				},success:function(data){
					console.log(data);
					totalPage = data.totalPage;
					var list_html ="";
					if(data.reviewList.length==0){
						alert('리뷰가 없습니다.');
						$('.comments_list').html(list_html);
						//더보기할때 없을땐 초기화 안되게 처리해야함*****
					}else{		
						data.reviewList.forEach(function(curVal, index, array){
							var date = new Date(curVal.reg_date).toISOString().slice(0,10);
							list_html += '<div class="comments_row"><label><strong style="color:#FFF">';
							list_html += curVal.writer+'</strong></label>';
							if($('.comments_list').attr('title')==curVal.writer){
								list_html += '<i class="fa fa-close delete_icon" title="'+curVal.rnum+'"></i>';
							}
							list_html += '</i><p class="comments_date">';
							list_html += date+'</p><textarea readonly="readonly" ';
							list_html += 'class="comments_content" row="4" cols="20">'+curVal.contents
							list_html += '</textarea></div>';
						});
						
						if(first){
							$('.comments_list').html(list_html);
						}else{
							$('.comments_list').append(list_html);
						}
						curPage++;
						
					}
				},error:function(){
					alert('list fail');
				}
			});
		}else{
			alert('더이상 리뷰가 없습니다.');
		}
	}
	
	$('.comments_list').on('click','.delete_icon',function(){
		var rnum = $(this).attr('title');
		
		$.ajax({
			url:'./reviewDelete',
			type:'POST',
			data:{
				rnum:rnum
			},success:function(result){
				if(result==1){
					getReviewList(true);
				}
			},error:function(){
				alert('삭제 실패');
			}
		
		})
		
	});
	
	function resizeMap(width_) {
		var container = document.getElementById('map');
		container.style.width = width_;
		map.relayout();
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
	
	$('#review_insert_btn').on('click',function(){
		$.ajax({
			url:"studyRoom/reviewInsert",
			type:"POST",
			data:{
				target_num:target_id,
				writer:$('#review_writer').val(),
				contents:$('#review_content').val(),
			},success:function(data){
				console.log(data);
				getReviewList(true);
			},error:function(){
				alert('insert Fail');
			}
			
		});
		
	});
	
	$('#list_plus_btn').on('click',function(){
		//리스트가져올때 totalPage도 가져와서 curPage가 totalPage랑 같을시 더보기 안보이게 처리
		getReviewList(false);
	});
