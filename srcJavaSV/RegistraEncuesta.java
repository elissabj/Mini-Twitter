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
@WebServlet(name = "RegistraEncuesta", urlPatterns = {"/RegistraEncuesta"})
public class RegistraEncuesta extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String Titulo = request.getParameter("Titulo");
        String Contenido = request.getParameter("Contenido");
        String idUsuario = request.getParameter("idUsuario");
        String NombreUsr = request.getParameter("NombreUsr");
        
        try (PrintWriter out = response.getWriter()) {
            HttpSession sesion = request.getSession();
            if (sesion == null) {
                response.sendRedirect("Login.jsp");
            }
            String ImprimeHTML = "";            
            BD.cDatos BaseDatos = new BD.cDatos();
            ResultSet rsValida = null;
            
            try {
                BaseDatos.conectar();
                rsValida = BaseDatos.consulta("call sp_AltaEncuesta('"+Titulo+"','"+Contenido+"','"+idUsuario+"','"+NombreUsr+"');");
                
                while (rsValida.next()) {                    
                    if(rsValida.getString("Respuesta").equalsIgnoreCase("Encuesta Existente")){
                        response.sendRedirect("MenuEmpresa.jsp");
                    }else if(rsValida.getString("Respuesta").equalsIgnoreCase("Encuesta Registrada")){
                        request.setAttribute("AltaEncuestas", "1");//Dato que queremos mandar
                        request.getRequestDispatcher("/MenuEmpresa.jsp").forward(request, response);// A donde lo queremos mandar, pues si we no mames xd
                        response.sendRedirect("MenuEmpresa.jsp");
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
            out.println("<title>Servlet RegistraSeguidor</title>");            
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
