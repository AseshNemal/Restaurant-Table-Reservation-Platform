package com.example.restaurant_table_reservation.servlet.order;

import java.io.IOException;

import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditOrderServlet extends HttpServlet {
    private OrderService orderService = new OrderService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idParam = req.getParameter("id");
        if (idParam == null) {
            resp.sendRedirect("showOrders");
            return;
        }
        int id = Integer.parseInt(idParam);
        Order order = orderService.getOrderById(id);
        if (order == null) {
            resp.sendRedirect("showOrders");
            return;
        }
        req.setAttribute("order", order);
        req.getRequestDispatcher("editOrder.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String customerName = req.getParameter("customerName");
        int tableNumber = Integer.parseInt(req.getParameter("tableNumber"));
        String orderDetails = req.getParameter("orderDetails");
        double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));

        Order updatedOrder = new Order(customerName, tableNumber, orderDetails, totalPrice);
        updatedOrder.setId(id);
        orderService.updateOrder(updatedOrder);

        resp.sendRedirect("showOrders");
    }
}