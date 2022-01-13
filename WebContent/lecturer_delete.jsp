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
	pstmt=conn.prepareStatement("delete from lecturer0112 where idx=?");
	pstmt.setString(1, idx);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 완료");
	location.href="lecturer_select.jsp";
</script>
</html>