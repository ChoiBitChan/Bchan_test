package sns.controller;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import sns.dao.C_MypageDAO;
import sns.dto.CustomerDTO;
import sns.dto.ReserveDTO;
import sns.dto.ReviewDTO;

@Controller
public class C_MypageController {
	
	@Autowired
	C_MypageDAO c_mypageDAO;
	
	public void setMypageDAO(C_MypageDAO c_mypageDAO) {
		this.c_mypageDAO = c_mypageDAO;
	}

	@RequestMapping("/C_Mypage_Main.do")
	public String mypage_main() {
		System.out.println("Main page");
		return "C_Mypage_Main";
	}
	
	
	
	
	@RequestMapping("/C_Mypage_Reserve.do")
	public ModelAndView mypage_reserve(@RequestParam(value="end_rno", defaultValue="10") String end_rno) {
		System.out.println("Reserve page");
		System.out.println(end_rno);
		ModelAndView mav = new ModelAndView("C_Mypage_Reserve");
		
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		list = c_mypageDAO.getReserveList("a", end_rno);
		mav.addObject("reserveList", list);
		mav.addObject("end_rno", end_rno);
		return mav;
	}
	
	
	
	
	@RequestMapping("/C_Mypage_UserInfo.do")
	public ModelAndView mypage_userinfo() {
		System.out.println("UserInfo page");
		ModelAndView mav = new ModelAndView("C_Mypage_UserInfo");
		
		CustomerDTO userInfo = new CustomerDTO();
		userInfo = c_mypageDAO.getInfo("a");
		mav.addObject("userInfo", userInfo);
		
		return mav;
	}
	
	@RequestMapping("/C_modifyInfo.do")
	public String modifyInfo(CustomerDTO userInfo, BindingResult result) {
		System.out.println("modifyInfo");
		System.out.println(userInfo.getUserid());
		System.out.println(userInfo.getName());
		c_mypageDAO.modifyInfo(userInfo);
		
		return "redirect:/C_Mypage_UserInfo.do";
	}
	
	
	
	
	@RequestMapping("/C_Mypage_Review.do")
	public ModelAndView mypage_review() {
		System.out.println("Review page");
		ModelAndView mav = new ModelAndView("C_Mypage_Review");
		
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		list = c_mypageDAO.getReviewList("a");
		mav.addObject("reviewList", list);
		return mav;
	}
	
	@RequestMapping("/writeForm.do")
	public ModelAndView writeForm(@RequestParam("restaurant_number") String restaurant_number) {
		ModelAndView mav = new ModelAndView("C_Mypage_ReviewForm");
		mav.addObject("restaurant_number", restaurant_number);
		return mav;
	}
	
	@RequestMapping("/C_Review_Delete.do")
	public String review_delete(ReviewDTO reviewDto, BindingResult result){
		System.out.println("review_delete");
		c_mypageDAO.deleteReview(reviewDto);
				
		return "redirect:/C_Mypage_Review.do";
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

}
