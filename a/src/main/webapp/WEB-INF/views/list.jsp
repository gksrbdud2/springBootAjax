<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Listaaa</title>
</head>
<body>

	<div class="container">
		<table class="table table-hover">
			<tr>
				<th>No</th>
				<th>Subject</th>
				<th>Content</th>
				<th>Date</th>
			</tr>
			 <c:forEach var="l" items="${list}">
			 	<tr>
			 		<td>${l.id}</td>
			 		<td>${l.subject}</td>
			 		<td>${l.content}</td>
			 		<td>${l.reg_date}</td>
			 	</tr>
			 </c:forEach>
		</table>
	</div>
<%@ include file="bootstrap.jsp" %>
</body>
</html>