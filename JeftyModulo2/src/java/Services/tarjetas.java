package Services;

import DAO.DAO_TarjetaCredito;
import DAO.DAO_TarjetaPrepago;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.Cliente;
import DAO.DAO_Cliente;

@WebServlet(name = "tarjetas", urlPatterns = {"/tarjetas"})
public class tarjetas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        DAO_TarjetaCredito tcredito = new DAO_TarjetaCredito();
        DAO_TarjetaPrepago tprepago = new DAO_TarjetaPrepago();

        Gson gson = new Gson();

        if (action.equalsIgnoreCase("getSaldoCredito")) {
            String usuario = request.getParameter("id_usuario");
            String tarjeta = request.getParameter("no_tarjeta");
            Cliente cliente = new DAO.DAO_Cliente().getCliente(usuario);

            String tajeta = gson.toJson(tcredito.getTarjeta(tarjeta, String.valueOf(cliente.getId_cliente())));
            out.println(tajeta);
        }

        if (action.equalsIgnoreCase("getSaldoPrepago")) {
            String usuario = request.getParameter("id_usuario");
            String tarjeta = request.getParameter("no_tarjeta");
            Cliente cliente = new DAO.DAO_Cliente().getCliente(usuario);

            String tajeta = gson.toJson(tprepago.getTarjeta(tarjeta, String.valueOf(cliente.getId_cliente())));
            out.println(tajeta);
        }
    }
}