package com.Test.aop;

import org.springframework.context.support.ClassPathXmlApplicationContext;


public class AopTest {
	
	
	public static void main(String[] args) {
		ClassPathXmlApplicationContext applicationContext = new ClassPathXmlApplicationContext("spring-mvc.xml");	
		Star star = (Star) applicationContext.getBean("star");
		star.sing();
	}

}
