package fr.pascallinder.webcave;

import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class WineListForm extends ActionForm {
	private Collection wines;
	
	public Collection getWines() {
		return wines;
	}
	
	public void setWines() {
		this.wines = wines;
	}
	
	public void reset(ActionMapping arg0, HttpServletRequest arg1) {
		wines = new ArrayList();
	}

}
