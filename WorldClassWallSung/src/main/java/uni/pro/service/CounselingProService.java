package uni.pro.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uni.pro.model.CounselingProDto;

@Service
public class CounselingProService {
	@Autowired
	CounselingProDao dao;

	public void setdao(CounselingProDao dao) {
		this.dao = dao;
	}

	public List<CounselingProDto> sublist(int prof_cd) {
		return dao.sublist(prof_cd);
	}

	public List<CounselingProDto> conuall(String sub_cd) {
		return dao.conuall(sub_cd);
	}
	
	public List<Object> viewstucou(int cs_no){
		List<Object> list = new ArrayList<>(); 
		list.add(dao.viewstucou(cs_no));
		return list;
	}
	
	public  int stateok(int  cs_no) {
		return dao.stateok( cs_no);		
	}
	
	public  int statenot(int  cs_no) {
		return dao.statenot(cs_no);	
	}
	
	public int delete(int cs_no){
		return dao.deletecou(cs_no);	
	}

}
