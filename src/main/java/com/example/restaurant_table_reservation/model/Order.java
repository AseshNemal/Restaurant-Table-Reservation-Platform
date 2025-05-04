package com.example.restaurant_table_reservation.model;

public class Order {
    private int id;
    private String customerName;
    private int tableNumber;
    private String orderDetails;
    private double totalPrice;

    public Order() {}

    public Order(String customerName, int tableNumber, String orderDetails, double totalPrice) {
        this.customerName = customerName;
        this.tableNumber = tableNumber;
        this.orderDetails = orderDetails;
        this.totalPrice = totalPrice;
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
}
