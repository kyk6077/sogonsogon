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
<style type="text/css">	
	.main_container {
		width:100%;
		margin-top: 15em;
		margin-bottom: 200px;
	}
	#board_table{
		width: 100%;
		border: 1px solid #d7d5d5;
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
		border-top: 1px solid #d7d5d5;
		border: 1px solid #d7d5d5;
	}
	#board_write{
		min-width: 70px;
		min-height: 38px;
		margin-top: 10px;
		background-color: black;
		color: white;
		border:0 none;
	}
	.board_table_body td{
		overflow: hidden;
		line-height: 40px;
	}
	.tb_1{
		text-align: center;
	}
	.tb_2{
		padding-left: 10px;
	}
	.tb_3{
		padding-left: 10px;
	}
	.tb_4{
		text-align: center;
	}
	.tb_5{
		text-align: center;
	}
	
</style>
<script type="text/javascript">
$(function(){
	
	$('#board_write').click(function(){
		location.href = "./boardInsert";
	});
	
	
});
</script>
</head>
<body>
	<div class="container">
		<c:import url="../header.jsp"/>
		<div class="main_container">
			<h1>Board List</h1>
			<div class="row_table">
				<table id="board_table">
					<thead class="board_table_header">
						<tr>
							<th id="th_1">NUM</th>
							<th id="th_2">WRITER</th>
							<th id="th_3">TITLE</th>
							<th id="th_4">REG_DATE</th>
							<th id="th_5">HIT</th>
						</tr>
					</thead>
					<tbody class="board_table_body">
						<c:forEach items="${list}" var="dto">
						<tr>
							<td class="tb_1">${dto.bnum}</td>
							<td class="tb_2">${dto.writer}</td>
							<td class="tb_3"><a href="boardSelectOne?bnum=${dto.bnum}">${dto.title}</a></td>
							<td class="tb_4">${dto.reg_date}</td>
							<td class="tb_5">${dto.hit}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<c:if test="${token!=null}">
					<input type="button" id="board_write" value="Write"/>
				</c:if>
			</div>
			
			<div class="row_pager">
					<ul class="pagination">
					
						<c:if test="${pager.startNum > 1}">
							<li><a
								href="./boardList?curPage=${pager.startNum-1}&search=${pager.search}&kind=${pager.kind}"><span
									class="glyphicon glyphicon-chevron-left"></span></a></li>
						</c:if>
						
							<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="p" >
								<c:if test="${pager.lastNum == pager.totalPage}">
								<li><a
									href="./boardList?curPage=${p}&search=${pager.search}&kind=${pager.kind}">${p}</a></li>
								</c:if>
							</c:forEach>
					
						
						<c:if test="${pager.curBlock < pager.totalBlock}">
							<li><a
								href="./boardList?curPage=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}"><span
									class="glyphicon glyphicon-chevron-right"></span></a></li>
						</c:if>
					</ul>
				</div>


				<div class="Row_search">
					검색어
					<form class="form-inline" action="./boardList">
						<div class="form-group">
							<select class="form-control" id="menu2" name="kind">
								<option>writer</option>
								<option>title</option>
								<option>contents</option>
							</select> <input type="text" class="form-control" id="search"
								placeholder="Search keyWord" name="search">
						</div>
						<button type="submit" class="btn btn-default">Search</button>
					</form>
				</div>
			
		</div>
	</div>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header_scroll.js"></script>
</html>