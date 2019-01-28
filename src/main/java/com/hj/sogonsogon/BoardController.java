package com.hj.sogonsogon;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hj.board.BoardDTO;
import com.hj.board.BoardService;

@Controller
@RequestMapping(value="/board/**")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="boardList")
	
	public ModelAndView boardList(@RequestParam(value="curPage",defaultValue="1")int curPage,
			@RequestParam(value="search",defaultValue="") String search,
			@RequestParam(value="kind",defaultValue="title") String kind) throws Exception{
		
		return boardService.boardList(curPage,search,kind);
	}
	
	@RequestMapping(value="boardInsert",method=RequestMethod.GET)
	public void boardInsert() throws Exception{
		
	}
	
	@RequestMapping(value="boardInsert",method=RequestMethod.POST)
	public ModelAndView boardInsert2(BoardDTO boardDTO) throws Exception{
		return boardService.boardInsert(boardDTO);
	}
	
	@RequestMapping(value="boardSelectOne",method=RequestMethod.GET)
	public Map<Object, Object> boardInsert2(int bnum) throws Exception{
		return boardService.boardSelectOne(bnum);
	}
	
	@ResponseBody
	@RequestMapping(value="boardDelete",method=RequestMethod.POST)
	public int boardDelete(int bnum) throws Exception{
		return boardService.boardDelete(bnum);
	}
	
	@RequestMapping(value="boardUpdate",method=RequestMethod.GET)
	public BoardDTO boardUpdate(int bnum) throws Exception{
		return boardService.boardSelectOne(bnum,"boardUpdate");
	}
	
	@ResponseBody
	@RequestMapping(value="boardUpdate",method=RequestMethod.POST)
	public int boardUpdate2(BoardDTO boardDTO) throws Exception{
		return boardService.boardUpdate(boardDTO);
	}
	
}
