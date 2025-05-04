package com.example.restaurant_table_reservation.model;

import java.util.List;

public class Order {
    private int id;
    private int userId;
    private List<OrderItem> items;
    private double totalPrice;
    private String status; // e.g., "Pending", "Confirmed", "Completed", "Cancelled"

    public Order() {}

    public Order(int id, int userId, List<OrderItem> items, double totalPrice, String status) {
        this.id = id;
        this.userId = userId;
        this.items = items;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }

    public List<OrderItem> getItems() { return items; }
    public void setItems(List<OrderItem> items) { this.items = items; }

    public double getTotalPrice() { return totalPrice; }
    public void setTotalPrice(double totalPrice) { this.totalPrice = totalPrice; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
