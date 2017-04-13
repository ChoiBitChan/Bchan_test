package sns.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.web.multipart.MultipartFile;

import sns.dto.CustomerDTO;
import sns.dto.ReserveDTO;
import sns.dto.ReviewDTO;
import sns.dto.ReviewImageDTO;

public class C_MypageDAO extends SqlSessionDaoSupport {
	
	public List<ReserveDTO> getReserveList(String userid, String end_rno) {
		
		Map<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("end_rno", end_rno);
		
		List<ReserveDTO> reserveDTO = getSqlSession().selectList("reserve.c_getReserve", map);
		return reserveDTO;
	}
	
	public ReserveDTO getNum_Date(int reserveNumber) {
		ReserveDTO reserveDTO = getSqlSession().selectOne("reserve.c_getNum_Date", reserveNumber);
		return reserveDTO;
	}
	
	public void reserveCancel(String reserveNumber) {
		getSqlSession().update("reserve.c_reserveCancel", reserveNumber);
	}
	
	public void writeReview(ReviewDTO reviewDTO) {
		getSqlSession().insert("review.c_writeReview", reviewDTO);
	}
	
	public List<ReviewDTO> getReviewList(String userid) {
		List<ReviewDTO> reviewDTO = getSqlSession().selectList("review.c_getReview", userid);
		return reviewDTO;
	}
	
	public void deleteReview(ReviewDTO reviewDto) {
		getSqlSession().delete("review.c_deleteReview", reviewDto);
	}
	
	public CustomerDTO getInfo(String userid) {
		CustomerDTO userInfo = getSqlSession().selectOne("userInfo.getInfo", userid);
		return userInfo;
	}
	
	public void modifyInfo(CustomerDTO userInfo) {
		getSqlSession().update("userInfo.modifyInfo", userInfo);
	}
	
	public String upload(ReviewDTO reviewDTO) {
		System.out.println("upload");
		long now = System.currentTimeMillis();
		String name = reviewDTO.getUserid();
		String ori_name = reviewDTO.getReview_image().getOriginalFilename();
		
		String path = "d://Review_image//" + now + "_" + name + "_" + ori_name;
		File new_file = new File(path);
		System.out.println(new_file);
		try {
			reviewDTO.getReview_image().transferTo(new_file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		ReviewImageDTO imageDTO = new ReviewImageDTO();
		imageDTO.setOriginalFilename(reviewDTO.getReview_image().getOriginalFilename());
		imageDTO.setFilePath(new_file.getPath());
		imageDTO.setFileSize(reviewDTO.getReview_image().getSize());
		imageDTO.setRestaurant_number(reviewDTO.getRestaurant_number());
		imageDTO.setUserid(reviewDTO.getUserid());
		
		getSqlSession().insert("upload.review_image", imageDTO);
		
		return path;
	}

}
