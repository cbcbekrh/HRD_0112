<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>

<%
	String idx=request.getParameter("idx");
	String name=request.getParameter("name");
	String major=request.getParameter("major");
	String field=request.getParameter("field");
	
	pstmt=conn.prepareStatement("insert into lecturer0112 values(?,?,?,?)");
	pstmt.setString(1, idx);
	pstmt.setString(2, name);
	pstmt.setString(3, major);
	pstmt.setString(4, field);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("등록 완료");
	location.href="lecturer_select.jsp";
</script>
</html>