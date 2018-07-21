/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DB_Manager;
import java.sql.Connection;
import Model.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author juana
 */
public class DAO_Mesas {

    DB_Manager db_manager;
    Connection connection;

    public DAO_Mesas() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }

    public ArrayList<Mesas> getMesas() {
        ArrayList<Mesas> mesas = new ArrayList<>();
        try {
            String SQL = "SELECT * FROM mesas";
            PreparedStatement id = connection.prepareCall(SQL);
            ResultSet rs = id.executeQuery();
            while (rs.next()) {
                Mesas mesa = new Mesas();
                mesa.setId_mesa(rs.getInt(1));
                mesa.setArea(rs.getString(2));
                mesa.setEstado(rs.getString(3));
                mesas.add(mesa);
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Mesas > getMesas: " + e);
        }
        return mesas;
    }

    public boolean updateStatusMesa(Mesas mesa) {
        try {
            String SQL = "update mesas set estado = '" + mesa.getEstado() + "' where id_mesa = '" + mesa.getId_mesa() + "';";
            System.out.println(SQL);
            PreparedStatement id = connection.prepareCall(SQL);
            id.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Errir DAO_Mesas > updateStatusMesa: " + e);
            return false;
        }
    }

}
