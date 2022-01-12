<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
	Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("오라클 연결 성공");
	conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
	}catch(SQLException e){
		System.out.println("오라클 연결 실패");
	}
%>
</body>
</html>