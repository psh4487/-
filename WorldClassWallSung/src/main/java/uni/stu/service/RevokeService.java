package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.RevokeDto;

@Service
public class RevokeService {
	@Autowired
	RevokeDao rdao;

	public RevokeService() {
	}

	public List<RevokeDto> revokeList(int stu_no) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		return rdao.revokeList(m);
	}

	public int revokeDelete(int stu_no, int sub_cd) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		m.put("sub_cd", sub_cd);
		return rdao.revokeDelete(m);
	}

	public void setRdao(RevokeDao rdao) {
		this.rdao = rdao;
	}
}
