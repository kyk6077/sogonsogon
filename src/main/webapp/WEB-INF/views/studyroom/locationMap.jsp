<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/infowindow.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c48f92b49340045d7e1418ebcdc558a&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
$(function(){
	if('${token}'==''){
		$('.review_write').hide();
		$('.comments_list').css('height','570px');
	}
	
});
</script>
<style type="text/css">
	.main_container {
		width:100%;
		margin-top: 15em;
		margin-bottom: 200px;
	}
	
	.map_basic_container{
		width: 100%;
		min-width: 800px;
		min-height: 400px;
	}
	
	.map_container{
		width:70%;
		height:600px;
		position: absolute;
		left: 50px;
	}
	
	#map{
		width: 1100px;
		min-width:550px;
		height:600px;
		margin-top: 10px;
		display: inline-block;
		float: left;
	}
	
	.container_comments{
		min-width:20%;
		height:600px;
		background-color: silver;
		position: absolute;
		right: 50px;
	}
	
	.container_comments_View{
		width: 550px;
	    height: 600px;
	    display: none;
	    float: right;
	    margin-top: 10px;
	}
	
	.search_row{
		
	}
	
	#search_name{
		width:32em;
		display: inline-block;
	}
	#search_place_btn{
		width:70px;
		min-width:60px;
		display: inline-block;
		height: 34px;
	}
	.comments_list{
		width:100%;
		height:390px;
		background-color: #8aacc8;
		margin-bottom: 5px;
		overflow-y: auto;
		border-radius: 5px;
		border: 1px solid #BBB;
    	border-right: 2px solid #CCC;
    	border-bottom: 2px solid #CCC;
	}
	
	.comments_row{
	 	padding: 13px;
	 	margin-top: 10px;
	 	border-bottom: 1px dashed #baddf9;
	}
	
	.comments_content{
		width: 100%;
		height: 60px;
		resize: none;
		border-radius: 5px;
	}
	
	.update_icon,
	.delete_icon{
		margin-left: 6px;
    	font-size: 16px;
    	color: khaki;
	}
	
	.comments_date{
		display: inline-block;
		float: right;
		color: #DFDFDF
	}
	
	.list_plus{
		text-align: center;
		margin-bottom: 10px;
	}
	
	#list_close{
		color: darkseagreen;
	    font-weight: 700;
	    font-size: 16px;
	    margin-right: 20px;
	}
	#list_plus_btn{
		font: 700 larger bold;
		color: lightcoral
	}
	
	.review_write{
		width:100%;
		height:160px;
	    padding: 12px 16px 20px;
	    background: #8aacc8;
	    border: 2px solid #DDD;
	    border-bottom-color: #CCC;
	    border-radius: 8px;
	}
	 
	 .review_write_row{
	 	margin-top: 10px;
	 }
	 
	#review_content{
		min-width:100%;
		resize: none;
		background-color:#FCFCFC;
		border-style: hidden;
		border: 2px solid #DFDFDF;
		border-radius: 10px;
	}
	
	#review_insert_btn{
		min-width: 100%;
		min-height: 40px;
		background-color: #baddf9;
		border: 1px #CCC solid;
		border-radius: 10px;
		color: #FAFAFA;
		font-size: large;
		font-weight: 600;
		margin-top: 5px;
	}
	
	
	
	 @media screen and (max-width: 75rem) {
		#map{
			width: 550px;
			min-width:400px;
			margin-top: 10px;
			
		}
		
		.container_comments_View{
			width: 550px;
			min-width:400px;
		    height: 600px;
		    /* background-color: skyblue; */
		    float: left;
		}
		
	}
	
	
/*	@media screen and (max-width: 100rem) {
		.main_container{
			width:100%;
			height: 700px;
		}
		.map_container{
			width:60%;
			height: 600px;
			position: absolute;
			left: 50px;
		}
		#search_name{
			width:32em;
			display: inline-block;
		}
		#map{
			width: 100%;
			height: 600px;
			margin-top: 10px;
		}
		
		.container_comments{
			min-width:20%;
			height: 600px;
			position: absolute;
			right: 50px;
		}
	}
	
 	@media screen and (max-width: 50rem) {
		.main_container{
			width:100%;
			height: 1000px;
		}
		.map_container{
			width:90%;
			height: 500px;
			position: static;
		}
		#search_name{
			width:20em;
			display: inline-block;
		}
		#map{
			width: 100%;
			min-width:400px;
			margin-top: 10px;
		}
		.container_comments{
			width:40%;
			height: 400px;
			position: static;
		}
	}
	
 	@media screen and (max-width: 30rem) {
		
		.main_container{
			width:100%;
			height: 800px;
		}
		
		.map_container{
			width:100%;
			height: 300px;
			position: static;
		}
		#search_name{
			width:10em;
			display: inline-block;
		}
		#map{
			width: 100%;
			min-width:300px;
			height:250px;
			margin-top: 10px;
		}
		.container_comments{
			width:100%;
			height: 300px;
			position: static;
		}
	} */
	
</style>
</head>
<body>
	<div class="container">
		<c:import url="../header.jsp"/>
		<div class="main_container">
			<div class="map_basic_container">
				<div class="search_row">
					<input id="search_name" type="text" class="form-control" placeholder="검색어를 입력해주세요.">
					<Button id="search_place_btn">Search</Button>
					<Button class="test">Test</Button>
				</div>
				<div id="map"></div>
				<div class="container_comments_View">
					<div class="comments_list" title="${visitor.nickname}"></div>
					
					<div class="list_plus">
						<span class="glyphicon glyphicon-chevron-left" id="list_close">리뷰닫기</span>
						<span class="glyphicon glyphicon-plus" id="list_plus_btn">더보기</span>
					</div>
					
					
					<div class="review_write">
						<label>
							<em class="glyphicon glyphicon-ok" style="color:white"></em>
							<strong style="color:white">댓글쓰기</strong>
						</label>
						<div class="review_write_row">
							<input type="hidden" value="${visitor.nickname}" id="review_writer"> 
							<textarea rows="2" cols="20" id="review_content"></textarea>
						</div>
						<div class="review_button_row">
							<button id="review_insert_btn">등록</button>
						</div>
					</div>
						
				</div>
			</div>
			
		</div>
	</div>
	
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header_scroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/kko_map.js"></script>
</html>