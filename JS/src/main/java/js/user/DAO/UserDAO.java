package js.user.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import js.user.model.*;

@Repository
public class UserDAO {
		
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		private String strSqlSession = "js.user.model.rv_boardMapper";

		public void setSqlSession(SqlSessionTemplate sqlSession) {
			this.sqlSession = sqlSession;
		}

		public Rv_Board rv_board() {
			return sqlSession.selectOne(strSqlSession + ".rv_board");
			
		}
				
}
