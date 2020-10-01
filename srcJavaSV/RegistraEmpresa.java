package SV;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author github -> @elissabj -> @elias160299
 */
@WebServlet(name = "RegistraEmpresa", urlPatterns = {"/RegistraEmpresa"})
public class RegistraEmpresa extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String idAdmon = request.getParameter("idAdmon");
        String nomAdmon = request.getParameter("nomAdmon");
        String idPersona = request.getParameter("idPersona");
        String usr = request.getParameter("usr");
        String psw = request.getParameter("psw");
        String Nombre = request.getParameter("Nombre");
        String ApePa = request.getParameter("ApePa");
        String ApeMa = request.getParameter("ApeMa");
        
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            if (sesion == null) {
                response.sendRedirect("Login.jsp");
            }
            BD.cDatos BaseDatos = new BD.cDatos();
            ResultSet rsValida = null;

            try {
                BaseDatos.conectar();
                rsValida = BaseDatos.consulta("call sp_AltaEmpresa('"+idAdmon+"','"+nomAdmon+"','"+idPersona+"','"+usr+"','"+psw+"','"+Nombre+" "+ApePa+" "+ApeMa+"','','')");
                
                while (rsValida.next()) {
                    if (rsValida.getString("Respuesta").equalsIgnoreCase("Empresa Registrada")) {
                        request.setAttribute("AltaEmpresas", "1");//Dato que queremos mandar
                        request.getRequestDispatcher("/MenuAdministrador.jsp").forward(request, response);// A donde lo queremos mandar, pues si we no mames xd
                        response.sendRedirect("MenuAdministrador.jsp");
                    }else{
                        request.setAttribute("Mensaje", rsValida.getString("Respuesta"));//Dato que queremos mandar
                        request.getRequestDispatcher("/MenuAdministrador.jsp").forward(request, response);// A donde lo queremos mandar, pues si we no mames xd
                        response.sendRedirect("MenuAdministrador.jsp");                        
                    }
                }

                BaseDatos.cierraConexion();
                rsValida.close();
            } catch (Exception e) {
                System.out.println(e.getMessage());
                out.println(e.getMessage());
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegistraEmpresa</title>");            
            out.println("</head>");
            out.println("<body>");           
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
