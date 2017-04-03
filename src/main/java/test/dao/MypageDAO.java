package test.dao;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import test.dto.ReserveDTO;

public class MypageDAO extends SqlSessionDaoSupport {
	
	public List<ReserveDTO> getReserveList(String userid) {
		List<ReserveDTO> reserveDTO = getSqlSession().selectList("reserve.getReserve", userid);
		return reserveDTO;
	}

}
