package com.example.restaurant_table_reservation.service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.Order;
import com.example.restaurant_table_reservation.utils.LocalDateTimeTypeAdapter;
import com.example.restaurant_table_reservation.utils.OrderFileUtils;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;

public class OrderService {
    private List<Order> orderList;
    private Gson gson;

    public OrderService() {
        gson = new GsonBuilder()
                .registerTypeAdapter(java.time.LocalDateTime.class, new LocalDateTimeTypeAdapter())
                .create();
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
        loadOrders(); // Reload orders from file to get latest data
        return orderList;
    }

    public List<Order> getSortedOrders() {
        loadOrders();
        if (orderList == null || orderList.size() <= 1) {
            return orderList;
        }
        return mergeSort(orderList);
    }

    private List<Order> mergeSort(List<Order> orders) {
        System.out.println("mergeSort called with orders: " + orders);
        if (orders.size() <= 1) {
            return orders;
        }
        int mid = orders.size() / 2;
        List<Order> left = mergeSort(new ArrayList<>(orders.subList(0, mid)));
        List<Order> right = mergeSort(new ArrayList<>(orders.subList(mid, orders.size())));
        return merge(left, right);
    }

    private List<Order> merge(List<Order> left, List<Order> right) {
        System.out.println("merge called with left: " + left + ", right: " + right);
        List<Order> result = new ArrayList<>();
        int i = 0, j = 0;
        while (i < left.size() && j < right.size()) {
            // Sort by orderDateTime descending (most recent first)
            System.out.println("Comparing " + left.get(i).getOrderDateTime() + " and " + right.get(j).getOrderDateTime());
            if (left.get(i).getOrderDateTime().isAfter(right.get(j).getOrderDateTime())) {
                result.add(left.get(i));
                i++;
            } else {
                result.add(right.get(j));
                j++;
            }
        }
        while (i < left.size()) {
            result.add(left.get(i));
            i++;
        }
        while (j < right.size()) {
            result.add(right.get(j));
            j++;
        }
        System.out.println("merge result: " + result);
        return result;
    }

    public void addOrder(Order order) {
        int id = orderList.isEmpty() ? 1 : orderList.get(orderList.size() - 1).getId() + 1;
        order.setId(id);
        orderList.add(order);
        saveOrders();
    }

    public void deleteOrder(int id) {
        orderList.removeIf(order -> order.getId() == id);
        saveOrders();
    }

    public void updateOrder(Order updatedOrder) {
        for (Order order : orderList) {
            if (order.getId() == updatedOrder.getId()) {
                order.setCustomerName(updatedOrder.getCustomerName());
                order.setTableNumber(updatedOrder.getTableNumber());
                order.setOrderDetails(updatedOrder.getOrderDetails());
                order.setTotalPrice(updatedOrder.getTotalPrice());
                order.setOrderDateTime(updatedOrder.getOrderDateTime());
                saveOrders();
                break;
            }
        }
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
