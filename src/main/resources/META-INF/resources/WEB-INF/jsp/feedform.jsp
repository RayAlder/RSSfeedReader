<%@ page session="false"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<jsp:include page="fragments/header.jsp" />
<body>
	<div class="container">
		<c:choose>
			<c:when test="${feedForm.id gt 0}">
				<h1>Edit Feed</h1>
			</c:when>    
			<c:otherwise>
				<h1>Add Feed</h1>
			</c:otherwise>
		</c:choose>
	
		<form:form class="form-horizontal" method="post" modelAttribute="feedForm" action="/feed">

			<form:hidden path="id"/>
			<form:hidden path="title"/>
			<form:hidden path="items"/>
			<form:hidden path="lastUpdate"/>

			<spring:bind path="feedName">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Feed Name</label>
					<div class="col-sm-10">
						<form:input path="feedName" type="text" class="form-control" id="feedNname" placeholder="Feed name"/>
						<form:errors path="feedName" class="control-label"/>
					</div>
				</div>
			</spring:bind>
			
			<spring:bind path="url">
				<div class="form-group ${status.error ? 'has-error' : ''}">
					<label class="col-sm-2 control-label">Url</label>
					<div class="col-sm-10">
						<form:input path="url" type="text" class="form-control" placeholder="url"/>
						<form:errors path="url" class="control-label"/>
					</div>
				</div>
			</spring:bind>
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-success pull-right">Submit</button>
				</div>
			</div>
		</form:form>
	</div>
	
<jsp:include page="fragments/footer.jsp" />
</body>
</html>