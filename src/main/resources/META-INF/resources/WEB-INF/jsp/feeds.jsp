<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="fragments/header.jsp" />
<body>
	<div class="container">
		<c:if test="${not empty msg}">
			<div class="alert alert-${css} alert-dismissible" role="alert">
				<button type="button" class="close" data-dismiss="alert" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<strong>${msg}</strong>
			</div>
		</c:if>
		<div class="row col-md-offset-4">
			<h2>XML RSS Feeds</h1>
			<br>
			<c:choose>
				<c:when test="${not empty feeds}">
					<h4>Please find the list of all available feeds</h4>
				</c:when>    
				<c:otherwise>
					<h4>Currently there are no saved feeds</h4>
				</c:otherwise>
			</c:choose>
			<div class="list-group col-md-6">
				<c:forEach var="feed" items="${feeds}">
					<a href="/feed/${feed.id}" class="list-group-item">
						${feed.feedName} <span class="badge">${fn:length(feed.items)}</span>
					</a>
				</c:forEach>
			</div>
		</div>
		<div class="row col-md-offset-4">
			<button class="btn btn-primary" onclick="location.href='/feed/new'">Add feed</button>
		</div>
	</div>
	
<jsp:include page="fragments/footer.jsp" />
</body>
</html>