package com.flowingsand.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.flowingsand.dao.IUserDao;
import com.flowingsand.entity.Accounts;

public class LoginFilter implements HandlerInterceptor {
	@Autowired
	IUserDao iUserDao;

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj) throws Exception {

		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		Accounts accounts = new Accounts();
		accounts.setUname(userName);
		accounts.setPwd(password);
		request.setAttribute("user", accounts);

		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object obj, ModelAndView mav)
			throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception exception)
			throws Exception {

	}

}
