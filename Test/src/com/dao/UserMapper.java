package com.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.pojo.User;

public interface UserMapper {

	//增
	public int addUser(User user);
	
	//删
	public int delUser(@Param("id")int id);
	
	//改
	public int updUser(User user);
	
	//查+分页
	public List<User> findUser(@Param("name") String name,
			@Param("pageStart")int pageStart,
			@Param("pageSize")int pageSize);//pageStart=从第几条数据开始,pageSize=显示几条数据
	
	//根据User的id查询(修改时使用)
	public User findUserById(@Param("id")int id);
	
	//计算出总数据量(分页时使用)
	public int findUserCount(@Param("name")String name);
	
}