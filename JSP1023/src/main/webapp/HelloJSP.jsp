<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String str1 = "JSP";
String str2 = "안녕";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> HelloJSP </title>
</head>
<body>
	<h2> 다시 처음부터 </h2>
	<p> <%=str1 + str2 %> </p>
	<p> <% System.out.println(str1+str2); %></p>
	<p> <% out.println(str1 + str2); %> </p>
</body>
</html>