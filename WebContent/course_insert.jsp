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
<section>
<h2 id="h2">교과목 추가</h2>
<form name="form" method="post" action="course_insert_process.jsp">
<table border=1 id="t0">
<tr>
<th id="th">교과목 코드</th>
<td><input id="in" type="text" name="id"></td>
</tr>

<tr>
<th id="th">과목명</th>
<td><input id="in" type="text" name="name"></td>
</tr>

<tr>
<th id="th">학점</th>
<td><input id="in" type="text" name="credit"></td>
</tr>

<tr>
<th id="th">담당강사</th>
<td>
	<select id="sel" name="lecturer">
		<option value="">담당강사 선택</option>
		<option value="1">김교수</option>
		<option value="2">이교수</option>
		<option value="3">박교수</option>
		<option value="4">우교수</option>
		<option value="5">최교수</option>
		<option value="6">강교수</option>
		<option value="7">황교수</option>
	</select>
</td>
</tr>

<tr>
<th id="th">요일</th>
<td>
	<input type="radio" name="week" value="1">월
	<input type="radio" name="week" value="2">화
	<input type="radio" name="week" value="3">수
	<input type="radio" name="week" value="4">목
	<input type="radio" name="week" value="5">금
	<input type="radio" name="week" value="6">토
</td>
</tr>

<tr>
<th id="th">시작</th>
<td><input id="in" type="text" name="star_hour"></td>
</tr>

<tr>
<th id="th">종료</th>
<td><input id="in" type="text" name="end_hour"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="목록" onclick="location.href='course_select.jsp'">
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