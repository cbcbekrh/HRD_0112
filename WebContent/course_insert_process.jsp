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
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String credit=request.getParameter("credit");
	String lecturer=request.getParameter("lecturer");
	String week=request.getParameter("week");
	String star_hour=request.getParameter("star_hour");
	String end_hour=request.getParameter("end_hour");

	pstmt=conn.prepareStatement("insert into course0112 values(?,?,?,?,?,?,?)");
	pstmt.setString(1, id);
	pstmt.setString(2, name);
	pstmt.setString(3, credit);
	pstmt.setString(4, lecturer);
	pstmt.setString(5, week);
	pstmt.setString(6, star_hour);
	pstmt.setString(7, end_hour);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("등록 완료");
	location.href="course_select.jsp";
</script>
</html>