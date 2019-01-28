package com.hj.sogonsogon;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.hj.visitor.VisitorDTO;

@RestController
@RequestMapping(value="/visitor/**")
public class VisitorController {

	@RequestMapping(value="login",method = RequestMethod.POST)
	public String login(String token,VisitorDTO visitorDTO, HttpServletRequest request) throws Exception{
		HttpSession session = (HttpSession)request.getSession();
		session.setAttribute("token", token);
		session.setAttribute("visitor",visitorDTO);
		return "Success";
	}
	
	@RequestMapping(value="logout",method = RequestMethod.POST)
	public void logout(HttpServletRequest request) throws Exception{
		HttpSession session = (HttpSession)request.getSession();
		String token = (String)session.getAttribute("token");
		System.out.println(token);
		if(token != null) {
			session.removeAttribute("token");
			session.removeAttribute("visitor");
		}else {
			System.out.println("이미 로그아웃");
		}
		
	}
	
}
