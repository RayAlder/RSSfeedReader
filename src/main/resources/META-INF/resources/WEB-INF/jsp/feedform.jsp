<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Feed</title>
</head>
<body>
    <div align="center">
        <h1>New/Edit Feed</h1>
        <form:form action="/feed" method="post" modelAttribute="feed">
        <table>
            <form:hidden path="id"/>
		
			<form:hidden path="feedName"/>
            <tr>
                <td>Url:</td>
                <td><form:input path="url" /></td>
            </tr>
            <tr>
                <td>Title:</td>
                <td><form:input path="title" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>