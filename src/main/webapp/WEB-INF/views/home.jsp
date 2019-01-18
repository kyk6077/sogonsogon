<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<title>Home</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<style type="text/css">
	.main_container {
		width:100%;
		margin-top: 15em;
		margin-bottom: 200px;
	}
</style>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/header_scroll.js"></script>

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
$(function(){
	Kakao.init('8c48f92b49340045d7e1418ebcdc558a');
	$('.kko_login_btn').click(function(){
		//로그인 창 띄우기
		Kakao.Auth.loginForm({
			persistAccessToken:false,
			success: function(authObj){
				//console.log(JSON.stringify(authObj.access_token))
				
				$.ajax({
					url: './visitor/login',
					type: 'POST',
					data: {
						token: authObj.access_token
					},
					success:function(result){
						console.log(result);
						location.reload();
					},
					error:function(){
						alert('Login Fail');
					}
				});
			},
			fail: function(err){
				alert(JSON.stringify(err));
			}
			
		});
		
	});
	$('.kko_logout_btn').click(function(){
		if('${token}==null'){
			$.ajax({
				url: './visitor/logout',
				type: 'POST',
				success:function(result){
					location.reload();
				},
				error:function(){
					alert('Login Fail');
				}
			});
		}else{
			alert('세션이 만료되었습니다.');
			location.reload();
		}
		
	});
	
	
});

</script>
</head>


<body>
	<div class="container">
		<c:import url="./header.jsp"/>
		<div class="main_container">
			Index
		</div>
	</div>
</body>
</html>


