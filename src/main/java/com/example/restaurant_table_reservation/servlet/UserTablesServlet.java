package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.util.List;

import com.example.restaurant_table_reservation.model.Table;
import com.example.restaurant_table_reservation.service.TableService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserTablesServlet extends HttpServlet {
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
        req.getRequestDispatcher("userTables.jsp").forward(req, resp);
    }
}
