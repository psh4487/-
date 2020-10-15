package uni.stu.service;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import uni.stu.model.SubjectDto;

@Service
public class SubjectService{
	@Autowired
	SubjectDao sdao;	

	public List<SubjectDto> yearScore() {
		return sdao.yearScore();
	}

	public List<SubjectDto> semScore() {
		return sdao.semScore();
	}
	public List<SubjectDto> listScore(int stu_no, int years,int sem) {
		Map<String, Integer> m = new HashMap<String, Integer>();
		m.put("stu_no", stu_no);
		m.put("years", years);
		m.put("sem", sem);
		
		return sdao.listScore(m);
	}
	public List<SubjectDto> subjectList(int stu_no){
		List<SubjectDto> list = null;
		list = sdao.list(stu_no);
		return list;
	}
	public int count(int stu_no) {
		return sdao.count(stu_no);
	}
	public int count1(int stu_no) {
		return sdao.count1(stu_no);
	}
	public int count2(int stu_no) {
		return sdao.count2(stu_no);
	}
	
	public void setSdao(SubjectDao sdao) {
		this.sdao = sdao;
	}
}
