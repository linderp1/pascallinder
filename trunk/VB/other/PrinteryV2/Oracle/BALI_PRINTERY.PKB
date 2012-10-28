CREATE OR REPLACE PACKAGE BODY BALI_Printery AS
/******************************************************************************
   NAME:       		insertLog
   PURPOSE:    		Save a log entry into log table T_PRINTERY_LOG
					If the Report is a CoA save the additional values to
					the Log table T_PRINTERY_LOG_COA
   RETURNED VALUE:	The sequence number of the new record with Par1
					or -1 if an error occurs

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        29.04.2003      Klaus Zinsmeister       Created
******************************************************************************/

PROCEDURE insertLog ( ReportName IN VARCHAR2, Printer IN VARCHAR2,
					  Par1 IN OUT VARCHAR2, Par2 IN VARCHAR2, Par3 IN VARCHAR2,
					  PRODUCTNAME IN  VARCHAR2, PRODUCTNAME2 IN  VARCHAR2, MANUFACTUREDATE IN VARCHAR2,
					  RELEASEDATE IN VARCHAR2, CONTROL_NO IN VARCHAR2,
					  BATCH_QUANTITY IN VARCHAR2, EXPIRY_DATE IN VARCHAR2, YOUR_REF IN VARCHAR2,
					  OUR_REF IN VARCHAR2, DESTINATION IN VARCHAR2, RETEST_DATE IN VARCHAR2,
					  PLACE_OF_MANUFACTURE IN VARCHAR2, FERTIGSPEZ_NO IN VARCHAR2, FOOTER_LINE_1 IN VARCHAR2,
					  FOOTER_LINE_2 IN VARCHAR2, FOOTER_LINE_3 IN VARCHAR2
					) IS
	TmpVar NUMBER;
	l_NextSEQ INTEGER;

BEGIN
   tmpVar := 0;

	-- give some start staement
	PLVlog.put_line ('BALIPrintery InsertLog',0,USER);

	-- read next sequence
	SELECT EXTERNAL.T_PRINTERY_LOG_SEQ.NEXTVAL
	  INTO l_NextSEQ
	  FROM dual;

	-- insert into log table
	INSERT INTO T_PRINTERY_LOG (ID, USERNAME, REPORTNAME, PRINTER,
								PARAMETER_1, PARAMETER_2, PARAMETER_3,
								TIMESTAMP)
						VALUES (l_NextSEQ, USER, ReportName, Printer,
								Par1, Par2, Par3, SYSDATE) ;

    -- insert into CoA Log if report was CoA
	IF ReportName = 'local_coa' THEN
       	INSERT INTO T_PRINTERY_LOG_COA (ID, PRODUCTNAME, PRODUCTNAME2, MANUFACTUREDATE,
       									RELEASEDATE, CONTROL_NO, BATCH_QUANTITY, EXPIRY_DATE,
       									YOUR_REF, OUR_REF, DESTINATION, RETEST_DATE,
       									PLACE_OF_MANUFACTURE, FERTIGSPEZ_NO,
       									FOOTER_LINE_1, FOOTER_LINE_2, FOOTER_LINE_3)
       							VALUES (l_NextSEQ, PRODUCTNAME, PRODUCTNAME2, MANUFACTUREDATE,
       									RELEASEDATE, CONTROL_NO, BATCH_QUANTITY, EXPIRY_DATE,
       									YOUR_REF, OUR_REF, DESTINATION, RETEST_DATE,
       									PLACE_OF_MANUFACTURE, FERTIGSPEZ_NO, FOOTER_LINE_1,
       									FOOTER_LINE_2, FOOTER_LINE_3) ;
	END IF;

	Par1 := l_NextSEQ;
	EXCEPTION
		WHEN OTHERS THEN
			Par1 := '-1';
			RAISE;
END insertLog;

