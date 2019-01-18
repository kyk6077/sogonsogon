<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="cbp-af-header">
	<div class="cbp-af-inner">
		<h1><a href="${pageContext.request.contextPath}">StudyRoom</a></h1>
		<nav>
			<a href="${pageContext.request.contextPath }/board/boardList">Board</a>
			<a href="${pageContext.request.contextPath}/studyroom/locationMap">LocationMap</a>
			<a href="${pageContext.request.contextPath }/hotBook/hotBookList">HotBook</a>
		
				<!-- <a href="#" class="kko_login_btn">Login</a>
				<a href="#" class="kko_logout_btn">Logout</a> -->
			<c:choose>
			<c:when test="${token == null}">
				<a href="#" class="kko_login_btn">Login</a>
			</c:when>
			<c:when test="${token != null}">
				<a href="#" class="kko_logout_btn">Logout</a>
			</c:when>
			</c:choose>
		</nav>
	</div>
</div>