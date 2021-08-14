<!-- <html>
<body>
<h2>Hello World!</h2>
</body>
</html>
<!DOCTYPE html>
  -->
  
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
<title>Q9</title>
</head>
<body>
<h1>Q9 The customers who have availed rental more than two toys currently </h1>
<table border="1">
<tr>
<td>Customer Name</td>
<td>Count</td>




</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "Select Customer.Customer_Name, Count(Toy_Rental.Customer_ID) as count From Customer JOIN Toy_Rental on Toy_Rental.Customer_ID=Customer.Customer_ID group by Toy_Rental.Customer_ID HAVING Count(Toy_Rental.Customer_ID)>2";




resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Customer.Customer_Name") %></td>
<td><%=resultSet.getInt("count") %></td>



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




