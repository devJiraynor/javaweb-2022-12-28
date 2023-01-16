package board;

import java.util.ArrayList;
import java.util.List;

// 회원 등록
// 회원 정보 보기
// 회원 정보 수정
// 회원 삭제
// 회원 리스트
public class Main {
	private List<User> database = new ArrayList<User>();
	
	// 회원 등록
	// id는 0이상의 수 이어야 하고 password, name, telNumber는 빈값이 아니면서 null도 아니어야 함
	private boolean createUser(int id, String password, String name, String telNumber) {
		// 파라미터가 정상적인 값인지 검증
		if (id < 0) return false;
		if (password.isEmpty() || name.isEmpty() || telNumber.isEmpty()) return false;
		if (password == null || name == null || telNumber == null) return false;
		// 아이디 중복 체크
		if (checkOverlap(id)) return false;
		
		// 관리하고자하는 객체를 생성
		User user = new User(id, password, name, telNumber);
		// 생성한 객체를 데이터베이스에 삽입
		database.add(user);
		// 삽입 결과를 반환
		return true;
	}
	// 회원 정보 보기
	private User readUser(int id) {
		// 파라미터가 정상적인 값인지 검증
		if (id < 0) return null;
		// database 에서 해당 id를 검색
		User user = selectUser(id);
		// 검색 결과를 반환
		return user;
	}
	// 회원 정보 수정
	private User updateUser(UpdateUserDto dto) {
		// 입력된 id 값 검증
		int id = dto.getId();
		if (id < 0) return null;
		// 데이터베이스에서 입력받은 id에 해당하는 user정보를 불러옴
		User user = selectUser(id);
		// 입력받은 id에 해당하는 user정보가 있는지 검증
		if (user == null) return null;
		// 입력받은 패스워드하고 해당 유저의 패스워드가 같은지 검증
		String password = dto.getPassword();
		if (!password.equals(user.getPassword())) return null;
		// 유저 정보 변경
		String name = dto.getName();
		String telNumber = dto.getTelNumber();
		user.setName(name);
		user.setTelNumber(telNumber);
		
		return user;
	}
	// 회원 삭제
	private boolean deleteUser() {
		return false;
	}
	// 회원 리스트
	private List<User> readUserList() {
		return null;
	}

	// 메인 메서드
	public static void main(String[] args) {
		
	}
	
	// 회원 아이디가 중복되는지 검사하는 메서드
	private boolean checkOverlap(int id) {
		for (User user: database) {
			if (user.getId() == id) return true;
		}
		return false;
	}
	
	// 특정 회원 아이디를 database에서 검색하는 메서드
	private User selectUser(int id) {
		for (int i = 0; i < database.size(); i++) {
			if (database.get(i).getId() == id) return database.get(i);
		}
		return null;
	}
	
}






