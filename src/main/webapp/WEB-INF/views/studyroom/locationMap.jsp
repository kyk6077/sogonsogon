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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=8c48f92b49340045d7e1418ebcdc558a&libraries=services,clusterer,drawing"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header_scroll.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/kko_map.js"></script>
<style type="text/css">
	.main_container {
		width:100%;
		margin-top: 15em;
		margin-bottom: 200px;
	}
	
	.map_basic_container{
		width: 100%;
		min-width: 300px;
		min-height: 400px;
	}
	
	.map_container{
		width:60%;
		height:600px;
		position: absolute;
		left: 50px;
	}
	
	#map{
		width: 100%;
		height:600px;
		margin-top: 10px;
	}
	
	.container_comments{
		min-width:20%;
		height:600px;
		background-color: silver;
		position: absolute;
		right: 50px;
	}
	
	.container_comments_noView{
		display: none;
	}
	#search_name{
		width:93%;
		display: inline-block;
	}
	#search_place_btn{
		width:70px;
		min-width:60px;
		display: inline-block;
		height: 34px;
	}
	
	@media screen and (max-width: 100rem) {
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
			height: 500px;
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
			height:300px;
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
			height:200px;
			margin-top: 10px;
		}
		.container_comments{
			width:100%;
			height: 300px;
			position: static;
		}
	}
	
</style>
</head>
<body>
	<div class="container">
		<c:import url="../header.jsp"/>
		<div class="main_container">
			<div class="map_basic_container">
				<input id="search_name" type="text" class="form-control" placeholder="검색어를 입력해주세요.">
				<Button id="search_place_btn">Search</Button>
				<div id="map"></div>
			</div>
			<div class="container_comments_noView">
						
			</div>
		</div>
	</div>
	
</body>
</html>