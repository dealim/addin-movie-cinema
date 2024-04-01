--------------------------------------------------------
--  파일이 생성됨 - 월요일-4월-01-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REGION
--------------------------------------------------------

  CREATE TABLE "ADDIN"."REGION" 
   (	"IS_WITHDRAWN" CHAR(1 BYTE) DEFAULT 'N', 
	"CREATED_AT" TIMESTAMP (6), 
	"MODIFIED_AT" TIMESTAMP (6), 
	"REGION_ID" NUMBER(19,0), 
	"WITHDRAWN_AT" TIMESTAMP (6), 
	"REGION_NAME" VARCHAR2(255 CHAR)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into ADDIN.REGION
SET DEFINE OFF;
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/02/13 11:41:48.175662000','RR/MM/DD HH24:MI:SSXFF'),null,7,null,'부산/울산');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/02/13 11:42:31.226783000','RR/MM/DD HH24:MI:SSXFF'),null,8,null,'경상');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/02/13 11:42:33.862025000','RR/MM/DD HH24:MI:SSXFF'),null,9,null,'광주/전라/제주');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/01/31 16:57:41.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('24/01/31 16:57:42.000000000','RR/MM/DD HH24:MI:SSXFF'),1,null,'서울');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/01/31 16:58:28.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('24/01/31 16:58:29.000000000','RR/MM/DD HH24:MI:SSXFF'),2,null,'경기');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/01/31 16:58:41.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('24/01/31 16:58:39.000000000','RR/MM/DD HH24:MI:SSXFF'),3,null,'인천');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/02/01 09:58:12.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('24/02/01 09:58:15.000000000','RR/MM/DD HH24:MI:SSXFF'),4,null,'강원');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/02/01 09:58:13.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('24/02/01 09:58:16.000000000','RR/MM/DD HH24:MI:SSXFF'),5,null,'대전/충청');
Insert into ADDIN.REGION (IS_WITHDRAWN,CREATED_AT,MODIFIED_AT,REGION_ID,WITHDRAWN_AT,REGION_NAME) values ('N',to_timestamp('24/02/01 09:58:14.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('24/02/01 09:58:17.000000000','RR/MM/DD HH24:MI:SSXFF'),6,null,'대구');
--------------------------------------------------------
--  DDL for Index SYS_C008394
--------------------------------------------------------

  CREATE UNIQUE INDEX "ADDIN"."SYS_C008394" ON "ADDIN"."REGION" ("REGION_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table REGION
--------------------------------------------------------

  ALTER TABLE "ADDIN"."REGION" MODIFY ("REGION_ID" NOT NULL ENABLE);
  ALTER TABLE "ADDIN"."REGION" ADD PRIMARY KEY ("REGION_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
