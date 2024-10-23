<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	pageContext.setAttribute("name1", "page man");
	request.setAttribute("name2", "request man");
	session.setAttribute("name3", "session man");
	application.setAttribute("name4", "application man");
	
	System.out.println("01_firstPage.jsp");
	System.out.println("하나의 페이지 속성 : " + pageContext.getAttribute("name1"));
	System.out.println("하나의 요청 속성 : " + request.getAttribute("name2"));
	System.out.println("하나의 세션 속성 : " + session.getAttribute("name3"));
	System.out.println("하나의 어플리케이션 속성 : " + application.getAttribute("name4"));
	
	//request.getRequestDispatcher("02_secondPage.jsp").forward(request,response);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2> 01_firstPage.jsp </h2>
	하나의 페이지 속성 : <%=pageContext.getAttribute("name1") %> <br>
	하나의 요청 속성 : <%=request.getAttribute("name2") %> <br>
	하나의 세션 속성 : <%=session.getAttribute("name3") %> <br>
	하나의 어플리케이션 속성 : <%=application.getAttribute("name4") %> <br>
	
	<!-- <a href="02_secondPage.jsp"> 또 다른 페이지로 이동</a>  원래 하던거 -->
	
	<a href="02_secondPage.jsp?name2=<%=request.getAttribute("name2") %>">또 다른 페이지로 이동</a>
	
	<!-- <form id="forwardForm" method="post" action="02_secondPage.jsp" style="display:none;">
    <input type="hidden" name="name" value="<%=request.getAttribute("name2") %>">
</form>
<a href="#" onclick="document.getElementById('forwardForm').submit(); return false;">또 다른 페이지로 이동</a>
	또다른 방식으로 사라지는 요청속성값 전달하는거 구현하기 -->
	 
</body>
</html>	