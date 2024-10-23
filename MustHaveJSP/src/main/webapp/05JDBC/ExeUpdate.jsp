<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> JDBC </title>
</head>
<body>
	<h2> 회원 추가 테스트(executeUpdate() 사용) </h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	
	String id = "test1";
	String pass = "1111";
	String name = "테스트1회원";
	
	String sql = "INSERT INTO member VALUES (?,?,?, sysdate)";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, id);
	psmt.setString(2, pass);
	psmt.setString(3, name);
	
	int inResult = psmt.executeUpdate();  // 저장 성공시 1반환, 실패시 0반환
	out.println(inResult + "행이 입력되었습니다."); 
	
	/* String id = "test1";
	
	String sql = "DELETE FROM member WHERE id = ?";
	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
	psmt.setString(1, id);
	
	int inResult = psmt.executeUpdate();
	out.println(inResult + "행이 삭제되었습니다."); */
	
	jdbc.close();
	%>
</body>
</html>