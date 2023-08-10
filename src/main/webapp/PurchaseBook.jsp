<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.digit.javaTraining.LibraryManagemet.model.Book, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<%
	session = request.getSession();
	ArrayList<Book> allBooks = Book.getAllBooks();
	%>

	<%
	for (Book curBook : allBooks) {
	%>
	<p>
		Book ID:
		<%=curBook.getBid()%></p>
	<p>
		Book Name:
		<%=curBook.getBname()%>
	<p>
	<p>
		Book Amount:
		<%=curBook.getCost()%>
	</p>
	<br>
	<%
	}
	%>
	
	<form action="purchaseBook" method="post">
	
		<label>Enter All Book ID's you want to Purchase (Comma Separated): </label>
		<input type="text" name="booksList" required>
		
		<input type="submit">
	
	</form>

</body>
</html>