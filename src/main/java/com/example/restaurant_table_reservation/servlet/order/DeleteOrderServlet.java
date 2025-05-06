package com.example.restaurant_table_reservation.servlet.order;

import java.io.IOException;

import com.example.restaurant_table_reservation.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class DeleteOrderServlet extends HttpServlet {
    private OrderService orderService = new OrderService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        System.out.println("DeleteOrderServlet received id: " + idParam);
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                orderService.deleteOrder(id);
                System.out.println("Order deleted with id: " + id);
            } catch (NumberFormatException e) {
                System.err.println("Invalid order id format: " + idParam);
            }
        } else {
            System.err.println("No order id received in request");
        }
        System.out.println("Current orders after deletion: " + orderService.getAllOrders());
        resp.sendRedirect("adminDashboard");
    }
}
