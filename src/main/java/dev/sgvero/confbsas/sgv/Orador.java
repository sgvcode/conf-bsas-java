package dev.sgvero.confbsas.sgv;

public class Orador {
    private String nombre;
    private String apellido;
    private String temario;

    public Orador(String nombre, String apellido, String temario) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.temario = temario;
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
}
