package com.sms.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
private static Connection con = null;
 public static Connection getConn() {
	 
	 try {
		 Class.forName("com.mysql.jdbc.Driver");
		 con =  DriverManager.getConnection("jdbc:mysql://localhost:3306/studmngt","root","");
	 }catch(Exception e) {
		 e.printStackTrace();
	 }
	 
	 return con;
 }
	
}
