package com.springcore.javapracconfig.copy;

public class Employee {
	public Samosa samosa;

	public Samosa getSamosa() {
		return samosa;
	}

	public void setSamosa(Samosa samosa) {
		this.samosa = samosa;
	}

	public Employee(Samosa samosa) {
		super();
		this.samosa = samosa;
	}
	public void work(){
		this.samosa.display();
		System.out.println("Employee is working");
	}
	
	
	
}
