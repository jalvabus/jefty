package Model;

public class Tarjeta_prepago {

    private String id_tarjetaPrepago;
    private String vige_anio;
    private String vig_dia;
    private String propietario;
    private int id_usuario;
    private float saldo;
    private String estado;

    public Tarjeta_prepago() {
    }

    public String getId_tarjetaPrepago() {
        return id_tarjetaPrepago;
    }

    public void setId_tarjetaPrepago(String id_tarjetaPrepago) {
        this.id_tarjetaPrepago = id_tarjetaPrepago;
    }

    public String getVige_anio() {
        return vige_anio;
    }

    public void setVige_anio(String vige_anio) {
        this.vige_anio = vige_anio;
    }

    public String getVig_dia() {
        return vig_dia;
    }

    public void setVig_dia(String vig_dia) {
        this.vig_dia = vig_dia;
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
}