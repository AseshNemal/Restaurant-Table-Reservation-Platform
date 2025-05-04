package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.MenuItem;
import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.model.OrderItem;
import com.example.restaurant_table_reservation.model.OrderItemWithName;
import com.example.restaurant_table_reservation.model.OrderWithItemsWithNames;
import com.example.restaurant_table_reservation.service.MenuService;
import com.example.restaurant_table_reservation.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShowOrdersServlet extends HttpServlet {
    private OrderService orderService = new OrderService();
    private MenuService menuService = new MenuService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Order> orders = orderService.getAllOrders();
        List<OrderWithItemsWithNames> ordersWithNames = new ArrayList<>();

        for (Order order : orders) {
            List<OrderItemWithName> itemsWithNames = new ArrayList<>();
            for (OrderItem item : order.getItems()) {
                MenuItem menuItem = menuService.getItemById(item.getMenuItemId());
                String name = (menuItem != null) ? menuItem.getName() : "Unknown";
                itemsWithNames.add(new OrderItemWithName(item.getMenuItemId(), item.getQuantity(), name));
            }
            ordersWithNames.add(new OrderWithItemsWithNames(order.getId(), order.getUserId(), itemsWithNames, order.getTotalPrice(), order.getStatus()));
        }

        req.setAttribute("orders", ordersWithNames);
        req.getRequestDispatcher("showOrders.jsp").forward(req, resp);
    }
}
