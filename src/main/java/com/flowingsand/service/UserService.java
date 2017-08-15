package com.flowingsand.service;

import com.flowingsand.entity.Accounts;

/**
 * 
 * @author yyt
 *
 */
public interface UserService {
	/**
	 * 用户登录
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public boolean login(String uname, String pwd);
	
	/**
	 * 根据用户名进行查询Id
	 * @param uanem
	 * @return
	 */
	public Integer selectId(String uanem);
	
	/**
	 * 查询用户是否存在
	 * 
	 * @param username
	 * @return
	 */
	public boolean isUserNameExist(String uname);
	
	/**
	 * 查询邮箱是否存在
	 * @param email
	 * @return
	 */
	public boolean isEmailExist(String email);

	/**
	 * 用户注册
	 * 
	 * @param accounts
	 * @return
	 */
	public int register(Accounts accounts);
	
	/**
	 * 更新密码
	 * @param pwd
	 * @param email
	 * @return
	 */
	public int modify(String pwd,String email);
}