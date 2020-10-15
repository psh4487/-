package uni.stu.service;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.main.model.Login_All_Dto;
import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDto;


public class StuInfoDao  extends SqlSessionDaoSupport {

	public StuDto SelInfo(int stu_no) {
		return getSqlSession().selectOne("Info.selInfo", stu_no);
	}
	
	public ProDto SelInfoPro(int prof_cd) {
		return getSqlSession().selectOne("Info.selInfoPro", prof_cd);
	}
	
	public StaffDto SelInfoSta(int staff_no) {
		return getSqlSession().selectOne("Info.selInfoSta", staff_no);
	}
	
	public void upInfo(Login_All_Dto dto) {
		getSqlSession().update("Info.upInfo", dto);
	}
	
	public void upInfoPro(Login_All_Dto dto) {
		getSqlSession().update("Info.upInfoPro", dto);
	}
	
	public void upInfoSta(Login_All_Dto dto) {
		getSqlSession().update("Info.upInfoSta", dto);
	}
	
}
