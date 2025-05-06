package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;

import com.example.restaurant_table_reservation.service.UserService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegistrationServlet extends HttpServlet {
    private UserService userService;

    @Override
    public void init() throws ServletException {
        userService = (UserService) getServletContext().getAttribute("userService");
        if (userService == null) {
            userService = new UserService();
            getServletContext().setAttribute("userService", userService);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("registration.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        boolean success = userService.registerUser(username, password, email);
        if (success) {
            resp.sendRedirect("login"); // Redirect to login page after successful registration
        } else {
            req.setAttribute("errorMessage", "Username already exists");
            req.getRequestDispatcher("registration.jsp").forward(req, resp);
        }
    }
}
