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
	String studno=request.getParameter("studno");
	pstmt=conn.prepareStatement("delete from stud0112 where studno=?");
	pstmt.setString(1, studno);
	pstmt.executeUpdate();

%>
</body>
<script>
	alert("삭제 완료");
	location.href="stud_select.jsp";
</script>
</html>