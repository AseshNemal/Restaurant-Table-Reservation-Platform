<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restaurant_table_reservation.model.Review" %>
<html>
<head>
    <title>Customer Reviews</title>
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
        .delete-btn {
            background-color: #FF4D4D;
            color: white;
            border: none;
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
        }
        .delete-btn:hover {
            background-color: #FF3333;
        }
        .edit-btn {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 5px;
        }
        .edit-btn:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<h2>Customer Reviews</h2>

<table>
    <thead>
    <tr>
        <th>Name</th>
        <th>Email</th>
        <th>Message</th>
        <th>Rating</th>
        <th>Admin Reply</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Review> reviews = (List<Review>) request.getAttribute("reviews");
        if (reviews != null && !reviews.isEmpty()) {
            for (Review review : reviews) {
    %>
    <tr>
        <td><%= review.getCustomerName() %></td>
        <td><%= review.getEmail() %></td>
        <td><%= review.getMessage() %></td>
        <td><%= review.getRating() %> / 5</td>
        <td><%= review.getAdminReply() != null ? review.getAdminReply() : "" %></td>
        <td>
            <form action="reviews" method="POST" style="display:inline;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= review.getId() %>">
                <button type="submit" class="delete-btn">Delete</button>
            </form>
            <form action="reviews" method="GET" style="display:inline;">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id" value="<%= review.getId() %>">
                <button type="submit" class="edit-btn">Edit</button>
            </form>
        </td>
    </tr>
    <%
            }
        } else {
    %>
    <tr>
        <td colspan="6">No reviews available.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

</body>
</html>
