package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.pojo.User;
import com.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	// http://localhost:8080/Test/user/showfindUser
	
	@Autowired
	private UserService objService;
	
	//显示User查询页面
	@RequestMapping("/showfindUser")
	public String showfindUser(Model model) {
		return "findUser";
	}
	
	
	//显示User查询数据
	@RequestMapping("showfindUserData")
	@ResponseBody
	public String showfindUserData(@RequestParam(value = "name",required = false)String name,
			@RequestParam(value = "pageNo",required = false)Integer pageNo,
			@RequestParam(value="pageSize",required = false)Integer pageSize,Model model) {
			
			
		    pageSize=3;//改进
		  //获取页面当前页码
	    	if(pageNo==null||pageNo.equals("")){
	    		pageNo=1;
	    	}
			// 计算数据库的分页从第几行开始取数
			int pageCount = (pageNo - 1) * pageSize;
			//获取总条数
			
			
			
			
			
		 	int count=objService.findUserCountService(name);
		 	System.out.println("QQQQQQQQQQQQQQQ"+count);
		 	
		 	// page=总页数
		 	int page=count%pageSize==0?count/pageSize:count/pageSize+1;
		 
		 	

		 	
		 	
		 	
		 	
		 	
		 	
		    List<User> list=objService.findUserService(name,pageCount,pageSize);
		    String json=JSON.toJSONString(list);
		    
		    String strJson = "{\"count\":" + count + ",\"page\":"+page+",\"data\":" + json + "}";
		    System.out.println("BBBBBBBBBB"+strJson);
		    return strJson;//返回查询页面
	}
	
	
	//显示添加页面
	@RequestMapping("showAddUser")
	public String showAddUser() {
		return "addUser";
	}
	
	//添加方法
	@RequestMapping("addUserData")
	@ResponseBody
	public int addUser(User user) {
		int count=objService.addUserService(user);
		return count;
	}
	
	
	//删除方法
	@RequestMapping("delUserData")
	@ResponseBody
	public int delUser(@RequestParam(value = "id",required = true)int id) {
		int count=objService.delUserService(id);
		return count;		
	}
	
	
	//显示修改页面
	@RequestMapping("showUpdUser")
	public String showUpdUser(@RequestParam("id")int id,Model model) {
		User user=objService.findUserByIdService(id);
		model.addAttribute("objUser",user);
		return "updUser";//返回修改页面
	}
	
	//显示修改页面数据
	@RequestMapping("showUpdUserData")
	@ResponseBody
	public int showUpdUserData(User user) {
		int count=objService.updUserService(user);
		return count;
	}
	
	//显示根据User的id查询的数据
	@RequestMapping("showUserById")
	@ResponseBody
	public String showUserById(@RequestParam(value = "id",required = true)int id,Model model) {
		User user=objService.findUserByIdService(id);
		model.addAttribute("obj",user);
		return "updUser";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
