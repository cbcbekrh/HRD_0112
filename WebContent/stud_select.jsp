<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<% 
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from stud0112");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<section>
<h2 id="h2">학사 정보 목록</h2>
<p id="p">총 <%=cnt %>명의 학사정보가 있습니다.</p><hr>
<table border=1 id="t2">
<tr>
<th id="th0">학번</th>
<th id="th0">성명</th>
<th id="th0">학과</th>
<th id="th0">학년</th>
<th id="th2">주소</th>
<th id="th1">연락처</th>
<th id="th2">취미</th>
<th id="th1">관리</th>
</tr>

<%
	pstmt=conn.prepareStatement("select * from stud0112");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String studno=rs.getString("studno");
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String address=rs.getString("address");
		String phone=rs.getString("phone");
		String hobby=rs.getString("hobby");
	
%>

<tr>
<td id="td"><%=studno %></td>
<td id="td"><%=name %></td>
<td id="td"><%=dept %></td>
<td id="td"><%=position %></td>
<td id="td"><%=address %></td>
<td id="td"><%=phone %></td>
<td id="td"><%=hobby %></td>
<td id="td">
	<a href="stud_update.jsp?studno=<%=studno %>">수정/</a>
	<a href="stud_delete.jsp?studno=<%=studno %>" onclick="if(!confirm('정말 삭제하시겠습니까?')) return false">삭제</a>
</td>
</tr>
<%} %>
</table>
<div id="div">
<input id=b1 type="button" value="학사정보 추가" onclick="location.href='stud_insert.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>