package test.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import test.dto.ReserveDTO;
import test.dto.ZipcodeDTO;

public class E_MypageDAO extends SqlSessionDaoSupport {
	
	public List<ReserveDTO> getReserveList(String restaurant_number, String end_rno) {
		
		Map<String, String> map = new HashMap<>();
		map.put("restaurant_number", restaurant_number);
		map.put("end_rno", end_rno);
		
		List<ReserveDTO> reserveDTO = getSqlSession().selectList("reserve.e_getReserve", map);
		return reserveDTO;
		
	}
	
	public void reserveOk(ReserveDTO reserveDTO) {
		getSqlSession().update("reserve.e_reserveOk", reserveDTO);
		
	}
	
	public void reserveCancel(ReserveDTO reserveDTO) {
		getSqlSession().update("reserve.e_reserveCancel", reserveDTO);
		
	}
	
	public List<ZipcodeDTO> zipcodeRead(String area4) {
		
		List<ZipcodeDTO> zipCodeList = new ArrayList<ZipcodeDTO>();
		zipCodeList = getSqlSession().selectList("zipcode.getList", area4);
		return zipCodeList;
		
	}

}
