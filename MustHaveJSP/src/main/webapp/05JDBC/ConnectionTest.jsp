<%@page import="common.JDBConnect"%>
<%@page import="common.DBConnPool"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 커넥션 풀 테스트 </h2>
	<%
		/*String driver = application.getInitParameter("OracleDriver");
		String url = application.getInitParameter("OracleURL");
		String id = application.getInitParameter("OracleId");
		String pwd = application.getInitParameter("OraclePwd"); */
		
		//JDBCConnect jdbc1 = new JDBCConnect(application);
		//jdbc1.close();
		DBConnPool pool = new DBConnPool();
		pool.close();
	%>
</body>
</html>