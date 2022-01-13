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
	
	pstmt=conn.prepareStatement("update lecturer0112 set name=?,major=?,field=? where idx=?");
	pstmt.setString(4, idx);
	pstmt.setString(1, name);
	pstmt.setString(2, major);
	pstmt.setString(3, field);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("수정 완료");
	location.href="lecturer_select.jsp";
</script>
</html>