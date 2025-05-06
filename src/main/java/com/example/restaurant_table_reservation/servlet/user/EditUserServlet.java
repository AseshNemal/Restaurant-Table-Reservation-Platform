package com.example.restaurant_table_reservation.servlet.user;

import java.io.IOException;

import com.example.restaurant_table_reservation.model.User;
import com.example.restaurant_table_reservation.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditUserServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr == null) {
            resp.sendRedirect("showUsers");
            return;
        }
        int id = Integer.parseInt(idStr);
        User user = null;
        for (User u : userService.getAllUsers()) {
            if (u.getId() == id) {
                user = u;
                break;
            }
        }
        if (user == null) {
            resp.sendRedirect("showUsers");
            return;
        }
        req.setAttribute("user", user);
        req.getRequestDispatcher("editUser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        User updatedUser = null;
        for (User user : userService.getAllUsers()) {
            if (user.getId() == id) {
                user.setUsername(username);
                user.setPassword(password);
                user.setEmail(email);
                updatedUser = user;
                break;
            }
        }
        if (updatedUser != null) {
            userService.updateUser(updatedUser);
        }
        resp.sendRedirect("showUsers");
    }
}
