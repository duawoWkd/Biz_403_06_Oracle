-- 관리자 화면입니다
-- 관리자(DBA)가 사용하는 명령어
-- 물리적 객체를 생성하는 명령 : CREATE로 시작

-- 사용자를 생성
-- 보통 DDL 명령중에서 표준 SQL에서 가장 많이 사용하는 명령
-- 사용자란 : DBMS에 접속(Connection)하여 SQL문을 실행할수 있는 ID
-- 오라클에서의 사용자 : DB Schema 개념으로 TABLE 들을 포함하는 저장소 개념

-- 오라클에서 사용자를 등록하는 명령문
CREATE USER biz     -- 사용자 ID, 표준SQL       
IDENTIFIED BY 1234; -- 사용자 비밀번호, 오라클 SQL

-- DCL 명령인 GRANT 명령을 수행해서
-- biz라는 새용자에게 CREATE SESSION이라는 권한을 부여했다.
-- 그러므로 해서 biz 라는 사용자는
-- 오라클에 연결(접속)할수 있게 되고, 의미는 없지만 최소한 select 명령을
-- 수행 해 볼수 있또록 되었다.
-- 즉 DB에 간접적인 어떤 영향을 미치도록 하는 명령어들.. 
-- 이런 명령을 DCL(Data Controll lang)라고 한다
GRANT CREATE SESSION TO biz;

-- GRNAT 명령은 사용자에게 DB SQL문을 사용할수 있는 등급(권한)을 부여하는 명령
-- 아래 GRANT DBA TO biz는 biz 사용자에게 관리자 권한에 살짝 못미치는 
-- 막대한 권한을 부여한다.
-- GRANT DBA TO biz;
GRANT CREATE TABLE TO biz;

REVOKE CREATE SESSION FROM biz;