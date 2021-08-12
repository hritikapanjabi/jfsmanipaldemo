package com.springcore.auto.wire;

public class Emp {

	private Address address;

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public Emp(Address address) {
		super();
		this.address = address;
		System.out.println("Inside constructor");
	}

	public Emp() {
		super();
		System.out.println("Inside constructor 1");
	}

	@Override
	public String toString() {
		return "Emp [address=" + address + "]";
	}
	
	
	
}
