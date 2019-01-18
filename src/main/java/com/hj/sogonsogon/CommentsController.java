package com.hj.sogonsogon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hj.comments.CommentsDTO;
import com.hj.comments.CommentsService;

@Controller
@RequestMapping(value="/comments/**")
public class CommentsController {

	@Autowired
	private CommentsService commentsService;
	
	@ResponseBody
	@RequestMapping(value="/commentsInsert",method=RequestMethod.POST)
	public int commentsInsert(CommentsDTO commentsDTO) throws Exception{
		return commentsService.commentsInsert(commentsDTO);
	}
	
	@ResponseBody
	@RequestMapping(value="/commentsList",method=RequestMethod.GET)
	public List<CommentsDTO> commentsList(int bnum) throws Exception{
		return commentsService.commentsList(bnum);
	}
	
	@ResponseBody
	@RequestMapping(value="/commentsUpdate",method=RequestMethod.POST)
	public int commentsUpdate(CommentsDTO commentsDTO) throws Exception{
		return commentsService.commentsUpdate(commentsDTO);
	}
	
	@ResponseBody
	@RequestMapping(value="/commentsDelete",method=RequestMethod.POST)
	public int commentsDelete(int cnum) throws Exception{
		return commentsService.commentsDelete(cnum);
	}
}