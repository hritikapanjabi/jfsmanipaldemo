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
<title>Q10</title>
</head>
<body>
<h1>Q10 All the customers who have rented at least 1 toy, and details of toy, rental return date. </h1>
<table border="1">
<tr>
<td>Customer Name</td>
<td>Toy ID</td>
<td>Toy Name</td>
<td>Toy Type</td>
<td>Toy Rental End Date</td>




</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select Customer.Customer_Name ,Toy.Toy_Id,Toy.Toy_Name,Toy.Toy_Type,Toy_Rental.Rental_End_Date FROM Toy_Rental join Customer on Toy_Rental.Customer_ID = Customer.Customer_Id join Toy on Toy.Toy_Id = Toy_Rental.Toy_ID";




resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Customer_Name") %></td>
<td><%=resultSet.getInt("Toy_Id") %></td>
<td><%=resultSet.getString("Toy_Name") %></td>
<td><%=resultSet.getString("Toy_Type") %></td>
<td><%=resultSet.getDate("Rental_End_Date") %></td>


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