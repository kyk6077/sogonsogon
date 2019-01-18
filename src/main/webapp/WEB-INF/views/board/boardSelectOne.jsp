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
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header_scroll.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.main_container {
		width:100%;
		margin-top: 18em;
		margin-bottom: 200px;
		background: #f6f6f6;
		padding: 15px;
		min-width: 600px;
	}
	.board_info_row{
		min-width: 600px;
		border: 1px #eeeeee inset;
		background-color: #8c8c8c;
	
	}
	.board_info_title{
		text-align: center;
	}
	.info_header{
		border-bottom:2px double #f9f9f9;
		padding: 10px;
		color: #f5f5f5;
	}
	.info_header>p{
		font-size: 2rem;
	}
	.board_title{
		font-weight: bolder;
		text-align: center;
	}
	.info_header>span{
		font-size: 1.8rem;
	}
	.info_date{
		float: right;
	}
	
	.info_body{
		color:#f5f5f5;
		padding: 10px;
		min-height: 400px;
	}
	.info_body>p{
		font-size: 1.8rem;
	}
	.info_footer{
		min-height: 60px;
		padding: 15px;
		line-height:28px;
		background-color: #ffffff;
	}
	.info_button_row{
		text-align: right;
		float: right;
	}
	.info_button_row button{
		min-width: 8rem;
	}
	.board_comments{
		cursor: pointer;
		color:#5a9216;
	}
	.comment_row{
		width:100%;
		min-width:600px;
		margin-top: 10px;
		border: 1px solid #b3b3b3;
	}
	.comment_header{
		background-color: white
	}
	#comment_writer{
		padding:10px;
		width:100%;
		border: none;
	}
	#comment_contents{
		width:100%;
		resize:none;
		border: none;
		padding: 10px;
	}
	.comment_bottom{
		min-height: 50px;
		border-top: 1px dotted #c2c2c2;
		background-color: white;
	}
	.comment_insert{
		min-height:49px;
	    float: right;
	    background-color: #5a9216;
	    border: none;
	    color: #F1F1F1;
	    width: 80px;
	}
	.comment_view{
		display:none;
		margin-top: 10px;
		padding: 10px;
	}
	.comment_view_body{
		margin-top: 5px;
	}
	.comment_input_update{
		display:none;
	}
	.comment_view_footer{
		margin-top: 3px;
	}
	.comment_view_writer{
		font-size: 14px;
		font-weight: 700;
	}
	.comment_button_row{
		display: inline-block;
		float: right;
		word-spacing: 2px;
	}
	.myComment_update{
		cursor: pointer;
		color:#5a9216;
	}
	.myComment_delete{
		cursor: pointer;
		color:#5a9216;
		margin-left: 5px;
	}
	.comment_list{
		margin-top: 10px;
		padding:5px;
		border-bottom: 1px solid white;
	}
	.comment_page{
		margin-top: 20px;
		text-align: center;
	}
	.pagebtn{
		padding:10px;
		font-weight: 700;
		cursor: pointer;
	}
	.comment_view{
		min-width: 600px;
	}
	.comment_list{
		min-width: 600px;
	}
