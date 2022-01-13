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
	pstmt=conn.prepareStatement("select count(*) from course0112");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<section>
<h2 id="h2">학사 교과목 목록</h2>
<p id="p">총 <%=cnt %>개의 교과목이 있습니다.</p><hr>
<table border=1 id="t2">
<tr>
<th id="th1">과목코드</th>
<th id="th2">과목명</th>
<th id="th1">학점</th>
<th id="th1">담당강사</th>
<th id="th1">요일</th>
<th id="th1">시작시간</th>
<th id="th1">종료시간</th>
<th id="th1">관리</th>
</tr>

<%
	pstmt=conn.prepareStatement("select * from course0112");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String id=rs.getString("id");
		String name=rs.getString("name");
		String credit=rs.getString("credit");
		String lecturer=rs.getString("lecturer");
		String week=rs.getString("week");
		String star_hour=rs.getString("star_hour");
		String end_hour=rs.getString("end_hour");
	
%>

<tr>
<td id="td"><%=id %></td>
<td id="td"><%=name %></td>
<td id="td"><%=credit %></td>
<td id="td"><%=lecturer %></td>
<td id="td"><%=week %></td>
<td id="td"><%=star_hour %></td>
<td id="td"><%=end_hour %></td>
<td id="td">
	<a href="course_update.jsp?id=<%=id %>">수정 /</a>
	<a href="course_delete.jsp?id=<%=id %>" onclick="if(!confirm('정말 삭제하시겠습니까?')) return false">삭제</a>
</td>
</tr>
<%} %>
</table>
<div id="div">
<input id=b1 type="button" value="작성" onclick="location.href='course_insert.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>