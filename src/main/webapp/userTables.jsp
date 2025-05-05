<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restaurant_table_reservation.model.Table" %>
<html>
<head>
    <title>Available Tables</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f9f9f9;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: center;
            color: #000000;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
<h2>Available Tables</h2>
<table>
    <thead>
    <tr>
        <th>Table Number</th>
        <th>Capacity</th>
        <th>Availability</th>
        <th>Category</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Table> tables = (List<Table>) request.getAttribute("tables");
        if (tables != null && !tables.isEmpty()) {
            for (Table table : tables) {
    %>
    <tr>
        <td><%= table.getNumber() %></td>
        <td><%= table.getCapacity() %></td>
        <td><%= table.isAvailable() ? "Available" : "Not Available" %></td>
        <td><%= table.getCategory() != null ? table.getCategory() : "" %></td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="4">No tables available.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
</body>
</html>
