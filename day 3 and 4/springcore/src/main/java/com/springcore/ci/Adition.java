package com.springcore.ci;

public class Adition {

	private int a;
	private int b;
	public Adition(int a, int b) {
		super();
		this.a = a;
		this.b = b;
		System.out.println("Contructor:int,int");
	}
	public Adition(double a, double b) {
		super();
		this.a =(int) a;
		this.b =(int) b;
		System.out.println("Contructor:double,double");
	}
	public Adition(String a, String b) {
		super();
		this.a =Integer.parseInt(a);
		this.b =Integer.parseInt(b);
		System.out.println("Contructor:double,double");
	}
	
	public void dosum()
	{System.out.println("sum:  "+(this.a+this.b));
	System.out.println("Value of a:  "+this.a);
	System.out.println("Value of b:  "+this.b);
	
	
	}
}
