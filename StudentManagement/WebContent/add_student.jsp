<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* .container{
background-color: gray;
} */
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
function doValidate(){
	
	
	var rollNumber = document.forms["student_form"]["roll_number"].value;
	var name =  document.forms["student_form"]["name"].value;
	var course = document.forms["student_form"]["course"].value;
	var rollNumberStatus;
	var nameStatus;
	var courseStatus;
	var rollNumberMsg;
	var nameMessage;
	var courseMessage;
	
		if(document.getElementById("rollNumberMsg").innerHTML != ""){
			document.getElementById("rollNumberMsg").innerHTML = "";
		}
		if(document.getElementById("nameMsg").innerHTML != ""){
			document.getElementById("nameMsg").innerHTML = "";
		}
		if(document.getElementById("courseMsg").innerHTML != ""){
			document.getElementById("courseMsg").innerHTML = "";
		}
		if(rollNumber == ""){
			rollNumberStatus = false;
			rollNumberMsg = "*Roll Number should not be empty"
			var spanEle = document.getElementById("rollNumberMsg");
			spanEle.style.color = "red";
			spanEle.innerHTML = rollNumberMsg;
			//document.getElementById("rollNumberMsg").innerHTML = rollNumberMsg;
		}
		if(name == ""){
			nameStatus = false;
			nameMsg = "*Name should not be empty";  
			var spanEle = document.getElementById("nameMsg");
			spanEle.style.color = "red";
			spanEle.innerHTML = nameMsg;
			//document.getElementById("nameMsg").innerHTML = nameMsg;
		}
		if(course == ""){
			courseStatus = false;
			courseMsg = "*course should not be empty";
			var spanEle = document.getElementById("courseMsg");
			spanEle.style.color = "red";
			spanEle.innerHTML = courseMsg;
			//document.getElementById("courseMsg").innerHTML = courseMsg;
		}
	
	
	if(rollNumberStatus == false || nameStatus == false || courseStatus == false){
		return false;
	}
	
}


</script>
<%
String msg = (String)request.getAttribute("msg");
if(msg == null){
	msg = "";
}
%>
<div><%@include file="header.html" %></div>


<div class="container">
<center>
<h1>Add Student</h1>

<h4 style="color:green"><%= msg %></h4>
<form action="./AddStudentController" name="student_form" method="post" onsubmit="return doValidate()">
<table>
<tr><td>Student Roll Number</td><td><input type="text" name="roll_number"><span id="rollNumberMsg"></span></td></tr>
<tr><td>Student Name</td><td><input type="text" name="name"><span id="nameMsg"></span></td></tr>
<tr><td>Gender</td><td><input name="gender" checked="checked" value="male" type="radio"> Male &nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="female"> Female</td></tr>
<tr><td>Course</td><td><select name="course">
<option value="">--select--</option>
<option value="java">Java</option>
<option value="html">Html</option>
<option value="dot net">Dot Net</option>
</select><span id="courseMsg"></span></td></tr>
<tr><td><input type="submit" value="Add Student"/></td><td><input type="button" value="Cancel"></td></tr>
</table>

</form>
</center>
</div>


<div><%@include file="footer.html" %></div>


</body>
</html>