package uni.pro.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uni.pro.model.EstimationProDto;

@Service
public class EstimationProService {
	@Autowired
	EstimationProDao dao;

	public void setDao(EstimationProDao dao) {
		this.dao = dao;
	}
	 
	public List<EstimationProDto> sublist(int prof_cd){
		return  dao.sublist(prof_cd);
	}
	public List<EstimationProDto>estall(String sub_cd){
		return dao.estall(sub_cd);
}

	public List<Object> viewest(int stu_no,String sub_cd) {
		List<Object> list = new ArrayList<>(); 
		EstimationProDto dto = new EstimationProDto();
		dto.setSub_cd(sub_cd);
		dto.setStu_no(stu_no);
		list.add(dao.viewest(dto));
		return list;
	}
	
	public  int esteok(int stu_no) {
		return dao.esteok(stu_no);
	}
	
	public List<Object> view(String sub_cd) {
		List<Object> list = new ArrayList<>(); 
		list.add(dao.view(sub_cd));
		return list;
	}
}
