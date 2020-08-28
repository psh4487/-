package uni.sta.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import uni.sta.model.SubjectDto;

@Service
public class RestService {
	
	@Setter
	@Autowired
	RestDao rd; 
	
	public List<SubjectDto> viewList(){
		return rd.restList2();
	}
	public List<SubjectDto> reasonList(String sub_nm){
		return rd.reasonList(sub_nm);
	}
	public void accept(String sub_cd) {
		rd.accept(sub_cd);
	}	
	public void naccept(String sub_cd) {
		rd.naccept(sub_cd);
	}
}
