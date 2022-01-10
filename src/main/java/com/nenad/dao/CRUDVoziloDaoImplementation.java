package com.nenad.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.nenad.connection.JDBCConnection;
import com.nenad.model.Vozilo;

public class CRUDVoziloDaoImplementation implements CRUDVoziloDao {
	
	private static final String SQLsnimiVozilo = "INSERT INTO Vozilo" +
	        "  (Vreme, Marka, Tip, Godiste, ImeVlasnika, Telefon, Adresa) VALUES " + " (?, ?, ?, ?, ?, ?, ?);";

	private static final String SQLprikaziVozilo = "SELECT * FROM Vozilo WHERE VoziloID=?;";

	private static final String SQLprikaziSvaVozila = "SELECT * FROM Vozilo ORDER BY Vreme;";
	
	private static final String SQLobrisiVozilo = "DELETE FROM Vozilo WHERE VoziloID=?;";
	
	private static final String SQLizmeniVozilo = "UPDATE Vozilo SET Vreme = ?, Marka = ?, Tip = ?, Godiste = ?, ImeVlasnika = ?, Telefon = ?, Adresa = ? WHERE VoziloID = ?;";

	private static final String SQLpostojiVozilo = "SELECT * FROM Vozilo WHERE Vreme=?;";
	
	private static final String SQLpronadjiVozilaPoMarki = "SELECT * FROM Vozilo WHERE Marka=?;";
	
	private static final String SQLpronadjiVozilaPoVlasniku = "SELECT * FROM Vozilo WHERE ImeVlasnika=?;";

	
	
