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
	pstmt=conn.prepareStatement("update stud0112 set name=?,dept=?,position=?,address=?,phone=?,hobby=? where studno=?");
	pstmt.setString(7, studno);
	pstmt.setString(1, name);
	pstmt.setString(2, dept);
	pstmt.setString(3, position);
	pstmt.setString(4, address);
	pstmt.setString(5, phone);
	pstmt.setString(6, hobby);
	pstmt.executeUpdate();
	
	
%>
</body>
<script>
	alert("수정 완료");
	location.href="stud_select.jsp";
</script>
</html>