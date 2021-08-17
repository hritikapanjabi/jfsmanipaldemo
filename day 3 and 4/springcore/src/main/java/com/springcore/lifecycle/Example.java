package com.springcore.lifecycle;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

public class Example {

	private String subject;

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "Example [subject=" + subject + "]";
	}

	public Example() {
		super();
	}
	
	@PostConstruct
	public void start() {
		
		System.out.println("Starting example method");
	}
	@PreDestroy
	public void end() {
			
			System.out.println("Ending example method");
		}
	
	
}
