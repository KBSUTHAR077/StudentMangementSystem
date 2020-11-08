package com.sms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sms.service.StudentService;
import com.sms.vo.StudentVo;


@WebServlet("/AddStudentController")
public class AddStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentVo studentVo = null;
	StudentService studentService = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 // get data from ui
	int rollNumber = Integer.parseInt(request.getParameter("roll_number"));
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String course = request.getParameter("course");
	
	studentVo = new StudentVo();
	studentVo.setRollNumber(rollNumber);
	studentVo.setName(name);
	studentVo.setGender(gender);
	studentVo.setCourse(course);
	
	studentService = new StudentService();
	int i = studentService.saveStudent(studentVo);
	
	if(i != 0) {
		String msg = "Successfully Added";
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("./add_student.jsp").forward(request, response);
	}
	
		
	
	}

}
