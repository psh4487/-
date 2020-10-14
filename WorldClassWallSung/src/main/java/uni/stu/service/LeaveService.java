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

	public List<LeaveDto> leaveList(int stu_no) {
		return ldao.leaveList(stu_no);
	}
	
	public int leaveInsert(LeaveDto dto) {
		return ldao.leaveInsert(dto);
	}
	
	public void setLdao(LeaveDao ldao) {
		this.ldao = ldao;
	}
}
