<%@page import="utils.CookieManager"%>
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

   
 
<% String userId = request.getParameter("user_id");
   String userPwd = request.getParameter("user_pw");
   String saveCheck = request.getParameter("save_check");
   
   String oracleDriver = application.getInitParameter("OracleDriver");
   String oracleURL = application.getInitParameter("OracleURL");
   String oracleId = application.getInitParameter("OracleId");
   String oraclePwd = application.getInitParameter("OraclePwd");
   
   MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
   MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
   dao.close();
   
   if (memberDTO.getId() != null) {
	   session.setAttribute("UserId", memberDTO.getId());
	   session.setAttribute("UserName", memberDTO.getName());
	   
	   // 아이디 저장 체크가 되어 있으면 쿠키 저장
       if ("Y".equals(saveCheck)) {
           CookieManager.makeCookie(response, "loginId", userId, 86400); // 쿠키 유효기간: 하루(86400초)
       } else {
           // 체크가 해제되어 있으면 쿠키 삭제
           CookieManager.deleteCookie(response, "loginId");
       }
	   
	   response.sendRedirect("LoginForm.jsp");
   }
   else{
	   request.setAttribute("LoginErrMsg", "아이디와 비밀번호를 정확히 입력해 주세요.");
	   request.setAttribute("user_id", userId); // 입력된 아이디를 request에 저장
	   request.getRequestDispatcher("LoginForm.jsp").forward(request, response);
   }
%>
