package DAO;

import Connection.DB_Manager;
import java.sql.Connection;
import Model.Cliente;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DAO_Cliente {

    DB_Manager db_manager;
    Connection connection;

    public DAO_Cliente() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }

    public Cliente getCliente(String usuario) {
        Cliente cliente = new Cliente();
        try {
            String SQL = "select * from cliente where id_usuario = " + usuario + "";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                cliente.setId_cliente(rs.getInt(1));
                cliente.setNo_cel(rs.getString(2));
                cliente.setDireccion(rs.getString(3));
                cliente.setNo_targeta(rs.getString(4));
                cliente.setId_usuario(rs.getInt(5));
            }
        } catch (Exception e) {
            System.out.println("Error DAO_cliente : " + e);
        }
        return cliente;
    }

    public int getComprasCliente(int id_usuario) {
        try {
            String SQL = "select count(compra) from clientefrecuente where id_usuario = '" + id_usuario + "'";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Cliente > getComprasCliente : " + e);
            return 0;
        }
    }

    public boolean createClienteFrecuente(int idCliente) {
        try {
            String SQL = "insert into clientefrecuente values ('" + idCliente + "', 1);";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Cliente > createClienteFrecuente: " + e);
            return false;
        }
    }

    public int getPuntosCliente(int id_usuario) {
        try {
            String SQL = "select puntos from puntosCliente where id_usuario = '" + id_usuario + "';";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return 0;
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Cliente > getPuntosCliente : " + e);
            return 0;
        }
    }

    public void ifgetPuntosCliente(int id_usuario) {
        try {
            String SQL = "select * from puntosCliente where id_usuario = '" + id_usuario + "';";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (!rs.next()) {
                String insert = "insert into puntosCliente values('" + id_usuario + "', 0);";
                PreparedStatement psi = connection.prepareCall(insert);
                psi.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Error DAO_Cliente > ifgetPuntosCliente : " + e);
        }
    }

    public boolean sumaPuntosCliente(int id_usuario, int puntos) {
        ifgetPuntosCliente(id_usuario);
        try {
            String SQL = "update puntosCliente set puntos = '" + puntos + "' where id_usuario = '" + id_usuario + "';";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Error DAO_Cliente > sumaPuntosCliente : " + e);
            return false;
        }
    }
}