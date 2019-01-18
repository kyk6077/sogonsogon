package com.hj.sogonsogon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="/visitor/**")
public class VisitorController {

	@RequestMapping(value="login",method = RequestMethod.POST)
	public String login(String token, HttpServletRequest request) throws Exception{
		System.out.println("login");
		HttpSession session = (HttpSession)request.getSession();
		System.out.println(token);
		session.setAttribute("token", token);
		return "Success";
	}
	
	@RequestMapping(value="logout",method = RequestMethod.POST)
	public void logout(HttpServletRequest request) throws Exception{
		System.out.println("logout");
		HttpSession session = (HttpSession)request.getSession();
		String token = (String)session.getAttribute("token");
		System.out.println(token);
		if(token != null) {
			session.removeAttribute("token");
		}else {
			System.out.println("이미 로그아웃");
		}
		
	}
}
