package com.flowingsand.controller;

import java.io.File;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.flowingsand.entity.Article;
import com.flowingsand.entity.Message;
import com.flowingsand.service.HomeService;
import com.flowingsand.utils.OSinfo;

@Controller
@Scope("prototype")
public class HomeController extends BaseController {
	@Autowired
	HomeService homeService;
	List<Article> article=null;
	DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	DateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
	DateFormat sdfn = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
	/**
	 * 判断上传的图片link是否为空
	 */
	public void isLinkNull(){
		if (article != null) {
			for (Article lists : article) {
				if (lists.getLink() == "") {
					String ostype = OSinfo.getOSname().toString();
					if (ostype.equals("Windows")) {
						lists.setLink("/flowingsand/images/temporary.jpg");
					} else if (ostype.equals("Linux")) {
						lists.setLink("/images/temporary.jpg");
					}
				}
				try {
					lists.setAtime(sdf.format(df.parse(lists.getAtime())));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@RequestMapping(value = "/show")
	public String initialShow() {
		return "show";
	}
	
	@RequestMapping(value = "/messageshow")
	public String initialShowMessage(HttpServletRequest request) {
		HttpSession session=request.getSession();
		if(session.getAttribute("sname") !=null){
			return "messageshow";
		}
		return "user";
	}
	
	@RequestMapping(value = "/showdetails")
	@ResponseBody
	public String showDetails(HttpServletRequest request,@RequestParam(value = "aid", required = false) Integer aid) {
		HttpSession session = request.getSession();
		article=this.homeService.showArticlesDetails(aid);
		this.isLinkNull();
		session.setAttribute("adetails", article);
		return "showok";
	}
	
	/**
	 * 初始化Home页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/home")
	public ModelAndView initialHome(HttpServletRequest request, Model model) {
		String name = (String) request.getSession().getAttribute("sname");
		if (name != null) {
			article = this.homeService.showArticlesByPage(request, model, name);
			this.isLinkNull();
		} else {
			article = this.homeService.showAllArticlesByPage(request, model);
			this.isLinkNull();
		}
		return new ModelAndView("home");

	}

	/**
	 * 发布内容
	 * @param article
	 * @param request
	 * @param imageFile
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload")
	public ModelAndView upload(Article article, HttpServletRequest request,@RequestParam("imageFile") MultipartFile imageFile) throws Exception {
		String userName = (String) request.getSession().getAttribute("sname");
		String ostype = OSinfo.getOSname().toString();
		String title = request.getParameter("title");
		String acontents = request.getParameter("acontents");
		String uuid = UUID.randomUUID().toString();
		String uploadTime = df.format(new Date());
		String URL_WINDOWS = "D:/attaches";
		String URL_LINUX = "/home/attaches";
		if (userName == null) {
			return new ModelAndView("redirect:/user.html");
		}
		try {
			String extension = FilenameUtils.getExtension(imageFile.getOriginalFilename());
			// 拼接的新图片名称
			String relName = "/" + userName + uploadTime + uuid + "." + extension;
			if (ostype.equals("Windows")) {
				article.setLink("http://localhost//attaches" + relName);
				File file = new File(URL_WINDOWS);
				if (!file.exists()) {
					file.mkdirs();
				}
				imageFile.transferTo(new File(URL_WINDOWS + relName));
			} else if (ostype.equals("Linux")) {
				article.setLink("http://flowingsand.com//home/attaches" + relName);
				File file = new File(URL_LINUX);
				if (!file.exists()) {
					file.mkdirs();
				}
				imageFile.transferTo(new File(URL_LINUX + relName));
			}
			article.setTitle(title);
			article.setAcontents(acontents);
			if (extension != "") {
				
				if (ostype.equals("Windows")) {
					article.setLink("http://localhost//attaches" + relName);
				} else if (ostype.equals("Linux")) {
					article.setLink("http://flowingsand.com//home/attaches" + relName);
				}
			} else {
				article.setLink("");
			}
			article.setAtime(uploadTime);
			article.setAuthor(userName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int result = homeService.insertContents(article);
		if (result == 1) {
			return new ModelAndView("redirect:/home.html");
		} else {
			return new ModelAndView("redirect:/setting.html");
		}

	}
	/**
	 * 显示消息中心
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/message")
	public String showMessage(HttpServletRequest request){
		HttpSession session = request.getSession();
		String name=(String) session.getAttribute("sname");
		if(name !=null){
			List<Message> messages=homeService.showMessages(name);
			if(messages !=null){
				for (Message list : messages) {
					try {
						list.setMtime(sdfn.format(df.parse(list.getMtime())));
					} catch (ParseException e) {
						e.printStackTrace();
					}
				}
				session.setAttribute("messages", messages);
			}else{
				request.setAttribute("messages", "暂无消息。");
			}
		}else{
			request.setAttribute("messages", "暂无消息。");
			return "user";
		}
		return "message";
	}
	
	/**
	 * 删除消息信息
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/deletemessages")
	@ResponseBody
	public String deleteMessage(HttpServletRequest request,@RequestParam(value = "id", required = false) Integer id){
		Integer res=homeService.deleteMessage(id);
		if(res==1){
			return "delSuc";
		}else{
			return "delDef";
		}
	}
	
	/**
	 * 查询普通用户名
	 * @return
	 */
	@RequestMapping(value = "/queryusers", method = RequestMethod.POST)
	@ResponseBody
	public String queryUsers(){
		List<String> accounts=homeService.selectUserNames();
		JSONArray json=JSONArray.fromObject(accounts);
		return json.toString();
	}
	
	/**
	 * 发送消息
	 * @param message
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/sendmessages")
	public String sendMessages(Message message, HttpServletRequest request){
		message.setMname(request.getParameter("mname"));
		message.setMtime(df.format(new Date()));
		message.setMessages(request.getParameter("messages"));
		
		int res = homeService.insertMessages(message);
		if(res ==1){
			return "setting";
		}else{
			new Exception();
			return "error";
		}
	}
	
	/**
	 * 
	 * @param request
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/messhow")
	@ResponseBody
	public String showMessageDetails(HttpServletRequest request,@RequestParam(value = "id", required = false) Integer id){
		HttpSession session = request.getSession();
		List<Message> message=homeService.showMessageDetails(id);
		if(message !=null){
			for (Message list : message) {
				try {
					list.setMtime(sdfn.format(df.parse(list.getMtime())));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			session.setAttribute("message", message);
		}else{
			request.setAttribute("message", "暂无消息。");
		}
		return "messhowok";
	}
}
