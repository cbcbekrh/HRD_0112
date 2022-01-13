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
	pstmt=conn.prepareStatement("select count(*) from lecturer0112");
	rs=pstmt.executeQuery();
	if(rs.next()){
		cnt=rs.getInt(1)+1;
	}
	
%>
<section>
<h2 id="h2">강사 추가</h2>
<form name="form" method="post" action="lecturer_insert_process.jsp">
<table border=1 id="t0">
<tr>
<th id="th">강사ID</th>
<td><input id="in1" type="text" name="idx" value="<%=cnt %>">자동증가(마지막번호+1)</td>
</tr>

<tr>
<th id="th">강사명</th>
<td><input id="in1" type="text" name="name"></td>
</tr>

<tr>
<th id="th">전공</th>
<td><input id="in1" type="text" name="major"></td>
</tr>

<tr>
<th id="th">세부전공</th>
<td><input id="in1" type="text" name="field"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="목록">
	<input id="b" type="button" value="등록" onclick="check()">
</td>
</tr>

</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	if(document.form.name.value==""){
		alert("강사명을 입력하세요.");
		document.form.name.focus();
	}else if(document.form.major.value==""){
		alert("전공을 입력하세요.");
		document.form.major.focus();
	}else if(document.form.field.value==""){
		alert("세부전공을 입력하세요.");
		document.form.field.focus();
	}else{
		document.form.submit();
	}
}
</script>
</html>