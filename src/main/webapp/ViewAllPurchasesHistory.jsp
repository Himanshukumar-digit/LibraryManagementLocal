<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
	import="com.digit.javaTraining.LibraryManagemet.model.PurchaseHistory, java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	ArrayList<PurchaseHistory> allPurchasesHistory = PurchaseHistory.getAllPurchasesHistory();
	%>

	<%
	for (PurchaseHistory curPur : allPurchasesHistory) {
	%>
	<h1>
		Purchase ID:
		<%=curPur.getPid()%></h1>
	<h1>
		BookID:
		<%=curPur.getBook_id()%></h1>
	<h1>
		BookName:
		<%=curPur.getBname()%></h1>
	<h1>
		UID:
		<%=curPur.getUid()%></h1>
	<br>
	<%
	}
	%>

</body>
</html>