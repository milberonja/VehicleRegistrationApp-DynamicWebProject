package com.nenad.dao;

import java.util.List;

import com.nenad.model.Vozilo;

public interface CRUDVoziloDao {
	
	void snimiVozilo(Vozilo vozilo);

	Vozilo prikaziVozilo(int voziloID);

	List<Vozilo> prikaziSvaVozila();

	boolean obrisiVozilo(int voziloID);

	boolean izmeniVozilo(Vozilo vozilo);
	
	boolean postojiVozilo(String datum, String vreme);
	
	Vozilo pronadjiVoziloPoTermninu(String datum, String vreme);
	
	List<Vozilo> pronadjiVozilaPoMarki(String marka);
	
	List<Vozilo> pronadjiVozilaPoVlasniku(String vlasnik);



}
