package com.coco.aop;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Component
@Aspect
public class AuthConfigAop {
	
	private static Logger logger = LoggerFactory.getLogger(AuthConfigAop.class);
	
	@Pointcut("(execution(* com.coco.controller..*(..))) && !(execution(* com.coco.controller.LoginController.*(..)))")
	public void checkLogin(){}
	
	
	@Around(value="checkLogin()")
	public Object checkAuth(ProceedingJoinPoint joinPoint) throws Throwable{
		
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("user");
		if(StringUtils.isBlank(userName)){
			//如果未登录
			logger.info("not login.....");
			return "redirect:/login/initLogin";
		}
		logger.info("userName:{}", userName);
		return joinPoint.proceed();
	}

}
