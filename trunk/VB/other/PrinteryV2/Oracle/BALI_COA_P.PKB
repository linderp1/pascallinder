CREATE OR REPLACE PACKAGE BALI_COA_P IS
   FUNCTION countSpecVar ( GWSpecRev NUMBER,  Limit VARCHAR2) Return NUMBER ;
   FUNCTION getFlagPrintProcDisplayname ( GWSpecRev NUMBER ) Return NUMBER ;
   FUNCTION getFirstVarDisplayname ( GWSpecRev NUMBER ) Return VARCHAR2;
   FUNCTION getProcDisplayname ( GWSpecRev NUMBER ) Return VARCHAR2;
   PROCEDURE MakeLocalCoA ( SampleName VARCHAR2, CoAType VARCHAR2 );
   PROCEDURE deleteTableRecords ;
   PROCEDURE makeLocalProcVariables ( GWSpecRev VARCHAR2, ProcOrder NUMBER,
   			 						  Flag_PPDN NUMBER, Limit VARCHAR2 );

/******************************************************************************
   NAME:       BALI_COA_P
   PURPOSE:    Set of procedures and function to fill a temp table with the needed
   			   values to generate a CoA.


   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   0.9        25.02.2003      Klaus Zinsmeister       1. Created this package.
   1.0		  21-Mar-2003	  Klaus Zinsmeister		  Implement all procedures to generate
   			  				  						  a local CoA. For project Printery 2.0
   OUTPUT:			Some debug information out to DBMS Output
   CALLED BY:	    From a InfoReport within a expression
   CALLS:
   NOTES:

******************************************************************************/
END BALI_COA_P;
/
CREATE OR REPLACE PACKAGE BODY BALI_COA_P AS
   g_SampleName VARCHAR2(20);  -- Global Samplename
   g_SpecID    VARCHAR2(240);  -- Global Specification Name
   g_SpecRev   NUMBER;		   -- Global Specification Revision


/******************************************************************************
   NAME:       		MakeLocalCoA
   PURPOSE:    		Fill the table for a local CoA depending on th CoA Type
   RETURNED VALUE:

   REVISIONS:
   Ver        Date         	  Author           		Description
   ---------  ----------      ---------------		-------------------------
   1.0        17.03.2003      Klaus Zinsmeister		1. First Version
   1.1        09.05.2003      Klaus Zinsmeister		Define a custom exception
													when no Testpoint is found
******************************************************************************/

PROCEDURE MakeLocalCoA ( SampleName VARCHAR2, CoAType VARCHAR2 ) IS
	TYPE GWSpecRevType IS RECORD (
	    	GWSpecRevID NUMBER,
			ProcOrder NUMBER);

	TYPE GWSpecRevArray IS VARRAY(400) OF GWSpecRevType;

	e_no_procedures_found EXCEPTION;

	l_Counter   INTEGER := 0;
	l_VarCount  INTEGER := 0 ;
	l_PPDNFlag  NUMBER := 0 ;
	l_PPDN_Printed_Flag NUMBER := 0;
	l_LastPPDN_Equal NUMBER := 0;
	l_FirstVarDispName VAR.DISPNAME%TYPE :='';
	l_ProcDispName SPEC.DISPNAME%TYPE := ' ';
	l_LastProcDispName VARCHAR2(240) := ' ';
	l_InsertProcName VARCHAR2(240) := ' ' ;
	l_InsertVarName VARCHAR2(240) := '' ;
	l_InsertResult VARCHAR2(240) := '' ;
	l_GWSpecRevType_Hold GWSpecRevType;
	l_GWSpecRevArray GWSpecRevArray := GWSpecRevArray();
	l_limit VARCHAR2(100) :='DUMMY';

	CURSOR c1 (limit VARCHAR2) IS
   		  SELECT DISTINCT GWSPECAPPROVEDATTRIBUTE.SPECREVID, GWSPECAPPROVEDATTRIBUTE.PROCORDER
		  		     FROM GWSPECAPPROVEDATTRIBUTE
				    WHERE (GWSPECAPPROVEDATTRIBUTE.LIMITCLASS = 'LIMITCLASS2'
					   OR GWSPECAPPROVEDATTRIBUTE.LIMITCLASS = limit)
					  AND GWSPECAPPROVEDATTRIBUTE.COFAFLAG <> 0
					  AND GWSPECAPPROVEDATTRIBUTE.SPECNAME = g_SpecID
					  AND GWSPECAPPROVEDATTRIBUTE.SPECIFICATIONREVISION = g_SpecRev
				 ORDER BY GWSPECAPPROVEDATTRIBUTE.PROCORDER ASC ;

