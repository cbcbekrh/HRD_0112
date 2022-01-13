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

	pstmt=conn.prepareStatement("update course0112 set name=?,credit=?,lecturer=?,week=?,star_hour=?,end_hour=? where id=?");
	pstmt.setString(7, id);
	pstmt.setString(1, name);
	pstmt.setString(2, credit);
	pstmt.setString(3, lecturer);
	pstmt.setString(4, week);
	pstmt.setString(5, star_hour);
	pstmt.setString(6, end_hour);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("수정 완료");
	location.href="course_select.jsp";
</script>
</html>