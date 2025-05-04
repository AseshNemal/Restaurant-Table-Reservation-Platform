package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.util.List;

import com.example.restaurant_table_reservation.model.User;
import com.example.restaurant_table_reservation.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ShowUsersServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<User> users = userService.getAllUsers();
        req.setAttribute("users", users);
        req.getRequestDispatcher("showUsers.jsp").forward(req, resp);
    }
}
