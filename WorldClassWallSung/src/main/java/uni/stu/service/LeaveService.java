package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.LeaveDto;
import uni.stu.model.SubjectDto;

@Service
public class LeaveService{
	@Autowired
	LeaveDao ldao;
	
	public LeaveService() {}

	public List<LeaveDto> leaveList() {
		return ldao.leaveList();
	}
	
	public int leaveInsert(String leave_year, String leave_sem, String leave_change, int stu_no) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("leave_year", leave_year);
		m.put("leave_sem", leave_sem);
		m.put("leave_change", leave_change);
		m.put("stu_no", stu_no);
		return ldao.leaveInsert(m);
	}
	
	public void setLdao(LeaveDao ldao) {
		this.ldao = ldao;
	}
}