BEGIN
	-- Assign global variables
	g_SampleName := SampleName;
	g_SpecID := BALI_SMP.GETSPECID (g_SampleName);
	g_SpecRev := BALI_SMP.GETSPECREV(g_SampleName);
	p.l (g_SpecID);
	p.l (g_SpecRev);
	-- give some start staement
	PLVlog.put_line ('MakeLocalCoA - Start',0,SampleName);
	IF CoAType = 'FS' THEN
		-- For CoA Type FS we need also the variables from Limitclass NULL
		l_limit := 'NULL';
	END IF;
	p.l (l_limit);
	-- Delete records in TEMP Table
	deleteTableRecords ;
	-- Open cursor to read all procedures
	OPEN c1 (l_limit) ;
	LOOP
		l_Counter := l_Counter + 1;
		FETCH c1  INTO l_GWSpecRevType_Hold  ;
		EXIT WHEN c1%NOTFOUND;
		l_GWSpecRevArray.extend;
		p.l (l_GWSpecRevType_Hold.GWSpecRevID);
		l_GWSpecRevArray(l_Counter) := l_GWSpecRevType_Hold;
	END LOOP;
	CLOSE c1;

	IF l_GWSpecRevArray.count = 0 THEN
		-- Raise custom error
		RAISE e_no_procedures_found;
	END IF;

	-- We have an array with all procedures, loop and check if we need to print them
	FOR l_Counter IN l_GWSpecRevArray.FIRST..l_GWSpecRevArray.LAST LOOP
   		-- count all variables we should print for this SpecRevID
		l_VarCount := countSpecVar(l_GWSpecRevArray(l_Counter).GWSpecRevID, l_Limit) ;
		p.l ('Number of variables:' || l_VarCount);
		IF l_VarCount > 0 THEN
	   		-- We have some variables to print - check if we should print Proceduredisplayname
			-- Read PrintProcDisplayName Flag, the first Variable Displayname and the
			-- ProcedureDisplayName
			l_PPDNFlag := getFlagPrintProcDisplayname (l_GWSpecRevArray(l_Counter).GWSpecRevID);
			l_FirstVarDispName := getFirstVarDisplayname(l_GWSpecRevArray(l_Counter).GWSpecRevID);
			l_ProcDispName := getProcDisplayname(l_GWSpecRevArray(l_Counter).GWSpecRevID);
			-- We should print the ProcedureDisplayName, check if it is different from
			-- last Procedurename and different from the first VariableDisplayname
			IF l_PPDNFlag = 1 THEN
				p.l ('We should print the Procname');
				p.l ('Last Procname is :' || l_LastProcDispName);
				p.l ('Procname is :' || l_ProcDispName);
				IF (l_ProcDispName <> l_LastProcDispName) THEN
			    	p.l ('Procname is not equal to last Procname');
					IF (l_ProcDispName <> l_FirstVarDispName) THEN
						l_InsertProcName := l_ProcDispName;
						l_LastProcDispName := l_ProcDispName;
						l_PPDN_Printed_Flag := 1;
						p.l ('We will print: ' || l_InsertProcName);
					END IF;
				ELSIF l_ProcDispName = l_LastProcDispName THEN
					l_LastPPDN_Equal := 1;
				END IF;
			END IF;
		END IF;

		--Insert Record if we should print the ProcDisplayName
		IF l_PPDN_Printed_Flag = 1 THEN
			p.l ('Insert record : ' || l_InsertProcName);
			INSERT INTO BALI_COA ( SAMPLENAME, PROCORDER, SPECREVID, COFAFLAG,
								   VARID, FLAG_PPDN, LIBPROCVARNAME, PROCDISPLAYNAME,
								   VARDISPLAYNAME, SPECCOMMENT, LIMITDETECTEDASFOLLOWS,
								   RESULT, RESULT_UNIT, RESULT_LIMITCHECK, TESTNAME, TESTORDER)
						  VALUES ( g_SampleName,l_GWSpecRevArray(l_Counter).ProcOrder ,
								   l_GWSpecRevArray(l_Counter).GWSpecRevID, 0, 0, 0, NULL,
								   l_InsertProcName, NULL, NULL, NULL, NULL, NULL, NULL, l_InsertProcName, 0) ;
		END IF;

		-- Read all ProcVariables
		makeLocalProcVariables (l_GWSpecRevArray(l_Counter).GWSpecRevID,
								l_GWSpecRevArray(l_Counter).ProcOrder,
								l_PPDN_Printed_Flag,
								l_Limit);
		-- Reset variables for next run
		l_PPDNFlag := 0;
		l_LastPPDN_Equal := 0;
		l_PPDN_Printed_Flag := 0;
		l_InsertProcName := ' ';
	END LOOP;
	-- Save our work
	COMMIT;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		CLOSE c1;
	WHEN e_no_procedures_found THEN
		PLVlog.put_line ('MakeLocalCoA',SampleName,'No procedures found');
	WHEN OTHERS THEN
		PLVlog.put_line ('MakeLocalCoA',SQLCODE,SQLERRM || ' Sample: ' || g_SampleName);
		COMMIT;
		RAISE;
