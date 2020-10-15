package uni.stu.service;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.LicenseDto;

public class LicenseDao extends SqlSessionDaoSupport{
	public List<LicenseDto> list(int stu_no){
		return getSqlSession().selectList("student.listLicense",stu_no);
	}
	public int delete(LicenseDto dto) {
		return getSqlSession().delete("student.deleteLicense", dto);
	}
	public int insert(LicenseDto dto){
		return getSqlSession().insert("student.insertLicense", dto);
	}
}
