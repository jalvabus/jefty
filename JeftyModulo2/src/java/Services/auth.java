package Services;

import DAO.DAO_user;
import Model.Usuario;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "auth", urlPatterns = {"/auth"})
public class auth extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        if (action.equalsIgnoreCase("login")) {
            DAO_user user = new DAO_user();
            String nombre = request.getParameter("usuario");
            String pass = request.getParameter("password");
            
            Usuario usuario = user.login(nombre, pass);
            System.out.println(usuario.getNombre());
            if (usuario != null) {
                Gson gson = new Gson();
                String us = gson.toJson(usuario);
                HttpSession sesion = request.getSession();
                sesion.setAttribute("user", usuario);
                System.out.println("Logueado");
                out.println(us);
            } else {
                out.println("");
            }
        }

        if (action.equalsIgnoreCase("logout")) {
            HttpSession sesion = request.getSession();
            sesion.removeAttribute("user");
            sesion.invalidate();
            System.out.println("Des-Logueado");
        }

        if (action.equalsIgnoreCase("authlogin")) {
            Gson gson = new Gson();
            HttpSession sesion = request.getSession();
            Usuario userSesion = (Usuario) sesion.getAttribute("user");
            if (userSesion != null) {
                String users = gson.toJson(userSesion);
                out.println(users);
            } else {
                out.println("Nouser");
            }
        }
    }
}