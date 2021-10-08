<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>
</head>
<body>

	<h3>View Books</h3>
	<table>
		<tr>
			<th>Acc. Number</th>
			<th>Title</th>
			<th>Author</th>
			<th>Status</th>
		</tr>
		<c:forEach items="${listBooks}" var="book">
			<tr>
				<td><c:out value="${book.bookAccessionNumber}" /></td>
				<td><c:out value="${book.bookTitle}" /></td>
				<td><c:out value="${book.bookAuthor}" /></td>
				<td><c:out value="${book.bookStatus}" /></td>
			</tr>
		</c:forEach>
	</table>
	
	<a href="/SpringMVCProject/homepage-member">
        <button type="submit">Done</button>
    </a>

</body>
</html>