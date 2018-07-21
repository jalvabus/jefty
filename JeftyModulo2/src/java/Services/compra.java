package Services;

import Model.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.*;
import DAO.*;

@WebServlet(name = "compra", urlPatterns = {"/compra"})
public class compra extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        DAO_Compra $compra = new DAO_Compra();
        DAO_Cliente $cliente = new DAO_Cliente();

        if (action.equalsIgnoreCase("finalizarCompra")) {

            String id_usuario = request.getParameter("id_usuario");
            String tipoTarjeta = request.getParameter("tipoCompra");
            String noTarjeta = request.getParameter("notarjeta");
            Float total = Float.parseFloat(request.getParameter("total"));
            Float nuevoSaldo = Float.parseFloat(request.getParameter("nuevoSaldo"));
            int cantidadPlatillos = Integer.parseInt(request.getParameter("cantidadPlatillos"));
            float restante = Float.parseFloat(request.getParameter("restante"));

            int puntosCliente = $cliente.getPuntosCliente(Integer.parseInt(id_usuario));
            int puntosCompra = (int) (total / 10);
            
            $cliente.sumaPuntosCliente(Integer.parseInt(id_usuario), puntosCompra);

            $compra.actualizarSaldoTarjeta(noTarjeta, tipoTarjeta, nuevoSaldo);
            
            $compra.insertPago(String.valueOf(total), tipoTarjeta, noTarjeta);
            $cliente.createClienteFrecuente(Integer.parseInt(id_usuario));

            int idVenta = $compra.createVenta(id_usuario, cantidadPlatillos, tipoTarjeta, total, restante);
            for (int i = 0; i < cantidadPlatillos; i++) {
                String paramID = "idPlatillo" + String.valueOf(i);
                System.out.println("Id_libroidPlatilo: " + request.getParameter(paramID));
                String paramCant = "cantidad" + String.valueOf(i);
                System.out.println("Cantidad: " + request.getParameter(paramCant));
                $compra.createDetalleVenta(idVenta, Integer.parseInt(request.getParameter(paramID)), Integer.parseInt(request.getParameter(paramCant)));
            }

            out.println("OK");
        }

        if (action.equalsIgnoreCase("encuesta")) {
            String p1 = request.getParameter("p1");
            String p2 = request.getParameter("p2");
            String p3 = request.getParameter("p3");
            String p4 = request.getParameter("p4");
            String p5 = request.getParameter("p5");
            $compra.registrarEncuesta(p1, p2, p3, p4, p5);
        }
    }
}