<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 1. 클라와 서버의 환경정보 읽기 </h2>
	<a href="./RequestWebInfo.jsp?eng=Hello&han=안녕">
	GET 방식 전송
	</a> <br/>
	<form action="RequestWebInfo.jsp" method="post">
		영어: <input type="text" name="eng" value="Hellohello"><br/>	
		한글: <input type="text" name="han" value="안녕안녕"><br/>	
		<input type="submit" value="POST 방식">
	</form>
	
	<h2> 2. 클라의 요청 매개변수 읽기 </h2>
	<form method="post" action="RequestParameter.jsp">
		아이디 : <input type="text" name="id" value="" />
		<br />
		성별 : <input type="radio" name="sex" value="man" checked="checked" /> 남자
			  <input type="radio" name="sex" value="woman"  /> 여자
		<br />
		관심사항 : <input type="checkbox" name="favo" value="eco" checked /> 경제
				<input type="checkbox" name="favo" value="pol" />정치
				<input type="checkbox" name="favo" value="ent" />연예
		<br />
		자기소개:
		<textarea name="intro" cols="30" rows="4"></textarea>
		<br />
		<input type="submit" value="전송하기" />
	</form>
	
	<h2> 3. HTTP 요청 헤더 정보 읽기 </h2>
	<a href="./RequestHeader.jsp"> 요청 헤더 정보 읽기 </a>
</body>
</html>