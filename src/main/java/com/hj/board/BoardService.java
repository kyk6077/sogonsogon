package com.hj.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hj.comments.CommentsDAO;
import com.hj.page.MakePager;
import com.hj.page.Pager;
import com.hj.page.RowNumber;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDAO;
	@Autowired
	private CommentsDAO commentsDAO;
	
	public ModelAndView boardInsert(BoardDTO boardDTO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = boardDAO.boardInsert(boardDTO);
		if(result>0) {
			mv.setViewName("redirect:./boardList");
			mv.addObject("msg", "Success");
		}else {
			mv.setViewName("./boardInsert");
			mv.addObject("boardDTO", boardDTO);
		}
		
		return mv;
	}
	
	public ModelAndView boardList(int curPage, String search, String kind) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		MakePager makePager = new MakePager(curPage, search, kind);
		RowNumber rowNumber = makePager.MakeRow();
		rowNumber.setSearch("%"+search+"%");
		Pager pager = makePager.MakePage(boardDAO.getNum(rowNumber));
		List<BoardDTO> ar = boardDAO.boardList(rowNumber);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("./board/boardList");
		
		return mv;
	}
	
	public Map<Object, Object> boardSelectOne(int bnum) throws Exception{
		boardDAO.hitPlus(bnum);
		BoardDTO boardDTO = boardDAO.boardSelectOne(bnum);
		int count = commentsDAO.commentsCount(bnum);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("boardDTO", boardDTO);
		map.put("commentsCount", count);
		
		return map;
	}
	
	public BoardDTO boardSelectOne(int bnum,String path) throws Exception{
		BoardDTO boardDTO = boardDAO.boardSelectOne(bnum);
		
		return boardDTO;
	}
	
	public int boardUpdate(BoardDTO boardDTO) throws Exception{
		return boardDAO.boardUpdate(boardDTO);
	}
	
	public int boardDelete(int bnum) throws Exception{
		return boardDAO.boardDelete(bnum);
	}
}
