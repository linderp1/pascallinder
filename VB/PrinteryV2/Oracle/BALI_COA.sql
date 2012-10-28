/*==============================================================*/
/* Table for temp values for local coa                          */
/*                                                              */
/*==============================================================*/
DROP TABLE BALI_COA CASCADE CONSTRAINTS ; 
CREATE TABLE BALI_COA ( 
  SAMPLENAME              VARCHAR2 (10)  NOT NULL, 
  PROCORDER               NUMBER, 
  SPECREVID               NUMBER, 
  COFAFLAG                NUMBER, 
  VARID                   NUMBER, 
  FLAG_PPDN               NUMBER, 
  LIBPROCVARNAME          VARCHAR2 (240), 
  PROCDISPLAYNAME         VARCHAR2 (40), 
  VARDISPLAYNAME          VARCHAR2 (80), 
  SPECCOMMENT             VARCHAR2 (250), 
  LIMITDETECTEDASFOLLOWS  NUMBER, 
  RESULT                  VARCHAR2 (240), 
  RESULT_UNIT             VARCHAR2 (40), 
  RESULT_LIMITCHECK       VARCHAR2 (1), 
  TESTNAME                CHAR (200), 
  TESTORDER               NUMBER ) ; 
GRANT SELECT ON BALI_COA TO PUBLIC;
CREATE PUBLIC SYNONYM BALI_COA FOR CHEMLMS.BALI_COA;

