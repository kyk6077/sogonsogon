<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.ckeditor.com/4.11.1/standard/ckeditor.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace('contents',{height:400});
		
		$('#board_submit_btn').on('click',function(){
			$.ajax({
				url:"./boardUpdate",
				type:'POST',
				data:{
					bnum:$('#bnum').val(),
					title:$('#title').val(),
					contents:CKEDITOR.instances.contents.getData()
				},
				success:function(data){
					if(data==1){
						alert('Update Success');
						location.href = "./boardSelectOne?bnum="+${boardDTO.bnum};
					}else{
						alert('Update Fail');
					}
					
				},
				error:function(){
					alert('Update Fail');
				}
			})
		});
		
	});
</script>
<style type="text/css">
	.main_container {
		width:100%;
		margin-top: 15em;
		margin-bottom: 200px;
	}
	.board_input{
		width:100%;
		background-color: #f2f2f2;
		padding:8px;
		border: 0px;
		font-size: 15px;
	}
	.board_label{
		min-width:350px;
		touch-action: manipulation;
		font-family: 'Nanum Gothic';
	}
	.board_input_contents{
		min-height:500px; 
	}
	.contents_title{
		font-weight:bold;
		font-family: 'Nanum Gothic';
		margin-top:20px;
		font-size: 15px;
	}
	#board_submit_btn{
		min-width: 80px;
		min-height: 38px;
		margin-top: 10px;
		background-color: black;
		color: white;
		border:0 none;
	}
</style>
</head>
<body>
	<div class="container">
		<c:import url="../header.jsp"/>
		<div class="main_container">
			
			<input type="hidden" value="${boardDTO.bnum}" id="bnum">
			<p><label class="board_label">
					Title<br>
					<input type="text" class="board_input" value="${boardDTO.title}" id="title">
				</label></p>
				<p><label class="board_label">
					Writer<br>
					<input type="text" class="board_input" value="${boardDTO.writer}" id="writer" readonly="readonly">
				</label></p>
	
				<p class="contents_title">Contents</p>
				<textarea rows="50" cols="40" class="board_input_contents" id="contents">
				${boardDTO.contents}</textarea>
				<input type="button" value="Update" id="board_submit_btn">
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header_scroll.js"></script>
</html>