<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:'https://openapi.gg.go.kr/Poplitloanbook?',
			type:'GET',
			data:{
				KEY: '20acc3078cce4a10805b81e1f0b131af',
				Type: 'json',
				pIndex: 1,
				pSize: 30
			},
			success:function(data){
				console.log(data);
				/* 백엔드로 보내서 리스트로 처리해서 가져와야됨 */
			},
			error:function(){
				alert('fail');
			}
		
		});
	});
</script>
<style type="text/css">
	.main_container {
		width:100%;
		margin-top: 15em;
		margin-bottom: 200px;
	}
	#board_table{
		width: 100%;
		border: 1px solid #d7d5d5;
		min-width: 620px;
	}
	
	.board_table_header{
		font-weight: normal;
    	background: #fbfafa;
  
	}
	.board_table_header th{
		text-align: center;	
		padding: 11px 0 10px 0;
		border: 1px solid #d7d5d5;
	}
	#th_1{
		width: 10%;
	}
	#th_2{
		width: 20%;
	}
	#th_3{
		width: 40%;
	}
	#th_4{
		width: 20%;
	}
	#th_5{
		width: 10%;
	}
	
	.board_table_body td{
		padding: 8px 0 7px 7px;
		border-top: 1px solid #d7d5d5;
		border: 1px solid #d7d5d5;
	}
</style>
</head>
<body>
	<div class="container">
		<c:import url="../header.jsp"/>
		<div class="main_container">
			<h1>HotBook List</h1>
			<div class="row_table">
				<table id="board_table">
					<thead class="board_table_header">
						<tr>
							<th id="th_1">NUM</th>
							<th id="th_2">WRITER</th>
							<th id="th_3">CONTENTS</th>
							<th id="th_4">REG_DATE</th>
						</tr>
					</thead>
					<tbody class="board_table_body">
						<tr>
							<td>a</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
						</tr>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
						</tr>
						<tr>
							<td>1</td>
							<td>2</td>
							<td>3</td>
							<td>4</td>
						</tr>
					</tbody>
				</table>
				
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header_scroll.js"></script>
</html>