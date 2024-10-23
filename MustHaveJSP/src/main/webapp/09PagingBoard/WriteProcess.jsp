<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp" %>
<%
String title = request.getParameter("title");
String content = request.getParameter("content");

BoardDTO dto = new BoardDTO();
dto.setTitle(title);
dto.setContent(content);
dto.setId(session.getAttribute("UserId").toString());

BoardDAO dao = new BoardDAO(application);
int iResult = dao.insertWrite(dto); // iResult 인 이유: 정수형 결과를 담고 있음을 명확히 알 수 있고, 
									//이 값이 데이터베이스 작업의 결과임을 강조
/* 
int iResult = 0 ;
for (int i=1; i<=100; i++) {
	dto.setTitle(title + "-" + i);        // 다수의 게시글 생성용 반복문
	iResult = dao.insertWrite(dto);
} 
*/

dao.close();                       

 if(iResult == 1) { 
	response.sendRedirect("List.jsp");
} else {
	JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
} 
%>

