Kakao.init('8c48f92b49340045d7e1418ebcdc558a');
$('.kko_login_btn').click(function(){
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	var path = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	path += '/visitor/login';
	//로그인 창 띄우기
	Kakao.Auth.loginForm({
		persistAccessToken:false,
		success: function(authObj){
			
			Kakao.API.request({
				url: '/v2/user/me', 
				success: function(res){
					$.ajax({
						url: path,
						type: 'POST',
						data: {
							token: authObj.access_token,
							id: res.id,
							nickname: res.properties.nickname
						},
						success:function(result){
							/*console.log(result);*/
							location.reload();
						},
						error:function(){
							alert('Login Fail');
						}
					});
					
				},
				fail: function(error){
					alert(JSON.stringify(error));
				}
			})
			
		},
		fail: function(err){
			alert(JSON.stringify(err));
		}

	});

});
$('.kko_logout_btn').click(function(){
	var hostIndex = location.href.indexOf( location.host ) + location.host.length;
	var path = location.href.substring( hostIndex, location.href.indexOf('/', hostIndex + 1) );
	path += '/visitor/logout';
	if('${token}==null'){
		$.ajax({
			url: path,
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

