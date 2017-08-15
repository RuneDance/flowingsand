package com.flowingsand.dao;

import org.apache.ibatis.annotations.Param;

import com.flowingsand.entity.Accounts;

/**
 * 
 * @author yyt
 *
 */
public interface IUserDao {
	/**
	 * 根据用户名和密码进行查询
	 * 
	 * @param uname
	 * @param pwd
	 * @return
	 */
	public Accounts selectByNameAndPassword(@Param("uname") String uname,
			@Param("pwd") String pwd);

	/**
	 * 根据用户名进行查询
	 * 
	 * @param uname
	 * @return
	 */
	public Accounts selectByName(@Param("uname") String uname);
	
	/**
	 * 根据用户名进行查询Id
	 * @param uname
	 * @return
	 */
	public Integer selectIdByName(@Param("uname") String uname);
	
	/**
	 * 根据邮箱进行查询
	 * 
	 * @param email
	 * @return
	 */
	public Accounts selectByEmail(@Param("email") String email);

	/**
	 * 用户注册
	 * 
	 * @param accounts
	 * @return
	 */
	public int insertAccounts(@Param("accounts") Accounts accounts);
	
	/**
	 * 更新密码
	 * @param pwd
	 * @param email
	 * @return
	 */
	public int modifyPassword(@Param("pwd") String pwd,@Param("email") String email);
}
