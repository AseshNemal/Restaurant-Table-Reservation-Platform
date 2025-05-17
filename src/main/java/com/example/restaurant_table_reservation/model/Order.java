package com.example.restaurant_table_reservation.model;

import java.time.LocalDateTime;

public class Order {
    private int id;
    private String customerName;
    private int tableNumber;
    private String orderDetails;
    private double totalPrice;
    private LocalDateTime orderDateTime;

    public Order() {}

    public Order(String customerName, int tableNumber, String orderDetails, double totalPrice) {
        this.customerName = customerName;
        this.tableNumber = tableNumber;
        this.orderDetails = orderDetails;
        this.totalPrice = totalPrice;
        this.orderDateTime = LocalDateTime.now();
    }

    public Order(String customerName, int tableNumber, String orderDetails, double totalPrice, LocalDateTime orderDateTime) {
        this.customerName = customerName;
        this.tableNumber = tableNumber;
        this.orderDetails = orderDetails;
        this.totalPrice = totalPrice;
        this.orderDateTime = orderDateTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public int getTableNumber() {
        return tableNumber;
    }

    public void setTableNumber(int tableNumber) {
        this.tableNumber = tableNumber;
    }

    public String getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(String orderDetails) {
        this.orderDetails = orderDetails;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public LocalDateTime getOrderDateTime() {
        return orderDateTime;
    }

    public void setOrderDateTime(LocalDateTime orderDateTime) {
        this.orderDateTime = orderDateTime;
    }
}
