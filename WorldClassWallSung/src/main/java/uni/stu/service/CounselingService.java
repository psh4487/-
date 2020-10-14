package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.CounselingDto;

@Service
public class CounselingService{
	@Autowired
	CounselingDao cdao;
	
	public CounselingService() {}

	public List<CounselingDto> subroomList(int stu_no) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		return cdao.subList(m);
	}
	
	public List<CounselingDto> historyList(int stu_no) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		return cdao.historyList(m);
	}
	
	public int counselingApply(CounselingDto dto) {
		return cdao.counselingApply(dto);
	}
	
	public void setCdao(CounselingDao cdao) {
		this.cdao = cdao;
	}
}
