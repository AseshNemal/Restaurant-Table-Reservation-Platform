package com.example.restaurant_table_reservation.servlet;


import java.io.IOException;

import com.example.restaurant_table_reservation.service.MenuService;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddItemServlet extends HttpServlet {
    private MenuService service = new MenuService();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String description = req.getParameter("description");
        boolean available = Boolean.parseBoolean(req.getParameter("available"));
        String imageUrl = req.getParameter("imageUrl");

        String category = req.getParameter("category");
        service.addItem(name, price, description, available, imageUrl, category);
        

        resp.sendRedirect("menu");

    
    }
}
