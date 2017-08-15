package com.flowingsand.entity;

import java.io.Serializable;

public class Message implements Serializable {
	/**
	 * 消息类
	 */
	private static final long serialVersionUID = 1L;
	private int mid;
	private String mname;
	private String mtime;
	private String messages;

	public int getMid() {
		return mid;
	}

	public void setMid(int mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public String getMtime() {
		return mtime;
	}

	public void setMtime(String mtime) {
		this.mtime = mtime;
	}

	public String getMessages() {
		return messages;
	}

	public void setMessages(String messages) {
		this.messages = messages;
	}
}
