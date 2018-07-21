package Model;

public class Cliente {

    private int id_cliente;
    private String no_cel;
    private String direccion;
    private String no_targeta;
    private int id_usuario;

    public Cliente() {
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getNo_cel() {
        return no_cel;
    }

    public void setNo_cel(String no_cel) {
        this.no_cel = no_cel;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getNo_targeta() {
        return no_targeta;
    }

    public void setNo_targeta(String no_targeta) {
        this.no_targeta = no_targeta;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }
}