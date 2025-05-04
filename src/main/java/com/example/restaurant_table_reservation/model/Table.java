package com.example.restaurant_table_reservation.model;

public class Table {
    private int id;
    private int number;
    private int capacity;
    private boolean available;

    public Table() {}

    public Table(int id, int number, int capacity, boolean available) {
        this.id = id;
        this.number = number;
        this.capacity = capacity;
        this.available = available;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public boolean isAvailable() {
        return available;
    }

    public void setAvailable(boolean available) {
        this.available = available;
    }
}
