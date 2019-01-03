package js.admin.DAO;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import js.admin.model.*;
import js.admin.service.*;


@Repository
public class LocationDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String strSqlSession = "js.admin.model.LocationMapper";
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int location(HashMap<String, String> map){
		return sqlSession.insert(strSqlSession + ".location", map);
	}
	
	public int street(HashMap<String, String> list){
		return sqlSession.insert(strSqlSession + ".street", list);
	}
	
	public List<Location> select(){
		return sqlSession.selectList(strSqlSession + ".select");
	}
	
	/*

	public int count() {
		return sqlSession.selectOne(strSqlSession + ".count");
	}
	
	public int insert(Post post) {
		return sqlSession.insert(strSqlSession + ".insert", post);
	}
	public List <Thread> select() {
		return sqlSession.selectList(strSqlSession + ".select");
	}
	
	public List <Post> page(HashMap<String, Integer> map){
		
		return sqlSession.selectList(strSqlSession + ".page", map);
	}
	*/
}
