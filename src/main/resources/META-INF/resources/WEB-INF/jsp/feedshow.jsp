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
			<div class="row">
				<div class="col-sm-12"><h2>${feed.feedName}</h2></div>
			</div>
			<div class="row">
				<label class="col-sm-2">Url</label>
				<div class="col-sm-6">${feed.url}</div>
			</div>
			<div class="row">
				<label class="col-sm-2">Title</label>
				<div class="col-sm-6">${feed.title}</div>
			</div>
			<div class="row">
				<label class="col-sm-2">Published</label>
				<div class="col-sm-6">
				<fmt:formatDate value="${feed.lastUpdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</div>
			</div>
			<div class="row">
				<label class="col-sm-2">Article count</label>
				<div class="col-sm-6">${fn:length(feed.items)}</div>
			</div>
			<div class="row btn-group col-md-12" role="group" aria-label="Controls">
				<button class="btn btn-primary col-sm-4 col-md-2" onclick="location.href='/feed/edit/${feed.id}'">Edit</button>
				<button class="btn btn-success col-sm-4 col-md-2" onclick="location.href='/feed/fetchItems/${feed.id}'">Synchronize</button>
				<button class="btn btn-danger col-sm-4 col-md-2" onclick="location.href='/feed/delete/${feed.id}'">Delete</button>
			</div>
		</div>
		<h3>Latest articles</h3>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Title </th>
					<th>Published</th>
					<th>Link</th>
				</tr>
			</thead>
			<c:forEach begin="0" end="4" var="item" items="${feed.items}">
				<tr>
					<td>${item.title}</td>
					<td>
						<fmt:formatDate value="${item.published}" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
					<td><button class="btn btn-primary" onclick="location.href='${item.link}'">Read</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
<jsp:include page="fragments/footer.jsp" />
</body>
</html>









