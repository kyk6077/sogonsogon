package com.hj.review;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hj.page.MakePager;
import com.hj.page.ReviewRowNumber;

@Service
public class ReviewService {

	@Autowired
	private ReviewDAO reviewDAO;
	
	
	public int reviewInsert(ReviewDTO reviewDTO) throws Exception{
		return reviewDAO.reviewInsert(reviewDTO);
	}
	
	//perPage 수정시  reviewTotalCount totalPage 계산 수치도 같이 변경
	public Map<Object, Object> reviewList(String target_num,int curPage) throws Exception{
		MakePager makePager = new MakePager(curPage,10);
		ReviewRowNumber reviewRowNumber = makePager.makeReviewRow(target_num);
		int totalCount = reviewDAO.reviewTotalCount(target_num);
		int totalPage = totalCount/10;
		if(totalCount%10 > 0) {
			totalPage++;
		}
		List<ReviewDTO> ar = reviewDAO.reviewList(reviewRowNumber);
		Map<Object, Object> map = new HashMap<Object, Object>();
		map.put("totalPage", totalPage);
		map.put("reviewList", ar);
		
		return map;
	}
	
	
	//perPage 수정시  reviewList에 MakePager 매개변수 수치도 같이 변경
	public int reviewTotalCount(String target_num) throws Exception{
		int totalCount = reviewDAO.reviewTotalCount(target_num);
		int totalPage = totalCount/10;
		if(totalCount%10 > 0) {
			totalPage++;
		}
		
		return totalPage;
	}
	
	public int reviewDelete(int rnum) throws Exception{
		return reviewDAO.reviewDelete(rnum);
	}
	
}
