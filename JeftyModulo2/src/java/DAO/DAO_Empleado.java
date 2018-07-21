/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Connection.DB_Manager;
import java.sql.Connection;
import Model.Empleado;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

/**
 *
 * @author juana
 */
public class DAO_Empleado {

    DB_Manager db_manager;
    Connection connection;

    public DAO_Empleado() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }

    public boolean createEmpleado(Empleado empleado) {
        try {
            String SQL = "insert into empleados values (null, '"
                    + empleado.getNombre() + "', '"
                    + empleado.getPuesto() + "' ,'"
                    + empleado.getSalario() + "' ,'"
                    + empleado.getEstado() + "', '" + empleado.getFoto() + "');";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Epleado > createEmpleado: " + e);
            return false;
        }
    }

    public ArrayList<Empleado> getAll() {
        ArrayList<Empleado> empleados = new ArrayList<>();
        try {
            String SQL = "select * from empleados";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Empleado empleado = new Empleado();
                empleado.setId_empleado(rs.getInt(1));
                empleado.setNombre(rs.getString(2));
                empleado.setPuesto(rs.getString(3));
                empleado.setSalario(rs.getFloat(4));
                empleado.setEstado(rs.getString(5));
                empleado.setFoto(rs.getString(6));
                empleados.add(empleado);
            }
        } catch (Exception e) {
        }
        return empleados;
    }

    public boolean updateEmpleado(Empleado empleado) {
        try {
            String SQL = "update empleados set nombre = '" + empleado.getNombre()
                    + "', puesto = '" + empleado.getPuesto()
                    + "', salario = '" + empleado.getSalario()
                    + "', estado = '" + empleado.getEstado()
                    + "', foto = '" + empleado.getFoto() + "' where Id_Empleado = '" + empleado.getId_empleado() + "';";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Epleado > updateEmpleado: " + e);
            return false;
        }
    }

    public boolean updateStatusEmpleado(Empleado empleado) {
        try {
            String SQL = "update empleados set estado = '" + empleado.getEstado() + "' where Id_Empleado = '" + empleado.getId_empleado() + "';";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Epleado > updateEmpleado: " + e);
            return false;
        }
    }

    public boolean repetido(Empleado empleado) {
        try {
            String SQL = "Select * from empleados where nombre = '" + empleado.getNombre() + "'";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("Error DAO_Epleado > repetido: " + e);
            return false;
        }
    }
}
