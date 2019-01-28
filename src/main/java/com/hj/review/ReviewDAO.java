package com.hj.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hj.page.ReviewRowNumber;

@Repository
public class ReviewDAO {
	
	@Autowired
	private SqlSession sqlSession;
	final static String NAMESPACE = "StudyRoomMapper.";
	
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"reviewInsert",reviewDTO);
	}
	
	public List<ReviewDTO> reviewList(ReviewRowNumber reviewRowNumber) throws Exception{
		return sqlSession.selectList(NAMESPACE+"reviewList",reviewRowNumber);
	}
	
	public int reviewDelete(int rnum) throws Exception{
		return sqlSession.delete(NAMESPACE+"reviewDelete",rnum);
	}
	
	public int reviewTotalCount(String target_num) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"reviewTotalCount",target_num);
	}
}
