package uni.stu.service;

import java.util.Map;  
import org.mybatis.spring.support.SqlSessionDaoSupport;
import uni.main.model.Login_All_Dto;

public class StuPassUpDao extends SqlSessionDaoSupport {
	
	public void pwdUpdateStu(Map<String, Object> map, Login_All_Dto dto) {
		map.get("stu_no");
		map.get("stu_pwd");
		getSqlSession().update("Info.pwdUpdateStu", map);
	}
	
	public void pwdUpdatePro(Map<String, Object> map, Login_All_Dto dto) {
		map.get("stu_no");
		map.get("stu_pwd");
		getSqlSession().update("Info.pwdUpdatePro", map);
	}
	
	public void pwdUpdateSta(Map<String, Object> map, Login_All_Dto dto) {
		map.get("stu_no");
		map.get("stu_pwd");
		getSqlSession().update("Info.pwdUpdateSta", map);
	}
	
	public String pwd_check_stu(int stu_no) {

		return getSqlSession().selectOne("Info.pwd_check_stu", stu_no);
	}

	public String pwd_check_pro(int prof_cd) {

		return getSqlSession().selectOne("Info.pwd_check_pro", prof_cd);
	}

	public String pwd_check_sta(int staff_no) {

		return getSqlSession().selectOne("Info.pwd_check_sta", staff_no);
	}
}
