package com.aopconcept.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.aopconcept.services.PaymentService;

/**
 * Hello world!
 *
 */
public class App 
{
	
    public static void main( String[] args )
    {  ApplicationContext context= new ClassPathXmlApplicationContext("com/aopconcept/aop/config.xml");
       PaymentService paymentservice=context.getBean("payment",PaymentService.class);
    paymentservice.makePayement();
    }
}
