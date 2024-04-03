--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-01-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table NOTIFICATION
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."NOTIFICATION"
   (	"ID" NUMBER(19,0) GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"CREATED_DATE_TIME" TIMESTAMP (6), 
	"IS_READ" NUMBER(1,0), 
	"IS_SENT" NUMBER(1,0), 
	"MOVIE_ID" NUMBER(19,0), 
	"TYPE" VARCHAR2(255 CHAR), 
	"USER_NAME" VARCHAR2(255 CHAR), 
	"REVIEW_ID" NUMBER(19,0), 
	"TICKET_ID" NUMBER(19,0), 
	"MESSAGE" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SYSTEM.NOTIFICATION
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C008569
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C008569" ON "SYSTEM"."NOTIFICATION" ("ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table NOTIFICATION
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."NOTIFICATION" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NOTIFICATION" MODIFY ("IS_READ" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NOTIFICATION" MODIFY ("IS_SENT" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."NOTIFICATION" ADD CHECK (is_read in (0,1)) ENABLE;
  ALTER TABLE "SYSTEM"."NOTIFICATION" ADD CHECK (is_sent in (0,1)) ENABLE;
  ALTER TABLE "SYSTEM"."NOTIFICATION" ADD CHECK (type in ('INTEREST_MOVIE_ADDED','LIKE_NOTIFICATION','MOVIE_BOOKED')) ENABLE;
  ALTER TABLE "SYSTEM"."NOTIFICATION" ADD PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;