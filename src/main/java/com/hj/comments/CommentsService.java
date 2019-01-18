package com.hj.comments;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsDAO commentsDAO;

	public int commentsInsert(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.commentsInsert(commentsDTO);
	}
	
	public List<CommentsDTO> commentsList(int bnum) throws Exception{
		return commentsDAO.commentsList(bnum);
	}
	
	public int commentsUpdate(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.commentsUpdate(commentsDTO);
	}
	
	public int commentsDelete(int cnum) throws Exception{
		return commentsDAO.commentsDelete(cnum);
	}
}
