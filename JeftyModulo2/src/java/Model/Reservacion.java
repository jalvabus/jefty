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
public class Reservacion {
    private int id_reservacion;
    private String fecha_reservacion;
    private String hora_reservacion;
    private String fecha_llegada;
    private String hora_llegada;
    private String no_comensales;
    private int id_mesa;
    private int id_cliente;
    private String nombreCliente;
    private String mesaArea;

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        this.nombreCliente = nombreCliente;
    }

    public String getMesaArea() {
        return mesaArea;
    }

    public void setMesaArea(String mesaArea) {
        this.mesaArea = mesaArea;
    }
    
    public Reservacion() {
    }

    public int getId_resevacion() {
        return id_reservacion;
    }

    public void setId_resevacion(int id_reservacion) {
        this.id_reservacion = id_reservacion;
    }

    public String getFecha_reservacion() {
        return fecha_reservacion;
    }

    public void setFecha_reservacion(String fecha_reservacion) {
        this.fecha_reservacion = fecha_reservacion;
    }

    public String getHora_reservacion() {
        return hora_reservacion;
    }

    public void setHora_reservacion(String hora_reservacion) {
        this.hora_reservacion = hora_reservacion;
    }

    public String getFecha_llegada() {
        return fecha_llegada;
    }

    public void setFecha_llegada(String fecha_llegada) {
        this.fecha_llegada = fecha_llegada;
    }

    public String getHora_llegada() {
        return hora_llegada;
    }

    public void setHora_llegada(String hora_llegada) {
        this.hora_llegada = hora_llegada;
    }

    public String getNo_comensales() {
        return no_comensales;
    }

    public void setNo_comensales(String no_comensales) {
        this.no_comensales = no_comensales;
    }

    public int getId_mesa() {
        return id_mesa;
    }

    public void setId_mesa(int id_mesa) {
        this.id_mesa = id_mesa;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }
    
}