</style>
<script type="text/javascript">
$(function(){
	
	$('.boardList_btn').on('click',function(){
		location.href = "./boardList";
	});
	
	$('.boardUpdate_btn').on('click',function(){
		location.href = "./boardUpdate?bnum="+${boardDTO.bnum};
	});
	
	$('.boardDelete_btn').on('click',function(){
		$.ajax({
			url:"./boardDelete",
			data:{
				bnum: ${boardDTO.bnum}
			},
			type:'POST',
			success:function(data){
				if(data==1){
					alert('delete Success');
					location.href = "./boardList";
				}else{
					alert('Delete Fail');
				}	
			},
			error:function(){
				alert('Delete Fail');
			}
			
		});
	
	});
	
	$('.board_comments').on('click',function(){
		if($('.comment_view').css('display') == 'none'){
			$('.comment_view').show();
			getCommentList();
			
		}else{
			$('.comment_view').hide();
		}
		
		
		
	});
	
	$('.comment_insert').on('click',function(){
		$.ajax({
			url:"../comments/commentsInsert",
			type:"POST",
			data:{
				writer:$('#comment_writer').val(),
				contents:$('#comment_contents').val(),
				bnum: ${boardDTO.bnum}
			},success:function(data){
				if(data==1){
					getCommentList();
					$('#comment_contents').val("");
					$('#comment_writer').val("");
				}else{
					alert('댓글 등록 실패');
				}
			},error:function(){
				alert('댓글 입력 실패');
			}
				
				
		});
		
	});
	
	$('.comment_view').on('click','.myComment_update',function(){
		var target_num = $(this).attr("title");
		if($('#t'+target_num).css('display') == 'none'){
			var content_ = $('#c'+target_num).html();
			$('#c'+target_num).hide();
			$('#t'+target_num).show();
			$('#t'+target_num).val(content_);
		}else{
			var content_ = $('#t'+target_num).val();
			$.ajax({
				url:"../comments/commentsUpdate",
				type:"POST",
				data:{
					contents:content_,
					cnum:target_num
				},success:function(data){
					if(data==1){
						$('#c'+target_num).show();
						$('#t'+target_num).hide();
						$('#c'+target_num).html(content_);
					}else{
						alert('수정 실패');
					}
				},error:function(){
					alert('수정 실패');
				}
			})
			
		}
		
	});
	
	$('.comment_view').on('click','.myComment_delete',function(){
		var target_num = $(this).attr("title");
		$.ajax({
			url:"../comments/commentsDelete",
			type:"POST",
			data:{
				cnum:target_num
			},
			success:function(data){
				if(data==1){
					getCommentList();
				}else{
					alert('삭제 실패');
				}
			},
			error:function(){
				alert('삭제 실패');
			}
		});
		
	});

	$('.comment_view').on('click','.pagebtn',function(){
		var page = $(this).attr("title");
		
		if(page.slice(0,1)=='s'){
			page = page.slice(1)*1-1;
		}else if(page.slice(0,1)=='l'){
			page = page.slice(1)*1+1;
		}else{
			page = page*1;
		}
		getCommentList(page);
	});
	
	function getCommentList(){
		$.ajax({
			url:"../comments/commentsList",
			type:"GET",
			data:{
				bnum: ${boardDTO.bnum}
			},success:function(data){
				console.log(data);
				makeCommentView(data.comments_list);
				makeCommentPage(data.comments_pager);
			},error:function(){
				alert('리스트 실패');
			}
		
		});
	}
	
	function getCommentList(page){
		$.ajax({
			url:"../comments/commentsList",
			type:"GET",
			data:{
				curPage: page,
				bnum: ${boardDTO.bnum}
			},success:function(data){
				console.log(data);
				makeCommentView(data.comments_list);
				makeCommentPage(data.comments_pager);
			},error:function(){
				alert('리스트 실패');
			}
		
		});
	}
	
	
	function makeCommentView(comments_list){
		$('.comment_view').html("");
		comments_list.forEach(function(currnetValue, index, array){
			var date = new Date(currnetValue.reg_date).toISOString().slice(0,10);
			var view = '<div class="comment_list"><div class="comment_view_header">'; 	
			view += '<span class="comment_view_writer">'+currnetValue.writer+'</span>';
			view += '</div><div class="comment_view_body">';
			view += '<span class="comment_view_contents" id="c'+currnetValue.cnum+'">'+currnetValue.contents+'</span>';
			view += '<textarea class="comment_input_update" id="t'+currnetValue.cnum+'" rows="3" cols="30">'+currnetValue.contents+'</textarea>'
			view += '</div><div class="comment_view_footer">';
			view += '<span class="comment_view_reg_date">'+date+'</span>';
			view += '<div class="comment_button_row"><span class="myComment_update" title="'+currnetValue.cnum+'">수정</span>';
			view += '<span class="myComment_delete" title="'+currnetValue.cnum+'">삭제</span></div></div></div>';
			$('.comment_view').append(view);
		});
	}
	
	function makeCommentPage(pager){
		var pageView = '<div class="comment_page">';
		var startNum = pager.startNum;
		var lastNum = pager.lastNum;
		if(startNum>1){
			pageView += '<span class="glyphicon glyphicon-chevron-left pagebtn" title="s'+startNum+'"></span>'
		}
		for(var i=startNum;i<=lastNum;i++){
			pageView += '<span class="pagebtn" title="'+i+'">'+i+'</span>';
		}
		if(pager.curBlock < pager.totalBlock){
			pageView += '<span class="glyphicon glyphicon-chevron-right pagebtn" title="l'+lastNum+'"></span>'
		}
		pageView +=	'</div>';
		$('.comment_view').append(pageView);
	}
	
});
</script>
</head>
<body>
	<div class="container">
		<c:import url="../header.jsp"/>
		<div class="main_container">
			<h1 class="board_info_title">자유게시판.</h1>
			<div class="board_info_row">
				<div class="info_header">
					<p class="board_title">${boardDTO.title}</p>
					<span class="glyphicon glyphicon-user"> ${boardDTO.writer}</span>
					<p class="info_date">${boardDTO.reg_date}</p>
				</div>
				<div class="info_body">
					<p>${boardDTO.contents}</p>
				</div>
				<div class="info_footer">
					<span class="board_comments">댓글 ${commentsCount} | </span>
					조회수 ${boardDTO.hit}
					<div class="info_button_row">
						<button class="boardList_btn">목록</button>
						<button class="boardUpdate_btn">수정</button>
						<button class="boardDelete_btn">삭제</button>
					</div>
				</div>
				
			</div>
			
			
			<div class="comment_row">
				<!-- <p class="comment_writer">writer1</p> -->
				<input type="text" id="comment_writer" name="writer" placeholder="writer">
				<div class="comment_header">
					<textarea placeholder="comment" rows="3" cols="30" id="comment_contents" name="comment_contents"></textarea>
				</div>
				<div class="comment_bottom">
					<button class="comment_insert">등록</button>
				</div>
			</div>
			
			<div class="comment_view"></div>
		</div>
	</div>
</body>
</html>