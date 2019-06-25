--------------------------------------------------------
--  파일이 생성됨 - 월요일-6월-24-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TBL_STUDENT
--------------------------------------------------------
DROP TABLE "USER4TS"."TBL_STUDENT" 
  CREATE TABLE "USER4TS"."TBL_STUDENT" 
   (	"ST_NO" CHAR(3 BYTE), 
	"ST_NAME" NVARCHAR2(30), 
	"ST_ADDR" NVARCHAR2(50), 
	"ST_GRADE" NUMBER(1,0), 
	"ST_HEIGHT" NUMBER(3,0), 
	"ST_WEIGHT" NUMBER(3,0), 
	"ST_NICK" NVARCHAR2(20), 
	"ST_NICK_REM" NVARCHAR2(50), 
	"ST_DEP_NO" CHAR(3 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USER4TS" ;
REM INSERTING into USER4TS.TBL_STUDENT
SET DEFINE OFF;
Insert into USER4TS.TBL_STUDENT (ST_NO,ST_NAME,ST_ADDR,ST_GRADE,ST_HEIGHT,ST_WEIGHT,ST_NICK,ST_NICK_REM,ST_DEP_NO) values ('001','조용필',null,4,166,56,'작은거인','작은 체구 불구 폭발적인 가창력 때문에','001');
Insert into USER4TS.TBL_STUDENT (ST_NO,ST_NAME,ST_ADDR,ST_GRADE,ST_HEIGHT,ST_WEIGHT,ST_NICK,ST_NICK_REM,ST_DEP_NO) values ('002','임성훈',null,4,168,null,null,null,'002');
Insert into USER4TS.TBL_STUDENT (ST_NO,ST_NAME,ST_ADDR,ST_GRADE,ST_HEIGHT,ST_WEIGHT,ST_NICK,ST_NICK_REM,ST_DEP_NO) values ('003','이수만','SM엔터테인먼트',4,null,null,null,null,'001');
Insert into USER4TS.TBL_STUDENT (ST_NO,ST_NAME,ST_ADDR,ST_GRADE,ST_HEIGHT,ST_WEIGHT,ST_NICK,ST_NICK_REM,ST_DEP_NO) values ('004','임예진',null,3,null,null,null,null,'003');
Insert into USER4TS.TBL_STUDENT (ST_NO,ST_NAME,ST_ADDR,ST_GRADE,ST_HEIGHT,ST_WEIGHT,ST_NICK,ST_NICK_REM,ST_DEP_NO) values ('005','원미경',null,3,null,null,null,null,'004');
Insert into USER4TS.TBL_STUDENT (ST_NO,ST_NAME,ST_ADDR,ST_GRADE,ST_HEIGHT,ST_WEIGHT,ST_NICK,ST_NICK_REM,ST_DEP_NO) values ('006','박수홍',null,2,183,65,'허우대','키가 큰 것을 비유하여','005');
Insert into USER4TS.TBL_STUDENT (ST_NO,ST_NAME,ST_ADDR,ST_GRADE,ST_HEIGHT,ST_WEIGHT,ST_NICK,ST_NICK_REM,ST_DEP_NO) values ('007','안칠현','SM엔터테인먼트',1,178,65,null,null,'006');
--------------------------------------------------------
--  DDL for Index SYS_C007010
--------------------------------------------------------

  CREATE UNIQUE INDEX "USER4TS"."SYS_C007010" ON "USER4TS"."TBL_STUDENT" ("ST_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USER4TS" ;
--------------------------------------------------------
--  Constraints for Table TBL_STUDENT
--------------------------------------------------------

  ALTER TABLE "USER4TS"."TBL_STUDENT" ADD PRIMARY KEY ("ST_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USER4TS"  ENABLE;
  ALTER TABLE "USER4TS"."TBL_STUDENT" MODIFY ("ST_DEP_NO" NOT NULL ENABLE);
  ALTER TABLE "USER4TS"."TBL_STUDENT" MODIFY ("ST_GRADE" NOT NULL ENABLE);
  ALTER TABLE "USER4TS"."TBL_STUDENT" MODIFY ("ST_NAME" NOT NULL ENABLE);
  ALTER TABLE "USER4TS"."TBL_STUDENT" MODIFY ("ST_NO" NOT NULL ENABLE);