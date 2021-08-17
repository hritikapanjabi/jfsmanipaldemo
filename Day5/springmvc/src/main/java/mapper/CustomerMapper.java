package mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
 

import org.springframework.jdbc.core.RowMapper;

import model.Customer;
 
public class CustomerMapper implements RowMapper<Customer> {
 
    public static final String BASE_SQL = //
            "Select d.dept_id,d.dept_no,d.dept_name,d.location "//
                    + " from Department d ";
 
    
    public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
        Integer cust_id = rs.getInt("cust_id");
        
        String cust_name = rs.getString("cust_name");
        String password = rs.getString("password");
        String city = rs.getString("city");
        String state = rs.getString("state");
        String zip = rs.getString("zip");
        String country = rs.getString("country");
       

 
        return new Customer(cust_id,cust_name,password,city,state,zip,country);
    }
 
}