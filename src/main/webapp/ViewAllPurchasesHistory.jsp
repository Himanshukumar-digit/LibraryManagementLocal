<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.digit.javaTraining.LibraryManagemet.model.PurchaseHistory, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="Keywords" content="html, css, html tables, table">
    <meta name="Description" content="html table">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/assets/css/markscard1.css">
</head>
<body>

	<%
	ArrayList<PurchaseHistory> allPurchasesHistory = PurchaseHistory.getAllPurchasesHistory();
	%>

	<div class="container">
      <h2 align="center">Purchase History</h2><br><br>
      <table>
        <thead>
          <tr>
            <th>Purchase ID</th>
            <th>BookID</th>
            <th>BookName</th>
            <th>UID</th>
            
          <tr>  
        </thead>
        <!-- <tbody>
          <tr> -->
            <%
	for (PurchaseHistory curPur : allPurchasesHistory) {
	%>
	<tbody>
          <tr>
	<th>
		
		<%=curPur.getPid()%></th>
	
		
		<th><%=curPur.getBook_id()%></th>
	<th>
		
		<%=curPur.getBname()%></th>
	<th>
		
		<%=curPur.getUid()%></th>
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

</body>
</html>