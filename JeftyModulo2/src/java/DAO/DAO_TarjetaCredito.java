package DAO;

import Connection.DB_Manager;
import Model.Tarjeta_credito;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO_TarjetaCredito {

    DB_Manager db_manager;
    Connection connection;

    public DAO_TarjetaCredito() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }

    public Tarjeta_credito getTarjeta(String codigo, String usuario) {
        Tarjeta_credito tarjeta = new Tarjeta_credito();
        try {
            String SQL = "select * from tarjetacredito where id_tarjetacredito = '" + codigo + "' and id_cliente = '" + usuario + "';";
            System.out.println(SQL);
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tarjeta.setId_tarjetaCredito(rs.getString(1));
                tarjeta.setVenci_dia(rs.getString(2));
                tarjeta.setVenci_anio(rs.getString(3));
                tarjeta.setTipo(rs.getString(4));
                tarjeta.setPropietario(rs.getString(5));
                tarjeta.setId_cliente(rs.getInt(6));
                tarjeta.setSaldo(rs.getFloat(7));
            }
        } catch (SQLException e) {
            System.out.println("Error DAO_TarjetaCredito > getTarjeta : " + e);
        }
        return tarjeta;
    }
    
    public boolean updateSaldo(double saldo, String codigo_tarjeta){
        final String SQL = "UPDATE tarjetacredito SET saldo = '"+saldo+"' WHERE id_tarjetacredito = '"+codigo_tarjeta+"'";
        System.out.println(SQL);
        try {
            CallableStatement cs = connection.prepareCall(SQL);
            cs.execute();
        } catch (Exception e) {
            System.err.print("Error al actualizar a el saldo de la tarjeta de credito");
            e.printStackTrace();
            return false;
        }
        return true;
    }
}