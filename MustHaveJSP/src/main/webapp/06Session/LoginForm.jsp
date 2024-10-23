<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="utils.CookieManager" %>

<html>
<head>
<meta charset="UTF-8">
<title> Session </title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp"/>
	
	<h2> 로그인 페이지 </h2>
	<span style="color: red; font-size: 1.2em;"> 
		<%= request.getAttribute("LoginErrMsg") == null ? 
				"" : request.getAttribute("LoginErrMsg") %> 
	</span>
	<% 
	if (session.getAttribute("UserId") == null) { 
		 // 쿠키에서 로그인 아이디를 읽음
        String loginId = CookieManager.readCookie(request, "loginId");
        
        // 로그인 실패 시 입력했던 아이디를 가져옴
        String userId = (request.getAttribute("user_id") != null) ? (String) request.getAttribute("user_id") : loginId;
        
        // 쿠키가 있으면 체크박스를 체크
        String cookieCheck = !loginId.equals("") ? "checked" : "";
	%>
	<script>
	function validateForm(form){
		if(!form.user_id.value){
			alert("아이디를 입력하세요.");
			return false;
		}
		if (form.user_pw.value == "") {
			alert("패스워드를 입력하세요.");
			return false;
		}
		return true;
	}
	</script>
	
	<form action="LoginProcess.jsp" method="post" name="loginForm"
		onsubmit="return validateForm(this);">
		 아이디 : <input type="text" name="user_id" value="<%= userId != null ? userId : "" %>" /> 
        <input type="checkbox" name="save_check" value="Y" <%=cookieCheck %> /> 아이디 저장하기<br/> 
		
		패스워드: <input type="password" name="user_pw" /><br/>
		<input type="submit" value="로그인하기" />
	</form>
	<%
	} else {
	%>
		<%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br/>
		<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>