package uni.main.service;

import java.util.Map; 

import org.mybatis.spring.support.SqlSessionDaoSupport;
import uni.main.model.Login_All_Dto;
import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDto;

public class LoginStuDao extends SqlSessionDaoSupport {

	public Login_All_Dto LoginStu(Map<String, Object> map, Login_All_Dto alldto) {

		map.get("stu_no");
		map.get("stu_pwd");
		return getSqlSession().selectOne("staff.selectstu", map);
	}

	public Login_All_Dto LoginSta(Map<String, Object> map, Login_All_Dto alldto) {

		map.get("staff_no");
		map.get("staff_pwd");
		return getSqlSession().selectOne("staff.selectsta", map);
	}

	public Login_All_Dto LoginPro(Map<String, Object> map, Login_All_Dto alldto) {

		map.get("prof_cd");
		map.get("prof_pwd");
		return getSqlSession().selectOne("staff.selectpro", map);
	}

	public Login_All_Dto idmailcheck_stu(Map<String, Object> map, Login_All_Dto alldto) {

		map.get("stu_no");
		map.get("stu_email");

		return getSqlSession().selectOne("staff.idmailcheck_stu", map);
	}

	public Login_All_Dto idmailcheck_pro(Map<String, Object> map, Login_All_Dto alldto) {

		map.get("prof_cd");
		map.get("prof_email");

		return getSqlSession().selectOne("staff.idmailcheck_pro", map);
	}

	public Login_All_Dto idmailcheck_sta(Map<String, Object> map, Login_All_Dto alldto) {

		map.get("staff_no");
		map.get("staff_email");

		return getSqlSession().selectOne("staff.idmailcheck_sta", map);
	}

	public void pass_change_stu(Map<String, Object> map, StuDto dto) throws Exception {

		map.get("stu_pwd");
		map.get("stu_no");

		getSqlSession().update("staff.pass_change_stu", map);
	}

	public void pass_change_pro(Map<String, Object> map, ProDto dto) throws Exception {

		map.get("prof_pwd");
		map.get("prof_cd");

		getSqlSession().update("staff.pass_change_pro", map);
	}

	public void pass_change_sta(Map<String, Object> map, StaffDto dto) throws Exception {

		map.get("staff_pwd");
		map.get("staff_no");

		getSqlSession().update("staff.pass_change_sta", map);
	}

}
