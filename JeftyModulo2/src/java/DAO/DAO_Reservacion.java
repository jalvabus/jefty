/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DB_Manager;
import Model.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author juana
 */
public class DAO_Reservacion {

    DB_Manager db_manager;
    Connection connection;

    public DAO_Reservacion() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }

    public ArrayList<Reservacion> getReservaciones() {
        ArrayList<Reservacion> reservaciones = new ArrayList<>();
        try {
            String SQL = "select r.id_reservacion, r.fecha_reservacion, r.hora_reservacion, r.fecha_llegada, r.hora_llegada, "
                    + "r.no_comensales, r.id_mesa, r.id_cliente, m.area, concat(u.nombre, ' ', u.apellidopat) as nombre "
                    + "from reservacion r "
                    + "inner join mesas m "
                    + "on m.id_mesa = r.id_mesa "
                    + "inner join cliente c "
                    + "on c.id_cliente = r.id_cliente "
                    + "inner join usuario u "
                    + "on c.id_usuario = u.id_usuario;";
            PreparedStatement id = connection.prepareCall(SQL);
            ResultSet rs = id.executeQuery();
            while (rs.next()) {
                Reservacion reservacion = new Reservacion();
                reservacion.setId_resevacion(rs.getInt(1));
                reservacion.setFecha_reservacion(rs.getString(2));
                reservacion.setHora_reservacion(rs.getString(3));
                reservacion.setFecha_llegada(rs.getString(4));
                reservacion.setHora_llegada(rs.getString(5));
                reservacion.setNo_comensales(rs.getString(6));
                reservacion.setId_mesa(rs.getInt(7));
                reservacion.setId_cliente(rs.getInt(8));
                reservacion.setMesaArea(rs.getString(9));
                reservacion.setNombreCliente(rs.getString(10));
                reservaciones.add(reservacion);
            }
        } catch (Exception e) {
            System.out.println("Erro DAO_Reservacion > getReservaciones");
        }
        return reservaciones;
    }

    public boolean doReservacion(Reservacion reservacion) {
        try {
            String SQL = "insert into reservacion values (null, now(), now(),'"
                    + reservacion.getFecha_llegada() + "', '"
                    + reservacion.getHora_llegada() + "', '"
                    + reservacion.getNo_comensales() + "','"
                    + reservacion.getId_mesa() + "', '"
                    + reservacion.getId_cliente() + "');";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Reservacion > doReservacion: " + e);
            return false;
        }
    }

    public boolean getMisReservaciones(int id_cliente) {
        try {
            String SQL = "SELECT * FROM reservacion where id_cliente = '" + id_cliente + "'";
            System.out.println(SQL);
            PreparedStatement id = connection.prepareCall(SQL);
            ResultSet rs = id.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("Errir DAO_Reservacion > getMisReservaciones: " + e);
            return false;
        }
    }

    public boolean deleteReservacion(int id_reservacion) {
        try {
            String SQL = "delete from reservacion where id_reservacion = '" + id_reservacion + "';";
            PreparedStatement id = connection.prepareCall(SQL);
            id.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Errir DAO_Reservacion > deleteReservacion: " + e);
            return false;
        }
    }
}
