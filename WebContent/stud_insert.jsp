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
<form name="form" method="post" action="stud_insert_process.jsp">
<h1 id="h1">학사 정보 등록 화면</h1>
<table border=1 id="t1">
<tr>
<th id="th">학번</th>
<td><input id="in" type="text" name="studno"></td>
</tr>

<tr>
<th id="th">성명</th>
<td><input id="in" type="text" name="name"></td>
</tr>

<tr>
<th id="th">학과</th>
<td>
	<select name="dept" id="sel">
		<option value="1">컴퓨터공학과</option>
		<option value="2">기계공학과</option>
		<option value="3">전자과</option>
		<option value="4">영문학과</option>
		<option value="5">일어과</option>
		<option value="6">경영학과</option>
		<option value="7">무역학과</option>
		<option value="8">교육학과</option>
	</select>
</td>
</tr>

<tr>
<th id="th">학년</th>
<td>
	<input type="radio" name="position" value="1">1학년
	<input type="radio" name="position" value="2">2학년
	<input type="radio" name="position" value="3">3학년
	<input type="radio" name="position" value="4">4학년
</td>
</tr>

<tr>
<th id="th">취미</th>
<td>
	<input type="checkbox" name="hobby" value="프로그램">프로그램
	<input type="checkbox" name="hobby" value="독서">독서
	<input type="checkbox" name="hobby" value="등산">등산
	<input type="checkbox" name="hobby" value="여행">여행
	<input type="checkbox" name="hobby" value="낚시">낚시
	<input type="checkbox" name="hobby" value="영화보기">영화보기
	<input type="checkbox" name="hobby" value="잠자기">잠자기
	<input type="checkbox" name="hobby" value="멍때리기">멍때리기
</td>
</tr>

<tr>
<th id="th">주소</th>
<td><input id="in" type="text" name="address"></td>
</tr>

<tr>
<th id="th">연락처</th>
<td><input id="in" type="text" name="phone"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="등록" onclick="check()">
	<input id="b" type="button" value="취소">
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
	var position=document.getElementsByName("position");
	for(var i=0; i<position.length; i++){
		if(position[i].checked == true){
			cnt++
		}
	}
	var cnt1=0;
	var hobby=document.getElementsByName("hobby");
	for(var i=0; i<hobby.length; i++){
		if(hobby[i].checked == true){
			cnt1++
		}
	}
	
	
	if(document.form.studno.value==""){
		alert("학번을 입력하세요.");
		document.form.studno.focus();
	}else if(document.form.name.value==""){
		alert("이름을 입력하세요.");
		document.form.name.focus();
	}else if(cnt == 0){
		alert("학년을 선택하세요.");
	}else if(cnt1 == 0){
		alert("취미를 선택하세요.");
	}else if(cnt1 == 1){
		alert("취미를 두개이상 선택하세요.");
	}else{
		document.form.submit();
	}
}
</script>
</html>