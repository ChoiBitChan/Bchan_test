package test.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import test.dao.MypageDAO;
import test.dto.ReserveDTO;

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
	
	
	public String mypage_reserve1() {
		System.out.println("Reserve page");
		return "Mypage_Reserve";
	}
	
	@RequestMapping("/Mypage_Reserve.do")
	public ModelAndView mypage_reserve2() {
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
	public String mypage_review() {
		System.out.println("Review page");
		return "Mypage_Review";
	}

}
