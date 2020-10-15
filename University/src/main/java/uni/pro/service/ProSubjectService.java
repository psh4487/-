package uni.pro.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.pro.model.Class_cancel_Dto;
import uni.pro.model.Class_cancel_Dto_main;
import uni.pro.model.ProSubjectDto;

@Service
public class ProSubjectService {
	@Autowired
	ProSubjectDao SDao;
	String day;
	int time;
	int[] alltime;

	public ProSubjectService() {
	}

	public List<ProSubjectDto> submain(int prof_cd) {
		return SDao.submain(prof_cd);
	}
	
	public List<Class_cancel_Dto_main> class_cancel_main(int prof_cd) {
		return SDao.class_cancel_main(prof_cd);
	}

	public List<ProSubjectDto> sublist(int prof_cd) {
		return SDao.sublist(prof_cd);
	}

	public ProSubjectDto noclass(String sub_nm) {
		return SDao.noclass(sub_nm);
	}
	
	public void class_cancel(Class_cancel_Dto Dto) {
		SDao.class_cancel(Dto);
	}

	public void setSDao(ProSubjectDao sDao) {
		SDao = sDao;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public void setAlltime(int[] alltime) {
		this.alltime = alltime;
	}

}
