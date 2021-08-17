
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
<title>Q11</title>
</head>
<body>
<h1>Q11 The customer who has availed maximum number of  toys for rental during the current fiscal </h1>
<table border="1">
<tr>
<td>Customer Name</td>
<td>Max Number of Toys</td>



</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select Customer.Customer_Name, count(Toy_Rental.Toy_Id) as Max_num_of_toys from Toy_Rental  inner join Customer on Customer.Customer_Id=Toy_Rental.Customer_ID where Toy_Rental.Rental_Start_Date>='2021-04-01' && Toy_Rental.Rental_End_Date<='2022-03-31' group by Toy_Rental.Customer_Id order by count(Toy_Rental.Toy_Id) desc limit 1";



resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Customer_Name") %></td>
<td><%=resultSet.getInt("Max_num_of_toys") %></td>


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