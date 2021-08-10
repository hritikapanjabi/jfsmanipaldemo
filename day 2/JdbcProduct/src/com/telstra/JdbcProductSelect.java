package com.telstra;
import java.sql.*;
public class JdbcProductSelect{

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
		String selectCommand="SELECT * FROM products";
		Connection cn=null;
		Statement st=null;
		ResultSet rs=null;
		int i=0;
		
		try {
			cn=DriverManager.getConnection(url,username,password);
			st=cn.createStatement();
			rs=st.executeQuery(selectCommand);
			while(rs.next()) {
				int empid=rs.getInt("id");
				String name=rs.getString("name");
				String price=rs.getString("price");
				System.out.println(empid+" "+ name+"  "+price );
			}


			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
