package com.sms.service;

import java.util.List;

import com.sms.bo.StudentBo;
import com.sms.dao.StudentDao;
import com.sms.dto.StudentDto;
import com.sms.vo.StudentVo;

public class StudentService {
	StudentDao studentDao = null;
	StudentBo studentBo = null;
	
	public int saveStudent(StudentVo studentVo){
	// business
	studentDao = new StudentDao();
	studentBo = new StudentBo();
	studentBo.setRollNumber(studentVo.getRollNumber());
	studentBo.setName(studentVo.getName());
	studentBo.setGender(studentVo.getGender());
	studentBo.setCourse(studentVo.getCourse());
	
	
	int i = studentDao.addStudent(studentBo);
	return i;
	}
	public List<StudentDto> getAllStudents() {
		studentDao = new StudentDao();
		return studentDao.viewStudents();
	}
	public boolean removeStudent(int rollNumber) {
		studentDao = new StudentDao();
		return studentDao.delete(rollNumber);
	}
	public StudentDto searchStudent(int rollNumber) {
		studentDao = new StudentDao();
		return studentDao.getStudentDetails(rollNumber);
	}
	public int modifyStudent(StudentVo studentVo) {
		studentDao = new StudentDao();
		studentBo = new StudentBo();
		studentBo.setRollNumber(studentVo.getRollNumber());
		studentBo.setName(studentVo.getName());
		studentBo.setGender(studentVo.getGender());
		studentBo.setCourse(studentVo.getCourse());
		
		studentDao = new StudentDao();
		return studentDao.updateStudent(studentBo);

	}
	
}