	@Override
	public void snimiVozilo(Vozilo vozilo) {
    
        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLsnimiVozilo)) {
            
            preparedStatement.setString(1, vozilo.getDatum() + " " + vozilo.getVreme());
            preparedStatement.setString(2, vozilo.getMarka());
            preparedStatement.setString(3, vozilo.getTip());
            preparedStatement.setString(4, vozilo.getGodiste());
            preparedStatement.setString(5, vozilo.getImeVlasnika());
            preparedStatement.setString(6, vozilo.getTelefon());
            preparedStatement.setString(7, vozilo.getAdresa());
   
            preparedStatement.executeUpdate();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

	}

	@Override
	public Vozilo prikaziVozilo(int voziloID) {
		Vozilo vozilo = null;
		SimpleDateFormat sdfDatum = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdfVreme = new SimpleDateFormat("HH:mm");
	
        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLprikaziVozilo)) {
        	
            preparedStatement.setInt(1, voziloID);   

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("voziloID");
                String datum = sdfDatum.format(rs.getTimestamp("Vreme"));
                String vreme = sdfVreme.format(rs.getTimestamp("Vreme"));
                String marka = rs.getString("Marka");
                String tip = rs.getString("Tip");
                String godiste = rs.getString("Godiste");
                String imeVlasnika = rs.getString("imeVlasnika");
                String telefon = rs.getString("Telefon");
                String adresa = rs.getString("Adresa");
                
                vozilo = new Vozilo(id, datum, vreme, marka, tip, godiste, imeVlasnika, telefon, adresa);
            }
        } catch (SQLException exception) {
        	exception.printStackTrace();;
        }
        return vozilo;
	}
	
	@Override
	public List<Vozilo> prikaziSvaVozila() {
		
        List <Vozilo> vozila = new ArrayList<Vozilo>();
        SimpleDateFormat sdfDatum = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdfVreme = new SimpleDateFormat("HH:mm");

        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLprikaziSvaVozila)) {
            
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	int id = rs.getInt("voziloID");
            	String datum = sdfDatum.format(rs.getTimestamp("Vreme"));
                String vreme = sdfVreme.format(rs.getTimestamp("Vreme"));
                String marka = rs.getString("Marka");
                String tip = rs.getString("Tip");
                String godiste = rs.getString("Godiste");
                String imeVlasnika = rs.getString("imeVlasnika");
                String telefon = rs.getString("Telefon");
                String adresa = rs.getString("Adresa");
                
                vozila.add(new Vozilo(id, datum, vreme, marka, tip, godiste, imeVlasnika, telefon, adresa));
            }
        } catch (SQLException exception) {
        	exception.printStackTrace();
        }
        return vozila;
	}

	@Override
	public boolean obrisiVozilo(int voziloID) {
		boolean voziloObrisano = false;
		
        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLobrisiVozilo)) {
        	
        	preparedStatement.setInt(1, voziloID);
        	
        	if(preparedStatement.executeUpdate() > 0) {
        		voziloObrisano = true;
        	}
        	
        } catch (SQLException exception) {
        	exception.printStackTrace();
        }
        return voziloObrisano;
	}

	@Override
	public boolean izmeniVozilo(Vozilo vozilo) {
		
		boolean voziloIzmenjeno = false;
        
		try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLizmeniVozilo)) {
        	
			preparedStatement.setString(1, vozilo.getDatum() + " " + vozilo.getVreme());
            preparedStatement.setString(2, vozilo.getMarka());
            preparedStatement.setString(3, vozilo.getTip());
            preparedStatement.setString(4, vozilo.getGodiste());
            preparedStatement.setString(5, vozilo.getImeVlasnika());
            preparedStatement.setString(6, vozilo.getTelefon());
            preparedStatement.setString(7, vozilo.getAdresa());
            preparedStatement.setInt(8, vozilo.getVoziloID());
            
            if(preparedStatement.executeUpdate() > 0) {
            	voziloIzmenjeno = true;
            	
        	} 
        } catch (SQLException exception) {
        	exception.printStackTrace();
        }
		
        return voziloIzmenjeno;
	}
	
	@Override
	public boolean postojiVozilo(String datum, String vreme){
	
		boolean postojiVozilo = false;
		
        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLpostojiVozilo)) {
        	
            preparedStatement.setString(1, datum + " " + vreme);  
            
            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next()) {
            	postojiVozilo = true;
            }
        } catch (SQLException exception) {
        	exception.printStackTrace();
        }
        
        return postojiVozilo;
	}
	
	@Override
	public Vozilo pronadjiVoziloPoTermninu(String datum, String vreme) {
		
		Vozilo vozilo = null;
		SimpleDateFormat sdfDatum = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdfVreme = new SimpleDateFormat("HH:mm");
	
        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLpostojiVozilo)) {
        	
            preparedStatement.setString(1, datum + " " + vreme);   

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("voziloID");
                String dat = sdfDatum.format(rs.getTimestamp("Vreme"));
                String vre = sdfVreme.format(rs.getTimestamp("Vreme"));
                String marka = rs.getString("Marka");
                String tip = rs.getString("Tip");
                String godiste = rs.getString("Godiste");
                String imeVlasnika = rs.getString("imeVlasnika");
                String telefon = rs.getString("Telefon");
                String adresa = rs.getString("Adresa");
                
                vozilo = new Vozilo(id, dat, vre, marka, tip, godiste, imeVlasnika, telefon, adresa);
            }
        } catch (SQLException exception) {
        	exception.printStackTrace();;
        }
        return vozilo;
	}
	
	@Override
	public List<Vozilo> pronadjiVozilaPoMarki(String markaVozila) {
		
        List <Vozilo> vozila = new ArrayList<Vozilo>();
        SimpleDateFormat sdfDatum = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdfVreme = new SimpleDateFormat("HH:mm");

        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLpronadjiVozilaPoMarki)) {
            
        	preparedStatement.setString(1, markaVozila); 
        	ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	int id = rs.getInt("voziloID");
            	String datum = sdfDatum.format(rs.getTimestamp("Vreme"));
                String vreme = sdfVreme.format(rs.getTimestamp("Vreme"));
                String marka = rs.getString("Marka");
                String tip = rs.getString("Tip");
                String godiste = rs.getString("Godiste");
                String imeVlasnika = rs.getString("imeVlasnika");
                String telefon = rs.getString("Telefon");
                String adresa = rs.getString("Adresa");
                
                vozila.add(new Vozilo(id, datum, vreme, marka, tip, godiste, imeVlasnika, telefon, adresa));
            }
        } catch (SQLException exception) {
        	exception.printStackTrace();
        }
        return vozila;
	}
	
	@Override
	public List<Vozilo> pronadjiVozilaPoVlasniku(String vlasnik) {
		
        List <Vozilo> vozila = new ArrayList<Vozilo>();
        SimpleDateFormat sdfDatum = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdfVreme = new SimpleDateFormat("HH:mm");

        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLpronadjiVozilaPoVlasniku)) {
            
        	preparedStatement.setString(1, vlasnik); 
        	ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
            	int id = rs.getInt("voziloID");
            	String datum = sdfDatum.format(rs.getTimestamp("Vreme"));
                String vreme = sdfVreme.format(rs.getTimestamp("Vreme"));
                String marka = rs.getString("Marka");
                String tip = rs.getString("Tip");
                String godiste = rs.getString("Godiste");
                String imeVlasnika = rs.getString("imeVlasnika");
                String telefon = rs.getString("Telefon");
                String adresa = rs.getString("Adresa");
                
                vozila.add(new Vozilo(id, datum, vreme, marka, tip, godiste, imeVlasnika, telefon, adresa));
            }
        } catch (SQLException exception) {
        	exception.printStackTrace();
        }
        return vozila;
	}


	
}
