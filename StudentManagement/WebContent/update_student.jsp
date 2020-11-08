<%@page import="com.sms.dto.StudentDto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Student</title>
</head>
<body>
<%
StudentDto dto = (StudentDto)request.getAttribute("dto");
System.out.println(dto);
if(dto == null){
	dto = new StudentDto();
	dto.setRollNumber(0);
	dto.setName("");
	dto.setGender("");
	dto.setCourse("");
}
String msg = request.getParameter("msg");
if(msg == null){
	msg = "";
}
%>
<div><%@include file="header.html" %></div>
<div>
<center>
	<div class="search">
	<h1>Update Student</h1>
	<h4 style="color:green"></h4>
	<form action="./SearchStudentController" method="post">
	<pre>
	Student RollNumber:  <input type="text" name="rollNumber"/>
	</pre>
	<pre>
	<input type="submit" value="Search"/>
	</pre>
	
	</form>
	</div>
	<div>
	<h4 style="color:green"><%=msg %></h4>
	<form action="./UpdateStudentController" name="student_form" method="post">
	<table>
	<%
	String rollNum = "";
	if(dto.getRollNumber() != 0){
		rollNum =   String.valueOf(dto.getRollNumber());
	}
	%>
	<tr><td>Student Roll Number</td><td><input type="text" name="roll_number" value="<%=rollNum%>"><span id="rollNumberMsg"></span></td></tr>
	<tr><td>Student Name</td><td><input type="text" name="name" value="<%=dto.getName()%>"><span id="nameMsg"></span></td></tr>
	<tr><td>Gender</td><td><input name="gender" value="<%=dto.getGender() %>" type="text"/></td></tr>
	<tr><td>Course</td><td><input name="course" value="<%=dto.getCourse() %>" type="text"/></td></tr>
	<tr><td><input type="submit" value="Update"/></td><td><input type="button" value="Cancel"></td></tr>
	</table>

	</form>
	</div>
</center>
</div>
<div><%@include file="footer.html" %></div>


</body>
</html>