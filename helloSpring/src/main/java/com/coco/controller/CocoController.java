package com.coco.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.coco.service.CocoService;

@Controller
@RequestMapping("/coco")
public class CocoController {
	
	@Resource
	private CocoService service;
	
	
	@RequestMapping("insert")
	public void insert(){
		System.out.println("------begin------");
		service.insert();
		System.out.println("-----------end-------------");
	}
}
