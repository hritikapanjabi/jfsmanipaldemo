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
String database = "Baby_Toy_Company";
String userid = "root";
String password = "vampire2412";
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
<title>Q12</title>
</head>
<body>
<h1>Q12 The toy which was availed for rent by most customers</h1>
<table border="1">
<tr>
<td>Toy Names</td>
<td>Number of customers</td>



</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select Toy.Toy_Name, count(Toy_Rental.Customer_ID) as Number_of_customers from Toy_Rental inner join Toy on Toy.Toy_Id=Toy_Rental.Toy_ID group by Toy_Rental.Toy_Id order by count(Toy_Rental.Customer_ID) desc limit 1";


resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Toy.Toy_Name") %></td>
<td><%=resultSet.getString("Number_of_customers") %></td>


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