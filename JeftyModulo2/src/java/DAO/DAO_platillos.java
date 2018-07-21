package DAO;

import Connection.DB_Manager;
import java.sql.Connection;
import java.util.ArrayList;

import Model.Platillo;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO_platillos {
    DB_Manager db_manager;
    Connection connection;

    public DAO_platillos() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }
    
    public ArrayList<Platillo> getPlatillos() {
        ArrayList<Platillo> platillos = new ArrayList<>();
        String SQL = "select * from platillo;";
        try {
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Platillo platillo = new Platillo();
                platillo.setId_platillo(rs.getInt(1));
                platillo.setNombre(rs.getString(2));
                platillo.setDescripcion(rs.getString(3));
                platillo.setRuta(rs.getString(4));
                platillo.setPrecio(rs.getFloat(5));
                platillo.setCategoria(rs.getString(6));
                platillo.setTipo(rs.getString(7));
                platillos.add(platillo);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_platillos: " + e);
            return null;
        }
        return platillos;
    }
}