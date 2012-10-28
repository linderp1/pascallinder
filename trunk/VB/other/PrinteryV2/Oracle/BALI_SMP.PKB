CREATE OR REPLACE PACKAGE BALI_SMP IS
   FUNCTION getSpecID  (Samplename VARCHAR2) Return VARCHAR2 ;
   FUNCTION getSpecRev (Samplename VARCHAR2) Return INTEGER ;
/******************************************************************************
   NAME:       BALI_SMP
   PURPOSE:    Collection of standard functions for a sample

   REVISIONS:
   Ver        Date        	Author           	Description
   ---------  --------		---------------  	------------------------------------
   1.0        10.04.2003    Klaus Zinsmeister   1. Created this package.

******************************************************************************/
END BALI_SMP;
/
CREATE OR REPLACE PACKAGE BODY BALI_SMP AS

/******************************************************************************
   NAME:       		getSpecID
   PURPOSE:    		Read the Specification Name from the sample (global)
   RETURNED VALUE:	Specification Name as VARCHAR2

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        25.02.2003      Klaus Zinsmeister       1. Created
******************************************************************************/

FUNCTION getSpecID (Samplename VARCHAR2) Return VARCHAR2 IS
	CURSOR c1 (l_Samplename VARCHAR2) IS
		SELECT SPECNAME
		  FROM BALI_ATTRIB_SPECNAMEVW
		 WHERE SAMPLENAME = l_Samplename ;   
   l_SpecID VARCHAR2(240) := '';
BEGIN
	OPEN c1 (Samplename);
		FETCH c1 into l_SpecID;
	CLOSE c1;
	RETURN l_SpecID;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		CLOSE c1;
	WHEN OTHERS THEN
		CLOSE c1;
		PLVlog.put_line ('getSpecID',SQLCODE,SQLERRM);
		RAISE;
END getSpecID;

/******************************************************************************
   NAME:       		getSpecRev
   PURPOSE:    		Read the Specification Revision from a sample
   RETURNED VALUE:	Specification Revision as NUMBER

   REVISIONS:
   Ver        Date         	  Author           		  Description
   ---------  ----------      ---------------  		  -------------------------
   1.0        25.02.2003      Klaus Zinsmeister       1. First Version
******************************************************************************/
FUNCTION getSpecRev (Samplename VARCHAR2) Return INTEGER IS
	CURSOR c1 (l_Samplename VARCHAR2) IS
    	SELECT SPECREV
		  FROM BALI_ATTRIB_SPECREVVW
		 WHERE SAMPLENAME = l_Samplename ;   
   l_SpecRev INTEGER := 0;
BEGIN
	OPEN c1 (Samplename);
		FETCH c1 into l_SpecRev;
	CLOSE c1 ;
	RETURN l_SpecRev;

EXCEPTION
	WHEN NO_DATA_FOUND THEN
		CLOSE c1;
	WHEN OTHERS THEN
		CLOSE c1;
		PLVlog.put_line ('getSpecRev',SQLCODE,SQLERRM);
		RAISE;
END getSpecRev;

END BALI_SMP;

/
