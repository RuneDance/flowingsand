package com.flowingsand.entity;

import java.io.Serializable;

public class Article implements Serializable {
	/**
	 * 文章类
	 */
	private static final long serialVersionUID = 1L;
	// 自动编号
	private Integer aid;
	// 标题
	private String title;
	// 作者
	private String author;
	// 日期
	private String atime;
	// 内容
	private String acontents;

	public Integer getAid() {
		return aid;
	}

	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getAtime() {
		return atime;
	}

	public void setAtime(String atime) {
		this.atime = atime;
	}

	public String getAcontents() {
		return acontents;
	}

	public void setAcontents(String acontents) {
		this.acontents = acontents;
	}

}
