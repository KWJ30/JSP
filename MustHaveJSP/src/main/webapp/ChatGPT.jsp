<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    int[] numbers = {10, 20, 30, 40, 50};
    int sum = 0;

    for (int num : numbers) {
        sum += num;
    }

    double average = sum / (double)numbers.length;
%>

    <h1>배열의 합: <%= sum %></h1>
    <h1>배열의 평균: <%= average %></h1>

</body>
</html>
