package com.Test.aop;

import org.springframework.stereotype.Component;


@Component("star")
public class Star {
	
	public void sing(){
		System.out.println("sing.............");
	}
}