/******************************************************************************
   NAME:       		saveCoAPara
   PURPOSE:    		Save a the parameters of a CoA to parameter tabel
   RETURNED VALUE:	The samplename submitted
					or -1 if an error occurs

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        29.04.2003      Klaus Zinsmeister       Created
******************************************************************************/
PROCEDURE saveCoAPara ( SampleName IN OUT VARCHAR2,
					  PRODUCTNAME IN  VARCHAR2, PRODUCTNAME2 IN  VARCHAR2, MANUFACTUREDATE IN VARCHAR2,
					  RELEASEDATE IN VARCHAR2, CONTROL_NO IN VARCHAR2,
					  BATCH_QUANTITY IN VARCHAR2, EXPIRY_DATE IN VARCHAR2, YOUR_REF IN VARCHAR2,
					  OUR_REF IN VARCHAR2, DESTINATION IN VARCHAR2, RETEST_DATE IN VARCHAR2,
					  PLACE_OF_MANUFACTURE IN VARCHAR2, FERTIGSPEZ_NO IN VARCHAR2, FOOTER_LINE_1 IN VARCHAR2,
					  FOOTER_LINE_2 IN VARCHAR2, FOOTER_LINE_3 IN VARCHAR2
					) IS
	tmpSample VARCHAR2(10) :='';
BEGIN
	tmpSample := SampleName;
	-- give some start staement
	PLVlog.put_line ('BALIPrintery saveCoAPara',0,USER);

	-- delete already existing parameters
	DELETE
	  FROM T_PRINTERY_COA_PARA
	 WHERE SAMPLENAME = tmpSample;
	-- insert into prameter table
	INSERT INTO T_PRINTERY_COA_PARA (SAMPLENAME, USERNAME, TIMESTAMP, PRODUCTNAME,
										PRODUCTNAME2, MANUFACTUREDATE, RELEASEDATE,
       									CONTROL_NO, BATCH_QUANTITY, EXPIRY_DATE,
       									YOUR_REF, OUR_REF, DESTINATION, RETEST_DATE,
       									PLACE_OF_MANUFACTURE, FERTIGSPEZ_NO,
       									FOOTER_LINE_1, FOOTER_LINE_2, FOOTER_LINE_3)
       							VALUES (SampleName, USER, SYSDATE, PRODUCTNAME,
										PRODUCTNAME2, MANUFACTUREDATE, RELEASEDATE,
       									CONTROL_NO, BATCH_QUANTITY, EXPIRY_DATE,
       									YOUR_REF, OUR_REF, DESTINATION, RETEST_DATE,
       									PLACE_OF_MANUFACTURE, FERTIGSPEZ_NO, FOOTER_LINE_1,
       									FOOTER_LINE_2, FOOTER_LINE_3) ;
	EXCEPTION
		WHEN OTHERS THEN
			SampleName := '-1';
			RAISE;
END saveCoAPara;

/******************************************************************************
   NAME:       		deleteLabelSet
   PURPOSE:    		Save a the parameters of a CoA to parameter tabel
   RETURNED VALUE:	The samplename submitted
					or -1 if an error occurs

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        29.04.2003      Klaus Zinsmeister       Created
   1.1		  15.03.2004	  Klaus Zinsmeister		  changed variable from SetNo
   			  to lSetNo. Before all Labelsets was deleted because the
			  variable name was not uniquie.
******************************************************************************/
PROCEDURE deleteLabelSet ( lSetNo IN OUT Integer) IS
BEGIN
	-- give some start statement
	PLVlog.put_line ('BALIPrintery deleteLabelSet',lSetNo,USER);

	-- delete label set for logged in user
	DELETE
	  FROM T_PRINTERY_LABEL
	 WHERE USERNAME = USER
	   AND SETNO = lSetNo;
	-- success
	lSetNo := 0;
	EXCEPTION
		WHEN OTHERS THEN
			lSetNo := -1;
			RAISE;
END deleteLabelSet;

