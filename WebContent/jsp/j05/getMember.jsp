<%@page import="com.pcwk.board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세션 읽기</title>
</head>
<body>
	<h2>세션 읽기</h2>
	<hr/>
	<%
	    String userId = (String)session.getAttribute("userId");
	    String userName = (String)session.getAttribute("userName");
	    BoardVO board = (BoardVO)session.getAttribute("board");
	    //board
	    out.print("userId : " + userId + "<br>");
	    out.print("userName : " + userName + "<br>");
	    out.print("board : " + board.toString());
	%>
</body>
</html>