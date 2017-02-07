<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>

<jsp:include page="fragments/header.jsp" />

<body>
	<h2>Feeds list</h2>

	<c:if test="${not empty feeds}">

		<table>
			<tr>
				<th>Id</th>
				<th>Url</th>
				<th>Title </th>
				<th>Last update</th>
				<th>Feed name</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="feed" items="${feeds}">
			<tr>
				<td>${feed.id}</td>
				<td>${feed.url}</td>
				<td>${feed.title}</td>
				<td>${feed.lastUpdate}</td>
				<td>${feed.feedName}</td>
				<td>
					<a href="/feed/${feed.id}">View</a>
					&nbsp;&nbsp;
					<a href="/feed/edit/${feed.id}">Edit</a>
                        &nbsp;&nbsp;
                     <a href="/feed/delete/${feed.id}">Delete</a>
				</td>
			</tr>	
			</c:forEach>
		</table>

		
		<a classs="btn" href="/feed/new">Add new</a>
	</c:if>
</body>
</html>