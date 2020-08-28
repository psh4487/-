package uni.stu.service;

import java.util.*;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import uni.stu.model.SubjectDto;

public class SubjectDao extends SqlSessionDaoSupport{
	public List<SubjectDto> yearScore(){
		return getSqlSession().selectList("score.yearScore");
	}
	public List<SubjectDto> semScore(){
		return getSqlSession().selectList("score.semScore");
	}
	public List<SubjectDto> listScore(Map<String, Integer> d){
		return getSqlSession().selectList("score.listScore", d);
	}
	public List<SubjectDto> list(int stu_no){
		return getSqlSession().selectList("student.isu",stu_no);
	}
	public int count(int stu_no) {
		return getSqlSession().selectOne("student.sumsub",stu_no);
	}
	public int count1(int stu_no) {
		return getSqlSession().selectOne("student.sumsub1",stu_no);
	}
	public int count2(int stu_no) {
		return getSqlSession().selectOne("student.sumsub2",stu_no);
	}
}