/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.*;
import Model.*;
import javax.servlet.http.HttpSession;

/**
 *
 * @author juana
 */
@WebServlet(name = "mesas", urlPatterns = {"/mesas"})
public class mesas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        
        Gson gson = new Gson();
        DAO_Mesas $mesas = new DAO_Mesas();
        DAO_Reservacion $reservacion = new DAO_Reservacion();
        
        /**
         * Obtener Cliente
         */
        HttpSession sesion = request.getSession();
        Usuario userSesion = (Usuario) sesion.getAttribute("user");

        DAO_Cliente $cliente = new DAO_Cliente();
        Model.Cliente cliente = $cliente.getCliente(String.valueOf(userSesion.getId_usuario()));

        if (action.equalsIgnoreCase("getMesas")) {
            out.println(gson.toJson($mesas.getMesas()));
        }

        if (action.equalsIgnoreCase("reservarMesa")) {
            int id_mesa = Integer.parseInt(request.getParameter("id_mesa"));
            String fecha = request.getParameter("fecha");
            String hora = request.getParameter("hora");
            String comensales = request.getParameter("comensales");
            
            if($reservacion.getMisReservaciones(cliente.getId_cliente())) {
                out.println("0");
            } else {
                Reservacion reservacion = new Reservacion();
                reservacion.setId_mesa(id_mesa);
                reservacion.setId_cliente(cliente.getId_cliente());
                reservacion.setFecha_llegada(fecha);
                reservacion.setHora_llegada(hora);
                reservacion.setNo_comensales(comensales);
                if ($reservacion.doReservacion(reservacion)) {
                    Mesas mesa = new Mesas();
                    mesa.setId_mesa(id_mesa);
                    mesa.setEstado("Reservada");
                    $mesas.updateStatusMesa(mesa);
                    out.println("1");
                } else {
                    out.println("404");
                }
            }
        }
        
        if (action.equalsIgnoreCase("getReservaciones")) {
            Gson json = new Gson();
            out.println(json.toJson($reservacion.getReservaciones()));
        }
        
        if (action.equalsIgnoreCase("updateReservacion")) {
            String id_reservacion = request.getParameter("id_reservacion");
            String id_mesa =  request.getParameter("id_mesa");
            
            Mesas mesa = new Mesas();
            mesa.setId_mesa(Integer.parseInt(id_mesa));
            mesa.setEstado("Disponible");
            $mesas.updateStatusMesa(mesa);
            $reservacion.deleteReservacion(Integer.parseInt(id_reservacion));
            
            Gson json = new Gson();
            out.println(json.toJson($reservacion.getReservaciones()));
        }
    }

}
