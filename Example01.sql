# 첫번째 SQL 주석 (한 줄 주석)
-- 두번째 SQL 주석 (한 줄 주석) -- 주석은 '-'뒤에 반드시 띄어쓰기가 포함되어야 함
/* 
세번째
SQL
주석 (여러 줄 주석) 
*/

## DDL ##

# 데이터베이스 생성 쿼리
# CREATE DATABASE 데이터베이스명;

CREATE DATABASE HOTEL;

# 생성된 데이터베이스 목록 보기
# SHOW DATABASES;
SHOW DATABASES;

# 데이터베이스 선택
# USE 데이터베이스명;
USE HOTEL;

# 테이블 생성
# CREATE TABLE 테이블명 (
#   필드명 필드타입 제약조건,
#   ...
# );

CREATE TABLE Reservation(
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  reservationDate DATE NOT NULL,
  roomNumber INT
);

# 선택된 데이터베이스의 테이블을 조회

SHOW TABLES;

# 테이블 수정
# - 컬럼 추가
# ALTER TABLE 테이블명 ADD 필드명 필드타입 [제약조건];

ALTER TABLE Reservation ADD telNumber VARCHAR(20);

# - 컬럼 삭제
# ALTER TABLE 테이블명 DROP 필드명;

ALTER TABLE Reservation DROP roomNumber;

# - 컬럼 수정
# ALTER TABLE 테이블명 MODIFY COLUMN 필드명 필드타입 [제약조건];

ALTER TABLE Reservation MODIFY COLUMN reservationDate VARCHAR(20) NOT NULL;

# 테이블 삭제
# - DROP
# DROP TABLE 테이블명;
# 테이블의 존재 자체를 삭제

DROP TABLE Reservation;

# - TRUNCATE
# TRUNCATE TABLE 테이블명;
# 해당 테이블을 생성 직후의 상태로 되돌림 (DDL)

INSERT INTO Reservation(name, reservationDate) VALUES ('홍길동', now());
SELECT * FROM Reservation;

TRUNCATE TABLE Reservation;

# - DELETE FROM
# DELETE FROM 테이블명;
# 레코드만 삭제 (DML)

DELETE FROM Reservation;

### DML ###

# INSERT
# - 데이터 삽입
# INSERT INTO 테이블명(컬럼명1, 컬럼명2, ...) VALUES (값1, 값2, ...);
# INSERT INTO 테이블명 VALUES (값1, 값2, ...);
# 각 컬럼에 매칭되는 값을 순서에 맞게 작성하여야 함

INSERT INTO Reservation (name, reservationDate, roomNumber) VALUES ('김철수', '2023-01-17', 3134);
INSERT INTO Reservation VALUES (4, '이영희', '2022-10-11', 908);
# NOT NULL 조건으로 걸린 name 컬럼 값을 지정 하지 않았기 때문에 삽입 에러가 발생
INSERT INTO Reservation (reservationDate, roomNumber) VALUES ('1999-02-10', 1004);

# UPDATE
# - 데이터 수정
# UPDATE 테이블명 SET 컬럼1 = 값1, ... [WHERE 컬럼 = 값]
# WHERE : 조건을 지정해주는 키워드, 조건에 해당하는 대한 레코드에만 명령을 실행

# IS NULL : WHERE 조건에서 해당 컬럼이 NULL 인 레코드를 고를 때 사용
UPDATE Reservation SET roomNumber = 502 WHERE roomNumber IS NULL;
UPDATE Reservation SET reservationDate = '2023-01-30' WHERE name = '김철수';
UPDATE Reservation SET roomNumber = 1001;

# 데이터 삭제
# - DELETE
# DELETE FROM 테이블명 [WHERE 컬럼=값]

DELETE FROM Reservation WHERE id = 7;









