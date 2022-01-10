package com.nenad.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.nenad.dao.CRUDVoziloDao;
import com.nenad.dao.CRUDVoziloDaoImplementation;
import com.nenad.model.Vozilo;


public class SnimiVozilo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private CRUDVoziloDao crudVoziloDao;
	Vozilo vozilo;
	
	public void init() {
    	crudVoziloDao = new CRUDVoziloDaoImplementation();
    }       
 
    public SnimiVozilo() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String datum = request.getParameter("datum");
		String vreme = request.getParameter("vreme");
		String marka = request.getParameter("marka");
		String tip = request.getParameter("tip");
		String godiste = request.getParameter("godiste");
		String imeVlasnika = request.getParameter("imeVlasnika");
		String telefon = request.getParameter("telefon");
		String adresa = request.getParameter("adresa");
		
		vozilo = new Vozilo(datum, vreme, marka, tip, godiste, imeVlasnika, telefon, adresa);
		
		boolean voziloPostoji = crudVoziloDao.postojiVozilo(datum, vreme);
		
		if(voziloPostoji) {
			List <Vozilo> svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
			request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
			request.setAttribute("status", "zauzetTermin");
	        RequestDispatcher dispatcher = request.getRequestDispatcher("zakaziRegistraciju.jsp");
	        dispatcher.forward(request, response);
		} else {
			crudVoziloDao.snimiVozilo(vozilo);
			List <Vozilo> svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
			request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
			request.setAttribute("status", "zakazanTermin");
	        RequestDispatcher dispatcher = request.getRequestDispatcher("zakaziRegistraciju.jsp");
	        dispatcher.forward(request, response); 
		}
        
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
