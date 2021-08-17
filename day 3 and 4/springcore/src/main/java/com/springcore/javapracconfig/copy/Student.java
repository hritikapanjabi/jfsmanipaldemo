package com.springcore.javapracconfig.copy;

import org.springframework.stereotype.Component;

//@Component("firststudent")
public class Student {
    public Samosa samosa;
    
	public Student(Samosa samosa) {
		super();
		this.samosa = samosa;
	}

	public Samosa getSamosa() {
		return samosa;
	}

	public void setSamosa(Samosa samosa) {
		this.samosa = samosa;
	}

	public void study(){
		this.samosa.display();
		System.out.println("Student is studying");
	}
	
}
