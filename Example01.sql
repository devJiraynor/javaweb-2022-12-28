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

INSERT INTO Reservation (name, reservationDate, roomNumber) VALUES ('고수', '2023-03-02', 904);
INSERT INTO Reservation (name, reservationDate) VALUES ('홍길동', '2023-09-07');
INSERT INTO Reservation VALUES (20, '고길동', '2023-03-02', 3414);

# 데이터 검색
# - SELECT
# SELECT 컬럼명1 [, 컬럼명2, ...] FROM 테이블명 [WHERE 조건];
# 지정한 테이블에서 선택한 컬럼을 검색할 때 사용

SELECT name FROM Reservation;
SELECT name, roomNumber FROM Reservation;
SELECT name, roomNumber FROM Reservation WHERE reservationDate = '2023-03-02';

# SELELCT * 으로 모든 컬럼을 선택 할 수 있음
SELECT * FROM Reservation;
SELECT * FROM Reservation WHERE name = '홍길동';

# WHERE 문 뒤에 비교연산자 및 논리연산자로 조건을 추가하여 검색할 수 있음
SELECT * FROM Reservation WHERE name = '홍길동' AND reservationDate < '2023-04-01';
SELECT * FROM Reservation WHERE name = '홍길동' OR reservationDate < '2023-04-01';
SELECT * FROM Reservation WHERE roomNumber IS NOT NULL;
SELECT * FROM Reservation WHERE roomNumber IS NULL;
SELECT * FROM Reservation WHERE name LIKE '%길동' AND roomNumber IS NOT NULL;

# 특정 컬럼의 중복 제거 DISTINCT
SELECT DISTINCT name, roomNumber FROM Reservation;

# 특정 컬럼을 기준으로 정렬 ORDER BY
# 옵션 - ASC : 오름차순 / DESC : 내림차순
SELECT * FROM Reservation ORDER BY reservationDate;
SELECT * FROM Reservation ORDER BY reservationDate DESC;
SELECT * FROM Reservation ORDER BY reservationDate DESC, roomNumber DESC;
SELECT * FROM Reservation ORDER BY roomNumber DESC, reservationDate DESC;

# 별칭 사용 AS
SELECT name AS eman, roomNumber FROM Reservation;
SELECT name, roomNumber FROM Reservation AS R;

# MySQL 데이터타입
# 문자열 타입 CHAR
# 고정길이 문자열 / 길이로 지정할 수 있는 값의 범위 0 ~ 255
ALTER TABLE Reservation ADD note CHAR(4);

# DESCRIBE 테이블명; : 테이블의 정보를 볼 수 있음
DESCRIBE Reservation;

SELECT char_length(note) FROM Reservation WHERE name = '노트';

INSERT INTO Reservation(name, reservationDate, note) VALUES ('노트', NOW(), ' ');

# 비교 연산자

SELECT * FROM Reservation;

# 동등 비교연산 ( = )
# 좌항이 우항과 같으면 1을 반환 아니면 0을 반환

SELECT 1 = 1;

# Reservation 테이블에서 roomNumber가 1001인 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE roomNumber = 1001;

# not 연산 ( !=, <> )
# 좌항이 우항과 다르면 1을 반환 아니면 0을 반환

SELECT 1 != 1, 1 <> 2;

# Reservation 테이블에서 roomNumber가 1001이 아닌 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE roomNumber != 1001;

# Great than, Great than Equal 연산 (>, >=)
# 좌항이 우항보다 크면 1을 반환 아니면 0을 반환
# 좌항이 우항보다 크거나 가틍면 1을 반환 아니면 0을 반환

SELECT 1 > 1, 1 >= 1;

# Reservation 테이블에서 reservationDate가 2023-01-01 보다 크거나 같은(이후의) 모든 컬럼을 선택
SELECT * FROM Reservation WHERE reservationDate >= '2023-01-01';

# Less than, Less than Equal ( <, <= )
# 좌항이 우항보다 작으면 1을 반환하고 아니면 0을 반환
# 좌항이 우항보다 작거나 같으면 1을 반환하고 아니면 0을 반환

SELECT 1 < 1, 1 <= 1;

# Reservation 테이블에서 reservationDate가 2023-02-28 보다 작거나 같은 (이전인) 모든 컬럼 선택
SELECT * FROM Reservation WHERE reservationDate <= '2023-02-28';

# null 확인 ( <=> )
# 좌항과 우항이 모두 null이면 1을 반환하고 아니면 0을 반환

SELECT null <=> 1;

# Reservation 테이블에서 roomNumber와 note가 모두 null인 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE roomNumber <=> note;

# Equal 연산 ( IS )
# 좌항이 우항과 같으면 1을 반환하고 아니면 0을 반환
# 우항이 TRUE, FALSE, UNKNOWN 일때 사용

SELECT FALSE IS TRUE;

