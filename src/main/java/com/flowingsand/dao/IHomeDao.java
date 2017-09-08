package com.flowingsand.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.flowingsand.entity.Article;
import com.flowingsand.entity.Message;

public interface IHomeDao {
	// 查询所有用户内容的总数
	public int selectAllCount();

	// 查询所有所有内容并分页
	public List<Article> selectAllArticlesByPage(
			@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

	// 查询当前登录用户内容的总数
	public int selectCountByAuthor(@Param("name") String name);

	// 查询当前登录用户内容并分页
	public List<Article> selectArticlesByPage(@Param("name") String name,
			@Param(value = "startPos") Integer startPos,
			@Param(value = "pageSize") Integer pageSize);

	// 用户发布内容
	public int insertArticle(@Param("article") Article article);

	// 根据id查询内容
	public List<Article> selectArticlesById(Integer aid);

	// 根据用户名进行信息查询
	public List<Message> selectMessagesByUser(@Param("name") String name);

	// 根据Id删除消息
	public Integer deleteMessagesById(Integer id);
	
	// 查询普通用户名
	public List<String> selectUserNames();
	
	//向用户发送消息
	public int insertMessages(@Param("message") Message message);
	
	// 根据Id进行消息查询
	public List<Message> selectMessagesById(Integer id);
	
	// 根据用户名进行邮箱查询
	public String selectEmailByUname(String name);
}