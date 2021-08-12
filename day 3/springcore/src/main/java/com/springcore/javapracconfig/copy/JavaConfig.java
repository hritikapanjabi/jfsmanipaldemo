package com.springcore.javapracconfig.copy;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages="com.springcore.javaconfig")
public class JavaConfig {
	
	@Bean
  public Samosa getSamosa() {
	return new Samosa();
}	
	
	 @Bean
  public Employee getEmployee() {
	 
	  //creating a new student object
	  Employee emp =new Employee(getSamosa());
	  return emp;
	  
  }
}
