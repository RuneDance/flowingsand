package com.flowingsand.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.flowingsand.entity.Article;
import com.flowingsand.entity.Message;

public interface HomeService {
	/**
	 * 查询所有用户内容并分页
	 * 
	 * @return
	 */
	public List<Article> showAllArticlesByPage(HttpServletRequest request,
			Model model);

	/**
	 * 查询当前登录用户内容并分页
	 * 
	 * @param request
	 * @param model
	 * @param name
	 * @return
	 */
	public List<Article> showArticlesByPage(HttpServletRequest request,
			Model model, String name);

	/**
	 * 用户发布内容
	 * 
	 * @param article
	 * @return
	 */
	public Integer insertContents(Article article);

	/**
	 * 根据id查询内容
	 * 
	 * @param aid
	 * @return
	 */
	public List<Article> showArticlesDetails(Integer aid);

	/**
	 * 根据用户名进行信息查询
	 * 
	 * @param name
	 * @return
	 */
	public List<Message> showMessages(String name);

	/**
	 * 根据Id删除消息
	 * 
	 * @param id
	 * @return
	 */
	public Integer deleteMessage(Integer id);

	/**
	 * 根据Id进行消息查询
	 * 
	 * @param id
	 * @return
	 */
	public List<Message> showMessageDetails(Integer id);
}
