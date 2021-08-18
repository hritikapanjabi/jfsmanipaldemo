package com.annotations;
import java.util.Date;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

@Configuration
@ComponentScan(basePackages= {"com.annotations.mypack"})
public class MyConfig {
	@Bean("student 1")
	@Lazy
 public Student getStudent() {
		System.out.println("creating student 1");
	return new Student("student 1");
	
}
	
	@Bean("student 2")
	@Lazy
	 public Student createStudent() {
		System.out.println("creating student 2");
		return new Student("student 2");
		
	}
	@Bean
	public Date getDate() {
		  System.out.println("Create a new date");
		  return new Date();
	  }
}
