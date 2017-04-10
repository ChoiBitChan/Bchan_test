package test.dao;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.web.multipart.MultipartFile;

import test.dto.E_EnterpriseDTO;
import test.dto.FileInfoDTO;
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
	
	public String getE_info(String userid) {
		System.out.println(userid);
		String e_num = getSqlSession().selectOne("enterInfo.getE_Number", userid);
		return e_num;
	}
	
	public List<ZipcodeDTO> zipcodeRead(String area4) {
		System.out.println(area4);
		List<ZipcodeDTO> zipCodeList = getSqlSession().selectList("zipcode.getList", area4);
		return zipCodeList;
		
	}
	
	public void insertEnterInfo(E_EnterpriseDTO enterInfo) {
		getSqlSession().insert("enterInfo.insertE_Info", enterInfo);
	}
	
	public void upload(MultipartFile emage, String e_name) {
		System.out.println("upload");
		long now = System.currentTimeMillis();
		Random r = new Random();
		int i = r.nextInt(50);
		String name = e_name + "_" + now + "_" + i;
		String ori_name = emage.getOriginalFilename();
		File new_file = new File("f://upload//" + name + "_" + ori_name);
		System.out.println(new_file);
		try {
			emage.transferTo(new_file);
		} catch (Exception e) {
			e.printStackTrace();
		}
		FileInfoDTO f = new FileInfoDTO(emage.getOriginalFilename(), new_file.getPath(), emage.getSize());
		getSqlSession().insert("file.addFile", f);
	}

}
