# Board 데이터베이스 생성
CREATE DATABASE PEED;
USE PEED;

# User 테이블 생성
CREATE TABLE User (
  id INT PRIMARY KEY AUTO_INCREMENT,	# 아이디 / 정수형태 / 기본키 / 자동 증가
  password VARCHAR(30) NOT NULL, 		# 패스워드 / 길이 30의 가변 문자열 / 필수 값
  name VARCHAR(50) NOT NULL,			# 이름 / 길이 50의 가변 문자열 / 필수 값
  telNumber VARCHAR(15) NOT NULL UNIQUE # 전화번호 / 길이 15의 가변 문자열 / 필수 값 / 중복 불가능
);

# Board 테이블 생성
# 게시물 번호 (boardNumber)가 존재하고 정수형태 및 자동 증가로 관리,
# 게시물 번호로 각 데이터를 구분
# 게시물 제목 (boardTitle)이 존재하고 길이 200의 가변 문자열 및 필수 값으로 관리
# 게시물 내용 (boardContent)이 존재하고 길이의 제한이 없는 문자열 및 필수 값으로 관리
# 게시물 작성일 (boardDate)이 존재하고 날짜 타입 및 필수 값으로 관리
# 게시물 작성자 (boardWriter)가 존재하고 정수 형태 및 필수 값으로 관리
CREATE TABLE Board (
  boardNumber INT AUTO_INCREMENT PRIMARY KEY,
  boardTitle VARCHAR(200) NOT NULL,
  boardContent TEXT NOT NULL,
  boardDate DATE NOT NULL,
  boardWriter INT NOT NULL
);

SELECT * FROM User;

# User 레코드를 삽입
# 아이디는 자동 값을 그대로 사용, 
# 비밀번호는 'P!ssw0rd', 이름 '고길동', 전화번호는 '010-4488-9944'인 데이터를 삽입

# -- 회원가입 할때 사용 --
INSERT INTO User(password, name, telNumber) VALUES ('P!ssw0rd', '고길동', '010-4488-9944');

# User 테이블에서 이름이 '고길동'인 레코드의 비밀번호를 'qwer1234!!'로 수정

# -- 각종 회원정보 수정 할때 사용 --
UPDATE User SET password = 'qwer1234!!' WHERE name = '고길동';

# User 테이블에서 id가 1인 레코드를 삭제

# ??
DELETE FROM User WHERE id = 1;




