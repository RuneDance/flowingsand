package com.flowingsand.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.ExceptionHandler;

import com.flowingsand.exception.MyException;

public class BaseController {
	@ExceptionHandler(MyException.class)
	public String handleException(Exception ex,HttpServletRequest request){
		request.setAttribute("error", ex);
		return "/WEB-INF/jsp/error404.jsp";
	}
}
