package com.flowingsand.controller;
class HelloA{
	public HelloA(){
		System.out.println("HelloA");
	}
	{System.out.println("I'm A class");}
	static {System.out.println("static A");}
}
public class TestDemo extends HelloA{
	public TestDemo(){
		System.out.println("HelloB");
	}
	{System.out.println("I'm B class");}
	static {System.out.println("static B");}
	public static void main(String[] args) {
		new TestDemo();

	}
}
