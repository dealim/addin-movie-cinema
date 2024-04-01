--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-01-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table INTEREST_MOVIE
--------------------------------------------------------

  CREATE TABLE "ADDIN"."INTEREST_MOVIE" 
   (	"INTEREST_MOVIE_ID" NUMBER(19,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"MOVIE_ID" NUMBER(19,0), 
	"USER_NAME" VARCHAR2(255 BYTE), 
	"MOVIE_NO" NUMBER(19,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into ADDIN.INTEREST_MOVIE
SET DEFINE OFF;
Insert into ADDIN.INTEREST_MOVIE (INTEREST_MOVIE_ID,MOVIE_ID,USER_NAME,MOVIE_NO) values (304,456,'user',null);
Insert into ADDIN.INTEREST_MOVIE (INTEREST_MOVIE_ID,MOVIE_ID,USER_NAME,MOVIE_NO) values (302,458,'user',null);
Insert into ADDIN.INTEREST_MOVIE (INTEREST_MOVIE_ID,MOVIE_ID,USER_NAME,MOVIE_NO) values (303,457,'user',null);
Insert into ADDIN.INTEREST_MOVIE (INTEREST_MOVIE_ID,MOVIE_ID,USER_NAME,MOVIE_NO) values (305,455,'user',null);
Insert into ADDIN.INTEREST_MOVIE (INTEREST_MOVIE_ID,MOVIE_ID,USER_NAME,MOVIE_NO) values (301,459,'user',null);
--------------------------------------------------------
--  DDL for Index SYS_C008465
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADDIN"."SYS_C008465" ON "ADDIN"."INTEREST_MOVIE" ("INTEREST_MOVIE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C008466
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADDIN"."SYS_C008466" ON "ADDIN"."INTEREST_MOVIE" ("MOVIE_ID", "USER_NAME") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table INTEREST_MOVIE
--------------------------------------------------------

  ALTER TABLE "ADDIN"."INTEREST_MOVIE" MODIFY ("INTEREST_MOVIE_ID" NOT NULL ENABLE);
  ALTER TABLE "ADDIN"."INTEREST_MOVIE" MODIFY ("MOVIE_ID" NOT NULL ENABLE);
  ALTER TABLE "ADDIN"."INTEREST_MOVIE" MODIFY ("USER_NAME" NOT NULL ENABLE);
  ALTER TABLE "ADDIN"."INTEREST_MOVIE" ADD PRIMARY KEY ("INTEREST_MOVIE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  ALTER TABLE "ADDIN"."INTEREST_MOVIE" ADD UNIQUE ("MOVIE_ID", "USER_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
