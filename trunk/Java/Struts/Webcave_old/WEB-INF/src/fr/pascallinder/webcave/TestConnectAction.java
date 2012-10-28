//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl

package fr.pascallinder.webcave;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

/** 
 * MyEclipse Struts
 * Creation date: 08-10-2006
 * 
 * XDoclet definition:
 * @struts.action validate="true"
 */
public class TestConnectAction extends Action {

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
		HttpServletResponse response) 
		throws Exception {
			javax.sql.DataSource dataSource;
			java.sql.Connection myConnection=null;
			try {
				dataSource = getDataSource(request);
				myConnection = dataSource.getConnection();

				PreparedStatement stmt = myConnection.prepareStatement("select name from wine where id='1'");
				ResultSet rs = stmt.executeQuery();
				rs.next();
				String nom=rs.getString(1);
				request.setAttribute ("name", nom);
				}
				catch (SQLException sqle) {
				System.out.println(sqle);
			}
		return mapping.findForward("ok");
		
	}

}

