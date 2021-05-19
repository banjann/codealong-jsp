# codealong-jsp

JSP and JDBC
Simplified steps in using JDBC:
1. import java.sql.*
2. register the jdbc driver
	-> Class.forName ("org.h2.Driver");
3. Open the connection
	-> Connection conn = DriverManager.getConnection ("jdbc:h2:~/test", "sa","");
4. Create a statement
	-> Statement st = conn.createStatement();
5. Execute a statement (query, create table, insert value, etc..)
	-> String sql =  "CREATE TABLE   REGISTRATION " + 
            "(id INTEGER not NULL, " + 
            " first VARCHAR(255), " +  
            " last VARCHAR(255), " +  
            " age INTEGER, " +  
            " PRIMARY KEY ( id ))";  
         st.executeUpdate(sql);
    -> String sql = "SELECT * FROM REGISTRATION WHERE ID=100";
	    ResultSet rs = st.executeQuery(sql);
	    rs.next();
	    
	    String id = rs.getString("ID");
	    String first = rs.getString("First");
	    String last = rs.getString("Last");
	    String age = rs.getString("Age");
6. Clean up environment
	-> conn.close();
	-> st.close();