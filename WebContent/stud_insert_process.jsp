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
	String name=request.getParameter("name");
	String dept=request.getParameter("dept");
	String position=request.getParameter("position");
	String address=request.getParameter("address");
	String phone=request.getParameter("phone");
	String values[]=request.getParameterValues("hobby");
	String hobby="";
	if(values != null){
		for(int i=0; i<values.length; i++){
			if(i==(values.length-1)){
				hobby += values[i];
			}else{
				hobby += values[i]+",";
			}
		}
	}
	pstmt=conn.prepareStatement("insert into stud0112 values(?,?,?,?,?,?,?)");
	pstmt.setString(1, studno);
	pstmt.setString(2, name);
	pstmt.setString(3, dept);
	pstmt.setString(4, position);
	pstmt.setString(5, address);
	pstmt.setString(6, phone);
	pstmt.setString(7, hobby);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("등록 완료");
	location.href="stud_select.jsp";
</script>
</html>