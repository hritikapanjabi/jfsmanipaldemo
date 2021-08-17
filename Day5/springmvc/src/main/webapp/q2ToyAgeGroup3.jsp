
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
<title>Q2</title>
</head>
<body>
<h1>Q2 toys for the age group 3</h1>
<table border="1">
<tr>
<td>Toy_Id</td>
<td>Toy_Name</td>
<td>Toy_Type</td>
<td>Min_Age</td>
<td>Max_Age</td>
<td>Price</td>
<td>Rental_Amount</td>
<td>Quantity</td>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select * from Toy where min_age<=3 AND max_age>=3";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("Toy_Id") %></td>
<td><%=resultSet.getString("Toy_Name") %></td>
<td><%=resultSet.getString("Toy_Type") %></td>
<td><%=resultSet.getInt("Min_Age") %></td>
<td><%=resultSet.getInt("Max_Age") %></td>
<td><%=resultSet.getDouble("Price") %></td>
<td><%=resultSet.getDouble("Rental_Amount") %></td>
<td><%=resultSet.getInt("Quantity") %></td>

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