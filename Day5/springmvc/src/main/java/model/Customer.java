package model;

public class Customer {
	
		private int cust_id;
		private String cust_name;
		private String password;
		private String city;
		private String state;
		private String zip;
		private String country;

		
		public Customer(int cust_id,String cust_name, String password, String city, String state, String zip,
				String country) {
			
			this.cust_name = cust_name;
			this.password = password;
			this.city = city;
			this.state = state;
			this.zip = zip;
			this.country = country;
		}

		public int getCust_id() {
			return cust_id;
		}

		public void setCust_id(int cust_id) {
			this.cust_id = cust_id;
		}

		public String getCust_name() {
			return cust_name;
		}

		public void setCust_name(String cust_name) {
			this.cust_name = cust_name;
		}

		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		public String getZip() {
			return zip;
		}

		public void setZip(String zip) {
			this.zip = zip;
		}

		public String getCountry() {
			return country;
		}

		public void setCountry(String country) {
			this.country = country;
		}

	}



