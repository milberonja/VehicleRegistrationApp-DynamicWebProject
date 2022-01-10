package com.nenad.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.nenad.dao.CRUDVoziloDao;
import com.nenad.dao.CRUDVoziloDaoImplementation;
import com.nenad.model.Vozilo;


public class PrikaziRezervacije extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CRUDVoziloDao crudVoziloDao;

    public void init() {
    	crudVoziloDao = new CRUDVoziloDaoImplementation();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <Vozilo> svaZakazanaVozila = crudVoziloDao.prikaziSvaVozila();
        request.setAttribute("svaZakazanaVozila", svaZakazanaVozila);
        RequestDispatcher dispatcher = request.getRequestDispatcher("zakaziRegistraciju.jsp");
        dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
