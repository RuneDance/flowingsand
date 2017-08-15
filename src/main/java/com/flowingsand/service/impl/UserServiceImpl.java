package com.flowingsand.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.flowingsand.dao.IUserDao;
import com.flowingsand.entity.Accounts;
import com.flowingsand.service.UserService;

/**
 * 
 * @author yyt
 *
 */

@Service(value = "UserService")
public class UserServiceImpl implements UserService {
	@Autowired
	IUserDao iUserDao;

	/**
	 * 用户登录
	 */
	@Override
	public boolean login(String uname, String pwd) {
		Accounts user = iUserDao.selectByNameAndPassword(uname, pwd);
		if (user != null) {
			if (user.getUname().equals(uname)
					&& user.getPwd().equals(pwd))
				return true;
		}
		return false;
	}
	
	/**
	 * 根据用户名进行查询Id
	 */
	@Override
	public Integer selectId(String uname){
		Integer result=iUserDao.selectIdByName(uname);
		if(result !=null){
			return result;
		}
		return null;
	}
	
	/**
	 * 校验用户是否存在
	 */
	@Override
	public boolean isUserNameExist(String uname) {
		Accounts userName = iUserDao.selectByName(uname);
		if (userName != null) {
			if (userName.getUname().equals(uname)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 校验邮箱是否存在
	 */
	@Override
	public boolean isEmailExist(String email){
		Accounts userEmail=iUserDao.selectByEmail(email);
		if(null !=userEmail){
			if(userEmail.getEmail().equals(email)){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 用户注册
	 */
	@Override
	public int register(Accounts accounts) {
		int iuser=iUserDao.insertAccounts(accounts);
		return iuser;
	}
	
	/**
	 * 更新密码
	 */
	@Override
	public int modify(String pwd, String email) {
		int result=iUserDao.modifyPassword(pwd,email);
		return result;
	}
	
}
