package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.GradeMDto;

@Service
public class GradeMService{
	@Autowired
	GradeMDao mdao;
	
	public GradeMService() {}

	public List<GradeMDto> yearsList() {
		return mdao.yearsList();
	}
	public List<GradeMDto> semList() {
		return mdao.semList();
	}
	
	public List<GradeMDto> gradeMSel(int stu_no, int years, int sem) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		m.put("years", years);
		m.put("sem", sem);
		return mdao.gradeMSel(m);
	}
	
	public void setMdao(GradeMDao mdao) {
		this.mdao = mdao;
	}
}
