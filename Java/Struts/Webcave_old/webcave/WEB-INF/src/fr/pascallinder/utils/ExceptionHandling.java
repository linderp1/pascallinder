package fr.pascallinder.utils;
import java.sql.SQLException;


public class ExceptionHandling {
	SQLException e;
	/*
	public void ExceptionHandling(SQLException ex) {
		this.e = ex;
		//System.out.println("Java exception captured :" + e);
	}*/
	public void PrintException(SQLException ex) {
		this.e = ex;
		System.out.println("Java exception captured : " + e);
	}
	
}
