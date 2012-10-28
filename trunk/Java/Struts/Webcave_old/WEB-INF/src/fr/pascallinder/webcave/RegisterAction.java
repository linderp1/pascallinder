//Created by MyEclipse Struts
//XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl

package fr.pascallinder.webcave;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import java.sql.*;

/** 
 * MyEclipse Struts
 * Creation date: 08-11-2006
 * 
 * XDoclet definition:
 * @struts.action path="/RegisterAction" name="RegisterForm" input="/jsp/reguster.jsp" scope="request" validate="true"
 * @struts.action-forward name="finished" path="/finished.jsp"
 */
public class RegisterAction extends Action {
	
	// --------------------------------------------------------- Instance Variables
	
	// --------------------------------------------------------- Methods
	
	/** 
	 * Method execute
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return ActionForward
	 */
	public ActionForward execute (
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest req,
			HttpServletResponse res) {
		
//		Casting de EnregistrementForm en tant qu'objet form
		
		RegisterForm RegisterForm = (RegisterForm) form;
		String login= RegisterForm.getLogin();
		String pass = RegisterForm.getPass();
		String passconfirm = RegisterForm.getPassconfirm();
		String email = RegisterForm.getEmail();
		
//		System.out.println(login);
//		System.out.println(pass);
//		System.out.println(passconfirm);
//		System.out.println(email);
		
//		Verify both passwords are identical
//		then insert into DB
		
		if (pass.equals(passconfirm)) {
			javax.sql.DataSource dataSource;
			java.sql.Connection myConnection=null;
			try {
				dataSource = getDataSource(req);
				myConnection = dataSource.getConnection();
				PreparedStatement stmt=myConnection.prepareStatement("insert into user(name, pass, email) values (?,?,?)");
				stmt.setString(1,login);
				stmt.setString(2,pass);
				stmt.setString(3,email);
				stmt.executeUpdate();
				
				stmt.close();
			} catch (SQLException sqle) {
				System.out.println(sqle);
			} finally {
				//enclose this in a finally block to make
				//sure the connection is closed
				try {
					myConnection.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
			return mapping.findForward("finished");
		}
		else {
			return mapping.findForward("echec");
		}
	}
}


