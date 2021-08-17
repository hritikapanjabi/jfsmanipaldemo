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
<title>Report to help Maximize Revenue</title>
</head>
<body>
<h1>Toy which was availed for rent by most of the customers</h1>
<table border="1">
<tr>

						<th>Toy_Id</th>
						<th>Toy_Name</th>
						<th>Toy_Type</th>
						<th>Min_Age</th>
						<th>Max_Age</th>
						
						<th>Quantity</th>
						

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select t1.toy_id, t2.Toy_Name,t2.Toy_Type, t2.Min_Age ,t2.Max_Age ,t2.quantity from Toy_Rental t1 natural join Toy t2  group by Toy_id order by count(customer_id) desc Limit 1; ";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>

<td><%=resultSet.getInt("Toy_Id") %></td>
<td><%=resultSet.getString("Toy_Name") %></td>
<td><%=resultSet.getString("Toy_Type") %></td>
<td><%=resultSet.getInt("Min_Age") %></td>
<td><%=resultSet.getInt("Max_Age") %></td>

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
