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
	String id=request.getParameter("id");
	pstmt=conn.prepareStatement("select * from course0112 where id=?");
	pstmt.setString(1, id);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String credit=rs.getString("credit");
		String lecturer=rs.getString("lecturer");
		String week=rs.getString("week");
		String star_hour=rs.getString("star_hour");
		String end_hour=rs.getString("end_hour");
	
			
%>
<section>
<h2 id="h2">교과목 수정</h2>
<form name="form" method="post" action="course_update_process.jsp">
<table border=1 id="t0">
<tr>
<th id="th">교과목 코드</th>
<td><input id="in" type="text" name="id" value="<%=id %>"></td>
</tr>

<tr>
<th id="th">과목명</th>
<td><input id="in" type="text" name="name" value="<%=name %>"></td>
</tr>

<tr>
<th id="th">학점</th>
<td><input id="in" type="text" name="credit" value="<%=credit %>"></td>
</tr>

<tr>
<th id="th">담당강사</th>
<td>
	<select id="sel" name="lecturer">
		<option value="">담당강사 선택</option>
		<option value="1" <%= lecturer.equals("1") ? "selected" : "" %>>김교수</option>
		<option value="2" <%= lecturer.equals("2") ? "selected" : "" %>>이교수</option>
		<option value="3" <%= lecturer.equals("3") ? "selected" : "" %>>박교수</option>
		<option value="4" <%= lecturer.equals("4") ? "selected" : "" %>>우교수</option>
		<option value="5" <%= lecturer.equals("5") ? "selected" : "" %>>최교수</option>
		<option value="6" <%= lecturer.equals("6") ? "selected" : "" %>>강교수</option>
		<option value="7" <%= lecturer.equals("7") ? "selected" : "" %>>황교수</option>
	</select>
</td>
</tr>

<tr>
<th id="th">요일</th>
<td>
	<input type="radio" name="week" value="1" <%= week.equals("1") ? "checked" : "" %>>월
	<input type="radio" name="week" value="2" <%= week.equals("2") ? "checked" : "" %>>화
	<input type="radio" name="week" value="3" <%= week.equals("3") ? "checked" : "" %>>수
	<input type="radio" name="week" value="4" <%= week.equals("4") ? "checked" : "" %>>목
	<input type="radio" name="week" value="5" <%= week.equals("5") ? "checked" : "" %>>금
	<input type="radio" name="week" value="6" <%= week.equals("6") ? "checked" : "" %>>토
</td>
</tr>

<tr>
<th id="th">시작</th>
<td><input id="in" type="text" name="star_hour" value="<%=star_hour %>"></td>
</tr>

<tr>
<th id="th">종료</th>
<td><input id="in" type="text" name="end_hour" value="<%=end_hour %>"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="목록" onclick="location.href='course_select.jsp'">
	<input id="b" type="button" value="수정" onclick="check()">
</td>
</tr>
<%
	}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
<script>
function check(){
	var cnt=0;
	var week=document.getElementsByName("week");
	for(var i=0; i<week.length; i++){
		if(week[i].checked == true){
			cnt++;
		}
	}
	
	if(document.form.id.value==""){
		alert("교과목 코드가 입력되지 않았습니다.");
		document.form.id.focus();
	}else if(document.form.name.value==""){
		alert("교과목명이 입력되지 않았습니다.");
		document.form.name.focus();
	}else if(document.form.credit.value==""){
		alert("학점이 입력되지 않았습니다.");
		document.form.credit.focus();
	}else if(document.form.lecturer.value==""){
		alert("담당강사가 입력되지 않았습니다.");
		document.form.lecturer.focus();
	}else if(cnt == 0){
		alert("요일이 입력되지 않았습니다.");
	}else if(document.form.star_hour.value==""){
		alert("시작시간이 입력되지 않았습니다.");
		document.form.star_hour.focus();
	}else if(document.form.end_hour.value==""){
		alert("종료시간이 입력되지 않았습니다.");
		document.form.end_hour.focus();
	}else{
		document.form.submit();
	}
	
}
</script>
</html>