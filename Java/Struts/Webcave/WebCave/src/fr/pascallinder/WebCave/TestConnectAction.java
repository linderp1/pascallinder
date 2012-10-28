package fr.pascallinder.WebCave;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.dbcp.BasicDataSource;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;


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
				dataSource = getDataSource(request, "local");
				myConnection = dataSource.getConnection();

				PreparedStatement stmt = myConnection.prepareStatement("select name from t_wine where id=1");
				ResultSet rs = stmt.executeQuery();
				rs.next();
				String strWineName=rs.getString(1);
				request.setAttribute ("name", strWineName);
				}
				catch (SQLException sqle) {
				System.out.println(sqle);
			}
		return mapping.findForward("TestConnect");
		
	}

}
