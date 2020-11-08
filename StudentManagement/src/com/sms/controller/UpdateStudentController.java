package com.sms.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sms.service.StudentService;
import com.sms.vo.StudentVo;

/**
 * Servlet implementation class UpdateStudentController
 */
@WebServlet("/UpdateStudentController")
public class UpdateStudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	StudentVo studentVo = null;
	StudentService studentService = null;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//int rollNumber = Integer.parseInt(request.getParameter("roll_number"));
		System.out.println("-----"+request.getParameter("roll_number"));
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String course = request.getParameter("course");
		
		studentVo = new StudentVo();
		studentVo.setRollNumber(123);
		studentVo.setName(name);
		studentVo.setGender(gender);
		studentVo.setCourse(course);
		
		studentService = new StudentService();
		int i = studentService.modifyStudent(studentVo);
		
		if(i != 0) {
			String msg = "successfully updated";
			response.sendRedirect("./update_student.jsp?msg="+msg);
		}
	}

}
