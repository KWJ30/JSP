<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> 03_thirdPage.jsp </h2>
	하나의 페이지 속성 : <%=pageContext.getAttribute("name1") %> <br>
	하나의 요청 속성 : <%=request.getAttribute("name2") %> <br>
	하나의 세션 속성 : <%=session.getAttribute("name3") %> <br>
	하나의 어플리케이션 속성 : <%=application.getAttribute("name4") %> <br>
	
	
</body>
</html>	