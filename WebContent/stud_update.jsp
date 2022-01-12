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
	String studno=request.getParameter("studno");
	pstmt=conn.prepareStatement("select * from stud0112 where studno=?");
	pstmt.setString(1, studno);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String dept=rs.getString("dept");
		String position=rs.getString("position");
		String address=rs.getString("address");
		String phone=rs.getString("phone");
		String hobby=rs.getString("hobby");
		String array[]=hobby.split(",");
		
	
%>
<section>
<form name="form" method="post" action="stud_update_process.jsp">
<h1 id="h1">학사 정보 수정 화면</h1>
<table border=1 id="t1">
<tr>
<th id="th">학번</th>
<td><input id="in" type="text" name="studno" value="<%=studno %>"></td>
</tr>

<tr>
<th id="th">성명</th>
<td><input id="in" type="text" name="name" value="<%=name %>"></td>
</tr>

<tr>
<th id="th">학과</th>
<td>
	<select name="dept" id="sel">
		<option value="1" <%= dept.equals("1") ? "selected" : "" %>>컴퓨터공학과</option>
		<option value="2" <%= dept.equals("2") ? "selected" : "" %>>기계공학과</option>
		<option value="3" <%= dept.equals("3") ? "selected" : "" %>>전자과</option>
		<option value="4" <%= dept.equals("4") ? "selected" : "" %>>영문학과</option>
		<option value="5" <%= dept.equals("5") ? "selected" : "" %>>일어과</option>
		<option value="6" <%= dept.equals("6") ? "selected" : "" %>>경영학과</option>
		<option value="7" <%= dept.equals("7") ? "selected" : "" %>>무역학과</option>
		<option value="8" <%= dept.equals("8") ? "selected" : "" %>>교육학과</option>
	</select>
</td>
</tr>

<tr>
<th id="th">학년</th>
<td>
	<input type="radio" name="position" value="1"  <%= position.equals("1") ? "checked" : "" %>>1학년
	<input type="radio" name="position" value="2"  <%= position.equals("2") ? "checked" : "" %>>2학년
	<input type="radio" name="position" value="3"  <%= position.equals("3") ? "checked" : "" %>>3학년
	<input type="radio" name="position" value="4"  <%= position.equals("4") ? "checked" : "" %>>4학년
</td>
</tr>

<tr>
<th id="th">취미</th>
<td>
	<input type="checkbox" name="hobby" value="프로그램" <% for(int i=0; i<array.length; i++) if(array[i].equals("프로그램"))out.print("checked"); %>>프로그램
	<input type="checkbox" name="hobby" value="독서" <% for(int i=0; i<array.length; i++) if(array[i].equals("독서"))out.print("checked"); %>>독서
	<input type="checkbox" name="hobby" value="등산" <% for(int i=0; i<array.length; i++) if(array[i].equals("등산"))out.print("checked"); %>>등산
	<input type="checkbox" name="hobby" value="여행" <% for(int i=0; i<array.length; i++) if(array[i].equals("여행"))out.print("checked"); %>>여행
	<input type="checkbox" name="hobby" value="낚시" <% for(int i=0; i<array.length; i++) if(array[i].equals("낚시"))out.print("checked"); %>>낚시
	<input type="checkbox" name="hobby" value="영화보기" <% for(int i=0; i<array.length; i++) if(array[i].equals("영화보기"))out.print("checked"); %>>영화보기
	<input type="checkbox" name="hobby" value="잠자기" <% for(int i=0; i<array.length; i++) if(array[i].equals("잠자기"))out.print("checked"); %>>잠자기
	<input type="checkbox" name="hobby" value="멍때리기" <% for(int i=0; i<array.length; i++) if(array[i].equals("멍때리기"))out.print("checked"); %>>멍때리기
</td>
</tr>

<tr>
<th id="th">주소</th>
<td><input id="in" type="text" name="address" value="<%=address %>"></td>
</tr>

<tr>
<th id="th">연락처</th>
<td><input id="in" type="text" name="phone" value="<%=phone %>"></td>
</tr>

<tr>
<td colspan=2 align=center>
	<input id="b" type="button" value="수정" onclick="check()">
	<input id="b" type="button" value="취소">
</td>
</tr>
<%} %>
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