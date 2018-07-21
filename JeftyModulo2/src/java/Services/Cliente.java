package Services;

import DAO.*;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Cliente", urlPatterns = {"/Cliente"})
public class Cliente extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        Gson gson = new Gson();

        if (action.equalsIgnoreCase("individual")) {
            DAO_platillos $platillos = new DAO_platillos();
            String platillos = gson.toJson($platillos.getPlatillos());
            out.println(platillos);
        }

        if (action.equalsIgnoreCase("grupal")) {
            DAO_Paquetes $paquetes = new DAO_Paquetes();
            out.println(gson.toJson($paquetes.getPaquetes()));
        }

        if (action.equalsIgnoreCase("frecuente")) {
            DAO_Cliente $cliente = new DAO_Cliente();
            out.println($cliente.getComprasCliente(Integer.parseInt(request.getParameter("id_usuario"))));
        }
    }
}
