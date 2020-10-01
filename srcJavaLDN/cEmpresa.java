package LDN;

import java.sql.Blob;
import java.sql.ResultSet;

/**
 *
 * @author github -> @elissabj -> @elias160299
 */
public class cEmpresa {

    private String _idPersona;
    private String _UsuarioEmpresa;
    private String _ContraEmpresa;
    private String _idTipoPersona;
    private String _NombreEmpresa;
    private String _NumSeguidos;
    private String _NumSeguidores;
    private String _notific;
    private String _imprime;
    private String _errorDx;

    public cEmpresa() {
        this._imprime = "";
        this._notific = "";
    }

    public cEmpresa(String usrEmp, String pswEmp) {
        this._UsuarioEmpresa = usrEmp;
        this._ContraEmpresa = pswEmp;
        this._imprime = "";
        this._notific = "";
    }

    public cEmpresa(String usrEmp, String pswEmp, String Aviso) {
        this._UsuarioEmpresa = usrEmp;
        this._ContraEmpresa = pswEmp;
        this._notific = Aviso;
        this._imprime = "";
    }

    public String VerificaEmpresa() {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsEmpresa = null;
        try {
            BaseDatos.conectar();
            rsEmpresa = BaseDatos.consulta("call sp_ConsultaEmpresa('" + this._UsuarioEmpresa + "','" + this._ContraEmpresa + "');");
            this._imprime = "<form name=\"formulario1\" id=\"formulario1\" method=\"POST\" action=\"MenuAdministrador.jsp\">";
            while (rsEmpresa.next()) {
                this._idPersona = rsEmpresa.getString("idpersona");
                this._NombreEmpresa = rsEmpresa.getString("Nombre");
                this._NumSeguidos = rsEmpresa.getString("NumSeguidos");
                this._NumSeguidores = rsEmpresa.getString("NumSeguidores");
                this._imprime += "<input type=\"hidden\" name=\"Notificac\" id=\"Notificac\" value=\"" + this._notific + "\" required>";
            }
            this._imprime += "</form>";
            BaseDatos.cierraConexion();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public String traeEmpresas(String idPer, String nom) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsEmpresa = null;
        try {
            BaseDatos.conectar();
            rsEmpresa = BaseDatos.consulta("call sp_TraeEmpresas();");
            this._imprime = "<table border=\"13\"><thead><tr><th>Nombre</th><th>Num. Seguidos</th><th>Num. Seguidores</th><th>idPersona</th><th>Seguir</th></tr></thead>";
            while (rsEmpresa.next()) {
                this._NombreEmpresa = rsEmpresa.getString("Nombre");
                this._NumSeguidos = rsEmpresa.getString("NumSeguidos");
                this._NumSeguidores = rsEmpresa.getString("NumSeguidores");
                this._idPersona = rsEmpresa.getString("idPersona");
                this._UsuarioEmpresa = rsEmpresa.getString("USR");
                this._ContraEmpresa = rsEmpresa.getString("PSW");
                this._imprime += "<tbody>";
                this._imprime += "<tr>";
                this._imprime += "<th><strong>" + this._NombreEmpresa + "</strong></th> <th>" + this._NumSeguidos + "</th> <th>" + this._NumSeguidores + "</th> <th>" + this._idPersona + "</th>";
                BD.cDatos Basesita = new BD.cDatos();
                ResultSet rsValida = null;
                this._imprime += "<th>";
                try {
                    Basesita.conectar();
                    rsValida = Basesita.consulta("call sp_ValidaSeguidosEmpresa('" + idPer + "','" + nom + "','" + this._idPersona + "')");
                    while (rsValida.next()) {
                        if (rsValida.getString("Respuesta").equalsIgnoreCase("Seguido Actualmente")) {
                            this._notific = "Dejar de Seguir";
                            this._imprime += "<form method=\"POST\" action=\"EliminaSeguidor\">";
                        } else if (rsValida.getString("Respuesta").equalsIgnoreCase("No Seguido")) {
                            this._notific = "Seguir";
                            this._imprime += "<form method=\"POST\" action=\"RegistraSeguidor\">";
                        }
                    }
                    Basesita.cierraConexion();
                    rsValida.close();
                } catch (Exception xD) {
                    System.out.println(xD.getMessage());
                }
                this._imprime += "<input type=\"hidden\" id=\"BuscaPersonas\" name=\"BuscaPersonas\" value=\"1\" >";
                this._imprime += "<input type=\"hidden\" id=\"_idPersona\" name=\"_idPersona\" value=\"" + this._idPersona + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"_NombreEmpresa\" name=\"_NombreEmpresa\" value=\"" + this._NombreEmpresa + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"IdPersonaMaster\" name=\"IdPersonaMaster\" value=\"" + idPer + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"NombreMaster\" name=\"NombreMaster\" value=\"" + nom + "\" required>";
                this._imprime += "<input type=\"submit\" value=\"" + this._notific + "\">";
                this._imprime += "</form>";
                this._imprime += "</th>";
                this._imprime += "</tr>";
                this._imprime += "</tbody>";
            }
            this._imprime += "</table>";
            BaseDatos.cierraConexion();
            rsEmpresa.close();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public String Publicaciones(String idPer, String Nombre) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsEmpresa = null;
        ResultSet Publicaciones = null;
        try {
            BaseDatos.conectar();
            rsEmpresa = BaseDatos.consulta("call sp_TraeSeguidosEmpresa('" + idPer + "','" + Nombre + "');");
            this._imprime = "<hr width=\"75%\" />";
            while (rsEmpresa.next()) {//Vuelta por cada seguidor
                String idSeguido = rsEmpresa.getString("idUsuario");
                String NombreSeguido = rsEmpresa.getString("NombreUsr");
                try {
                    Publicaciones = BaseDatos.consulta("call sp_PublicacionesSeguidos('" + idSeguido + "','" + NombreSeguido + "');");
                    while (Publicaciones.next()) {//Vuelta por cada publicacion realizada por el seguidor
                        this._imprime += "<div>";
                        this._imprime += "<h2>" + Publicaciones.getString("Titulo") + "</h2>";
                        this._imprime += "<h3>" + Publicaciones.getString("Contenido") + "</h3>";
                        this._imprime += "<h5> Autor: " + NombreSeguido + " </h5>";
                        if (idPer.equals(idSeguido) && Nombre.equals(NombreSeguido)) {
                            this._imprime += "<form method=\"POST\" action=\"EliminarPublicacion\">";
                            this._imprime += "<input type=\"hidden\" id=\"idPublicacion\" name=\"idPublicacion\" value=\"" + Publicaciones.getString("idPublicacion") + "\" required>";
                            this._imprime += "<input type=\"submit\" value=\"Eliminar Publicacion\">";
                            this._imprime += "</form>";
                        }
                        this._imprime += "</div>";
                        this._imprime += "<hr width=\"75%\" />";
                    }
                } catch (Exception xD) {
                    System.out.println(xD.getMessage());
                }
            }
            rsEmpresa.close();
            BaseDatos.cierraConexion();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public String Foros(String idPer, String Nombre) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsEmpresa = null;
        ResultSet Publicaciones = null;
        try {
            BaseDatos.conectar();
            rsEmpresa = BaseDatos.consulta("call sp_TraeSeguidosEmpresa('" + idPer + "','" + Nombre + "');");
            this._imprime = "<hr width=\"75%\" />";
            while (rsEmpresa.next()) {//Vuelta por cada seguidor
                String idSeguido = rsEmpresa.getString("idUsuario");
                String NombreSeguido = rsEmpresa.getString("NombreUsr");
                try {
                    Publicaciones = BaseDatos.consulta("call sp_ForosSeguidos('" + idSeguido + "','" + NombreSeguido + "');");
                    while (Publicaciones.next()) {//Vuelta por cada publicacion realizada por el seguidor
                        this._imprime += "<div>";
                        this._imprime += "<h2>" + Publicaciones.getString("Titulo") + "</h2>";
                        this._imprime += "<h3>" + Publicaciones.getString("Contenido") + "</h3>";
                        this._imprime += "<h5> Autor: " + NombreSeguido + " </h5>";
                        this._imprime += "<form method=\"POST\" action=\"MenuEmpresa.jsp\">";
                        this._imprime += "<input type=\"hidden\" id=\"idForoF\" name=\"idForoF\" value=\"" + Publicaciones.getString("idForo") + "\" required>";
                        this._imprime += "<input type=\"hidden\" id=\"idUsuarioF\" name=\"idUsuarioF\" value=\"" + Publicaciones.getString("idUsuario") + "\" required>";
                        this._imprime += "<input type=\"hidden\" id=\"NombreUsrF\" name=\"NombreUsrF\" value=\"" + Publicaciones.getString("NombreUsr") + "\" required>";
                        this._imprime += "<input type=\"hidden\" id=\"VerForo\" name=\"VerForo\" value=\"1\">";
                        this._imprime += "<input type=\"submit\" value=\"Ver Foro\">";
                        this._imprime += "</form>";
                        this._imprime += "<br>";
                        if (idPer.equals(idSeguido) && Nombre.equals(NombreSeguido)) {
                            this._imprime += "<form method=\"POST\" action=\"EliminarForo\">";
                            this._imprime += "<input type=\"hidden\" id=\"idForo\" name=\"idForo\" value=\"" + Publicaciones.getString("idForo") + "\" required>";
                            this._imprime += "<input type=\"submit\" value=\"Eliminar Foro\">";
                            this._imprime += "</form>";
                        }
                        this._imprime += "</div>";
                        this._imprime += "<hr width=\"75%\" />";
                    }
                } catch (Exception xD) {
                    System.out.println(xD.getMessage());
                }
            }
            rsEmpresa.close();
            BaseDatos.cierraConexion();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public String verForo(String idForo) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsValida = null;

        try {
            BaseDatos.conectar();
            rsValida = BaseDatos.consulta("call sp_VerForo('" + idForo + "');");
            this._imprime = "<br><hr>";
            while (rsValida.next()) {
                this._imprime += "<div style=\"background-color: rgba(190,255,255,0.35);\">";
                this._imprime += "<h1>" + rsValida.getString("Titulo") + "</h1>";
                this._imprime += "<h2>" + rsValida.getString("Contenido") + "</h2>";
                this._imprime += "<h5> Autor: " + rsValida.getString("NombreUsr") + " </h4>";
                this._imprime += "<form method=\"POST\" action=\"MenuEmpresa.jsp\">";
                this._imprime += "<input type=\"hidden\" id=\"idForoF\" name=\"idForoF\" value=\"" + idForo + "\">";
                this._imprime += "<input type=\"hidden\" id=\"idUsuarioF\" name=\"idUsuarioF\" value=\"" + rsValida.getString("idUsuario") + "\">";
                this._imprime += "<input type=\"hidden\" id=\"NombreUsrF\" name=\"NombreUsrF\" value=\"" + rsValida.getString("NombreUsr") + "\">";
                this._imprime += "<input type=\"hidden\" id=\"VerForo\" name=\"VerForo\" value=\"1\">";
                this._imprime += "<input type=\"hidden\" id=\"AltaComentarios\" name=\"AltaComentarios\" value=\"0\" required>";
                this._imprime += "<input type=\"submit\" value=\"Ver Comentarios\">";
                this._imprime += "</form><br>";
                this._imprime += "<form method=\"POST\" action=\"MenuEmpresa.jsp\">";
                this._imprime += "<input type=\"hidden\" id=\"idForoF\" name=\"idForoF\" value=\"" + idForo + "\">";
                this._imprime += "<input type=\"hidden\" id=\"idUsuarioF\" name=\"idUsuarioF\" value=\"" + rsValida.getString("idUsuario") + "\">";
                this._imprime += "<input type=\"hidden\" id=\"NombreUsrF\" name=\"NombreUsrF\" value=\"" + rsValida.getString("NombreUsr") + "\">";
                this._imprime += "<input type=\"hidden\" id=\"VerForo\" name=\"VerForo\" value=\"1\">";
                this._imprime += "<input type=\"hidden\" id=\"AltaComentarios\" name=\"AltaComentarios\" value=\"1\" required>";
                this._imprime += "<input type=\"submit\" value=\"Agregar Comentario\">";
                this._imprime += "</form><br>";
                this._imprime += "</div>";
            }
            this._imprime += "<br><hr><br>";
            BaseDatos.cierraConexion();
            rsValida.close();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public String Comentarios(String idForo, String idPersona, String idUsuarioF, String NombreUsrF) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsEmpresa = null;
        try {
            BaseDatos.conectar();
            rsEmpresa = BaseDatos.consulta("call sp_ConsultaComentario('" + idForo + "');");
            this._imprime = "<div>";
            while (rsEmpresa.next()) {//Vuelta por cada seguidor
                String idPer = rsEmpresa.getString("idpersona");                
                this._imprime += "<h4> Usuario: " + idPer + "</h4>";
                this._imprime += "<h3>" + rsEmpresa.getString("Contenido") + "</h3>";
                this._imprime += "<form method=\"POST\" action=\"EliminarComentario\">";
                this._imprime += "<input type=\"hidden\" id=\"idComentario\" name=\"idComentario\" value=\"" + rsEmpresa.getString("idComentario") + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"idForoF\" name=\"idForoF\" value=\"" + idForo + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"idUsuarioF\" name=\"idUsuarioF\" value=\"" + idUsuarioF + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"NombreUsrF\" name=\"NombreUsrF\" value=\"" + NombreUsrF + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"VerForo\" name=\"VerForo\" value=\"1\">";
                if (idPersona.equals(idPer)) {
                    this._imprime += "<input type=\"submit\" value=\"Eliminar Comentario\">";
                }
                this._imprime += "</form>";
                this._imprime += "<br>";
                this._imprime += "</div>";
                this._imprime += "<hr width=\"75%\" />";
            }
            rsEmpresa.close();
            BaseDatos.cierraConexion();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = "";
        }
        return this._imprime;
    }

    public String Encuestas(String idPer, String Nombre) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsEmpresa = null;
        ResultSet Publicaciones = null;
        try {
            BaseDatos.conectar();
            rsEmpresa = BaseDatos.consulta("call sp_TraeSeguidosEmpresa('" + idPer + "','" + Nombre + "');");
            this._imprime = "<hr width=\"75%\" />";
            while (rsEmpresa.next()) {//Vuelta por cada seguidor
                String idSeguido = rsEmpresa.getString("idUsuario");
                String NombreSeguido = rsEmpresa.getString("NombreUsr");
                try {
                    Publicaciones = BaseDatos.consulta("call sp_EncuestasSeguidos('" + idSeguido + "','" + NombreSeguido + "');");
                    while (Publicaciones.next()) {//Vuelta por cada publicacion realizada por el seguidor
                        this._imprime += "<div>";
                        this._imprime += "<h2>" + Publicaciones.getString("Titulo") + "</h2>";
                        this._imprime += "<a href=\"" + Publicaciones.getString("Hipervinculo") + "\" target=\"_blank\">Contestar Encuesta</a>";
                        //target="_blank" para abrir el hipervinculo en otra pagina
                        this._imprime += "<h5> Autor: " + NombreSeguido + " </h5>";
                        this._imprime += "<br>";
                        if (idPer.equals(idSeguido) && Nombre.equals(NombreSeguido)) {
                            this._imprime += "<form method=\"POST\" action=\"EliminarEncuesta\">";
                            this._imprime += "<input type=\"hidden\" id=\"idEncuesta\" name=\"idEncuesta\" value=\"" + Publicaciones.getString("idEncuesta") + "\" required>";
                            this._imprime += "<input type=\"submit\" value=\"Eliminar Encuesta\">";
                            this._imprime += "</form>";
                        }
                        this._imprime += "</div>";
                        this._imprime += "<hr width=\"75%\" />";
                    }
                } catch (Exception xD) {
                    System.out.println(xD.getMessage());
                }
            }
            rsEmpresa.close();
            BaseDatos.cierraConexion();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public void consultaSeguidosySeguidores(String idPer, String nom) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsEmpresa = null;
        try {
            BaseDatos.conectar();
            rsEmpresa = BaseDatos.consulta("call sp_ConsultaSegySedores('" + idPer + "','" + nom + "');");
            while (rsEmpresa.next()) {
                this._NumSeguidos = rsEmpresa.getString("NumSeguidos");
                this._NumSeguidores = rsEmpresa.getString("NumSeguidores");
            }
            BaseDatos.cierraConexion();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
        }
    }

    public String getIdPersona() {
        return _idPersona;
    }

    public String getUsuarioEmpresa() {
        return _UsuarioEmpresa;
    }

    public String getContraEmpresa() {
        return _ContraEmpresa;
    }

    public String getNombreEmpresa() {
        return _NombreEmpresa;
    }

    public String getNumSeguidos() {
        return _NumSeguidos;
    }

    public String getNumSeguidores() {
        return _NumSeguidores;
    }

    public void setIdPersona(String _idPersona) {
        this._idPersona = _idPersona;
    }

    public void setUsuarioEmpresa(String _UsuarioEmpresa) {
        this._UsuarioEmpresa = _UsuarioEmpresa;
    }

    public void setContraEmpresa(String _ContraEmpresa) {
        this._ContraEmpresa = _ContraEmpresa;
    }

    public void setNombreEmpresa(String _NombreEmpresa) {
        this._NombreEmpresa = _NombreEmpresa;
    }

    public void setNumSeguidos(String _NumSeguidos) {
        this._NumSeguidos = _NumSeguidos;
    }

    public void setNumSeguidores(String _NumSeguidores) {
        this._NumSeguidores = _NumSeguidores;
    }

}
