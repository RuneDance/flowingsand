package com.flowingsand.entity;

import java.io.Serializable;

public class Accounts implements Serializable {
	/**
	 * 用户类
	 */
	private static final long serialVersionUID = 1L;
	// 自动编号
	private Integer id;
	// 等级--用于区分用户身份：0，1，2，3
	private Integer lid;
	// 用户名
	private String uname;
	// 密码
	private String pwd;
	// 再次输入密码
	private String apwd;
	// 昵称
	private String nname;
	// 邮箱
	private String email;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLid() {
		return lid;
	}

	public void setLid(Integer lid) {
		this.lid = lid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getNname() {
		return nname;
	}

	public void setNname(String nname) {
		this.nname = nname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getApwd() {
		return apwd;
	}

	public void setApwd(String apwd) {
		this.apwd = apwd;
	}

}
