<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Feed properties</title>
</head>

<jsp:include page="fragments/header.jsp" />

<body>
    <div align="center">
		<c:choose>
			<c:when test="${feed.id gt 0}">
				<h1>Edit Feed</h1>
			</c:when>    
			<c:otherwise>
				<h1>Add Feed</h1>
			</c:otherwise>
		</c:choose>
		<table>
			<form:form action="/feed" method="post" commandName="feed" modelAttribute="feed">
				<form:hidden path="id"/>
				<form:hidden path="title"/>
				<form:hidden path="items"/>
				<form:hidden path="lastUpdate"/>
				<spring:bind path="url">
					<tr>  
						<td>Url: </td> <td><form:input  path="url"/> </td><td><form:errors path="url" /></td>
					</tr>
				</spring:bind>					
				<spring:bind path="feedName">
					<tr> 
						<td>Feed name: </td> <td><form:input path="feedName"/> </td><td><form:errors path="feedName" /></td>
					</tr>  
				</spring:bind>
				<tr> 
					<td colspan=2> <input type="submit"> </td> 
				</tr>
			</form:form>
		</table>
		<!--
		<spring:hasBindErrors name="feed">
			<c:forEach var="error" items="${errors.allErrors}">
				<b><spring:message message="${error}" /></b>
				<br />
			</c:forEach>
		</spring:hasBindErrors>
		-->
    </div>
</body>
</html>