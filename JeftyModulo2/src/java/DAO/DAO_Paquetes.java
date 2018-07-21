/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DB_Manager;
import Model.Paquetes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author juana
 */
public class DAO_Paquetes {
    DB_Manager db_manager;
    Connection connection;

    public DAO_Paquetes() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }
    
    public ArrayList<Paquetes> getPaquetes() {
        ArrayList<Paquetes> paquetes = new ArrayList<>();
        try {
            String SQL = "SELECT * FROM paquetes";
            PreparedStatement id = connection.prepareCall(SQL);
            ResultSet rs = id.executeQuery();
            while (rs.next()) {
                Paquetes paquete = new Paquetes();
                paquete.setId_paquete(rs.getInt(1));
                paquete.setNombre(rs.getString(2));
                paquete.setPlatillo(rs.getString(3));
                paquete.setCantidadPlatillo(rs.getInt(4));
                paquete.setBebida(rs.getString(5));
                paquete.setCantidadBebida(rs.getInt(6));
                paquete.setPostre(rs.getString(7));
                paquete.setCantidadPostre(rs.getInt(8));
                paquete.setCantidadPersonas(rs.getInt(9));
                paquete.setCosto(rs.getFloat(10));
                paquetes.add(paquete);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Mesas > getMesas: " + e);
        }
        return paquetes;
    }
}
