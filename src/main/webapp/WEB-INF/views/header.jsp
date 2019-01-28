<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<div class="cbp-af-header">
	<div class="cbp-af-inner">
		<h1><a href="${pageContext.request.contextPath}">StudyRoom</a></h1>
		<nav>
			<a href="${pageContext.request.contextPath }/board/boardList">Board</a>
			<a href="${pageContext.request.contextPath}/studyRoom/locationMap">LocationMap</a>
			<a href="${pageContext.request.contextPath }/hotBook/hotBookList">HotBook</a>
		
			<c:choose>
			<c:when test="${sessionScope.token == null}">
				<a href="#" class="kko_login_btn">Login</a>
			</c:when>
			<c:when test="${sessionScope.token != null}">
				<a href="#" class="kko_logout_btn">Logout</a>
			</c:when>
			</c:choose>
		</nav>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/script/kko_login_out.js"></script>
