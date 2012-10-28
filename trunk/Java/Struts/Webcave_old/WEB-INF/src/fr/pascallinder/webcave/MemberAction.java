//Created by MyEclipse Struts
//XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl

package fr.pascallinder.webcave;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.mysql.jdbc.ResultSet;

/** 
 * MyEclipse Struts
 * Creation date: 08-11-2006
 * 
 * XDoclet definition:
 * @struts.action path="/MemberAction" name="MemberForm" input="/jsp/member.jsp" scope="request" validate="true"
 * @struts.action-forward name="finished" path="/finished.jsp"
 */
public class MemberAction extends Action {
	
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
	public ActionForward execute(
			ActionMapping mapping,
			ActionForm form,
			HttpServletRequest request,
			HttpServletResponse response) {
		MemberForm MemberForm = (MemberForm) form;
		// TODO Auto-generated method stub
		//return null;
		String login = MemberForm.getLogin();
		String pass = MemberForm.getPass();
		System.out.println("User " + login + " entered credentials");
		
		//ResultSet rs = null;
		String fetchedPassword = "test";
		javax.sql.DataSource dataSource;
		java.sql.Connection myConnection=null;
		try {
			dataSource = getDataSource(request);
			myConnection = dataSource.getConnection();
			PreparedStatement stmt=myConnection.prepareStatement("select pass from user where name = ?");
			stmt.setString(1,login);	
			//ResultSet rs=stmt.executeQuery();
			stmt.close();
			//fetchedPassword = rs.getString("pass");
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
		
		
		if (login.equals("linderp1")) {
			System.out.println(login);
			System.out.println("success login as user "+login+" with password = "+ fetchedPassword);
			return mapping.findForward("FW_SuccessLogin");			
		}
		else {
			System.out.println(login);
			System.out.println("failed login");
			return mapping.findForward("FW_FailedLogin");
		}
	}
}

