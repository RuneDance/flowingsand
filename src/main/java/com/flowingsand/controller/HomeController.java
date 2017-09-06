package com.flowingsand.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.flowingsand.entity.Article;
import com.flowingsand.entity.Message;
import com.flowingsand.service.HomeService;
import com.flowingsand.utils.Global;
import com.flowingsand.utils.MessageDigestTools;
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
		} else {
			article = this.homeService.showAllArticlesByPage(request, model);
		}
		return new ModelAndView("home");

	}
	
	
	
	/**
	 * 内容发布
	 * @param article
	 * @param request
	 * @param contents
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/relContents", method = RequestMethod.POST)
	@ResponseBody
	public String relContents(Article article, HttpServletRequest request,
			@RequestParam(value = "contents", required = false) String contents,
			@RequestParam(value = "title", required = false) String title) throws Exception {
		OutputStream out;
		String userName = (String) request.getSession().getAttribute("sname");
		String ostype = OSinfo.getOSname().toString();
		String uploadTime = df.format(new Date());
		String regExpImg = "<img\\ssrc=\"\\S*\">";
		ArrayList<String> lists=new ArrayList<String>();
		Pattern pattern = Pattern.compile(regExpImg);
		Matcher matcher = pattern.matcher(contents);
		while (matcher.find()) {
			lists.add(matcher.group());
        }
		if(lists.size() >0){
			for (String list : lists) {
				String encodeVal=list.split("\"")[1].split(",")[1];
				String substr = list.split("\"")[1].split(",")[0];
				String md5Res = MessageDigestTools.encryptMD5(encodeVal.getBytes());
				String origFileName=substr.substring(substr.indexOf("/")+1, substr.indexOf(";"));
				String rename = userName + uploadTime + md5Res + "." + origFileName;
				byte[] b = Base64.decodeBase64(encodeVal);
				//调整异常数据
				for(int i=0;i<b.length;++i){
					if(b[i]<0){
						b[i]+=256;
					}
				}
				if (ostype.equals("Windows")) {
					File file = new File(Global.URL_WINDOWS);
					if (!file.exists()) {
						file.mkdirs();
						file.renameTo(new File(Global.URL_WINDOWS));
					}
					//生成图片到本地
					out = new FileOutputStream(Global.URL_WINDOWS + rename);
					out.write(b);
					out.flush();
					out.close();
					contents = contents.replace(list,"<img src="+ "http://localhost//attaches/" + rename + "/>");
				} else if (ostype.equals("Linux")) {
					File file = new File(Global.URL_LINUX);
					if (!file.exists()) {
						file.mkdirs();
						file.renameTo(new File(Global.URL_LINUX));
					}
					//生成图片到本地
					out = new FileOutputStream(Global.URL_LINUX + rename);
					out.write(b);
					out.flush();
					out.close();
					contents = contents.replace(list,"<img src=" +"http://flowingsand.com//home/attaches/" + rename + "/>");
				}
				
			}
		}
		article.setAcontents(contents);
		article.setTitle(title);
		article.setAtime(uploadTime);
		article.setAuthor(userName);
		int result = homeService.insertContents(article);
		if (result == 1) {
			return "relSucc";
		} else {
			return "relFail";
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
