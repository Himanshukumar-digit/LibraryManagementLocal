<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.digit.javaTraining.LibraryManagemet.model.Subscription, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	ArrayList<Subscription> allSubscriptions = Subscription.getAllSubscriptions();
	%>

	<%
	for (Subscription curSub : allSubscriptions) { %>
		<h1>Subscription ID: <%=curSub.getSub_id()%></h1>
		<h1>Subscription Amount: <%=curSub.getAmount()%></h1>
	<%
	}
	%>

</body>
</html>