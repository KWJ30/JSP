<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2> 2. 쿠키값 확인하기(쿠키가 생성된 이후의 페이지) </h2>
	<%
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie c : cookies) {
			String cookieName = c.getName();
			String cookieValue = c.getValue();
			int cookieAge = c.getMaxAge();
			out.println(String.format("%s : %s <br/>", cookieName, cookieValue));
			out.println(String.format("유효시간: %d초<br/>", cookieAge));
		}
	}
	%>
</body>
</html>