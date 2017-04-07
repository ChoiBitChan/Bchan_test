package test.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import test.dto.C_CustomerDTO;
import test.dto.ReserveDTO;
import test.dto.ReviewDTO;

public class C_MypageDAO extends SqlSessionDaoSupport {
	
	public List<ReserveDTO> getReserveList(String userid, String end_rno) {
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("end_rno", end_rno);
		
		List<ReserveDTO> reserveDTO = getSqlSession().selectList("reserve.c_getReserve", map);
		return reserveDTO;
	}
	
	public List<ReviewDTO> getReviewList(String userid) {
		List<ReviewDTO> reviewDTO = getSqlSession().selectList("review.c_getReview", userid);
		return reviewDTO;
	}
	
	public void deleteReview(ReviewDTO reviewDto) {
		getSqlSession().delete("review.c_deleteReview", reviewDto);
	}
	
	public C_CustomerDTO getInfo(String userid) {
		C_CustomerDTO userInfo = getSqlSession().selectOne("userInfo.getInfo", userid);
		return userInfo;
	}
	
	public void modifyInfo(C_CustomerDTO userInfo) {
		getSqlSession().update("userInfo.modifyInfo", userInfo);
	}

}
