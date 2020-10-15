package uni.sta.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import uni.sta.model.SubjectDto;

@Service
public class RestSubService {

	@Setter
	@Autowired
	RestSubDao rsd; 
	
	public List<SubjectDto> viewSub(){
		return rsd.viewSub();
	}
	public List<SubjectDto> viewSubOne(String sub_nm){
		return rsd.viewSubOne(sub_nm);
	}
	public void accept(String sub_cd) {
		rsd.accept(sub_cd);
	}	
	public void naccept(String sub_cd) {
		rsd.naccept(sub_cd);
	}
	
	public List<SubjectDto> searchBd(){
		return rsd.searchBd();
	}
	
	public List<Map<String,Object>> searchRm(String buil_no){
		return rsd.searchRm(buil_no);
	}
	public List<SubjectDto> selectRm(String subroom_nm){
		return rsd.selectRm(subroom_nm);
	}
	
}
