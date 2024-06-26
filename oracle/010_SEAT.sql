--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-01-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table SEAT
--------------------------------------------------------

  CREATE TABLE "SYSTEM"."SEAT"
   (	"SEAT_ID" NUMBER(19,0), 
	"MOVIE_ID" NUMBER(19,0), 
	"SEAT_NUMBER" NUMBER(10,0), 
	"THEATER_ID" NUMBER(19,0), 
	"MEMBER_ID" NUMBER(19,0), 
	"TICKET_ID" NUMBER(19,0), 
	"TICKETED_DATE" TIMESTAMP (6)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SYSTEM.SEAT
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C008452
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYSTEM"."SYS_C008452" ON "SYSTEM"."SEAT" ("SEAT_ID")
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table SEAT
--------------------------------------------------------

  ALTER TABLE "SYSTEM"."SEAT" MODIFY ("SEAT_ID" NOT NULL ENABLE);
  ALTER TABLE "SYSTEM"."SEAT" ADD PRIMARY KEY ("SEAT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