END MakeLocalCoA;

/******************************************************************************
   NAME:       		countSpecVar
   PURPOSE:    		Return the number of CoA relevant Variables within a given Spec
   					(PSL). Used to see if there are some Variables to print.
   RETURNED VALUE:	No of CoA relevant Variables

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        25.02.2003      Klaus Zinsmeister       Created
******************************************************************************/
FUNCTION countSpecVar ( GWSpecRev NUMBER, Limit VARCHAR2 ) Return NUMBER IS
	CURSOR c1(l_GWSpecRev NUMBER, l_Limit VARCHAR2) IS
	SELECT COUNT (VAR.VARID)
	  FROM GWSPECAPPROVEDATTRIBUTE, VARATTR, RESULT, VAR
     WHERE GWSPECAPPROVEDATTRIBUTE.SPECREVID = VAR.SPECREVID
	 	   AND GWSPECAPPROVEDATTRIBUTE.SPECNAME = g_SpecID
		   AND GWSPECAPPROVEDATTRIBUTE.SPECIFICATIONREVISION = g_SpecRev
		   AND GWSPECAPPROVEDATTRIBUTE.SPECREVID = l_GWSpecRev
	 	   AND GWSPECAPPROVEDATTRIBUTE.VARID = VAR.VARID
		   AND (GWSPECAPPROVEDATTRIBUTE.LIMITCLASS = 'LIMITCLASS2'
 		    OR GWSPECAPPROVEDATTRIBUTE.LIMITCLASS = l_Limit)
		   AND GWSPECAPPROVEDATTRIBUTE.COFAFLAG <> 0
		   AND RESULT.SAMPNAME = g_SampleName
		   AND VAR.SPECREVID = RESULT.SPECREVID
		   AND VAR.VARID = RESULT.VARID
 		   AND RESULT.RESSPECIALRESULTTYPE <> 'C'
		   AND RESULT.VARTYPE IN ('M', 'C')
		   AND VAR.SPECREVID = VARATTR.SPECREVID
		   AND VAR.VARID = VARATTR.VARID
		   AND VARATTR.ATTRNAME = 'INCLCOFA'
		   AND UPPER(VARATTR.ATTRVAL) = 'T'
		   AND RESULT.RESLOOPIX = 1
		   AND RESULT.RESREPEATIX = 1
		   AND RESULT.RESREPLICATEIX = 0 ;
	l_Return NUMBER := 0;
