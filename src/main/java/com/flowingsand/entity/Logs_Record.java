package com.flowingsand.entity;

/**
 * 日志记录
 * 
 * @author v
 *
 */
public class Logs_Record {

	// 远程访问IP地址
	private String ip;

	// 来自identd的远程逻辑用户名 (总会返回 '-')
	private String log_uname;

	// 通过身份验证的远程用户(如果有,否则“-”)
	private String aut_uname;

	// 远程访问日期
	private String date;

	// 远程访问请求方式
	private String method;

	// 远程访问资源路径
	private String res_url;

	// 远程访问HTTP版本
	private String http_version;

	// 远程访问HTTP响应的状态码
	private Integer http_status;

	// 远程访问的流量消耗
	private Integer flow;

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getLog_uname() {
		return log_uname;
	}

	public void setLog_uname(String log_uname) {
		this.log_uname = log_uname;
	}

	public String getAut_uname() {
		return aut_uname;
	}

	public void setAut_uname(String aut_uname) {
		this.aut_uname = aut_uname;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getRes_url() {
		return res_url;
	}

	public void setRes_url(String res_url) {
		this.res_url = res_url;
	}

	public String getHttp_version() {
		return http_version;
	}

	public void setHttp_version(String http_version) {
		this.http_version = http_version;
	}

	public Integer getHttp_status() {
		return http_status;
	}

	public void setHttp_status(Integer http_status) {
		this.http_status = http_status;
	}

	public Integer getFlow() {
		return flow;
	}

	public void setFlow(Integer flow) {
		this.flow = flow;
	}

}
