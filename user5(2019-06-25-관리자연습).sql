-- 여기는 user5 화면입니다
DROP TABLE tbl_student;

CREATE TABLE tbl_student(
    st_no	        CHAR(3)	PRIMARY KEY NOT NULL,
    st_name	        nVARCHAR2(30)		NOT NULL,
    st_addr	        nVARCHAR2(50),		
    st_grade	    NUMBER(1)		    NOT NULL,
    st_height	    NUMBER(3),		
    st_weight	    NUMBER(3),		
    st_nick	        nVARCHAR2(20),
    st_nick_rem	    nVARCHAR2(50),		
    st_dept_name    nVARCHAR2(20) 	    NOT NULL
);
SELECT  * FROM tbl_student;
DROP TABLE tbl_score;
CREATE TABLE tbl_score(
    sc_seq	    NUMBER	PRIMARY KEY	,
    sc_date	    VARCHAR2(10)		NOT NULL,
    sc_st_no	CHAR(3)		        NOT NULL,
    sc_subject	nVARCHAR2(50)		NOT NULL,
    sc_point	NUMBER	        	NOT NULL

    );
    
SELECT * FROM tbl_student;
SELECT * FROM tbl_score;

SELECT sc_date, sc_st_no,
        SUM(DECODE(sc_subject,'국어',sc_score,0)) AS 국어,
        SUM(DECODE(sc_subject,'영어',sc_score,0)) AS 영어,
        SUM(DECODE(sc_subject,'수학',sc_score,0)) AS 수학
FROM tbl_score
GROUP BY sc_date, sc_st_no






