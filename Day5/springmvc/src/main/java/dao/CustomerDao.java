package dao;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import mapper.CustomerMapper;
import model.Customer;

@Repository
@Transactional
public class CustomerDao extends JdbcDaoSupport {

	@Autowired
	public CustomerDao(DataSource dataSource) {
		this.setDataSource(dataSource);
	}

	private int getMaxDeptId() {
		String sql = "Select max(d.customer_id) from Customer d";

		Integer value = this.getJdbcTemplate().queryForObject(sql, Integer.class);
		if (value == null) {
			return 0;
		}
		return value;
	}

	public Customer findState(int cust_id) {
		String sql = CustomerMapper.BASE_SQL //
				+ " where d.Customer_Id = ?";

		Object[] params = new Object[] { cust_id };

		CustomerMapper mapper = new CustomerMapper();

		Customer cust = this.getJdbcTemplate().queryForObject(sql, params, mapper);
		return cust;
	}

	public List<Customer> listCustomer() {
		String sql = CustomerMapper.BASE_SQL;

		Object[] params = new Object[] {};
		CustomerMapper mapper = new CustomerMapper();

		List<Customer> list = this.getJdbcTemplate().query(sql, params, mapper);
		return list;
	}

	/*
	 * public void insertCustomer(String cust_name, String state) {
	 * 
	 * String sql = "Insert into Department (dept_id,dept_no,dept_name,location) "//
	 * + " values (?,?,?,?) ";
	 * 
	 * String
	 * inserts="insert into customer(Customer_Id,Customer_Name,Password,City,State,Zip,Country) values(?,?,?,?,?,?,?)"
	 * ;
	 * 
	 * 
	 * int cust_id = this.getMaxCustId() + 1; String deptNo = "D" + deptId; Object[]
	 * params = new Object[] { deptId, deptNo, deptName, location };
	 * this.getJdbcTemplate().update(sql, params); }
	 */
}