/******************************************************************************
   NAME:       		saveLabelSet
   PURPOSE:    		Save a the parameters of a CoA to parameter tabel
   RETURNED VALUE:	The samplename submitted
					or -1 if an error occurs

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        29.04.2003      Klaus Zinsmeister       Created
******************************************************************************/
PROCEDURE saveLabelSet ( SetNo IN OUT Integer, LabName IN VARCHAR2, LabPrinter IN VARCHAR2,
						 NoOfLabel IN Integer) IS
BEGIN
	-- give some start staement
	PLVlog.put_line ('BALIPrintery saveLabelSet',0,USER);

	-- insert into prameter table
	INSERT INTO T_PRINTERY_LABEL ( USERNAME, SETNO, LABNAME,
								   LABELPRINTER, NOOFLABEL )
       					  VALUES (USER, SetNo, LabName, LabPrinter, NoOfLabel);
	SetNo := 0;
	EXCEPTION
		WHEN OTHERS THEN
			SetNo := -1;
			RAISE;
END saveLabelSet;

END BALI_Printery;
/

CREATE OR REPLACE PACKAGE BALI_Printery IS

PROCEDURE insertLog ( ReportName IN VARCHAR2, Printer IN VARCHAR2,
					  Par1 IN OUT VARCHAR2, Par2 IN VARCHAR2, Par3 IN VARCHAR2,
					  PRODUCTNAME IN  VARCHAR2, PRODUCTNAME2 IN  VARCHAR2, MANUFACTUREDATE IN VARCHAR2,
					  RELEASEDATE IN VARCHAR2, CONTROL_NO IN VARCHAR2,
					  BATCH_QUANTITY IN VARCHAR2, EXPIRY_DATE IN VARCHAR2, YOUR_REF IN VARCHAR2,
					  OUR_REF IN VARCHAR2, DESTINATION IN VARCHAR2, RETEST_DATE IN VARCHAR2,
					  PLACE_OF_MANUFACTURE IN VARCHAR2, FERTIGSPEZ_NO IN VARCHAR2, FOOTER_LINE_1 IN VARCHAR2,
					  FOOTER_LINE_2 IN VARCHAR2, FOOTER_LINE_3 IN VARCHAR2
					) ;
PROCEDURE saveCoAPara ( SampleName IN OUT VARCHAR2,
					  PRODUCTNAME IN  VARCHAR2, PRODUCTNAME2 IN  VARCHAR2, MANUFACTUREDATE IN VARCHAR2,
					  RELEASEDATE IN VARCHAR2, CONTROL_NO IN VARCHAR2,
					  BATCH_QUANTITY IN VARCHAR2, EXPIRY_DATE IN VARCHAR2, YOUR_REF IN VARCHAR2,
					  OUR_REF IN VARCHAR2, DESTINATION IN VARCHAR2, RETEST_DATE IN VARCHAR2,
					  PLACE_OF_MANUFACTURE IN VARCHAR2, FERTIGSPEZ_NO IN VARCHAR2, FOOTER_LINE_1 IN VARCHAR2,
					  FOOTER_LINE_2 IN VARCHAR2, FOOTER_LINE_3 IN VARCHAR2
					) ;
PROCEDURE deleteLabelSet ( lSetNo IN OUT Integer);
PROCEDURE saveLabelSet ( SetNo IN OUT Integer, LabName IN VARCHAR2, LabPrinter IN VARCHAR2,
						 NoOfLabel IN Integer);
/******************************************************************************
   NAME:       		BALI_Printery
   PURPOSE:    		Set of procedures used by BALi Printery
					This package contains the helper procedures for BALI Printery
					to save the audit trail and the user settings for labels.
   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        29.04.2003      Klaus Zinsmeister       Created
   1.1		  15.03.2004	  Klaus zinsmeister		  CR20040210_216
   			  				  						  fixed error where all label
													  set was deleted

******************************************************************************/

END BALI_Printery;
/

