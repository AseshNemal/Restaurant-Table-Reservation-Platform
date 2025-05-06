package com.example.restaurant_table_reservation.servlet.menu;

import java.io.IOException;
import java.util.List;

import com.example.restaurant_table_reservation.model.MenuItem;
import com.example.restaurant_table_reservation.service.MenuService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MenuServlet extends HttpServlet {
    private MenuService service;

    @Override
    public void init() throws ServletException {
        // Load only once and store in ServletContext
        service = new MenuService();
        getServletContext().setAttribute("menuService", service);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        MenuService service = (MenuService) getServletContext().getAttribute("menuService");
        List<MenuItem> items = service.getAllItems();
        req.setAttribute("items", items);
        req.getRequestDispatcher("menu.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        MenuService service = (MenuService) getServletContext().getAttribute("menuService");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            boolean available = Boolean.parseBoolean(req.getParameter("available"));
            String imageUrl = req.getParameter("imageUrl");
            String category = req.getParameter("category");

            service.addItem(name, price, description, available, imageUrl, category);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            service.deleteItem(id);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            double price = Double.parseDouble(req.getParameter("price"));
            String description = req.getParameter("description");
            boolean available = Boolean.parseBoolean(req.getParameter("available"));
            String imageUrl = req.getParameter("imageUrl");
            String category = req.getParameter("category");

            service.updateItem(id, name, price, description, available, imageUrl, category);
        }

        resp.sendRedirect("menu");
    }
}
