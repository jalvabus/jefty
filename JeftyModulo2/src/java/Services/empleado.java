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
import Model.*;
import DAO.*;

/**
 *
 * @author juana
 */
@WebServlet(name = "empleado", urlPatterns = {"/empleado"})
public class empleado extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");

        Gson gson = new Gson();

        if (action.equalsIgnoreCase("getEmpleados")) {
            out.println(gson.toJson(new DAO.DAO_Empleado().getAll()));
        }

        if (action.equalsIgnoreCase("createEmpleado")) {
            Empleado empleado = new Empleado();
            DAO_Empleado $empleado = new DAO_Empleado();
            empleado.setEstado(request.getParameter("status"));
            empleado.setNombre(request.getParameter("nombre"));
            empleado.setPuesto(request.getParameter("puesto"));
            empleado.setSalario(Float.parseFloat(request.getParameter("salario")));
            empleado.setFoto(request.getParameter("foto"));

            if ($empleado.repetido(empleado)) {
                out.println("0");
            } else {
                if ($empleado.createEmpleado(empleado)) {
                    out.println("1");
                } else {
                    out.println("2");
                }
            }
        }

        if (action.equalsIgnoreCase("updateEmpleado")) {
            Empleado empleado = new Empleado();
            DAO_Empleado $empleado = new DAO_Empleado();
            empleado.setId_empleado(Integer.parseInt(request.getParameter("id_empleado")));
            empleado.setEstado(request.getParameter("status"));
            empleado.setNombre(request.getParameter("nombre"));
            empleado.setPuesto(request.getParameter("puesto"));
            empleado.setSalario(Float.parseFloat(request.getParameter("salario")));
            empleado.setFoto(request.getParameter("foto"));

            if ($empleado.updateEmpleado(empleado)) {
                out.println("1");
            } else {
                out.println("2");
            }

        }

        if (action.equalsIgnoreCase("updateStatusEmpleado")) {
            Empleado empleado = new Empleado();
            DAO_Empleado $empleado = new DAO_Empleado();
            empleado.setId_empleado(Integer.parseInt(request.getParameter("id_empleado")));
            empleado.setEstado(request.getParameter("status"));

            if ($empleado.updateStatusEmpleado(empleado)) {
                out.println("1");
            } else {
                out.println("2");
            }

        }
    }
}
