<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restaurant_table_reservation.model.Table" %>
<html>
<head>
    <title>Manage Tables</title>
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
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        form {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #333;
        }
        input[type="number"], select {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        button {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #45a049;
        }
        .action-buttons {
            display: flex;
            justify-content: center;
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
<h2>Manage Tables</h2>

<table>
    <thead>
    <tr>
        <th>Table Number</th>
        <th>Capacity</th>
        <th>Availability</th>
        <th>Actions</th>
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
        <td class="action-buttons">
            <form action="editTable.jsp" method="GET" style="display:inline;">
                <input type="hidden" name="id" value="<%= table.getId() %>">
                <button type="submit" class="edit-btn">Edit</button>
            </form>
            <form action="tables" method="POST" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= table.getId() %>">
                <button type="submit" class="delete-btn">Delete</button>
            </form>
        </td>
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

<h2>Add New Table</h2>
<form action="tables" method="POST">
    <input type="hidden" name="action" value="add">

    <label for="number">Table Number:</label>
    <input type="number" id="number" name="number" required>

    <label for="capacity">Capacity:</label>
    <input type="number" id="capacity" name="capacity" required>

    <label for="available">Availability:</label>
    <select id="available" name="available">
        <option value="true">Available</option>
        <option value="false">Not Available</option>
    </select>

    <button type="submit">Add Table</button>
</form>

</body>
</html>
