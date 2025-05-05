package com.example.restaurant_table_reservation.model;

public class Review {
    private int id;
    private String customerName;
    private String email;
    private String message;
    private int rating; // e.g., 1 to 5 stars
    private String adminReply; // Added admin reply field

    public Review() {}

    public Review(int id, String customerName, String email, String message, int rating, String adminReply) {
        this.id = id;
        this.customerName = customerName;
        this.email = email;
        this.message = message;
        this.rating = rating;
        this.adminReply = adminReply;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getAdminReply() {
        return adminReply;
    }

    public void setAdminReply(String adminReply) {
        this.adminReply = adminReply;
    }
}
