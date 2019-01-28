package com.hj.sogonsogon;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value="/hotBook/**")
public class HotBookController {

	@RequestMapping(value="hotBookList")
	public void locationMap() throws Exception{
		System.out.println("hotbookList");
	}
	
}
