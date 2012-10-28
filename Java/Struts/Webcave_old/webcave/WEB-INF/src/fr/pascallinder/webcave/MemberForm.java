//Created by MyEclipse Struts
// XSL source (default): platform:/plugin/com.genuitec.eclipse.cross.easystruts.eclipse_4.1.1/xslt/JavaClass.xsl

package fr.pascallinder.webcave;

import org.apache.struts.validator.ValidatorForm;

/** 
 * MyEclipse Struts
 * Creation date: 08-11-2006
 * 
 * XDoclet definition:
 * @struts.form name="MemberForm"
 */
public class MemberForm extends ValidatorForm {

	// --------------------------------------------------------- Instance Variables

	/** login property */
	private String login;

	/** pass property */
	private String pass;

	/** email property */
//	private String email;

	// --------------------------------------------------------- Methods

	public String getLogin() {
		return login;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public String getPass() {
		return pass;
	}
	
	public void setPass(String pass) {
		this.pass = pass;
	}

//	public String getEmail() {
//		return email;
//	}
	
//	public void setEmail(String email) {
//		this.email = email;
//	}

}
