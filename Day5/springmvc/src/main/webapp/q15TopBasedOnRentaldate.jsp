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
<title>Report on Rental Information</title>
</head>
<body>
<h1>List of Customers who rented toys on 25th Jan 2020</h1>
<table border="1">
<tr>
<th>Customer_Name</th>
						<th>City</th>
						<th>State</th>
						<th>Zip</th>
						<th>Country</th>
						<th>Rental_Id</th>
						<th>Customer_ID</th>
						<th>Toy_ID</th>
						<th>Rental_Start_Date</th>
						<th>Rental_End_Date</th>
						<th>Rental_Amount_Per_Day</th>
						<th>Total_Amount</th>
						<th>Fine</th>
						<th>Status</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select Customer.Customer_Name,Customer.City, Customer.State, Customer.Zip, Customer.Country, Toy_Rental.*  from Toy_Rental  inner join Customer  on Customer.Customer_Id=Toy_Rental.Customer_ID join Toy on Toy.Toy_Id=Toy_Rental.Toy_ID where Toy_Rental.Rental_Start_Date='2020-01-25';";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Customer_Name") %></td>
<td><%=resultSet.getString("City") %></td>
<td><%=resultSet.getString("State") %></td>
<td><%=resultSet.getString("Zip") %></td>
<td><%=resultSet.getString("Country") %></td>
<td><%=resultSet.getString("Rental_Id") %></td>
<td><%=resultSet.getInt("Customer_ID") %></td>
<td><%=resultSet.getInt("Toy_ID") %></td>
<td><%=resultSet.getString("Rental_Start_Date") %></td>
<td><%=resultSet.getString("Rental_End_Date") %></td>
<td><%=resultSet.getString("Rental_Amount_Per_Day") %></td>
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
