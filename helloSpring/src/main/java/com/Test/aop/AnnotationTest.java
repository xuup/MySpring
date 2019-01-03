package com.Test.aop;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;


@Component("AnnotationTest")
@Aspect
public class AnnotationTest {
	
	@Pointcut("execution(* *.sing(..))")
	public void sings(){}
	
	
	@Before(value = "sings()")
	public void sayHello(){
		System.out.println("前置通知......");
	}
	
}
