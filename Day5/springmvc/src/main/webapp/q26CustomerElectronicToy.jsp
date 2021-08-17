
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
<h2>Customer details who has availed Electronic toys for rental
</h2>
<table border="1">
<tr>
<td>Customer_id</td>
<td>Customer_Name</td>
<td>City</td>
<td>state</td>
<td>zip</td>
<td>Country</td>


</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select Customer_id,Customer_Name,City,state,zip,Country from customer where customer_Id in(Select customer_id from toy_rental where toy_id in (select toy_id from toy where toy_Type='electronic'));";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getInt("Customer_id") %></td>
<td><%=resultSet.getString("Customer_Name") %></td>
<td><%=resultSet.getString("City") %></td>
<td><%=resultSet.getString("state") %></td>
<td><%=resultSet.getString("zip") %></td>
<td><%=resultSet.getString("Country") %></td>

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