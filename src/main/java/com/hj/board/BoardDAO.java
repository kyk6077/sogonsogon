package com.hj.board;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hj.page.RowNumber;



@Repository
public class BoardDAO {
	@Inject
	private SqlSession sqlSession;
	final static String NAMESPACE = "BoardMapper.";
	
	public int boardInsert(BoardDTO boardDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"boardInsert",boardDTO);
	}
	
	public List<BoardDTO> boardList(RowNumber rowNumber) throws Exception{
		return sqlSession.selectList(NAMESPACE+"boardList",rowNumber);
	}
	
	public int getNum(RowNumber rowNumber) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum",rowNumber);
	}
	
	public BoardDTO boardSelectOne(int bnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"boardSelectOne", bnum);
	}
	
	
	public int boardUpdate(BoardDTO boardDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"boardUpdate", boardDTO);
	}
	
	public int boardDelete(int bnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"boardDelete", bnum);
	}
	public int hitPlus(int bnum) throws Exception{
		
		return sqlSession.update(NAMESPACE+"boardHitPlus", bnum); 
	}
	
}
