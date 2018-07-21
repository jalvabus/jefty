package Services;

import Connection.DB_Manager;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.awt.Desktop;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "encuestas", urlPatterns = {"/encuestas"})
public class encuestas extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        generarComprobante();
        out.print("Reportes");
    }

    public void generarComprobante() {
        String ruta = "C:\\reportesEncuesta\\";
        try {
            Document documento = new Document(PageSize.A4.rotate());
            PdfWriter.getInstance(documento, new FileOutputStream(ruta + "reporteEncueta.pdf"));
            documento.open();
            
            //Paragraph p1 = new Paragraph("");
            Paragraph p1 = new Paragraph(new Paragraph("\n \n \nREPORTE DE ENCUESTAS CONTESTADAS POR USUARIOS", FontFactory.getFont("Arial", 16, Font.BOLD, BaseColor.BLACK)));
            Paragraph p3 = new Paragraph("*********************************************************************");
            Paragraph p6 = new Paragraph("\n \n \n");
            Paragraph p7 = new Paragraph("");
            Paragraph p8 = new Paragraph("");
            
            p1.setAlignment(Element.ALIGN_CENTER);
            p3.setAlignment(Element.ALIGN_CENTER);
            p6.setAlignment(Element.ALIGN_RIGHT);
            
            documento.add(p1);
            documento.add(p3);
            documento.add(p6);
            documento.add(p7);
            documento.add(p8);

            PdfPTable tabla = new PdfPTable(5);
            tabla.setWidthPercentage(100);

            PdfPCell celda1 = new PdfPCell(new Paragraph("¿Encontro lo que buscaba?", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLUE)));
            PdfPCell celda2 = new PdfPCell(new Paragraph("¿Alguna sugerencia de platillos?", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLUE)));
            PdfPCell celda3 = new PdfPCell(new Paragraph("¿Recomendaria el sitio web?", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLUE)));
            PdfPCell celda4 = new PdfPCell(new Paragraph("¿Como le parecio el servicio?", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLUE)));
            PdfPCell celda5 = new PdfPCell(new Paragraph("¿Que opina del lugar?", FontFactory.getFont("Arial", 12, Font.BOLD, BaseColor.BLUE)));

            celda1.setBorder(0);
            celda2.setBorder(0);
            celda3.setBorder(0);
            celda4.setBorder(0);
            celda5.setBorder(0);

            tabla.addCell(celda1);
            tabla.addCell(celda2);
            tabla.addCell(celda3);
            tabla.addCell(celda4);
            tabla.addCell(celda5);

            try {
                String SQL = "select * from encuesta;";

                DB_Manager db_manager;
                Connection connection;
                db_manager = new DB_Manager();
                connection = db_manager.getConnection();

                System.out.println(SQL);
                PreparedStatement ps = connection.prepareCall(SQL);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    PdfPCell c1 = new PdfPCell(new Paragraph(rs.getString(4)));
                    PdfPCell c2 = new PdfPCell(new Paragraph(rs.getString(6)));
                    PdfPCell c3 = new PdfPCell(new Paragraph(rs.getString(8)));
                    PdfPCell c4 = new PdfPCell(new Paragraph(rs.getString(10)));
                    PdfPCell c5 = new PdfPCell(new Paragraph(rs.getString(12)));

                    c1.setBorder(0);
                    c2.setBorder(0);
                    c3.setBorder(0);
                    c4.setBorder(0);
                    c5.setBorder(0);

                    tabla.addCell(c1);
                    tabla.addCell(c2);
                    tabla.addCell(c3);
                    tabla.addCell(c4);
                    tabla.addCell(c5);
                }

            } catch (Exception e) {
                System.out.println("Error > encuesta : " + e);
            }

            PdfPCell total = new PdfPCell(new Paragraph("Puntos Restantes:  "));
            total.setColspan(4);
            total.setBorderWidthBottom(0);
            total.setBorderWidthLeft(0);
            total.setBorderWidthRight(0);
            tabla.addCell(total);

            documento.add(tabla);
            documento.setPageSize(PageSize.A4);
            documento.close();

            mostrarComprobante(ruta);
        } catch (DocumentException ex) {
            System.out.println("Excepcion SQL: " + ex.getMessage());
        } catch (FileNotFoundException ex) {
            System.out.println("Excepcion SQL: " + ex.getMessage());
        } catch (IOException ex) {
            System.out.println("Excepcion SQL: " + ex.getMessage());
        }
    }

    public void mostrarComprobante(String ruta) {
        try {
            File abrir = new File(ruta + "reporteEncueta.pdf");
            Desktop.getDesktop().open(abrir);
        } catch (Exception e) {
        }
    }
}