package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.util.List;

import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.model.Table;
import com.example.restaurant_table_reservation.model.User;
import com.example.restaurant_table_reservation.service.OrderService;
import com.example.restaurant_table_reservation.service.TableService;
import com.example.restaurant_table_reservation.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private UserService userService = new UserService();
    private OrderService orderService = new OrderService();
    private TableService tableService = new TableService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userService.getAllUsers();
        List<Order> orders = orderService.getAllOrders();
        List<Table> tables = tableService.getAllTables();

        // Calculate total users
        int totalUsers = users.size();

        // Remove today's orders count and today's revenue calculations due to missing order date
        int todaysOrdersCount = orders.size(); // fallback to total orders count
        double todaysRevenue = orders.stream().mapToDouble(Order::getTotalPrice).sum();

        // Calculate available tables count
        long availableTablesCount = tables.stream().filter(Table::isAvailable).count();
        int totalTablesCount = tables.size();

        req.setAttribute("users", users);
        req.setAttribute("orders", orders);
        req.setAttribute("tables", tables);

        // Set summary attributes
        req.setAttribute("totalUsers", totalUsers);
        req.setAttribute("todaysOrdersCount", todaysOrdersCount);
        req.setAttribute("todaysRevenue", todaysRevenue);
        req.setAttribute("availableTablesCount", availableTablesCount);
        req.setAttribute("totalTablesCount", totalTablesCount);

        req.getRequestDispatcher("adminDashboard.jsp").forward(req, resp);
    }
}
