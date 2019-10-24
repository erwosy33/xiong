package com.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.User;

public interface UserService {

		//增
		public int addUserService(User user);
		
		//删
		public int delUserService(int id);
		
		//改
		public int updUserService(User user);
		
		//查+分页
		public List<User> findUserService(String name,int pageStart,int pageSize);//pageStart=从第几条数据开始,pageSize=显示几条数据
		
		//根据User的id查询
		public User findUserByIdService(int id);
		
		//计算出总数据量(分页时使用)
		public int findUserCountService(String name);
}
