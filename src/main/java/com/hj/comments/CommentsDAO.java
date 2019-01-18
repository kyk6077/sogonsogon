package com.hj.comments;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.hj.page.RowNumber;

@Repository
public class CommentsDAO {
	
	@Inject
	private SqlSession sqlSession;
	final static String NAMESPACE = "CommentsMapper.";
	
	public int commentsCount(int bnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"boardCommentsCount", bnum); 
	}
	
	public int commentsInsert(CommentsDTO commentsDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"commentsInsert", commentsDTO);
	}
	
	public List<CommentsDTO> commentsList(RowNumber rowNumber)throws Exception{
		return sqlSession.selectList(NAMESPACE+"commentsList",rowNumber);
	}
	
	public int getNum(int bnum) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getNum",bnum);
	}

	public int commentsUpdate(CommentsDTO commentsDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"commentsUpdate",commentsDTO);
	}
	
	public int commentsDelete(int cnum)throws Exception{
		return sqlSession.delete(NAMESPACE+"commentsDelete",cnum);
	}
	
}
