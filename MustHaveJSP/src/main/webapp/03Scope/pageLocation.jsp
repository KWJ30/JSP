<%@page import="common.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4> LoLocation	 페이지 </h4>
	<%
		Object pInteger = pageContext.getAttribute("pageInteger");
		Object pString = pageContext.getAttribute("pageString");
		Object pPerson = pageContext.getAttribute("pagePerson");
	%>
	
	<ul>
		<li><%= (pInteger == null) ? "값 없음" : pInteger %></li>
		<li><%= (pString == null) ? "값 없음" : pString %></li>
		<li><%= (pPerson == null) ? "값 없음" : ((Person)pPerson).getName() %></li>
	</ul>
</body>
</html>