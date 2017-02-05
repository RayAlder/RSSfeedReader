<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
	<h2>Feed</h2> <a href="/">Back</a>

	<c:if test="${not empty feed}">
		<table>
			<tr>
				<th>Id</th>
				<th>Url</th>
				<th>Title </th>
				<th>Last update</th>
				<th>Feed name</th>
				<th>Actions</th>
			</tr>
			<tr>
				<td>${feed.id}</td>
				<td>${feed.url}</td>
				<td>${feed.title}</td>
				<td>${feed.lastUpdate}</td>
				<td>${feed.feedName}</td>
				<td>
					<a href="/feed/edit/${feed.id}">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="/feed/delete/${feed.id}">Delete</a>
				</td>
			</tr>	
		</table>
	</c:if>
	<c:if test="${not empty feed.items}">
		<h3>Feed items</h3>
		<table>
			<tr>
				<th>Id</th>
				<th>Title </th>
				<th>Link</th>
				<th>Description</th>
				<th>Published</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="item" items="${feed.items}">
			<tr>
				<td>${item.id}</td>
				<td>${item.title}</td>
				<td>${item.link}</td>
				<td>${item.description}</td>
				<td>${item.published}</td>
				<td>
					<a href="/item/${item.id}">View</a>
					&nbsp;&nbsp;				
					<a href="/item/edit/${item.id}">Edit</a>
                     &nbsp;&nbsp;
                     <a href="/item/delete/${item.id}">Delete</a>
				</td>
			</tr>
			</c:forEach>			
		</table>
	</c:if>
	<a classs="btn" href="/item/new">Add new</a>
</body>
</html>