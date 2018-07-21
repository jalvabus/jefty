package Model;

public class Usuario {

    private int id_usuario;
    private String nomUsuario;
    private String password;
    private String nombre;
    private String apellidopat;
    private String appellidomat;
    private String tipo;
    private String foto;
    private String status;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Usuario() {
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNomUsuario() {
        return nomUsuario;
    }

    public void setNomUsuario(String nomUsuario) {
        this.nomUsuario = nomUsuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellidopat() {
        return apellidopat;
    }

    public void setApellidopat(String apellidopat) {
        this.apellidopat = apellidopat;
    }

    public String getAppellidomat() {
        return appellidomat;
    }

    public void setAppellidomat(String appellidomat) {
        this.appellidomat = appellidomat;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
}