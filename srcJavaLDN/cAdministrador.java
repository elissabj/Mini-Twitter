package LDN;

import java.sql.ResultSet;

/**
 *
 * @author github -> @elissabj -> @elias160299
 */
public class cAdministrador {

    private String _idPersona;
    private String _UsuarioAdmon;
    private String _ContraAdmon;
    private String _NombreAdmon;
    private String _notific;
    private String _imprime;
    private String _errorDx;

    public cAdministrador() {
        this._imprime = "";
        this._notific = "";
    }

    public cAdministrador(String usrAdmon, String pswAdmon) {
        this._UsuarioAdmon = usrAdmon;
        this._ContraAdmon = pswAdmon;
        this._imprime = "";
        this._notific = "";
    }

    public cAdministrador(String usrAdmon, String pswAdmon, String Aviso) {
        this._UsuarioAdmon = usrAdmon;
        this._ContraAdmon = pswAdmon;
        this._notific = Aviso;
        this._imprime = "";
    }

    public String VerificaAdmon() {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsAdmon = null;
        try {
            BaseDatos.conectar();
            rsAdmon = BaseDatos.consulta("call sp_ConsultaAdministrador('" + this._UsuarioAdmon + "','" + this._ContraAdmon + "');");
            this._imprime = "<form name=\"formulario1\" id=\"formulario1\" method=\"POST\" action=\"MenuAdministrador.jsp\">";
            while (rsAdmon.next()) {
                this._idPersona = rsAdmon.getString("idpersona");
                this._NombreAdmon = rsAdmon.getString("Nombre");
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

    public String traeEmpresas(String idAdmon, String nomAdmon) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsAdmon = null;
        try {
            BaseDatos.conectar();
            rsAdmon = BaseDatos.consulta("call sp_TraeEmpresas();");
            this._imprime = "<table border=\"13\"><thead><tr><th>Nombre</th><th>Num. Seguidos</th><th>Num. Seguidores</th><th>idPersona</th><th>Eliminar</th></tr></thead>";
            while (rsAdmon.next()) {
                this._imprime += "<tbody>";
                this._imprime += "<tr>";
                this._imprime += "<th><strong>" + rsAdmon.getString("Nombre") + "</strong></th> <th>" + rsAdmon.getString("NumSeguidos") + "</th> <th>" + rsAdmon.getString("NumSeguidores") + "</th> <th>" + rsAdmon.getString("idPersona") + "</th>";
                this._imprime += "<th>";
                this._imprime += "<form method=\"POST\" action=\"EliminaEmpresa\">";
                this._imprime += "<input type=\"hidden\" id=\"Empresas\" name=\"Empresas\" value=\"1\" >";
                this._imprime += "<input type=\"hidden\" id=\"idPersona\" name=\"idPersona\" value=\"" + rsAdmon.getString("idPersona") + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"NombreEmpresa\" name=\"NombreEmpresa\" value=\"" + rsAdmon.getString("Nombre") + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"idAdmon\" name=\"idAdmon\" value=\"" + idAdmon + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"nomAdmon\" name=\"nomAdmon\" value=\"" + nomAdmon + "\" required>";
                this._imprime += "<input type=\"submit\" value=\"Eliminar\">";
                this._imprime += "</form>";
                this._imprime += "</th>";
                this._imprime += "</tr>";
                this._imprime += "</tbody>";
            }
            this._imprime += "</table>";
            BaseDatos.cierraConexion();
            rsAdmon.close();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public String traeAdmons(String idAdmon, String nomAdmon) {
        BD.cDatos BaseDatos = new BD.cDatos();
        ResultSet rsAdmon = null;
        try {
            BaseDatos.conectar();
            rsAdmon = BaseDatos.consulta("call sp_TraeAdmons();");
            this._imprime = "<table border=\"13\"><thead><tr><th>Nombre</th><th>idPersona</th><th>Eliminar</th></tr></thead>";
            while (rsAdmon.next()) {
                this._imprime += "<tbody>";
                this._imprime += "<tr>";
                this._imprime += "<th><strong>" + rsAdmon.getString("Nombre") + "</th> <th>" + rsAdmon.getString("idPersona") + "</th>";
                this._imprime += "<th>";
                this._imprime += "<form method=\"POST\" action=\"EliminaAdmons\">";
                this._imprime += "<input type=\"hidden\" id=\"Administradores\" name=\"Administradores\" value=\"1\" >";
                this._imprime += "<input type=\"hidden\" id=\"idPersona\" name=\"idPersona\" value=\"" + rsAdmon.getString("idPersona") + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"NombreAdmonaE\" name=\"NombreAdmonaE\" value=\"" + rsAdmon.getString("Nombre") + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"idAdmon\" name=\"idAdmon\" value=\"" + idAdmon + "\" required>";
                this._imprime += "<input type=\"hidden\" id=\"nomAdmon\" name=\"nomAdmon\" value=\"" + nomAdmon + "\" required>";
                this._imprime += "<input type=\"submit\" value=\"Eliminar\">";
                this._imprime += "</form>";
                this._imprime += "</th>";
                this._imprime += "</tr>";
                this._imprime += "</tbody>";
            }
            this._imprime += "</table>";
            BaseDatos.cierraConexion();
            rsAdmon.close();
        } catch (Exception e) {
            this._errorDx = e.getMessage();
            this._imprime = null;
        }
        return this._imprime;
    }

    public String getIdPersona() {
        return _idPersona;
    }

    public String getUsuarioAdmon() {
        return _UsuarioAdmon;
    }

    public String getContraAdmon() {
        return _ContraAdmon;
    }

    public String getNombreAdmon() {
        return _NombreAdmon;
    }

    public void setIdPersona(String _idPersona) {
        this._idPersona = _idPersona;
    }

    public void setUsuarioAdmon(String _UsuarioAdmon) {
        this._UsuarioAdmon = _UsuarioAdmon;
    }

    public void setContraAdmon(String _ContraAdmon) {
        this._ContraAdmon = _ContraAdmon;
    }

    public void setNombreAdmon(String _NombreAdmon) {
        this._NombreAdmon = _NombreAdmon;
    }

}
