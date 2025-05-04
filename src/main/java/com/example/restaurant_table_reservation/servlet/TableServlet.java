package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.util.List;

import com.example.restaurant_table_reservation.model.Table;
import com.example.restaurant_table_reservation.service.TableService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/tables")
public class TableServlet extends HttpServlet {
    private TableService service;

    @Override
    public void init() throws ServletException {
        service = new TableService();
        getServletContext().setAttribute("tableService", service);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TableService service = (TableService) getServletContext().getAttribute("tableService");
        List<Table> tables = service.getAllTables();
        req.setAttribute("tables", tables);
        req.getRequestDispatcher("tables.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        TableService service = (TableService) getServletContext().getAttribute("tableService");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            int number = Integer.parseInt(req.getParameter("number"));
            int capacity = Integer.parseInt(req.getParameter("capacity"));
            boolean available = Boolean.parseBoolean(req.getParameter("available"));
            service.addTable(number, capacity, available);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            service.deleteTable(id);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            int number = Integer.parseInt(req.getParameter("number"));
            int capacity = Integer.parseInt(req.getParameter("capacity"));
            boolean available = Boolean.parseBoolean(req.getParameter("available"));
            service.updateTable(id, number, capacity, available);
        }

        resp.sendRedirect("tables");
    }
}
