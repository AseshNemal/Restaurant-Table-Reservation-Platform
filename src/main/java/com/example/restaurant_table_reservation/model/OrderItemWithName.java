package com.example.restaurant_table_reservation.model;

public class OrderItemWithName {
    private int menuItemId;
    private int quantity;
    private String name;

    public OrderItemWithName(int menuItemId, int quantity, String name) {
        this.menuItemId = menuItemId;
        this.quantity = quantity;
        this.name = name;
    }

    public int getMenuItemId() {
        return menuItemId;
    }

    public void setMenuItemId(int menuItemId) {
        this.menuItemId = menuItemId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
