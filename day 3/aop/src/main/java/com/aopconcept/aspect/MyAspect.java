package com.aopconcept.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;

@Aspect
public class MyAspect {
	@Before("execution(com.aopconcept.services.PaymentServiceImpl.makePayement())")
   public void printBefore()
   {
	   System.out.println("Payment Started....");
   }
	
}
