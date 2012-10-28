//Created by MyEclipse Struts
//XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl

package fr.pascallinder.webcave;

import java.sql.PreparedStatement;
import java.sql.SQLException;
//import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import fr.pascallinder.utils.ExceptionHandling;;


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
				ExceptionHandling eh = new ExceptionHandling();
				eh.PrintException(sqle);
				//System.out.println("EXCEPTION:" + sqle);
				return mapping.findForward("finishedFail");
			} finally {
				
				//enclose this in a finally block to make
				//sure the connection is closed
				try {
					myConnection.close();
				} catch (SQLException e) {
					System.out.println(e);
				}
			}
			// SQl insert was successfull
			// send confirmation email to newly registered user before performing forward action
			// TODO: Add check of e-mail address validity !!
			
			String host = "smtp.neuf.fr";
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			Session sessionMail = Session.getDefaultInstance(props);
			String from = "Webcave <pascal.linder@neuf.fr>";
			try  {
//				HttpSession session = req.getSession(true);
//				form = (RegisterForm)session.getAttribute("RegisterForm");
				//String destination = RegisterForm.getEmail();
				//String login = RegisterForm.getLogin();
				//String pass = RegisterForm.getPass();
				String msgText = "Welcome " + login + "<br><br>Your Login is " + login + "<br>Your password is " + pass;
//				create the message
				Message msg = new MimeMessage(sessionMail);
				msg.setFrom(new InternetAddress(from));
				InternetAddress[] address = {new
					InternetAddress(email)
				};
				msg.setRecipients(Message.RecipientType.TO, address);
				msg.setSubject("User creation confirmation");
				msg.setSentDate(new java.util.Date());
				msg.setText(msgText);
				msg.setContent(msgText, "text/html");
				Transport.send(msg);
				return mapping.findForward("finishedSuccess");
				
			} catch (MessagingException mex) {
				System.out.println(mex);
			}
			return mapping.findForward("finishedSuccess");
		}
		else {
			return mapping.findForward("finishedFail");
		}
	}
}


