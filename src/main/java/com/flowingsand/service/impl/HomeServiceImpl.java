package com.flowingsand.service.impl;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.flowingsand.dao.IHomeDao;
import com.flowingsand.entity.Article;
import com.flowingsand.entity.Message;
import com.flowingsand.entity.Page;
import com.flowingsand.service.HomeService;

/**
 * 
 * @author yyt
 *
 */

@Service(value = "HomeService")
public class HomeServiceImpl implements HomeService {
	@Autowired
	IHomeDao iHomeDao;
	DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	DateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH:mm:ss");
	/**
	 * 查询所有用户内容并分页
	 */
	@Override
	public List<Article> showAllArticlesByPage(HttpServletRequest request,
			Model model) {
		Page page = null;
		List<Article> articles;
		HttpSession session = request.getSession();
		String pageNow = request.getParameter("pageNow");
		Integer totalCount = iHomeDao.selectAllCount();
		if (totalCount != null) {
			session.setAttribute("counts", totalCount);
		}
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			articles = this.iHomeDao.selectAllArticlesByPage(
					page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(totalCount, 1);
			articles = this.iHomeDao.selectAllArticlesByPage(page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("page", page);
		if (articles != null) {
			for (Article lists : articles) {
				try {
					lists.setAtime(sdf.format(df.parse(lists.getAtime())));
					lists.setAcontents(lists.getAcontents().replaceAll("<[^<>]*>", ""));
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			session.setAttribute("articles", articles);
			return (List<Article>) articles;
		} else {
			return null;
		}
	}

	/**
	 * 用户发布内容
	 */
	@Override
	public Integer insertContents(Article article) {
		int result = iHomeDao.insertArticle(article);
		return result;
	}

	/**
	 * 查询当前登录用户内容并分页
	 */
	@Override
	public List<Article> showArticlesByPage(HttpServletRequest request,
			Model model, String name) {
		Page page = null;
		List<Article> articles;
		HttpSession session = request.getSession();
		String pageNow = request.getParameter("pageNow");
		Integer totalCount = iHomeDao.selectCountByAuthor(name);
		if (totalCount != null) {
			session.setAttribute("counts", totalCount);
		}
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			articles = this.iHomeDao.selectArticlesByPage(name,
					page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(totalCount, 1);
			articles = this.iHomeDao.selectArticlesByPage(name,
					page.getStartPos(), page.getPageSize());
		}
		model.addAttribute("page", page);
		if (articles != null) {
			for (Article lists : articles) {
				try {
					lists.setAtime(sdf.format(df.parse(lists.getAtime())));
					lists.setAcontents(lists.getAcontents().replaceAll("<[^<>]*>", ""));	
				} catch (ParseException e) {
					e.printStackTrace();
				}
			}
			session.setAttribute("articles", articles);
			return (List<Article>) articles;
		} else {
			return null;
		}
	}

	// 根据id查询内容
	@Override
	public List<Article> showArticlesDetails(Integer aid) {
		return iHomeDao.selectArticlesById(aid);
	}

	// 根据用户名进行信息查询
	@Override
	public List<Message> showMessages(String name) {
		List<Message> message = iHomeDao.selectMessagesByUser(name);
		if (message != null) {
			return message;
		} else {
			return null;
		}
	}

	/**
	 * 根据Id删除消息
	 */
	@Override
	public Integer deleteMessage(Integer id) {
		int res = iHomeDao.deleteMessagesById(id);
		return res;
	}
	
	/**
	 * 查询普通用户名
	 */
	@Override
	public List<String> selectUserNames() {
		List<String> accounts=iHomeDao.selectUserNames();
		return accounts;
	}
	
	/**
	 * 向用户发送消息
	 */
	@Override
	public Integer insertMessages(Message message) {
		int res=iHomeDao.insertMessages(message);
		return res;
	}
	
	/**
	 * 根据Id进行消息查询
	 */
	@Override
	public List<Message> showMessageDetails(Integer id) {
		List<Message> res = iHomeDao.selectMessagesById(id);
		if (res != null) {
			return res;
		} else {
			return null;
		}
	}
	
	/**
	 * 根据用户名进行邮箱查询
	 */
	@Override
	public String selectEmailByUname(String name) {
		String email=iHomeDao.selectEmailByUname(name);
		return email;
	}



}
