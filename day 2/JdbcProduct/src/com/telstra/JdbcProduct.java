package com.telstra;
import java.sql.*;
public class JdbcProduct {

	public static void main(String[] args) {
		
//		try {
//			Class.forName("com.mysql.jdbc.Driver");
//		} catch (ClassNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		String url= "jdbc:mysql://localhost:3306/telstra";
		String username="root";
		String password="vampire2412";
		String insertCommand="INSERT INTO products VALUES(3,'Phone',10000)";
		
		
		Connection cn=null;
		Statement st=null;
		int i=0;
		try {
			cn=DriverManager.getConnection(url,username,password);
			st=cn.createStatement();
			
			i=st.executeUpdate(insertCommand);
		
			System.out.println(i+"  Records added ");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}


