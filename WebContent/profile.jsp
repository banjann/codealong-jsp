<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Hello World!</h1>
	
	<%!
	
	static final String USERNAME = "sa";
	static final String PASSWORD = "";
	static final String URL = "jdbc:h2:~/test";
	static final String DRIVER = "org.h2.Driver";
	
	%>
	
	<%
	//1. register JDBC driver
	Class.forName (DRIVER); 
	//2. open a connection
	Connection conn = DriverManager.getConnection (URL, USERNAME, PASSWORD);
	
	//3. Execute a query
	Statement st = conn.createStatement(); 
	String sql = "SELECT * FROM REGISTRATION WHERE ID=100";
    ResultSet rs = st.executeQuery(sql);
    rs.next();
    
    String id = rs.getString("ID");
    String first = rs.getString("First");
    String last = rs.getString("Last");
    String age = rs.getString("Age");
    
    // STEP 4: Clean-up environment 
    st.close(); 
    conn.close(); 
	%>
	
	<table>
		<tr>
			<th>ID</th>
			<th>First name</th>
			<th>Last name</th>
			<th>Age</th>
		</tr>
		<tr>
			<td><%= id %></td>
			<td><%= first %></td>
			<td><%= last %></td>
			<td><%= age %></td>
		</tr>
	</table>
	
</body>
</html>