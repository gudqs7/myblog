package com.guddqs.blog.controll;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class LoginAction {

	@RequestMapping("/login")
	public String guddqslogin(String pwd,HttpSession session){
		
		if(pwd.equals("guddqsblog")){
			session.setAttribute("user", "guddqs");
		}
		return "admin/index";
	}
	
	@RequestMapping("/index")
	public String index(String pwd,HttpSession session){
		return "admin/index";
	}
	
}
