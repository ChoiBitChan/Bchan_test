package test.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import test.dao.MypageDAO;
import test.dto.ReserveDTO;
import test.dto.ReviewDTO;

@Controller
public class MypageController {
	
	@Autowired
	MypageDAO mypageDAO;
	
	public void setMypageDAO(MypageDAO mypageDAO) {
		this.mypageDAO = mypageDAO;
	}

	@RequestMapping("/Mypage_Main.do")
	public String mypage_main() {
		System.out.println("Main page");
		return "Mypage_Main";
	}
	
	
	
	
	@RequestMapping("/Mypage_Reserve.do")
	public ModelAndView mypage_reserve() {
		System.out.println("Reserve page");
		ModelAndView mav = new ModelAndView("Mypage_Reserve");
		
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		list = mypageDAO.getReserveList("a");
		mav.addObject("reserveList", list);
		return mav;
	}
	
	
	
	
	@RequestMapping("/Mypage_UserInfo.do")
	public String mypage_userinfo() {
		System.out.println("UserInfo page");
		return "Mypage_UserInfo";
	}
	
	
	
	
	@RequestMapping("/Mypage_Review.do")
	public ModelAndView mypage_review() {
		System.out.println("Review page");
		ModelAndView mav = new ModelAndView("Mypage_Review");
		
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		list = mypageDAO.getReviewList("a");
		mav.addObject("reviewList", list);
		return mav;
	}
	
	@RequestMapping("/Review_Delete.do")
	public String review_delete(ReviewDTO reviewDto, BindingResult result){
		System.out.println("review_delete");
		mypageDAO.deleteReview(reviewDto);
				
		return "redirect:/Mypage_Review.do";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

}
