package com.nenad.model;

public class Admin {
	
	private int adminID;
	private String adminIme;
	private String sifra;
	
	public Admin() {
	}
	
	public Admin(String adminIme, String sifra) {
		this.adminIme = adminIme;
		this.sifra = sifra;
	}
	
	public Admin(int adminID, String adminIme, String sifra) {
		this.adminIme = adminIme;
		this.sifra = sifra;
		this.adminID = adminID;
	}
	
	public int getAdminID() {
		return adminID;
	}

	public void setAdminID(int adminID) {
		this.adminID = adminID;
	}

	public String getAdminIme() {
		return adminIme;
	}

	public void setAdminIme(String adminIme) {
		this.adminIme = adminIme;
	}

	public String getSifra() {
		return sifra;
	}

	public void setSifra(String sifra) {
		this.sifra = sifra;
	}

	@Override
	public String toString() {
		return "Admin [adminID=" + adminID + ", adminIme=" + adminIme + ", sifra=" + sifra + "]";
	}
	
		
		

}
