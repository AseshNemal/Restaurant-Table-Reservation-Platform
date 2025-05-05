<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restaurant_table_reservation.model.Review" %>
<html>
<head>
    <title>Customer Reviews</title>
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
        .review {
            width: 80%;
            margin: 15px auto;
            background-color: #fff;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0 1px 5px rgba(0,0,0,0.1);
        }
        .review h3 {
            margin: 0 0 5px 0;
            color: #4CAF50;
        }
        .review p {
            margin: 5px 0;
            color: #555;
        }
        .rating {
            font-weight: bold;
            color: #ff9900;
        }
        .admin-reply {
            margin-top: 10px;
            padding: 10px;
            background-color: #e8f5e9;
            border-left: 4px solid #4CAF50;
            color: #2e7d32;
        }
    </style>
</head>
<body>
<h2>Customer Reviews</h2>
<%
    List<Review> reviews = (List<Review>) request.getAttribute("reviews");
    if (reviews != null && !reviews.isEmpty()) {
        for (Review review : reviews) {
%>
<div class="review">
    <h3><%= review.getCustomerName() %> (<%= review.getEmail() %>)</h3>
    <p><%= review.getMessage() %></p>
    <p class="rating">Rating: <%= review.getRating() %> / 5</p>
    <% if (review.getAdminReply() != null && !review.getAdminReply().isEmpty()) { %>
    <div class="admin-reply">
        <strong>Admin Reply:</strong> <%= review.getAdminReply() %>
    </div>
    <% } %>
</div>
<%
        }
    } else {
%>
<p style="text-align:center;">No reviews available.</p>
<%
    }
%>
</body>
</html>
