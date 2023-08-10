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
	int curIndex = (session.getAttribute("curIndex") != null) ? (int) session.getAttribute("curIndex") : 0;

	if (session.getAttribute("allUnAuthorizedBooks") == null) {
		ArrayList<Book> allUnAuthorizedBooks = Book.getAllUnAuthorizedBooks();
		session.setAttribute("allUnAuthorizedBooks", allUnAuthorizedBooks);
	}

	ArrayList<Book> allUnAuthorizedBooks = (ArrayList<Book>) session.getAttribute("allUnAuthorizedBooks");

	if (curIndex >= allUnAuthorizedBooks.size()) {
		session.removeAttribute("curIndex");
		session.removeAttribute("allUnAuthorizedBooks");
		response.sendRedirect("/LibraryManagementLocal/admin.html");
		return;
	}

	Book curBook = allUnAuthorizedBooks.get(curIndex);
	curIndex++;
	session.setAttribute("curIndex", curIndex);
	%>

	<h1>Current Book</h1>
	<p>
		Book ID:
		<%=curBook.getBid()%></p>
	<p>
		Book Name:
		<%=curBook.getBname()%></p>
	<p>
		Book Author:
		<%=curBook.getAuthor()%></p>
	<p>
		Book Cost:
		<%=curBook.getCost()%></p>
	<p>
		Book Category:
		<%=curBook.getCategory()%></p>
	<br>

	<h3>Manage Request</h3>
	<form action="authorizeNewBook" method="post">

		<select id="operation" name="operation">
			<option value="Approve">Approve Request</option>
			<option value="Skip">Skip Request</option>
		</select> <input type="submit">

	</form>

</body>
</html>