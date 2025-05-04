package com.example.restaurant_table_reservation.service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.utils.OrderFileUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class OrderService {
    private List<Order> orderList;
    private Gson gson = new Gson();
    private static final String ORDER_FILE = "orders.json";

    public OrderService() {
        loadOrders();
    }

    private void loadOrders() {
        String json = OrderFileUtils.readFile();
        Type listType = new TypeToken<List<Order>>(){}.getType();
        orderList = gson.fromJson(json, listType);
        if (orderList == null) orderList = new ArrayList<>();
        System.out.println("Loaded Orders: " + orderList);
    }

    private void saveOrders() {
        OrderFileUtils.writeFile(gson.toJson(orderList));
    }

    public List<Order> getAllOrders() {
        return orderList;
    }

    public void addOrder(Order order) {
        int id = orderList.isEmpty() ? 1 : orderList.get(orderList.size() - 1).getId() + 1;
        order.setId(id);
        orderList.add(order);
        saveOrders();
        loadOrders();
    }

    public void updateOrder(Order updatedOrder) {
        for (int i = 0; i < orderList.size(); i++) {
            if (orderList.get(i).getId() == updatedOrder.getId()) {
                orderList.set(i, updatedOrder);
                saveOrders();
                break;
            }
        }
    }

    public void deleteOrder(int id) {
        orderList.removeIf(order -> order.getId() == id);
        saveOrders();
    }

    public Order getOrderById(int id) {
        for (Order order : orderList) {
            if (order.getId() == id) {
                return order;
            }
        }
        return null;
    }
}
