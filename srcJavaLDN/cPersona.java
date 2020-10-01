package LDN;

import java.sql.ResultSet;

/**
 *
 * @author github -> @elissabj -> @elias160299
 */
public class cPersona {

    private String _idPersona;
    private String _UsuarioPersona;
    private String _ContraPersona;
    private String _idTipoPersona;
    private String _NombrePersona;
    private String _NumSeguidos;
    private String _NumSeguidores;
    private String _notific;
    private String _imprime;
    private String _errorDx;

    public cPersona(){
        this._imprime = "";
        this._notific = "";
    }
    
    public cPersona(String usrPer, String pswPer){
        this._UsuarioPersona = usrPer;
        this._ContraPersona = pswPer;
        this._imprime = "";
        this._notific = "";
    }
    
    public cPersona(String usrPer, String pswPer, String Aviso){
        this._UsuarioPersona = usrPer;
        this._ContraPersona = pswPer;
        this._notific = Aviso;
        this._imprime = "";
    }
    
    
    public String getIdPersona() {
        return _idPersona;
    }

    public String getUsuarioPersona() {
        return _UsuarioPersona;
    }

    public String getContraPersona() {
        return _ContraPersona;
    }

    public void setIdPersona(String _idPersona) {
        this._idPersona = _idPersona;
    }

    public void setUsuarioPersona(String _UsuarioPersona) {
        this._UsuarioPersona = _UsuarioPersona;
    }

    public void setContraPersona(String _ContraPersona) {
        this._ContraPersona = _ContraPersona;
    }
}
