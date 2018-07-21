package DAO;

import Connection.DB_Manager;
import Model.Tarjeta_prepago;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO_TarjetaPrepago {
    
    DB_Manager db_manager;
    Connection connection;
    
    public DAO_TarjetaPrepago() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }
    
    public Tarjeta_prepago getTarjeta(String codigo, String usuario) {
        Tarjeta_prepago tarjeta = new Tarjeta_prepago();
        try {
            String SQL = "select * from tarjetaprepago where id_tarjetaPrepago = '" + codigo + "' and id_cliente = '" + usuario + "';";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tarjeta.setId_tarjetaPrepago(rs.getString(1));
                tarjeta.setVig_dia(rs.getString(2));
                tarjeta.setVige_anio(rs.getString(3));
                tarjeta.setPropietario(rs.getString(4));
                tarjeta.setId_usuario(rs.getInt(5));
                tarjeta.setSaldo(rs.getFloat(6));
                tarjeta.setEstado(rs.getString(7));
            }
        } catch (SQLException e) {
            System.out.println("Error DAO_TarjetaPrepago > getTarjeta : " + e);
        }
        return tarjeta;
    }
    
    public boolean updateSaldo(double saldo, String codigo_tarjeta){
        final String SQL = "UPDATE tarjetaprepago SET saldo = '"+saldo+"' WHERE id_tarjetaPrepago = '"+codigo_tarjeta+"'";
        System.out.println(SQL);
        try {
            CallableStatement cs = connection.prepareCall(SQL);
            cs.execute();
        } catch (Exception e) {
            System.err.print("Error al actualizar a el saldo de la tarjeta de prepago");
            e.printStackTrace();
            return false;
        }
        return true;
    }
}