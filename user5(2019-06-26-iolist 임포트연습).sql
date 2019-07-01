-- 여기는 user5 화면입니다
-- 엑셀에 매입매출정보를 참보하여
-- tbl_iolist 테이블을 생성하고
-- 매입과 매출 데이터를 임포트실행

CREATE TABLE tbl_iolist(
    io_seq	    NUMBER	            PRIMARY KEY,	
    io_date	    VARCHAR2(10)		NOT NULL,
    io_product	nVARCHAR2(50)		NOT NULL,
    io_comp	    nVARCHAR2(50)		NOT NULL,
    io_com_ceo	nVARCHAR2(50),		
    io_inout	nVARCHAR2(10)		NOT NULL,
    io_qty	    NUMBER,		
    io_price	NUMBER,		
    io_total	NUMBER		
);

SELECT io_inout, COUNT(*) FROM tbl_iolist
GROUP BY io_inout;

-- 상품이름으로 그룹을 짓고
-- 각 상품별 매입매출이 몇회 이루어졌는지 확인 SQLㄴ
SELECT io_product,COUNT(*)              -- 상품별 판매 횟수
FROM tbl_iolist
GROUP BY io_product;

-- 매입매출정보에서 상품이름 리스트를 추출하여 상품정보 테이블로 생성
-- GROUP BY 로 설정한 칼럼의 중복값이 없는 리스트를 추출하는 방법
SELECT io_product
FROM tbl_iolist
GROUP BY io_product
ORDER BY io_product;

-- 상품정보테이블 생성하기
CREATE TABLE tbl_product (
    p_code	    VARCHAR2(5)	PRIMARY KEY	,
    p_name	    nVARCHAR2(50)		NOT NULL,
    p_iprice	NUMBER,		
    p_oprice	NUMBER		
);

SELECT * FROM tbl_product;


-- 매입매출테이블에서 상품정보 테이블을 만들고
-- 매입매출에 있는 모든 상품이름이 상품정보 테이블에 반영되었나 확인 절차
-- 아래 SELECT에서 리스트가 한개라도 나오면 잘못 만들어진 상품정보가 된다.
SELECT IO.io_product, P.p_name
FROM tbl_iolist IO
    LEFT JOIN tbl_product P
        ON IO.io_product = P.p_name
WHERE P.p_name  IS NULL; -- p_name 값이 null 인값만 찾을려고한다 (이상태에선 데이터가 나오면 안된다)

-- tbl_iolist에 상품코드 칼럼을 추가하고 
-- tbl_product 테이블과 연동하여 상품코드 칼럼을 UPDATE하는 작업

-- tbl_iolist에 io_pcode 이름으로 VARCHAR2(5) 형식의 5자리 칼럼을 추가한다.
ALTER TABLE tbl_iolist ADD io_pcode VARCHAR2(5);

-- 테이블 구조를 변경한후 변경된 테이블 구조를 확인
DESC tbl_iolist;  -- 테이블의 구조를 확인할수 있는 명령어

-- 생성된 io_pcode 칼럼에 값을 UPDATE 한다.
-- 상품정보 테이블에서 상품이름으로 검색을 하여 각 상품에 맞는
-- 상품코드를 tbl_iolist에 update

UPDATE tbl_iolist IO
SET io_pcode = 
    (
        SELECT p_code FROM tbl_product P
        WHERE IO.io_product = P.p_name      -- IO.io_product에있는 이름이 P.p_name이 있으면 리턴해달라 
        )
;

-- 상품코드를 업데이트 하고 제대로 잘 수행되었는지 검증
-- 이 경우도 리스트가 1개라도 나타나면 잘못된 명령수행된 것이다.
SELECT IO.io_pcode, P.p_code, P.p_name
FROM tbl_iolist IO
    LEFT JOIN tbl_product P
        ON IO.io_pcode = P.p_code
WHERE P.p_code IS NULL OR P.p_name IS NULL;

-- io_product(필요없는 칼럼)을 삭제 
ALTER TABLE tbl_iolist DROP COLUMN io_product;
DESC tbl_iolist;

        
SELECT * FROM tbl_iolist;

-- 거래처 정보를 분리하기
-- 거래처명과 CEO 명을 리스트로 추출
SELECT io_comp, io_com_ceo
FROM tbl_iolist
GROUP BY io_comp, io_com_ceo
ORDER BY io_comp;

-- 거래처정보 테이블 생성
DROP TABLE tbl_company;
CREATE TABLE tbl_company(
    c_code	VARCHAR2(5)     	PRIMARY KEY	,
    c_name	nVARCHAR2(50)		NOT NULL,
    c_ceo	nVARCHAR2(50)		NOT NULL,
    c_tel	VARCHAR2(20),
    c_addr	nVARCHAR2(225)		
);

-- 거래처정보 데이터 검증
-- 리스트가 1개라도 나오면 안된다.
SELECT * FROM tbl_company;
SELECT COUNT(*) FROM tbl_company;

SELECT IO.io_com, C.c_name
FROM tbl_iolist IO
    LEFT JOIN tbl_company C
        ON IO.io_comp = C.c_name
WHERE C.c_name IS NULL;

-- UPDATE를 수행

-- tbl_iolist 거래처코드 칼럼 생성
ALTER TABLE tbl_iolist ADD io_code VARCHAR2(5);

--UPDATE  수행
UPDATE tbl_iolist IO
SET io_code =
(
    SELECT C.c_code FROM tbl_company C
    WHERE io.io_comp = C.c_name AND
            io.io_com_ceo = C.c_ceo
);

-- 업데이트된 거래처 코드 검정
SELECT IO.io_code, IO.io_comp, C.c_name, C.c_ceo
FROM tbl_iolist IO
    LEFT JOIN tbl_company C
        ON IO.io_code = C.c_code
WHERE C.c_name IS NULL;

-- tbl_iolist에서 거래처명, 거래처대표명 칼럼을 삭제
ALTER TABLE tbl_iolist DROP COLUMN io_comp;
ALTER TABLE tbl_iolist DROP COLUMN io_com_ceo;

DESC tbl_iolist;

-- 매입매출테이블, 상품테이블. 거래처테이블을 JOIN 하여 List
-- VIEW를 생성하기 위해 Query를 작성할때
-- 다른테이블의 칼럼이름들을 규칙성있는 Alais 를 설정해 두면
-- view 활용해서 또다른 SELECT를 구현할때
-- 훨씬 편리하게 사용할수 있다.
DROP VIEW view_iolist; 
CREATE VIEW view_iolist
AS
(
SELECT 
        IO_DATE,
        IO_PCODE,  P_NAME AS IO_PRO_NAME,
        IO_CODE,   C_NAME AS IO_COMP, 
                   C_CEO AS IO_COMP_CEO,  
                   C_TEL AS IO_COMP_TEL,
        IO_INOUT,
        IO_QTY,
        IO_PRICE,
        IO_TOTAL
FROM tbl_iolist IO
    LEFT JOIN tbl_product P
        ON IO.io_pcode = P.p_code
    LEFT JOIN tbl_company C
        ON IO.io_code = C.c_code
);

SELECT * FROM view_iolist;      -- 쉽게 자료를 볼수있다
    
SELECT io_pcode, io_pro_name         -- 원하는 리스트 내용을 볼수있다 사웊ㅁ코드와 상품이름
FROM view_iolist;

