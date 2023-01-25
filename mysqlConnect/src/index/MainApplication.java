package index;

import java.util.List;

import database.DAO.BoardDAO;
import database.Entity.BoardEntity;

public class MainApplication {

	public static void main(String[] args) {
		// DAO 인스턴스 생성
		BoardDAO dao = new BoardDAO();
		// 데이터베이스에서 Board 테이블의 전체 레코드를 검색해서 출력
		List<BoardEntity> findResult = dao.find();
		
		for (BoardEntity entity: findResult)
			System.out.println(entity.toString());
	}

}





