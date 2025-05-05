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
        String action = req.getParameter("action");
        if ("edit".equals(action)) {
            String idParam = req.getParameter("id");
            if (idParam != null) {
                int id = Integer.parseInt(idParam);
                Table table = service.getTableById(id);
                if (table != null) {
                    req.setAttribute("table", table);
                    req.getRequestDispatcher("editTable.jsp").forward(req, resp);
                    return;
                }
            }
            resp.sendRedirect("tables");
            return;
        }

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
            String category = req.getParameter("category");
            service.addTable(number, capacity, available, category);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            service.deleteTable(id);

        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            int number = Integer.parseInt(req.getParameter("number"));
            int capacity = Integer.parseInt(req.getParameter("capacity"));
            boolean available = Boolean.parseBoolean(req.getParameter("available"));
            String category = req.getParameter("category");
            service.updateTable(id, number, capacity, available, category);
        }

        resp.sendRedirect("tables");
    }
}
