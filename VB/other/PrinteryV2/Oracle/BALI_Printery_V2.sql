/*==============================================================*/
/* Database name:  BALI_PRINTERY                                */
/* DBMS name:      ORACLE Version 8                             */
/* Created on:     18.08.2003 11:46:07                          */
/*==============================================================*/


drop table EXTERNAL.T_PRINTERY_LOG_COA cascade constraints
/


drop table EXTERNAL.T_PRINTERY_LOG cascade constraints
/


drop table EXTERNAL.T_PRINTERY_LABEL cascade constraints
/


drop table EXTERNAL.T_PRINTERY_COA_PARA cascade constraints
/


drop sequence EXTERNAL.T_PRINTERY_LOG_SEQ
/


create sequence EXTERNAL.T_PRINTERY_LOG_SEQ
increment by 1
nocache
/


/*==============================================================*/
/* Table: T_PRINTERY_COA_PARA                                   */
/*==============================================================*/


create table EXTERNAL.T_PRINTERY_COA_PARA  (
   SAMPLENAME           VARCHAR2(10)                     not null,
   USERNAME             VARCHAR2(20),
   TIMESTAMP            DATE,
   PRODUCTNAME          VARCHAR2(100),
   PRODUCTNAME2         VARCHAR2(100),
   MANUFACTUREDATE      VARCHAR2(15),
   RELEASEDATE          VARCHAR2(15),
   CONTROL_NO           VARCHAR2(30),
   BATCH_QUANTITY       VARCHAR2(30),
   EXPIRY_DATE          VARCHAR2(15),
   YOUR_REF             VARCHAR2(30),
   OUR_REF              VARCHAR2(30),
   DESTINATION          VARCHAR2(60),
   RETEST_DATE          VARCHAR2(15),
   PLACE_OF_MANUFACTURE VARCHAR2(50),
   FERTIGSPEZ_NO        VARCHAR2(30),
   FOOTER_LINE_1        VARCHAR2(120),
   FOOTER_LINE_2        VARCHAR2(120),
   FOOTER_LINE_3        VARCHAR2(120),
   constraint PK_T_PRINTERY_COA_PARA primary key (SAMPLENAME)
)
/


comment on table EXTERNAL.T_PRINTERY_COA_PARA is
'Saved values for a CoA'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.SAMPLENAME is
'Name of the sample e.G 07000100'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.USERNAME is
'UserID of the insert user'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.TIMESTAMP is
'Date and Time of the entry'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.PRODUCTNAME is
'Productname'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.PRODUCTNAME2 is
'second row for productname'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.MANUFACTUREDATE is
'Date of Manufacture'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.RELEASEDATE is
'Title Release date (only used for special certificates9'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.CONTROL_NO is
'Control No.or Codification No'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.BATCH_QUANTITY is
'Quantity / Batch Size'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.EXPIRY_DATE is
'Date of Expiry'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.YOUR_REF is
'Your Ref'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.OUR_REF is
'Our Ref.'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.DESTINATION is
'Destination Country '
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.RETEST_DATE is
'Date of Retest'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.PLACE_OF_MANUFACTURE is
'Place of Manufacture or Supplier'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.FERTIGSPEZ_NO is
'Number of the Finished Product'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.FOOTER_LINE_1 is
'Footer Line 1'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.FOOTER_LINE_2 is
'Footer Line 2'
/


comment on column EXTERNAL.T_PRINTERY_COA_PARA.FOOTER_LINE_3 is
'Footer Line 3'
/


/*==============================================================*/
/* Begin additional commands                                    */
/*                                                              */
CREATE PUBLIC SYNONYM T_PRINTERY_COA_PARA FOR EXTERNAL.T_PRINTERY_COA_PARA ;
GRANT SELECT ON EXTERNAL.T_PRINTERY_COA_PARA TO PUBLIC ;
GRANT ALL ON EXTERNAL.T_PRINTERY_COA_PARA TO PDBA ;
GRANT ALL ON EXTERNAL.T_PRINTERY_COA_PARA TO CHEMLMS ;
/*                                                              */
/* End additional commands                                      */
/*==============================================================*/
/*==============================================================*/
/* Table: T_PRINTERY_LABEL                                      */
/*==============================================================*/


create table EXTERNAL.T_PRINTERY_LABEL  (
   USERNAME             VARCHAR2(10)                     not null,
   SETNO                NUMBER(2)                        not null,
   LABNAME              VARCHAR2(60),
   LABELPRINTER         VARCHAR2(60),
   NOOFLABEL            NUMBER(2)
)
/


comment on table EXTERNAL.T_PRINTERY_LABEL is
'Store sets of label definitions'
/


comment on column EXTERNAL.T_PRINTERY_LABEL.USERNAME is
'Userid '
/


comment on column EXTERNAL.T_PRINTERY_LABEL.LABNAME is
'Name of the Lab'
/


comment on column EXTERNAL.T_PRINTERY_LABEL.LABELPRINTER is
'Name of the label printer'
/


comment on column EXTERNAL.T_PRINTERY_LABEL.NOOFLABEL is
'Number of labels'
/


/*==============================================================*/
/* Begin additional commands                                    */
/*                                                              */
CREATE PUBLIC SYNONYM T_PRINTERY_LABEL FOR EXTERNAL.T_PRINTERY_LABEL ;
GRANT SELECT ON EXTERNAL.T_PRINTERY_LABEL TO PUBLIC ;
GRANT ALL ON EXTERNAL.T_PRINTERY_LABEL TO PDBA ;
GRANT ALL ON EXTERNAL.T_PRINTERY_LABEL TO CHEMLMS ;
/*                                                              */
/* End additional commands                                      */
/*==============================================================*/
/*==============================================================*/
/* Table: T_PRINTERY_LOG                                        */
/*==============================================================*/
/*==============================================================*/
/* Begin additional commands                                    */
/*                                                              */
/* we need to set the sequence here                             */
GRANT SELECT ON EXTERNAL.T_PRINTERY_LOG_SEQ TO CHEMLMS;
/*                                                              */
/* End additional commands                                      */
/*==============================================================*/


