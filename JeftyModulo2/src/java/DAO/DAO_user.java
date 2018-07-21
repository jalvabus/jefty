package DAO;

import Connection.DB_Manager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.Usuario;
import java.util.ArrayList;

public class DAO_user {

    DB_Manager db_manager;
    Connection connection;

    public DAO_user() {
        db_manager = new DB_Manager();
        connection = db_manager.getConnection();
    }

    public Usuario login(String nombre, String pss) {
        Usuario usuario = new Usuario();
        String SQL = "select * from usuario where nomUsuario = '" + nombre + "' and contrasena = '" + pss + "'";
        //System.out.println(SQL);
        try {
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario.setId_usuario(rs.getInt(1));
                usuario.setNomUsuario(nombre);
                usuario.setPassword(pss);
                usuario.setNombre(rs.getString(4));
                usuario.setApellidopat(rs.getString(5));
                usuario.setAppellidomat(rs.getString(6));
                usuario.setTipo(rs.getString(7));
                usuario.setFoto(rs.getString(8));
                usuario.setStatus(rs.getString(9));
                return usuario;
            } else {
                System.out.println("NO Encontrado");
                return null;
            }
        } catch (Exception e) {
            System.out.println("Error $Usuarios > login : " + e);
            return null;
        }
    }

    public ArrayList<Usuario> getUsuarios() {
        ArrayList<Usuario> user = new ArrayList<Usuario>();
        try {
            String SQL = "Select * from usuario";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId_usuario(rs.getInt(1));
                usuario.setNomUsuario(rs.getString(2));
                usuario.setPassword(rs.getString(3));
                usuario.setNombre(rs.getString(4));
                usuario.setApellidopat(rs.getString(5));
                usuario.setAppellidomat(rs.getString(6));
                usuario.setTipo(rs.getString(7));
                usuario.setFoto(rs.getString(8));
                usuario.setStatus(rs.getString(9));
                user.add(usuario);
            }
        } catch (Exception e) {
            System.out.println("Erro DAO_user getUsuarios: " + e);
        }
        return user;
    }

    /**
     *
     * @param usuario
     * @return
     */
    public boolean createUsuario(Usuario usuario) {
        try {
            String SQL = "insert into usuario values (null, '"
                    + usuario.getNomUsuario() + "', '"
                    + usuario.getPassword() + "', '"
                    + usuario.getNombre() + "', '"
                    + usuario.getApellidopat() + "', '"
                    + usuario.getAppellidomat() + "', '"
                    + usuario.getTipo() + "', '"
                    + usuario.getFoto() + "', '"
                    + usuario.getStatus() + "');";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Erro DAO_user createUsuario: " + e);
            return false;
        }
    }

    public boolean changeStatusUsuario(Usuario usuario) {
        try {
            String SQL = "update usuario set status = '" + usuario.getStatus() + "' where id_usuario = '" + usuario.getId_usuario() + "';";
            PreparedStatement ps = connection.prepareCall(SQL);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println("Erro DAO_user changeStatusUsuario: " + e);
            return false;
        }
    }

    public boolean usuarioRepetido(Usuario usuario) {
        try {
            String SQL = "select * from usuario where nomUsuario = '" + usuario.getNomUsuario() + "';";
            PreparedStatement ps = connection.prepareCall(SQL);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("Error DAO_user usuarioRepetido: " + e);
            return false;
        }
    }
}
