package uni.stu.service;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Service;

import uni.main.model.Login_All_Dto;
import uni.sta.model.ProDto;
import uni.sta.model.StaffDto;
import uni.sta.model.StuDto;


@Service
public class StuInfoService {
	
	StuInfoDao dao;
	
	@Autowired
	public void setDao(StuInfoDao dao) {
		this.dao = dao;
	}
	
	
	public StuDto SelInfo(int stu_no) {
		return dao.SelInfo(stu_no);
	}
	
	public ProDto SelInfoPro(int prof_cd) {
		return dao.SelInfoPro(prof_cd);
	}
	
	public StaffDto SelInfoSta(int staff_no) {
		return dao.SelInfoSta(staff_no);		
	}

		
	public void upInfo(Login_All_Dto dto) {
		dao.upInfo(dto);
	}
	
	public void upInfoPro(Login_All_Dto dto) {
		dao.upInfoPro(dto);
	}
	
	public void upInfoSta(Login_All_Dto dto) {
		dao.upInfoSta(dto);
	}
	
	
	

}
