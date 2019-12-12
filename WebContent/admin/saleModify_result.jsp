<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		response.sendRedirect("index.jsp?content=ReSaleSearch.rcd"); // 다시 Main으로 돌려보내준다.
	%>
</body>
<Script>
	histroy.back;
</Script>
</html>