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
<link rel="stylesheet" href="resource/assets/css/markscard1.css">
</head>
<body>


	<%
	session = request.getSession();
	ArrayList<Book> allBooks = Book.getAllBooks();
	%>

	<%-- <%
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
	%> --%>
	<div class="container">
      <h2 align="center">Books Available to Purchase</h2><br><br>
      <table>
        <thead>
          <tr>
            
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Get Cost</th>
            
          <tr>  
        </thead>
        <!-- <tbody>
          <tr> -->
            <%
	for (Book curbook : allBooks) {
	%>
	<tbody>
          <tr>
	<th>
		
		<%=curbook.getBid()%></th>
	
		
		<th><%=curbook.getCost()%></th>
	<th>
		
		<%=curbook.getBname()%></th>

		 </tr>
          
        </tbody>
	
	<%
	}
	%>
            
         <!--  </tr>
          
        </tbody> -->
    
      
      </table>
      <br><br>
      <a href="Logout">Logout</a>
      <span style="margin: 0 175px"> </span>
<a href="Menu.jsp">Back To Menu</a>
    </div>
	
	<form action="purchaseBook" method="post">
	
		<label>Enter All Book ID's you want to Purchase (Comma Separated): </label>
		<input type="text" name="booksList" required>
		
		<input type="submit">
	
	</form>

</body>
</html>