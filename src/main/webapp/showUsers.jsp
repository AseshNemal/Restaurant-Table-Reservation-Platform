<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registered Users</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1528605248644-14dd04022da1') no-repeat center center/cover;
            color: white;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        h2 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        table {
            width: 80%;
            margin: 0 auto 40px auto;
            border-collapse: collapse;
            background-color: rgba(255, 255, 255, 0.1);
            color: white;
        }

        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: rgba(255, 99, 71, 0.8);
        }

        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.05);
        }

        a.btn {
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 4px;
            background-color: #ff6347;
            color: white;
            text-decoration: none;
        }

        a.btn:hover {
            background-color: #ff4500;
        }
    </style>
</head>
<body>
<div class="overlay">
<h2>Registered Users</h2>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        java.util.List<com.example.restaurant_table_reservation.model.User> users = 
            (java.util.List<com.example.restaurant_table_reservation.model.User>) request.getAttribute("users");
        if (users != null && !users.isEmpty()) {
            for (com.example.restaurant_table_reservation.model.User user : users) {
    %>
    <tr>
        <td><%= user.getId() %></td>
        <td><%= user.getUsername() %></td>
        <td><%= user.getEmail() %></td>
        <td>
            <a href="editUser?id=<%= user.getId() %>" class="btn">Edit</a>
            <a href="deleteUser?id=<%= user.getId() %>" class="btn" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="4">No users found.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>
<p><a href="menu.jsp" class="btn">Back to Menu</a></p>
</div>
</body>
</html>
