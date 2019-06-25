-- 관리자 화면입니다.
-- C:\bizwork\mydb 폴더에 user4TS 이름으로 TableSpace 생성하고
-- 이름 : user4TS, 데이터파일 user4TS.dbf
-- 크기 : 500MB, 자동증가 100KB

CREATE TABLESPACE user4TS
DATAFILE 'C:/bizwork/mydb/user4TS.dbf'
SIZE 500M AUTOEXTEND ON NEXT 100K;

-- USER4를 생성
-- 비밀번호 : 1234, 기본 TABLESPACE : user4TS로 설정

CREATE USER user4TS
IDENTIFIED BY 1234
DEFAULT TABLESPACE user4TS;

GRANT DBA TO user4TS;



