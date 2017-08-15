package com.flowingsand.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.flowingsand.entity.Accounts;
import com.flowingsand.service.UserService;
import com.flowingsand.utils.MailUtil;
import com.flowingsand.utils.MessageDigestTools;

/**
 * 
 * @author yyt
 *
 */
@Controller
@Scope("prototype")
public class UserController extends BaseController {
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/fireworks")
	public String initialFireworks() {
		return "fireworks";
	}
	
	@RequestMapping(value = "/error")
	public String initialError() {
		return "error";
	}
	
	@RequestMapping(value = "/index")
	public String initialIndex() {
		return "index";
	}
	
	@RequestMapping(value = "/modify")
	public String initialModify() {
		return "modify";
	}
	
	@RequestMapping(value = "/setting")
	public String initialSetting(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("sname") !=null){
			return "setting";
		}
		return "user";
	}
	
	/**
	 * 测试页面
	 * @return
	 */
	@RequestMapping(value = "/test")
	public String initialTest() {
		return "test";
	}
	
	@RequestMapping(value = "/user")
	public String initialUser(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("sname") !=null){
			return "home";
		}
		return "user";
	}
	
	@RequestMapping(value = "/regist")
	public String initialRegist(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("sname") !=null){
			if(session.getAttribute("sname").toString().equals("admin")){
				return "regist";
			}
		}
		return "user";
	}
	
	@RequestMapping(value = "/about")
	public String initialAbout() {
		return "about";
	}
	
	/**
	 * 清除session code
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/cleancode", method = RequestMethod.POST)
	@ResponseBody
	public String cleanSessionCode(HttpServletRequest request) {
		// 清除session code
        request.getSession().removeAttribute("scode");
        return "ok";
	}
	
	
	/**
	 * 检测用户名是否存在
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/uname", method = RequestMethod.POST)
	@ResponseBody
	public String isNameExist(@RequestParam(value = "name", required = false) String name) throws Exception{
		if(null !=name){
			boolean isExist = userService.isUserNameExist(name);
			if(isExist){
				return "exist";
			}
		}
		return "unexist";
	}
	
	/**
	 * 检测邮箱是否存在
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/email", method = RequestMethod.POST)
	@ResponseBody
	public String isEmailExist(@RequestParam(value = "email", required = false) String email) throws Exception{
		if(null !=email){
			boolean isExist=userService.isEmailExist(email);
			if(isExist){
				return "exist";
			}
		}
		return "unexist";
	}
	
	/**
	 * 清除session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/session", method = RequestMethod.POST)
	@ResponseBody
	public String cleanSession(HttpServletRequest request) {
		// 清除session
        request.getSession().removeAttribute("sname");
        request.getSession().invalidate();
        return "expired";
	}
	
	/**
	 * 发送邮箱验证码
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/send", method = RequestMethod.POST)
	@ResponseBody
	public String send(HttpServletRequest request) throws Exception {
		HttpSession session=request.getSession();
		String email = request.getParameter("email");
		String code=String.valueOf((int)((Math.random()*9+1)*100000));
		new Thread(new MailUtil(email, code)).start();
		session.setAttribute("scode", code);
		return "successful";
	}
	
	
	/**
	 * 判断session code 是否过期
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/checkcode", method = RequestMethod.POST)
	@ResponseBody
	public String checkSessionCode(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String code=(String) session.getAttribute("scode");
		if(code !=null){
			return code;
		}else{
			return "unexist";
		}
	}
	
	
	/**
	 * 用户登录
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView login(HttpServletRequest request,HttpServletResponse response) throws Exception {
		String name = request.getParameter("uname");  
        String pwd = request.getParameter("pwd");  
		/* MD5+SHA-512 加密*/
		String md5Result = MessageDigestTools.encryptMD5(pwd.getBytes());
		String shaResult = MessageDigestTools.encryptSHA(md5Result.getBytes());
		boolean loginType = userService.login(name, shaResult);
		HttpSession session=request.getSession();
		if(!loginType){
			session.setAttribute("msg", "用户名或密码不正确 !");
			return new ModelAndView("redirect:/user.html");
		}else{
			/*Integer resid=userService.selectId(name);
			if(resid !=null){
				session.setAttribute("nid", resid);
			}*/
			session.setAttribute("sname", name);
			session.setMaxInactiveInterval(30*60);
			return new ModelAndView("redirect:/home.html");
		}
	}
	
	/**
	 * 用户注册
	 * @param param
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView register(Accounts param,HttpServletRequest request) throws Exception {
		/* MD5+SHA-512 加密*/
		String md5Result = MessageDigestTools.encryptMD5(param.getPwd().getBytes());
		String shaResult = MessageDigestTools.encryptSHA(md5Result.getBytes());
		param.setLid(1);
		param.setNname(request.getParameter("nname"));
		param.setUname(request.getParameter("uname"));
		param.setPwd(shaResult);
		//置空确认密码
		param.setApwd("");
		param.setEmail(request.getParameter("email"));
		int insert = userService.register(param);
		if(insert == 1){
			return new ModelAndView("success");
		}
		return new ModelAndView("regist");
	}
	
	/**
	 * 更新密码
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView modify(HttpServletRequest request) throws Exception{
		String email = request.getParameter("email");
		/* MD5+SHA-512 加密*/
		String md5Result = MessageDigestTools.encryptMD5(request.getParameter("pwd").getBytes());
		String shaResult = MessageDigestTools.encryptSHA(md5Result.getBytes());
		int result=userService.modify(shaResult, email);
		if(result == 1){
			return new ModelAndView("user");
		}
		return new ModelAndView("setting");
	}

}