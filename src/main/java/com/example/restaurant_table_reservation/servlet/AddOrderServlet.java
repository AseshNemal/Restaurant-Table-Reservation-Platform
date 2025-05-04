package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.MenuItem;
import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.model.OrderItem;
import com.example.restaurant_table_reservation.service.MenuService;
import com.example.restaurant_table_reservation.service.OrderService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AddOrderServlet extends HttpServlet {
    private OrderService orderService = new OrderService();
    private MenuService menuService = new MenuService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userIdStr = req.getParameter("userId");
        String[] itemIds = req.getParameterValues("itemId");
        String[] itemQuantities = req.getParameterValues("itemQuantity");

        if (userIdStr == null || itemIds == null || itemQuantities == null || itemIds.length != itemQuantities.length) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid order data");
            return;
        }

        int userId = Integer.parseInt(userIdStr);
        List<OrderItem> items = new ArrayList<>();
        double totalPrice = 0.0;

        for (int i = 0; i < itemIds.length; i++) {
            int menuItemId = Integer.parseInt(itemIds[i]);
            int quantity = Integer.parseInt(itemQuantities[i]);
            MenuItem menuItem = menuService.getItemById(menuItemId);
            if (menuItem != null) {
                totalPrice += menuItem.getPrice() * quantity;
                items.add(new OrderItem(menuItemId, quantity));
            }
        }

        Order order = new Order();
        order.setUserId(userId);
        order.setItems(items);
        order.setTotalPrice(totalPrice);
        order.setStatus("Pending");

        orderService.addOrder(order);

        resp.sendRedirect("showOrders");
    }
}
