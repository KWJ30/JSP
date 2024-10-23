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
try{
int myAge = Integer.parseInt(request.getParameter("age"))+10;
//request.getParameter()를 사용하는 경우, 반드시 클라이언트 측에서 어떤 방식으로든 데이터를 전송해야 합니다.
out.println("나이: " + myAge);
}
catch(Exception e){
	out.println("예외 발생");
}
%>
<!--  %="나이: "+ myAge %> -->
</body>
</html>