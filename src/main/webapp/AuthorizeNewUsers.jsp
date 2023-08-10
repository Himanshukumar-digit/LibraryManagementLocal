<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.digit.javaTraining.LibraryManagemet.model.User, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <meta name="Keywords" content="html, css, html tables, table">
    <meta name="Description" content="html table">
<title>Insert title here</title>
<link rel="stylesheet" href="resource/assets/css/markscard.css">
</head>
<body>

	<%
	session = request.getSession();
	int curIndex = (session.getAttribute("curIndex") != null) ? (int) session.getAttribute("curIndex") : 0;

	if (session.getAttribute("allUnAuthorizedUsers") == null) {
		ArrayList<User> allUnAuthorizedUsers = User.getAllUnAuthorizedUsers();
		if (allUnAuthorizedUsers.size() == 0) {
			response.sendRedirect("/LibraryManagementLocal/admin.html");
			return;
		}
		session.setAttribute("allUnAuthorizedUsers", allUnAuthorizedUsers);
	}

	ArrayList<User> allUnAuthorizedUsers = (ArrayList<User>) session.getAttribute("allUnAuthorizedUsers");

	if (curIndex >= allUnAuthorizedUsers.size()) {
		session.removeAttribute("curIndex");
		session.removeAttribute("allUnAuthorizedUsers");
		response.sendRedirect("/LibraryManagementLocal/admin.html");
		return;
	}

	User curUser = allUnAuthorizedUsers.get(curIndex);
	curIndex++;
	session.setAttribute("curIndex", curIndex);
	%>
	
	
	<%-- <h1>Current User</h1>
	<p>
		User ID:
		<%=curUser.getUid()%></p>
	<p>
		User Name:
		<%=curUser.getUname()%></p>
	<p>
		User Address:
		<%=curUser.getAddr()%></p>
	<p>
		User Phone:
		<%=curUser.getPhone()%></p>
	<p>
		User Email:
		<%=curUser.getEmail()%></p>
	<br>
 --%>
 <div class="container">
      <h2 align="center">Current User</h2><br><br>
      <table>
        <thead>
          <tr>
            <th>User ID</th>
            <th>User Name</th>
            <th>User Address</th>
            <th>User Phone</th>
            <th>User Email</th>
            
          <tr>  
        </thead>
        <!-- <tbody>
          <tr> -->
 
	<tbody>
          <tr>
	<th>
		
		<%=curUser.getUid()%></th>
	
		
		<th><%=curUser.getUname()%></th>
	<th>
		
		<%=curUser.getAddr()%></th>
	<th>
		
		<%=curUser.getPhone()%></th>
		<th>
		
		<%=curUser.getEmail()%></th>
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
	<form action="authorizeNewUser" method="post">

		<select id="operation" name="operation">
			<option value="Approve">Approve Request</option>
			<option value="Skip">Skip Request</option>
		</select> <input type="submit">

	</form>

</body>
</html>