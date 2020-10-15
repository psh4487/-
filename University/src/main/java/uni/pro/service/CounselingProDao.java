package uni.pro.service;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import uni.pro.model.CounselingProDto;

public class CounselingProDao extends SqlSessionDaoSupport {

	public List<CounselingProDto> sublist(int prof_cd) {
		return getSqlSession().selectList("Counseling.sublist",prof_cd);
	}// ������

	public List<CounselingProDto> conuall(String sub_cd) {
		return getSqlSession().selectList("Counseling.counselectall",sub_cd);
	}// �����

	public HashMap<String,Object> viewstucou(int cs_no) {
		return getSqlSession().selectOne("Counseling.subcou",cs_no);
	}// �󼼸��

	public int stateok(int cs_no){
		return getSqlSession().update("Counseling.ok",cs_no);
	}
	public int statenot(int cs_no){
		return getSqlSession().update("Counseling.not",cs_no);
 	}
	public int deletecou(int cs_no) {
		return getSqlSession().delete("Counseling.delete",cs_no);
		
	}

}
