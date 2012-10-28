package fr.pascallinder.webcave;

import org.apache.struts.validator.ValidatorForm;
public class RegisterForm extends ValidatorForm {
	private String login;
	private String pass;
	private String passconfirm;
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
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
	public String getPassconfirm() {
		return passconfirm;
	}
	public void setPassconfirm(String passconfirm) {
		this.passconfirm = passconfirm;
	}
	
}

