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
	
	Integer loginAttempts = (Integer) session.getAttribute("loginAttempts");
	if (loginAttempts == null) {
 	   loginAttempts = 0; // 초기화
	}	

	String id = request.getParameter("user_id");
	String pwd = request.getParameter("user_pwd");
	
	if(id.equals("1234") && pwd.equals("5678")){
		response.sendRedirect("ResponseWelcome.jsp");
		session.removeAttribute("loginAttempts"); // 성공 시 카운트 초기화
	}else{
		loginAttempts++;
        session.setAttribute("loginAttempts", loginAttempts); // 카운트 업데이트
        
        if (loginAttempts >= 5) {
            out.print("<span style='color: red;'>CAPTCHA를 입력하세요</span>");
            // CAPTCHA 표시하는 코드 추가 (예: 이미지, 입력 필드 등)
        } else {
			RequestDispatcher dis =
			request.getRequestDispatcher("ResponseMain.jsp?loginErr=1");
		
			dis.forward(request, response);
		
			//response.sendRedirect("ResponseMain.jsp?loginErr=1");
		}
	}
	
%>
</body>
</html>