BEGIN
	 l_Return :=0;
	OPEN c1 (GWSpecRev, Limit);
		FETCH c1 into l_Return;
	CLOSE c1;
	RETURN l_Return;
EXCEPTION
	WHEN OTHERS THEN
		CLOSE c1;
		PLVlog.put_line ('countSpecVar',SQLCODE,SQLERRM);
		RAISE;
END countSpecVar;

/******************************************************************************
   NAME:       		getFlagPrintProcDisplayname
   PURPOSE:    		Return if for the given SpecRev the Procedure name should be
   					printed.
   RETURNED VALUE:	1 for True/Yes or 0 for Fasle/No

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        25.02.2003      Klaus Zinsmeister       Created
******************************************************************************/
FUNCTION getFlagPrintProcDisplayname ( GWSpecRev NUMBER ) Return NUMBER IS
	CURSOR c1(l_GWSpecRev NUMBER) IS
	SELECT RESULT.RESSTRVAL
	  FROM RESULT, VAR
     WHERE RESULT.SPECREVID = VAR.SPECREVID
		   AND RESULT.SPECREVID = l_GWSpecRev
		   AND RESULT.SAMPNAME = g_SampleName
		   AND VAR.SPECREVID = RESULT.SPECREVID
		   AND VAR.VARID = RESULT.VARID
		   AND VAR.NAME = 'PRINTPROCDISPNAME$' ;
	l_SQLReturn VARCHAR2(240);
	l_Return NUMBER := 0;
BEGIN
	OPEN c1 (GWSpecRev);
		FETCH c1 into l_SQLReturn;
		IF l_SQLReturn = 'T' THEN
			l_Return := 1;
		ELSE
			l_Return := 0;
		END IF;
	CLOSE c1;
	RETURN l_Return;
EXCEPTION
	WHEN OTHERS THEN
		CLOSE c1;
		PLVlog.put_line ('getFlagPrintProcDisplayname',SQLCODE,SQLERRM);
		RAISE;
END getFlagPrintProcDisplayname;

/******************************************************************************
   NAME:       		getFirstVarDisplayname
   PURPOSE:    		Return the Displayname of the first Variable of a procedure
   RETURNED VALUE:	Displayname as VARCHAR2

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        25.02.2003      Klaus Zinsmeister       Created
******************************************************************************/

FUNCTION getFirstVarDisplayname ( GWSpecRev NUMBER ) Return VARCHAR2 IS
	CURSOR c1(l_GWSpecRev NUMBER) IS
		SELECT VAR.DISPNAME
		  FROM VAR
		 WHERE VAR.TYPE <> 'P'
		   AND VAR.SPECREVID = l_GWSpecRev
	  ORDER BY VAR.VARID ;
	l_Return VAR.DISPNAME%TYPE;
BEGIN
	OPEN c1 (GWSpecRev);
		FETCH c1 into l_Return;
	RETURN l_Return;
EXCEPTION
	WHEN OTHERS THEN
		CLOSE c1;
		PLVlog.put_line ('getFirstVarDisplayname',SQLCODE,SQLERRM);
		RAISE;
END getFirstVarDisplayname;


/******************************************************************************
   NAME:       		getProcDisplayname
   PURPOSE:    		Return the Displayname of the procedure
   RETURNED VALUE:	Displayname as VARCHAR2

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        25.02.2003      Klaus Zinsmeister       1. Created
******************************************************************************/

FUNCTION getProcDisplayname ( GWSpecRev NUMBER ) Return VARCHAR2 IS
	CURSOR c1(l_GWSpecRev NUMBER) IS
		SELECT SPEC.DISPNAME
		  FROM SPEC
		 WHERE SPEC.SPECREVID = l_GWSpecRev ;
	l_Return SPEC.DISPNAME%TYPE;
