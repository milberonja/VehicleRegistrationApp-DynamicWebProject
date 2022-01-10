package com.nenad.controller;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.nenad.dao.AdminDAO;
import com.nenad.dao.AdminDAOImplementation;
import com.nenad.dao.CRUDVoziloDao;
import com.nenad.dao.CRUDVoziloDaoImplementation;
import com.nenad.model.Vozilo;


public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	private AdminDAO adminDAO;

    public void init() {
    	adminDAO = new AdminDAOImplementation();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		boolean adminPostoji = adminDAO.adminPostoji(request.getParameter("adminIme"), request.getParameter("sifra"));
		
		if(adminPostoji) {
			response.sendRedirect(request.getContextPath() +  "/adminPanel");
		} else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			request.setAttribute("adminStatus", "NePostojiAdmin");
	        dispatcher.forward(request, response);
		}
	}

}
