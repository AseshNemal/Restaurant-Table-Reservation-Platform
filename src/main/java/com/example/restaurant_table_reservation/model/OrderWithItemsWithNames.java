package com.example.restaurant_table_reservation.model;

import java.util.List;

public class OrderWithItemsWithNames {
    private int id;
    private int userId;
    private List<OrderItemWithName> items;
    private double totalPrice;
    private String status;

    public OrderWithItemsWithNames(int id, int userId, List<OrderItemWithName> items, double totalPrice, String status) {
        this.id = id;
        this.userId = userId;
        this.items = items;
        this.totalPrice = totalPrice;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public List<OrderItemWithName> getItems() {
        return items;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public String getStatus() {
        return status;
    }
}
