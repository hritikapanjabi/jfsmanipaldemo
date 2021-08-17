
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "baby_toy_company";
String userid = "root";
String password = "Sayali@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Rental details of a customer "John"
</h1>
<table border="1">
<tr>
<td>Rental ID</td>
<td>Customer Id</td>
<td>Toy Id</td>
<td>Rental Start Date</td>
<td>Rental End Date</td>
<td>Rental Amount per Day</td>
<td>Total Amount</td>
<td>Fine</td>
<td>Status</td>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select * from Toy_Rental where customer_id in(select customer_id from customer where customer_name='john')";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("Rental_Id") %></td>
<td><%=resultSet.getInt("Customer_id") %></td>
<td><%=resultSet.getInt("Toy_Id") %></td>
<td><%=resultSet.getDate("Rental_Start_Date") %></td>
<td><%=resultSet.getDate("Rental_End_Date") %></td>
<td><%=resultSet.getDouble("Rental_Amount_per_Day") %></td>
<td><%=resultSet.getDouble("Total_Amount") %></td>
<td><%=resultSet.getDouble("Fine") %></td>
<td><%=resultSet.getString("Status") %></td>

</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>