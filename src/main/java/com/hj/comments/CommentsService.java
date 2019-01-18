package com.hj.comments;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hj.page.MakePager;
import com.hj.page.Pager;
import com.hj.page.RowNumber;

@Service
public class CommentsService {
	
	@Autowired
	private CommentsDAO commentsDAO;

	public int commentsInsert(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.commentsInsert(commentsDTO);
	}
	
	public Map<Object, Object> commentsList(int bnum, int curPage) throws Exception{
		Map<Object, Object> map = new HashMap<Object, Object>();
		
		MakePager makePager = new MakePager(curPage);
		RowNumber rowNumber = makePager.MakeRow(bnum);
		Pager pager = makePager.MakePage(commentsDAO.getNum(bnum));
		
		List<CommentsDTO> ar = commentsDAO.commentsList(rowNumber);
		
		map.put("comments_pager", pager);
		map.put("comments_list", ar);
		
		return map; 
	}
	
	public int commentsUpdate(CommentsDTO commentsDTO) throws Exception{
		return commentsDAO.commentsUpdate(commentsDTO);
	}
	
	public int commentsDelete(int cnum) throws Exception{
		return commentsDAO.commentsDelete(cnum);
	}
}
