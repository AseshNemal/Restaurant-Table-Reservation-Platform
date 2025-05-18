package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.model.Table;
import com.example.restaurant_table_reservation.service.OrderService;
import com.example.restaurant_table_reservation.service.TableService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddOrderServlet")
public class AddOrderServlet extends HttpServlet {
    private OrderService service;
    private TableService tableService;

    @Override
    public void init() throws ServletException {
        service = new OrderService();
        tableService = new TableService();
        getServletContext().setAttribute("orderService", service);
        getServletContext().setAttribute("tableService", tableService);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Table> allTables = tableService.getAllTables();
        List<Table> availableTables = new ArrayList<>();
        for (Table table : allTables) {
            if (table.isAvailable()) {
                availableTables.add(table);
            }
        }
        req.setAttribute("availableTables", availableTables);
        req.getRequestDispatcher("userAddOrder.jsp").forward(req, resp);
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
