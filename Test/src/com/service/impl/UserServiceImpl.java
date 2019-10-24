package com.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dao.UserMapper;
import com.pojo.User;
import com.service.UserService;

@Service("userServiceImpl")
public class UserServiceImpl implements UserService{

	@Autowired
	private UserMapper objUser;
	
	@Override
	public int addUserService(User user) {
		return objUser.addUser(user);
	}
  
	@Override
	public int delUserService(int id) {
		return objUser.delUser(id);
	}

	@Override
	public int updUserService(User user) {
		return objUser.updUser(user);
	}

	@Override
	public List<User> findUserService(String name,int pageStart,int pageSize) {
		return objUser.findUser(name,pageStart,pageSize);
	}

	@Override
	public User findUserByIdService(int id) {
		return objUser.findUserById(id);
	}

	@Override
	public int findUserCountService(String name) {
		System.out.println("findUserCountService:"+objUser.findUserCount(name));
		return objUser.findUserCount(name);
	}
	
	
	
	
	
	
	
	
	
	

}
