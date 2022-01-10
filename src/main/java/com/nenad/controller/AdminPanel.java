package com.nenad.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.nenad.dao.CRUDVoziloDao;
import com.nenad.dao.CRUDVoziloDaoImplementation;
import com.nenad.model.Vozilo;


public class AdminPanel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private CRUDVoziloDao crudVoziloDao;

    public void init() {
    	crudVoziloDao = new CRUDVoziloDaoImplementation();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//String action = request.getServletPath();
		List <Vozilo> svaZakazanaVozila;
		RequestDispatcher dispatcher;
		String imeParametra = "";
		String vrednostParametra = "";

		String idBroj;
		
		for(Entry<String, String[]> entry: request.getParameterMap().entrySet()) {
			imeParametra = entry.getKey();
			vrednostParametra = entry.getValue()[0];
		}
		
		switch (imeParametra) {
		case "":
			svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
	        request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
	        dispatcher = request.getRequestDispatcher("adminPanel.jsp");
	        dispatcher.forward(request, response);
			break;
		case "obrisi":
			idBroj = vrednostParametra;
			boolean obrisanoVozilo = crudVoziloDao.obrisiVozilo(Integer.parseInt(idBroj));
			
			if(obrisanoVozilo) {
				request.setAttribute("statusAkcije", "Uspesno");
			} else {
				request.setAttribute("statusAkcije", "NijeUspesno");
			}
			
			svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
	        request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
	        dispatcher = request.getRequestDispatcher("adminPanel.jsp");
	        dispatcher.forward(request, response);
			break;
		case "izmeni":
			idBroj = vrednostParametra;
			Vozilo unesenoVozilo = crudVoziloDao.prikaziVozilo(Integer.parseInt(idBroj));
			String obrnutDatum = unesenoVozilo.getDatum();
			String[] deloviDatuma = obrnutDatum.split("-");
			String ispravanDatum = deloviDatuma[2] + "-" + deloviDatuma[1] + "-" + deloviDatuma[0];
			unesenoVozilo.setDatum(ispravanDatum);
			request.setAttribute("unesenoVozilo", unesenoVozilo);
	        dispatcher = request.getRequestDispatcher("izmenaVozila.jsp");
	        dispatcher.forward(request, response);
			break;
		case "datum":
			String zakazanDatum = vrednostParametra;
			List<Vozilo> vozilaPoDatumu = new ArrayList<Vozilo>();
			String[] vreme = {"09:00", "11:00", "13:00", "15:00", "17:00", "19:00"};
			for(int i=0; i<6; i++) {
				Vozilo vozilo = crudVoziloDao.pronadjiVoziloPoTermninu(zakazanDatum, vreme[i]);
				if(vozilo != null) {
					vozilaPoDatumu.add(vozilo);
				}
			}
			request.setAttribute("pronadjenaVozilaPoTerminu", "pronadjenaVozilaPoTerminu");
			request.setAttribute("vozilaPoDatumu", vozilaPoDatumu);
			svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
	        request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
	        dispatcher = request.getRequestDispatcher("adminPanel.jsp");
	        dispatcher.forward(request, response);
			break;
		case "marka":
			String markaVozila = vrednostParametra;
			List<Vozilo> vozilaPoMarki = crudVoziloDao.pronadjiVozilaPoMarki(markaVozila);

			request.setAttribute("pronadjenaVozilaPoMarki", "pronadjenaVozilaPoMarki");
			request.setAttribute("vozilaPoMarki", vozilaPoMarki);
			svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
	        request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
	        dispatcher = request.getRequestDispatcher("adminPanel.jsp");
	        dispatcher.forward(request, response);
			break;
		case "vlasnik":
			String vlasnikVozila = vrednostParametra;
			List<Vozilo> vozilaPoVlasniku = crudVoziloDao.pronadjiVozilaPoVlasniku(vlasnikVozila);

			request.setAttribute("pronadjenaVozilaPoVlasniku", "pronadjenaVozilaPoVlasniku");
			request.setAttribute("vozilaPoVlasniku", vozilaPoVlasniku);
			svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
	        request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
	        dispatcher = request.getRequestDispatcher("adminPanel.jsp");
	        dispatcher.forward(request, response);
			break;
		default:
			break;
		}
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
