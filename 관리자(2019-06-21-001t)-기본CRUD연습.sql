--관리자 질의 작성기 화면
SELECT *
FROM access$;

SELECT*
FROM access$
WHERE d_obj# = 1299;

-- SQL 명령문은 대표키워드로 시작해서 보조 키워드들이 나열되는 형태이다
-- 일반적으로 명령문이나 변수명 들은 대소문자 구별이 없다.
-- 다만 작성할때 학습차원에서 
-- 키워드는 대문자로 사용하고, 기타 변수 명 등은 소문자로 작성한다.


-- SQL 명령문은 여러줄에 걸쳐 사용할수 있고
-- 명령문의 끝에는 세미콜론(;)을 붙여 준다.

-- 명령문 중간에서 Ctrol + Enter를 누르면
-- 해당하는 명령문을 오라클 DBMS에게 전송하고
-- 결과를 보여준다

-- 연습을 위해서 잠시 DBA가 되어봅시다.

-- 테이블객체
-- CREATE TABLE은 데이터 저장소의 최소
-- 테이블객체를 새엇ㅇ할수 있는 권환은 DBA에게 있다
-- DBA가 아닌 경우는 일반적으로 테이블 객체를 생성할 수 없다.
CREATE TABLE tbl_student(
    st_name nVARCHAR2(30), -- 데이터필드, 멤버변수 역할이며 DB에서는 칼럼이라고 부른다
    st_age NUMBER

);

-- CRUD Key word는
-- 기본 Key word와 보조 Key word가 있는데
-- 기본 Key word에 따라 보자 Key word가 필수적으로 따라 다녀야 하는 경우가 있다.
-- INSERT INTO AVLUES
-- SELECT FROM
-- UPDATE SET
-- DELETE FROM





INSERT INTO tbl_student(st_name,st_age)
VALUES('홍길동',33);

INSERT INTO tbl_student(st_name,st_age)
VALUES('성춘향',16);

SELECT*FROM tbl_student;

SELECT*FROM tbl_student
WHERE st_name = '성춘향';

SELECT*FROM tbl_student
WHERE st_age = 16;

INSERT INTO tbl_student(st_name,st_age)
VALUES('홍길동',33);

INSERT INTO tbl_student(st_name,st_age)
VALUES('성춘향',16);

INSERT INTO tbl_student(st_name,st_age)
VALUES('이몽룡',33);


-- 매우 조심해서 연습할 키워드
-- UPDATE와 DELETE를 연습
-- UPDATE와 DELETE 키워드세요 WHERE 절은 선택사항 이지만
-- 우리는 필수 키워드라고 생각하자
UPDATE tbl_student
SET st_age = 100;
WHERE st_name = '이몽룡';

SELECT *FROM tbl_student;

DELETE FROM tbl_student
WHERE st_name = '김길동';

-----------------
-- CRUD표준명령
-----------------

-- Create
INSTRT INTO 테이블명(칼럼리스트)
VALUEX(데이터리스트);

-- Read
SELECT  * FROM 테이블명
WHERE 칼럼 = 조건;

-- Update
UPDATE 테이블명
SET 칼럼1 = 값,칼럼2 = 값
WHERE 칼럼 = 조건;

-- Delete
DELETE FORM 테이블명
WHERE 칼럼 = 조건;