package uni.stu.service;

import java.util.Map; 

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.main.model.Login_All_Dto;


@Service
public class StuPassUpService {
	
	StuPassUpDao dao;
	@Autowired
	public void setDao(StuPassUpDao dao) {
		this.dao = dao;
	}


	public void pwdUpdateStu(Map<String, Object> map, Login_All_Dto dto) {
		dao.pwdUpdateStu(map,dto);
	}
	
	public void pwdUpdatePro(Map<String, Object> map, Login_All_Dto dto) {
		dao.pwdUpdatePro(map,dto);
	}
	
	public void pwdUpdateSta(Map<String, Object> map, Login_All_Dto dto) {
		dao.pwdUpdateSta(map,dto);
	}
	
	public String pwd_check_stu(int stu_no) {
		return dao.pwd_check_stu(stu_no);
	}

	public String pwd_check_pro(int prof_cd) {
		return dao.pwd_check_pro(prof_cd);
	}

	public String pwd_check_sta(int staff_no) {
		return dao.pwd_check_sta(staff_no);
	}
}
