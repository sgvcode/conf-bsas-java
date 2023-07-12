package dev.sgvero.confbsas.sgv;

public class Orador {

    private int id;
    private String nombre;
    private String apellido;
    private String temario;
    private String foto;

    public Orador(int id, String nombre, String apellido, String temario, String foto) {
        this.id = id;
        this.nombre = nombre;
        this.apellido = apellido;
        this.temario = temario;
        this.foto = foto;
    }

    public String getFoto() {
        return foto;
    }

    public String getFotoPath() {
        return "img/" + this.foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getTemario() {
        return temario;
    }

    public void setTemario(String temario) {
        this.temario = temario;
    }
    
    public boolean tieneFoto() {
    return foto != null && !foto.isEmpty();
}
}
