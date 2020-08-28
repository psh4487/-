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
	
	public int counselingApply(int sub_cd, int stu_no, String cs_date, String cs_nm, String cs_con) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("sub_cd", sub_cd);
		m.put("stu_no", stu_no);
		m.put("cs_date", cs_date);
		m.put("cs_nm", cs_nm);
		m.put("cs_con", cs_con);
		return cdao.counselingApply(m);
	}
	
	public void setCdao(CounselingDao cdao) {
		this.cdao = cdao;
	}
}
