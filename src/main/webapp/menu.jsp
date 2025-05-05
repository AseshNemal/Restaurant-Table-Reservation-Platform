<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restaurant_table_reservation.model.MenuItem" %>
<html>
<head>
    <title>Restaurant Menu</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        h2 {
            text-align: center;
            color: #333;
            margin-top: 20px;
        }

        ul {
            list-style-type: none;
            padding: 0;
            width: 80%;
            margin: 0 auto;
        }

        li {
            background-color: #fff;
            padding: 20px;
            margin: 10px 0;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
        }

        li h3 {
            margin: 0 0 10px 0;
            font-size: 18px;
            color: #444;
        }

        li p {
            font-size: 14px;
            color: #555;
            margin: 4px 0;
        }

        img {
            border-radius: 8px;
            max-width: 150px;
            max-height: 100px;
            object-fit: cover;
            margin-left: 20px;
        }

        form {
            background-color: #fff;
            padding: 20px;
            margin: 40px auto;
            width: 80%;
            max-width: 500px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        label {
            font-size: 14px;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], input[type="number"], textarea, select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 14px;
        }

        textarea {
            resize: vertical;
            height: 100px;
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

        .no-items {
            text-align: center;
            font-size: 16px;
            color: #888;
        }

        .action-buttons {
            display: flex;
            flex-direction: row;
            gap: 10px;
            margin-top: 10px;
        }

        .edit-btn, .delete-btn {
            padding: 6px 12px;
            font-size: 14px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
        }

        .edit-btn {
            background-color: #FFB84D;
            color: white;
        }

        .delete-btn {
            background-color: #FF4D4D;
            color: white;
        }

        .edit-btn:hover {
            background-color: #FF9E38;
        }

        .delete-btn:hover {
            background-color: #FF3333;
        }

        @media (max-width: 600px) {
            li {
                flex-direction: column;
                align-items: flex-start;
            }

            img {
                margin: 15px 0 0 0;
                max-width: 100%;
            }

            .action-buttons {
                flex-direction: column;
                width: 100%;
            }

            .edit-btn, .delete-btn {
                width: 100%;
            }
        }

        .form-title {
            font-size: 20px;
            text-align: center;
            color: #333;
            margin-top: 40px;
        }

    </style>
</head>
<body>

<h2>Restaurant Menu</h2>

<ul>
    <%
        List<MenuItem> items = (List<MenuItem>) request.getAttribute("items");
        if (items != null && !items.isEmpty()) {
            for (MenuItem item : items) {
    %>
    <li>
        <div>
            <h3><%= item.getName() %> - $<%= item.getPrice() %></h3>
            <p><strong>Category:</strong> <%= item.getCategory() %></p>
            <p><strong>Description:</strong> <%= item.getDescription() %></p>
            <p><strong>Status:</strong> <%= item.isAvailable() ? "Available" : "Not Available" %></p>
            <div class="action-buttons">
                <form action="editItem.jsp" method="GET" style="display:inline;">
                    <input type="hidden" name="id" value="<%= item.getId() %>">
                    <button type="submit" class="edit-btn">Edit</button>
                </form>

                <form action="menu" method="POST" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= item.getId() %>">
                    <button type="submit" class="delete-btn">Delete</button>
                </form>
            </div>
        </div>
        <img src="<%= item.getImageUrl() %>" alt="Menu Image"/>
    </li>
    <%
        }
    } else {
    %>
    <p class="no-items">No menu items available.</p>
    <%
        }
    %>
</ul>

<!-- Add Menu Item Form -->
<h2 class="form-title">Add New Menu Item</h2>
<form action="menu" method="POST">
    <input type="hidden" name="action" value="add">

    <label for="name">Name:</label>
    <input type="text" id="name" name="name" required>

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" step="0.01" required>

    <label for="category">Category:</label>
    <select id="category" name="category" required>
        <option value="">Select category</option>
        <option value="main dishes">Main Dishes</option>
        <option value="appetizers">Appetizers</option>
        <option value="hard drink">Hard Drink</option>
        <option value="soft drink">Soft Drink</option>
        <option value="desserts">Desserts</option>
    </select>

    <label for="description">Description:</label>
    <textarea id="description" name="description"></textarea>

    <label for="available">Available:</label>
    <select id="available" name="available">
        <option value="true">Available</option>
        <option value="false">Not Available</option>
    </select>

    <label for="imageUrl">Image URL:</label>
    <input type="text" id="imageUrl" name="imageUrl" required>

    <button type="submit">Add Item</button>

</form>

</body>
</html>
