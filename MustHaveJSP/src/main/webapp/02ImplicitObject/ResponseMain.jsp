<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 1. 로그인 폼 </h2>
	
	
	<form method="post" action="./ResponseLogin.jsp">
		아이디: <input type="text" name="user_id" value="<%= request.getParameter("user_id") != null ? request.getParameter("user_id") : "" %>" /><br>
		패스워드: <input type="password" name="user_pwd" value="" /><br>
		<input type="submit" value="로그인" />
	</form>
	
	<%
		String loginErr = request.getParameter("loginErr");
		if(loginErr != null) out.print("<span style='color: red; font-weight: bold;'>아이디(로그인 전화번호, 로그인 전용 아이디) 또는 비밀번호가 잘못 되었습니다. 아이디와 비밀번호를 정확히 입력해 주세요.</span>");
		//out.print(request.getParameter("user_id"));
		if(session.getAttribute("loginAttempts") != null) out.print("<span>로그인 시도 횟수: " + session.getAttribute("loginAttempts") + "</span>");
	%>
	
	
	
	<h2> 2.HTTP 응답 헤더 설정하기</h2>
	<form action="./ResponseHeader.jsp" method="get">
		날짜 형식: <input type="text" name="add_date" value="2021-10-25 09:00" /><br>
		숫자 형식: <input type="text" name="add_int" value="8282" /><br>
		문자 형식: <input type="text" name="add_str" value="홍길동" /><br>
		<input type="submit" value="응답 헤더 설정 & 출력" />
	</form>

</body>
</html>