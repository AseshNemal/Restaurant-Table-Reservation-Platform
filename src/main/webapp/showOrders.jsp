<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restaurant_table_reservation.model.Order" %>
<html>
<head>
    <title>Show Orders</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            background-color: #f4f4f4;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 90%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        .action-buttons {
            display: flex;
            gap: 10px;
        }
        .edit-btn, .delete-btn {
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            color: white;
        }
        .edit-btn {
            background-color: #FFB84D;
        }
        .delete-btn {
            background-color: #FF4D4D;
        }
        .edit-btn:hover {
            background-color: #FF9E38;
        }
        .delete-btn:hover {
            background-color: #FF3333;
        }
    </style>
</head>
<body>
<h2>Orders</h2>

<table class="data-table">
    <thead>
    <tr>
        <th>Order ID</th>
        <th>Customer Name</th>
        <th>Table Number</th>
        <th>Order Details</th>
        <th>Total Price</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        if (orders != null && !orders.isEmpty()) {
            for (Order order : orders) {
    %>
    <tr>
        <td><%= order.getId() %></td>
        <td><%= order.getCustomerName() %></td>
        <td><%= order.getTableNumber() %></td>
        <td><%= order.getOrderDetails() %></td>
        <td>$<%= order.getTotalPrice() %></td>
        <td class="action-buttons">
            <form action="EditOrderServlet" method="GET" style="display:inline;">
                <input type="hidden" name="id" value="<%= order.getId() %>">
                <button type="submit" class="edit-btn">Edit</button>
            </form>
            <form action="deleteOrder" method="POST" style="display:inline;">
                <input type="hidden" name="id" value="<%= order.getId() %>">
                <button type="submit" class="delete-btn">Delete</button>
            </form>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="6">No orders available.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
