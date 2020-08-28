package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.EestimationDto;

@Service
public class EstimationService{
	@Autowired
	EstimationDao edao;
	
	public EstimationService() {}

	public List<EestimationDto> subjectList(int stu_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_no", stu_no);
		return edao.subjectList(map);
	}
	
	public List<EestimationDto> dataCheck(int stu_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_no", stu_no);
		return edao.dataCheck(map);
	}
	
	public int joinEstimation(int stu_no, int sub_cd, int no1, int no2, int no3, int no4, int no5, int no6, int no7, int no8, int no9, int no10, String prof_say) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("stu_no", stu_no);
		map.put("sub_cd", sub_cd);
		map.put("no1", no1);
		map.put("no2", no2);
		map.put("no3", no3);
		map.put("no4", no4);
		map.put("no5", no5);
		map.put("no6", no6);
		map.put("no7", no7);
		map.put("no8", no8);
		map.put("no9", no9);
		map.put("no10", no10);
		map.put("prof_say", prof_say);
		return edao.joinEstimation(map);
	}

	public void setEdao(EstimationDao edao) {
		this.edao = edao;
	}
}