package com.nenad.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.nenad.connection.JDBCConnection;

public class AdminDAOImplementation implements AdminDAO {
	
	private static final String SQLadminPostoji = "SELECT * FROM Admin WHERE AdminIme=? AND Sifra=?;";

	@Override
	public boolean adminPostoji(String adminIme, String sifra) {
		
		boolean postojiAdmin = false;
		
        try (Connection connection = JDBCConnection.getConnection(); 
        		PreparedStatement preparedStatement = connection.prepareStatement(SQLadminPostoji)) {
        	
            preparedStatement.setString(1, adminIme);  
            preparedStatement.setString(2, sifra); 
            
            ResultSet rs = preparedStatement.executeQuery();

            if(rs.next()) {
            	postojiAdmin = true;
            }
        } catch (SQLException exception) {
        	exception.printStackTrace();
        }
        
        return postojiAdmin;
	}

}
