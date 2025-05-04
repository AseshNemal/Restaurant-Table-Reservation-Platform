package com.example.restaurant_table_reservation.model;

public class OrderItem {
    private int menuItemId;
    private int quantity;

    public OrderItem() {}

    public OrderItem(int menuItemId, int quantity) {
        this.menuItemId = menuItemId;
        this.quantity = quantity;
    }

    // Getters and Setters
    public int getMenuItemId() { return menuItemId; }
    public void setMenuItemId(int menuItemId) { this.menuItemId = menuItemId; }

    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
}
