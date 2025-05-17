package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;

import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    private OrderService service;

    @Override
    public void init() throws ServletException {
        service = new OrderService();
        getServletContext().setAttribute("orderService", service);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String customerName = req.getParameter("customerName");
        int tableNumber = Integer.parseInt(req.getParameter("tableNumber"));
        String orderDetails = req.getParameter("orderDetails");
        double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));

        String orderDateTimeStr = req.getParameter("orderDateTime");
        LocalDateTime orderDateTime = null;
        try {
            if (orderDateTimeStr != null && !orderDateTimeStr.isEmpty()) {
                orderDateTime = LocalDateTime.parse(orderDateTimeStr);
            }
        } catch (DateTimeParseException e) {
            orderDateTime = LocalDateTime.now();
        }

        service.addOrder(new Order(customerName, tableNumber, orderDetails, totalPrice, orderDateTime));

        resp.sendRedirect("index.jsp");
    }
}