BEGIN
	OPEN c1 (GWSpecRev);
		FETCH c1 into l_Return;
	CLOSE c1;
    RETURN l_Return;
EXCEPTION
	WHEN NO_DATA_FOUND THEN
		CLOSE c1;
	WHEN OTHERS THEN
		CLOSE c1;
		PLVlog.put_line ('getProcDisplayname',SQLCODE,SQLERRM);
		RAISE;
END getProcDisplayname;

/******************************************************************************
   NAME:       		deleteTableRecords
   PURPOSE:    		Delete all record for the global Samplename
   RETURNED VALUE:	-

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        20.03.2003      Klaus Zinsmeister       1. Created
******************************************************************************/

PROCEDURE deleteTableRecords IS
BEGIN
	DELETE FROM BALI_COA WHERE SAMPLENAME = g_SampleName ;
END deleteTableRecords;

/******************************************************************************
   NAME:       		makeLocalProcVariables
   PURPOSE:    		Read all CoA relevant variables for the given SpecID
   					and insert them into the table. If a Speccomment is found
					an additional row will be inserted. For this row the
					testorder will be set to 1 for sorting in the report.
   RETURNED VALUE:	-

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        20.03.2003      Klaus Zinsmeister       Created
******************************************************************************/

PROCEDURE makeLocalProcVariables ( GWSpecRev VARCHAR2,
		  						   ProcOrder NUMBER,
								   Flag_PPDN NUMBER,
								   Limit VARCHAR2 )  IS
	l_VarID NUMBER := 0;
	l_VarDisplayname VARCHAR2(80) := ' ';
	l_Result VARCHAR2(240) := ' ';
	l_ResultUnit VARCHAR2(40) := ' ';
	l_ResultLimitCheck VARCHAR2(1) := ' ';
	l_LibProcVarName VARCHAR2(240) := ' ';
	l_COFAFlag NUMBER := 0;
	l_SpecComment VARCHAR2(220) := ' ';
	l_SpecResultStr VARCHAR2(240) := ' ';
	l_SpecSOP VARCHAR2(250) := ' ';
	l_TestName CHAR(200) := ' ' ;	-- Testname to insert, needs to be a CHAR because we are using leading spaces

	CURSOR c1(l_GWSpecRev NUMBER, l_Limit VARCHAR2) IS
		   SELECT VAR.VARID, VAR.DISPNAME, RESULT.RESSTRVAL,
		   		  GWSPECAPPROVEDATTRIBUTE.LIBPROCVARNAME,
				  GWSPECAPPROVEDATTRIBUTE.COFAFLAG,
				  VAR.UNITS, GWSPECAPPROVEDATTRIBUTE.RESULTSTRING,
				  GWSPECAPPROVEDATTRIBUTE.SPECCOMMENT, GWSPECAPPROVEDATTRIBUTE.SOP,
				  RESULT.RESLIMITCHECKCODE
	  	     FROM GWSPECAPPROVEDATTRIBUTE, VARATTR, RESULT, VAR
     		WHERE GWSPECAPPROVEDATTRIBUTE.SPECREVID = VAR.SPECREVID
	 	      AND GWSPECAPPROVEDATTRIBUTE.SPECNAME = g_SpecID
		   	  AND GWSPECAPPROVEDATTRIBUTE.SPECIFICATIONREVISION = g_SpecRev
		   	  AND GWSPECAPPROVEDATTRIBUTE.SPECREVID = l_GWSpecRev
	 	   	  AND GWSPECAPPROVEDATTRIBUTE.VARID = VAR.VARID
		   	  AND (GWSPECAPPROVEDATTRIBUTE.LIMITCLASS = 'LIMITCLASS2'
			   OR GWSPECAPPROVEDATTRIBUTE.LIMITCLASS = l_Limit)
		   	  AND GWSPECAPPROVEDATTRIBUTE.COFAFLAG <> 0
		   	  AND RESULT.SAMPNAME = g_SampleName
		   	  AND VAR.SPECREVID = RESULT.SPECREVID
		   	  AND VAR.VARID = RESULT.VARID
 		   	  AND RESULT.RESSPECIALRESULTTYPE <> 'C'
		   	  AND RESULT.VARTYPE IN ('M', 'C')
		   	  AND VAR.SPECREVID = VARATTR.SPECREVID
		   	  AND VAR.VARID = VARATTR.VARID
		   	  AND VARATTR.ATTRNAME = 'INCLCOFA'
		   	  AND UPPER(VARATTR.ATTRVAL) = 'T'
		   	  AND RESULT.RESLOOPIX = 1
		   	  AND RESULT.RESREPEATIX = 1
		   	  AND RESULT.RESREPLICATEIX = 0
		 ORDER BY GWSPECAPPROVEDATTRIBUTE.COFAFLAG, VAR.VARID;

