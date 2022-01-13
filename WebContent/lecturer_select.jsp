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
<section>
<h2 id="h2">강사 리스트</h2>
<% 
	int cnt=0;
	pstmt=conn.prepareStatement("select count(*) from lecturer0112");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1);
	}
%>
<p id="p1">총 <%=cnt %>명의 강사가 있습니다.</p><hr>
<table border=1 id="t1">
<tr>
<th id="th11">강사코드</th>
<th id="th11">강사명</th>
<th id="th11">전공</th>
<th id="th11">세부전공</th>
<th id="th11">관리</th>
</tr>

<%
	pstmt=conn.prepareStatement("select * from lecturer0112");
	rs=pstmt.executeQuery();
	while(rs.next()){
		String idx=rs.getString("idx");
		String name=rs.getString("name");
		String major=rs.getString("major");
		String field=rs.getString("field");
	
%>

<tr>
<td id="td"><%=idx %></td>
<td id="td"><%=name %></td>
<td id="td"><%=major %></td>
<td id="td"><%=field %></td>
<td id="td">
	<a href="lecturer_update.jsp?idx=<%=idx %>">수정</a> /
	<a href="lecturer_delete.jsp?idx=<%=idx %>" onclick="if(!confirm('정막 삭제하시겠습니까?'))return false">삭제</a>
</td>
</tr>




<%} %>
</table>
<div id="div">
<input id="b1" type="button" value="작성" onclick="location.href='lecturer_insert.jsp'">
</div>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>