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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import test.dao.E_MypageDAO;
import test.dto.ReserveDTO;

@Controller
public class E_MypageController {
	
	@Autowired
	E_MypageDAO e_mypageDAO;

	public void setMypageDAO(E_MypageDAO e_mypageDAO) {
		this.e_mypageDAO = e_mypageDAO;
	}
	
	@RequestMapping("/E_Mypage_Main.do")
	public String mypage_main() {
		System.out.println("E_Main page");
		return "E_Mypage_Main";
	}
	
	
	
	
	
	@RequestMapping("/E_Mypage_Reserve.do")
	public ModelAndView mypage_reserve(@RequestParam(value="end_rno", defaultValue="20") String end_rno) {
		
		System.out.println("E_Reserve page");
		
		ModelAndView mav = new ModelAndView("E_Mypage_Reserve");
		List<ReserveDTO> list = new ArrayList<ReserveDTO>();
		list = e_mypageDAO.getReserveList("0101", end_rno);
		mav.addObject("reserveList", list);
		
		return mav;
	}
	
	@RequestMapping("/E_reserveOk.do")
	public String reserveOk(ReserveDTO reserveDTO, BindingResult result) {
		System.out.println("E_reserveOk");
		e_mypageDAO.reserveOk(reserveDTO);
		return "redirect:/E_Mypage_Reserve.do";
	}
	
	@RequestMapping("/E_reserveCancel.do")
	public String reserveCancel(ReserveDTO reserveDTO, BindingResult result) {
		System.out.println("E_reserveCancel");
		e_mypageDAO.reserveCancel(reserveDTO);
		return "redirect:/E_Mypage_Reserve.do";
	}
	
	
	
	
	@RequestMapping("/E_Mypage_EnterInfo.do")
	public String insertEnterInfo(){
		System.out.println("E_insertInfo");
		return "E_Mypage_EnterInfo";
	}
	
	@RequestMapping("/findZipcode.do")
	public String findZipcode() {
		return "findZipcode";
	}
	
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	

}
