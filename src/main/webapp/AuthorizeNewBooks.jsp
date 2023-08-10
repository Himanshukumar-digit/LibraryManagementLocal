<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.digit.javaTraining.LibraryManagemet.model.Book, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="Keywords" content="html, css, html tables, table">
    <meta name="Description" content="html table">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/assets/css/markscard2.css">
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

	<!-- <h1>Current Book</h1> -->
	<%-- <p>
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
	<br> --%>
	<div class="container">
      <h2 align="center">Current Book</h2><br><br>
      <table>
        <thead>
          <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Book Author</th>
            <th>Book Cost</th>
            <th>Book Category</th>
            
          <tr>  
        </thead>
        <!-- <tbody>
          <tr> -->
 
	<tbody>
          <tr>
	<th>
		
		<%=curBook.getBid()%></th>
	
		
		<th><%=curBook.getBname()%></th>
	<th>
		
		<%=curBook.getAuthor()%></th>
	<th>
		
		<%=curBook.getCost()%></th>
		<th>
		
		<%=curBook.getCategory()%></th>
		 </tr>
          
        </tbody>
	
            
         <!--  </tr>
          
        </tbody> -->
    
      
      </table>
      <br><br>
      <a href="Logout">Logout</a>
      <span style="margin: 0 175px"> </span>
<a href="admin.html">Back To Menu</a>
    </div>

	<h3>Manage Request</h3>
	<form action="authorizeNewBook" method="post">

		<select id="operation" name="operation">
			<option value="Approve">Approve Request</option>
			<option value="Skip">Skip Request</option>
		</select> <input type="submit">

	</form>

</body>
</html>