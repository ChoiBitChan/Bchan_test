package test.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import test.dto.FileInfoDTO;

public class FileDAO extends SqlSessionDaoSupport {
	
	public int insertFile(FileInfoDTO file) {
		int i = getSqlSession().insert("file.addFile", file);
		return i;
	}

}
