/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author juana
 */
public class Paquetes {
    private int id_paquete;
    private String nombre;
    private String platillo;
    private int cantidadPlatillo;
    private String bebida;
    private int cantidadBebida;
    private String postre;
    private int cantidadPostre;
    private int cantidadPersonas;
    private Float costo;

    public Paquetes() {
    }

    public int getId_paquete() {
        return id_paquete;
    }

    public void setId_paquete(int id_paquete) {
        this.id_paquete = id_paquete;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPlatillo() {
        return platillo;
    }

    public void setPlatillo(String platillo) {
        this.platillo = platillo;
    }

    public int getCantidadPlatillo() {
        return cantidadPlatillo;
    }

    public void setCantidadPlatillo(int cantidadPlatillo) {
        this.cantidadPlatillo = cantidadPlatillo;
    }

    public String getBebida() {
        return bebida;
    }

    public void setBebida(String bebida) {
        this.bebida = bebida;
    }

    public int getCantidadBebida() {
        return cantidadBebida;
    }

    public void setCantidadBebida(int cantidadBebida) {
        this.cantidadBebida = cantidadBebida;
    }

    public String getPostre() {
        return postre;
    }

    public void setPostre(String postre) {
        this.postre = postre;
    }

    public int getCantidadPostre() {
        return cantidadPostre;
    }

    public void setCantidadPostre(int cantidadPostre) {
        this.cantidadPostre = cantidadPostre;
    }

    public int getCantidadPersonas() {
        return cantidadPersonas;
    }

    public void setCantidadPersonas(int cantidadPersonas) {
        this.cantidadPersonas = cantidadPersonas;
    }

    public Float getCosto() {
        return costo;
    }

    public void setCosto(Float costo) {
        this.costo = costo;
    }
    
    
    
}
