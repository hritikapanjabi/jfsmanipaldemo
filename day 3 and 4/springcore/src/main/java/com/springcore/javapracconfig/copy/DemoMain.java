package com.springcore.javapracconfig.copy;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;


public class DemoMain {

	public static void main(String[] args) {
		ApplicationContext context=new AnnotationConfigApplicationContext(JavaConfig.class);
	    Employee emp=context.getBean("getEmployee",Employee.class);
	    System.out.println(emp);
	    emp.work();
	
	
	}
	
	
}
