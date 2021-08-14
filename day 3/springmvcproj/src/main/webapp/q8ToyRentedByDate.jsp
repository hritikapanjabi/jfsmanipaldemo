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
<title>Q8</title>
</head>
<body>
<h1>Q8 The toys which were rented out on 20/05/2020</h1>
<table border="1">
<tr>
<td>Toy ID</td>
<td>Toy Name</td>



</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select Toy.Toy_Id,Toy.Toy_Name FROM Toy WHERE Toy.Toy_Id in(Select Toy_Rental.Toy_ID FROM Toy_Rental WHERE Toy_Rental.Rental_Start_Date = '2020-05-20')";



resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Toy.Toy_Id") %></td>
<td><%=resultSet.getString("Toy.Toy_Name") %></td>


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