package com.hj.sogonsogon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/visitor/**")
public class VisitorController {

	@RequestMapping(value="login")
	public void login() throws Exception{
		
	}
	
}