create table EXTERNAL.T_PRINTERY_LOG  (
   ID                   NUMBER(8)                        not null,
   USERNAME             VARCHAR2(10),
   REPORTNAME           VARCHAR2(60),
   PRINTER              VARCHAR2(20),
   PARAMETER_1          VARCHAR2(40),
   PARAMETER_2          VARCHAR(40),
   PARAMETER_3          VARCHAR2(40),
   TIMESTAMP            DATE                           default sysdate,
   constraint PK_T_PRINTERY_LOG primary key (ID)
)
/


comment on table EXTERNAL.T_PRINTERY_LOG is
'Audittrail for Module BALI Printery'
/


comment on column EXTERNAL.T_PRINTERY_LOG.ID is
'Index Number'
/


comment on column EXTERNAL.T_PRINTERY_LOG.USERNAME is
'Username as UserID'
/


comment on column EXTERNAL.T_PRINTERY_LOG.REPORTNAME is
'The name of the report/lable'
/


comment on column EXTERNAL.T_PRINTERY_LOG.PRINTER is
'Printername'
/


comment on column EXTERNAL.T_PRINTERY_LOG.PARAMETER_1 is
'The first parameter for the report/label'
/


comment on column EXTERNAL.T_PRINTERY_LOG.PARAMETER_2 is
'The second parameter for the report/label'
/


comment on column EXTERNAL.T_PRINTERY_LOG.PARAMETER_3 is
'The third parameter for the report/label'
/


comment on column EXTERNAL.T_PRINTERY_LOG.TIMESTAMP is
'Timestamp of entry'
/


/*==============================================================*/
/* Begin additional commands                                    */
/*                                                              */
CREATE PUBLIC SYNONYM T_PRINTERY_LOG FOR EXTERNAL.T_PRINTERY_LOG ;
GRANT SELECT ON EXTERNAL.T_PRINTERY_LOG TO PUBLIC ;
GRANT ALL ON EXTERNAL.T_PRINTERY_LOG TO PDBA ;
GRANT ALL ON EXTERNAL.T_PRINTERY_LOG TO CHEMLMS ;
/*                                                              */
/* End additional commands                                      */
/*==============================================================*/
/*==============================================================*/
/* Table: T_PRINTERY_LOG_COA                                    */
/*==============================================================*/


create table EXTERNAL.T_PRINTERY_LOG_COA  (
   ID                   NUMBER(8)                        not null,
   PRODUCTNAME          VARCHAR2(100),
   PRODUCTNAME2         VARCHAR2(100),
   MANUFACTUREDATE      VARCHAR2(15),
   RELEASEDATE          VARCHAR2(15),
   CONTROL_NO           VARCHAR2(30),
   BATCH_QUANTITY       VARCHAR2(30),
   EXPIRY_DATE          VARCHAR2(15),
   YOUR_REF             VARCHAR2(30),
   OUR_REF              VARCHAR2(30),
   DESTINATION          VARCHAR2(60),
   RETEST_DATE          VARCHAR2(15),
   PLACE_OF_MANUFACTURE VARCHAR2(50),
   FERTIGSPEZ_NO        VARCHAR2(30),
   FOOTER_LINE_1        VARCHAR2(120),
   FOOTER_LINE_2        VARCHAR2(120),
   FOOTER_LINE_3        VARCHAR2(120),
   constraint PK_T_PRINTERY_LOG_COA primary key (ID),
   constraint FK_T_PRINTE_REF_PRINT_T_PRINTE foreign key (ID)
         references EXTERNAL.T_PRINTERY_LOG (ID)
)
/


comment on table EXTERNAL.T_PRINTERY_LOG_COA is
'Entered Parameter for a print out of a CoA'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.ID is
'Index Number'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.PRODUCTNAME is
'Productname'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.PRODUCTNAME2 is
'second row for Productname'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.MANUFACTUREDATE is
'Date of Manufacture'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.RELEASEDATE is
'Releasedate (used only for special certificates)'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.CONTROL_NO is
'Control No.or Codification No'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.BATCH_QUANTITY is
'Quantity / Batch Size'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.EXPIRY_DATE is
'Date of Expiry'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.YOUR_REF is
'Your Ref'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.OUR_REF is
'Our Ref.'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.DESTINATION is
'Destination Country '
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.RETEST_DATE is
'Date of Retest'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.PLACE_OF_MANUFACTURE is
'Place of Manufacture or Supplier'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.FERTIGSPEZ_NO is
'Number of the Finished Product'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.FOOTER_LINE_1 is
'Footer Line 1'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.FOOTER_LINE_2 is
'Footer Line 2'
/


comment on column EXTERNAL.T_PRINTERY_LOG_COA.FOOTER_LINE_3 is
'Footer Line 3'
/


/*==============================================================*/
/* Begin additional commands                                    */
/*                                                              */
CREATE PUBLIC SYNONYM T_PRINTERY_LOG_COA FOR EXTERNAL.T_PRINTERY_LOG_COA ;
GRANT SELECT ON EXTERNAL.T_PRINTERY_LOG_COA TO PUBLIC ;
GRANT ALL ON EXTERNAL.T_PRINTERY_LOG_COA TO PDBA ;
GRANT ALL ON EXTERNAL.T_PRINTERY_LOG_COA TO CHEMLMS ;
/*                                                              */
/* End additional commands                                      */
/*==============================================================*/
