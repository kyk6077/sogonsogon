package com.hj.sogonsogon;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hj.page.ReviewRowNumber;
import com.hj.review.ReviewDTO;
import com.hj.review.ReviewService;

@Controller
@RequestMapping(value="/studyRoom/**")
public class StudyRoomController {

	@Autowired
	private ReviewService reviewService;
	
	@RequestMapping(value="locationMap")
	public void locationMap() throws Exception{
		
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="reviewList")
	public Map<Object, Object> reviewList(String target_num,@RequestParam(value="curPage",defaultValue="1")int curPage) throws Exception{
		return reviewService.reviewList(target_num,curPage);
	}
	
	@ResponseBody
	@RequestMapping(value="reviewInsert",method=RequestMethod.POST)
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception{
		return reviewService.reviewInsert(reviewDTO);
	}
	
	
	@ResponseBody
	@RequestMapping(value="reviewDelete",method=RequestMethod.POST)
	public int reviewDelete(int rnum) throws Exception{
		return reviewService.reviewDelete(rnum);
	}
	
	
	
}
