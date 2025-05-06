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

<%
    Review editReview = (Review) request.getAttribute("editReview");
    if (editReview != null) {
%>
<form action="reviews" method="POST" style="width: 90%; margin: 20px auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
    <input type="hidden" name="action" value="update">
    <input type="hidden" name="id" value="<%= editReview.getId() %>">

    <label for="customerName">Name:</label>
    <input type="text" id="customerName" name="customerName" value="<%= editReview.getCustomerName() %>" required style="width: 100%; padding: 8px; margin-bottom: 10px;">

    <label for="email">Email:</label>
    <input type="email" id="email" name="email" value="<%= editReview.getEmail() %>" required style="width: 100%; padding: 8px; margin-bottom: 10px;">

    <label for="message">Message:</label>
    <textarea id="message" name="message" rows="4" required style="width: 100%; padding: 8px; margin-bottom: 10px;"><%= editReview.getMessage() %></textarea>

    <label for="rating">Rating:</label>
    <select id="rating" name="rating" required style="width: 100%; padding: 8px; margin-bottom: 10px;">
        <option value="1" <%= editReview.getRating() == 1 ? "selected" : "" %>>1 - Poor</option>
        <option value="2" <%= editReview.getRating() == 2 ? "selected" : "" %>>2 - Fair</option>
        <option value="3" <%= editReview.getRating() == 3 ? "selected" : "" %>>3 - Good</option>
        <option value="4" <%= editReview.getRating() == 4 ? "selected" : "" %>>4 - Very good</option>
        <option value="5" <%= editReview.getRating() == 5 ? "selected" : "" %>>5 - Excellent</option>
    </select>

    <label for="adminReply">Admin Reply:</label>
    <textarea id="adminReply" name="adminReply" rows="2" style="width: 100%; padding: 8px; margin-bottom: 10px;"><%= editReview.getAdminReply() != null ? editReview.getAdminReply() : "" %></textarea>

    <button type="submit" style="background-color: #4CAF50; color: white; border: none; padding: 10px 20px; font-size: 16px; border-radius: 5px; cursor: pointer;">Update Review</button>
</form>
<%
    }
%>

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