# Not Equal 연산 ( IS NOT )
# 좌항이 우항과 다르면 1을 반환하고 아니면 0을 반환
# 우항이 TRUE, FALSE, UNKNOWN 일때 사용

SELECT FALSE IS NOT TRUE;

# NULL 비교 연산 (IS NULL, IS NOT NULL)
# 좌항이 NULL이면 1을 반환하고 아니면 0을 반환

SELECT 1 IS NULL;

# Reservation 테이블에서 note 컬럼에 값이 없는 레코드의 모든 값을 선택
SELECT * FROM Reservation WHERE note IS NULL;

# 좌항이 NULL이 아니면 1을 반환하고 아니면 0을 반환

SELECT 1 IS NOT NULL;

# Reservation 테이블에서 roomNumber 컬럼에 값이 존재하는 레코드의 모든 값을 선택
SELECT * FROM Reservation WHERE roomNumber IS NOT NULL;

# 사이값 비교 연산 (BETWEEN a AND b, NOT BETWEEN a AND b)
# 좌항이 a보다 크거나 같으면서 b보다 작거나 같으면 1을 반환하고 아니면 0을 반환
# 좌항이 a보다 작거나 b보다 크면 1을 반환하고 아니면 0을 반환

SELECT 10 BETWEEN 5 AND 10, 10 NOT BETWEEN 3 AND 8;

# Reservation 테이블에서 reservationDate가 2023-01-01부터 2023-02-28까지인 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE reservationDate BETWEEN '2023-01-01' AND '2023-02-28';

# IN 연산 (IN, NOT IN)
# 좌항이 우항에 해당하는 배열 값 중 하나라도 같다면 1을 반환하고 아니면 0을 반환
# 좌항이 우항에 해당하는 배열 값이 포함되어 있지 않다면 1을 반환하고 아니면 0을 반환

SELECT 1 IN (1, 2, 3, 4, 5), 1 NOT IN (1, 2, 3, 4, 5);

# Reservation 테이블에서 name이 '홍길동', '고길동' 중 하나라도 해당되는 레코드의 모든 값을 선택
SELECT * FROM Reservation WHERE name IN ('홍길동', '고길동');


# 논리 연산

# AND 연산 ( AND, && )
# 좌항과 우항이 모두 1이면 1, 아니면 0을 반환
# 여기서 비교되는 1과 0은 비교 연산의 결과

SELECT 1 AND 0;

# Reservation 테이블에서 name이 '고길동'이면서 note 컬럼에 값이 지정되어 있지 않은 모든 컬럼 선택
SELECT * FROM Reservation WHERE name = '고길동' AND note IS NULL;

# Reservation 테이블에서 note 컬럼에 값이 지정되어 있지 않고
# reservationDate가 2023-01-01부터 2023-02-28까지인 레코드의 모든 컬럼 선택
SELECT * 
FROM Reservation 
WHERE note IS NULL 
AND (reservationDate BETWEEN '2023-01-01' AND '2023-02-28');

# OR 연산 ( OR, || )
# 좌항과 우항 중 하나라도 1이면 1을 반환하고 아니면 0을 반환
# 여기서 비교되는 1과 0은 비교 연산의 결과

SELECT 1 OR 0;

# Reservation 테이블 중 name이 '고수'이거나 note값이 존재하는 레코드의 모든 컬럼을 선택
SELECT * FROM Reservation WHERE name = '고수' OR note IS NOT NULL;

# XOR 연산 ( XOR )
# 좌항과 우항이 다르면 1을 반환 같으면 0을 반환

SELECT 1 XOR 1;

# AND 연산과 OR 연산에서 주의할 점
# 실제로 구하고자하는 값을 정확히 파악

# Reservation 테이블에서
# name이 고길동 이면서 note 값이 존재하지 않거나 roomNumber가 1000 이상인 레코드 중 모든 컬럼을 선택

# name = '고길동' AND note IS NULL OR roomNumber >= 1000
SELECT * FROM Reservation WHERE name = '고길동' AND note IS NULL OR roomNumber >= 1000 AND ~~~;
SELECT * FROM Reservation WHERE name = '고길동' AND ( note IS NULL OR roomNumber >= 1000 );

SELECT * FROM Reservation WHERE (name = '고길동' AND note IS NULL) OR (roomNumber >= 1000 AND id = 4);
SELECT * FROM Reservation WHERE (name = '고길동') AND (note IS NULL OR roomNumber >= 1000) AND (id = 4);


# IFNULL(검사할 인수, NULL일 때의 값)
# 검사할 인수가 NULL이면 NULL일 때의 값을 반환

SELECT IFNULL(NULL, '값이 지정되지 않았습니다.');

# Reservation 테이블에서 모든 레코드 중 name과 roomNumber를 선택하는데 
# roomNumber가 null이면 '아직 방이 배정되지 않았습니다.'를 출력
SELECT name, IFNULL(roomNumber, 0) FROM Reservation;