BEGIN
	p.l ('Enter makeLocalProcVariables');
	OPEN c1 (GWSpecRev, Limit);
	LOOP
		FETCH c1 INTO l_VarID, l_VarDisplayname, l_Result,
					  l_LibProcVarName, l_COFAFlag, l_ResultUnit,
					  l_SpecResultStr, l_SpecComment, l_SpecSOP, l_ResultLimitCheck ;
		EXIT WHEN c1%NOTFOUND;
		p.l ('VarID : ' || l_VarID || ' VarDisplayname: ' || l_VarDisplayname || ' Result: ' || l_Result);
		p.l ('SpecComment : ' || l_SpecComment);
		IF Flag_PPDN = 1 THEN
		 	 -- Insert some leading spaces because the Procname is printed
		 	 l_TestName := '   ' || l_VarDisplayname;
		ELSE
		 	 l_TestName := l_VarDisplayname;
		END IF;
		-- Insert variable into our table
		INSERT INTO BALI_COA ( SAMPLENAME, PROCORDER, SPECREVID, COFAFLAG,
							   VARID, FLAG_PPDN, LIBPROCVARNAME, PROCDISPLAYNAME,
							   VARDISPLAYNAME, SPECCOMMENT, LIMITDETECTEDASFOLLOWS,
							   RESULT, RESULT_UNIT, RESULT_LIMITCHECK, TESTNAME, TESTORDER)
					  VALUES ( g_SampleName, ProcOrder , GWSpecRev, l_COFAFlag, l_VarID,
		   		    		   Flag_PPDN, l_LibProcVarName, NULL, l_VarDisplayname, l_SpecComment, NULL,
							   l_Result, l_ResultUnit, l_ResultLimitCheck, l_TestName, 0 ) ;
		 -- check if a Speccomment is present
         IF l_SpecComment <> ' ' THEN
		 	-- Insert the Speccomment with leading spaces
		    l_TestName := '   ' || l_SpecComment;
		    p.l ('TestNameComment : ' || l_TestName);
			-- we just insert a row with the speccomment, no result to prevent from printing twice
		    INSERT INTO BALI_COA ( SAMPLENAME, PROCORDER, SPECREVID, COFAFLAG,
		   		  	   			   VARID, FLAG_PPDN, LIBPROCVARNAME, PROCDISPLAYNAME,
								   VARDISPLAYNAME, SPECCOMMENT, LIMITDETECTEDASFOLLOWS,
								   RESULT, RESULT_UNIT, RESULT_LIMITCHECK, TESTNAME, TESTORDER)
						  VALUES ( g_SampleName, ProcOrder , GWSpecRev, l_COFAFlag, l_VarID,
								   Flag_PPDN, l_LibProcVarName, NULL, l_VarDisplayname, l_SpecComment, NULL,
								   NULL, NULL, l_ResultLimitCheck, l_TestName, 1 ) ;
		 END IF;

	 END LOOP;
	 COMMIT;
EXCEPTION
	WHEN OTHERS THEN
		CLOSE c1;
		PLVlog.put_line ('makeLocalProcVariables',SQLCODE,SQLERRM || ' Sample: ' || g_SampleName);
		RAISE;
END makeLocalProcVariables;

END BALI_COA_P;
/
