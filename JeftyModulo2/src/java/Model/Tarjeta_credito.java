package Model;

public class Tarjeta_credito {

    private String id_tarjetaCredito;
    private String venci_dia;
    private String venci_anio;
    private String tipo;
    private String propietario;
    private int id_cliente;
    private float saldo;

    public Tarjeta_credito() {
    }

    public String getId_tarjetaCredito() {
        return id_tarjetaCredito;
    }

    public void setId_tarjetaCredito(String id_tarjetaCredito) {
        this.id_tarjetaCredito = id_tarjetaCredito;
    }

    public String getVenci_dia() {
        return venci_dia;
    }

    public void setVenci_dia(String venci_dia) {
        this.venci_dia = venci_dia;
    }

    public String getVenci_anio() {
        return venci_anio;
    }

    public void setVenci_anio(String venci_anio) {
        this.venci_anio = venci_anio;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public float getSaldo() {
        return saldo;
    }

    public void setSaldo(float saldo) {
        this.saldo = saldo;
    }
}