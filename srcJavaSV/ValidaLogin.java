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
@WebServlet(name = "ValidaLogin", urlPatterns = {"/ValidaLogin"})
public class ValidaLogin extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            String usr = request.getParameter("usuario") == null ? "" : request.getParameter("usuario");
            String psw = request.getParameter("contrasenia") == null ? "" : request.getParameter("contrasenia");
            
            HttpSession sesion = request.getSession();
            String ImprimeHTML = "";            
            BD.cDatos BaseDatos = new BD.cDatos();
            ResultSet rsValida = null;
            
            try {
                String AccesoNivel = null;
                
                BaseDatos.conectar();
                rsValida = BaseDatos.consulta("call sp_Login('"+usr+"','"+psw+"');");
                
                while(rsValida.next()){
                    AccesoNivel = rsValida.getString("Respuesta");
                    
                    if(rsValida.getString("Respuesta").equalsIgnoreCase("Persona Inexistente")){
                        response.sendRedirect("Login.jsp");
                    }else if(rsValida.getString("Respuesta").equalsIgnoreCase("Administrador")){
                        LDN.cAdministrador Admon = new LDN.cAdministrador(usr,psw);
                        ImprimeHTML = Admon.VerificaAdmon();
                        if(ImprimeHTML != null){
                            sesion.setAttribute("Acceso", AccesoNivel);
                            sesion.setAttribute("idPersona", Admon.getIdPersona());
                            sesion.setAttribute("usrAdmon", Admon.getUsuarioAdmon());
                            sesion.setAttribute("pswAdmon", Admon.getContraAdmon());
                            sesion.setAttribute("NombreAdmon", Admon.getNombreAdmon());                            
                        }else{
                            sesion.invalidate();
                            response.sendRedirect("Login.jsp");
                        }
                        response.sendRedirect("MenuAdministrador.jsp");
                    }else if(rsValida.getString("Respuesta").equalsIgnoreCase("Empresa")){
                        LDN.cEmpresa Empresa = new LDN.cEmpresa(usr,psw);
                        ImprimeHTML = Empresa.VerificaEmpresa();
                        if(ImprimeHTML != null){
                            sesion.setAttribute("Acceso", AccesoNivel);
                            sesion.setAttribute("idPersona", Empresa.getIdPersona());
                            sesion.setAttribute("usrEmpresa", Empresa.getUsuarioEmpresa());
                            sesion.setAttribute("pswEmpresa", Empresa.getContraEmpresa());
                            sesion.setAttribute("NombreEmpresa", Empresa.getNombreEmpresa());
                            sesion.setAttribute("NumSeguidos", Empresa.getNumSeguidos());
                            sesion.setAttribute("NumSeguidores", Empresa.getNumSeguidores());
                        }else{
                            sesion.invalidate();
                            response.sendRedirect("Login.jsp");
                        }
                        response.sendRedirect("MenuEmpresa.jsp");
                    }else if(rsValida.getString("Respuesta").equalsIgnoreCase("Usuario")){
                        response.sendRedirect("MenuPersona.jsp");
                    }
                }
                
                rsValida.close();
                BaseDatos.cierraConexion();
            } catch (Exception e) {
                System.out.println(e.getMessage());
                out.println(e.getMessage());
            }
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Validando Sesion</title>");            
            out.println("</head>");
            out.println("<body onload=\"document.formulario1.submit();\">");
            out.println(ImprimeHTML);
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
