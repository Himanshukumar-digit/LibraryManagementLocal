<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.digit.javaTraining.LibraryManagemet.model.User, java.util.ArrayList"%>
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
	
	
	<h1>Current User</h1>
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

	<h3>Manage Request</h3>
	<form action="authorizeNewUser" method="post">

		<select id="operation" name="operation">
			<option value="Approve">Approve Request</option>
			<option value="Skip">Skip Request</option>
		</select> <input type="submit">

	</form>

</body>
</html>