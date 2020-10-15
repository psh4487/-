package uni.pro.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.pro.model.ProSubjectDto;

@Service
public class LecturService {
	
	@Autowired
	LecturDao LDao;	
	
	public int code() {
		return LDao.code();
	}
		
	public void subjecttbsave(ProSubjectDto subdto) {
		LDao.subjecttbsave(subdto);
	}
	
	public List<ProSubjectDto> select(int prof_cd) {
		return LDao.select(prof_cd);
	}
	
	public List<ProSubjectDto> lectureroom() {
		return LDao.lectureroom();
	}
	
    public List<ProSubjectDto> appDomt_domt_employee_add_listselect(){
        return LDao.appDomt_domt_employee_add_listselect();  
     }
    
    public List<Map<String,Object>> appDomt_domt_employee_add_listselect_two(String Subroom_nm){
        return LDao.appDomt_domt_employee_add_listselect_two(Subroom_nm);
     }

	public void setLDao(LecturDao lDao) {
		LDao = lDao;
	}


	
}
