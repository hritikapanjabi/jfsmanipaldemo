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
<h1>List of Customers whose rental amount is maximum for the month</h1>
<table border="1">
<tr>
<th>Customer_Name</th>
						<th>max(Toy_Rental.Total_Amount)</th>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="Select Customer.Customer_Name, max(Toy_Rental.Total_Amount) from Toy_Rental  inner join Customer on Customer.Customer_Id=Toy_Rental.Customer_ID where month(Toy_Rental.Rental_Start_Date)=8 || month(Toy_Rental.Rental_End_Date)=1 group by Customer.Customer_Name order by max(Toy_Rental.Total_Amount) desc limit 1;";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Customer_Name") %></td>
<td><%=resultSet.getInt("max(Toy_Rental.Total_Amount)") %></td>

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
