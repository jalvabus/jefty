/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Services;

import DAO.*;
import Model.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author juana
 */
@WebServlet(name = "paquete", urlPatterns = {"/paquete"})
public class paquete extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        Gson gson = new Gson();
        DAO_Paquetes $paquetes = new DAO_Paquetes();

        /**
         * Obtener Cliente
         */
        HttpSession sesion = request.getSession();
        Usuario userSesion = (Usuario) sesion.getAttribute("user");

        DAO_Cliente $cliente = new DAO_Cliente();
        Model.Cliente cliente = $cliente.getCliente(String.valueOf(userSesion.getId_usuario()));

        DAO_Compra $compra = new DAO_Compra();

        if (action.equalsIgnoreCase("grupal")) {
            out.println(gson.toJson($paquetes.getPaquetes()));
        }

        if (action.equalsIgnoreCase("comprarPaquete")) {
            String id_paquete = request.getParameter("id_paquete");
            String costo = request.getParameter("costo");

            String tipoTarjeta = request.getParameter("tipoCompra");
            String noTarjeta = request.getParameter("notarjeta");
            Float nuevoSaldo = Float.parseFloat(request.getParameter("nuevoSaldo"));

            int pago = $compra.insertPago(String.valueOf(costo), tipoTarjeta, noTarjeta);

            $compra.actualizarSaldoTarjeta(noTarjeta, tipoTarjeta, nuevoSaldo);
            $compra.insertPaquete(costo, pago, cliente.getId_cliente(), Integer.parseInt(id_paquete));
        }
    }

}
