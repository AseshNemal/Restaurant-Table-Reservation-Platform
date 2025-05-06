<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, com.example.restaurant_table_reservation.model.MenuItem" %>
<html>
<head>
    <title>Menu by Category</title>
    <style>
        :root {
            --primary-color: #007bff;
            --secondary-color: #f9f9f9;
            --accent-color: #28a745;
            --text-color: #333;
            --light-text: #666;
            --card-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: var(--secondary-color);
            margin: 0;
            padding: 0;
            color: var(--text-color);
            line-height: 1.6;
        }

        .container {
            max-width: 1100px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            text-align: center;
            padding: 30px 0;
            background: var(--primary-color);
            color: white;
            margin-bottom: 40px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        h1 {
            margin: 0;
            font-size: 2.5rem;
            font-weight: 400;
            letter-spacing: 1px;
        }

        h2 {
            color: var(--accent-color);
            margin: 40px 0 20px;
            padding-bottom: 8px;
            border-bottom: 3px solid var(--accent-color);
            font-size: 2rem;
            text-transform: capitalize;
        }

        .category-section {
            margin-bottom: 50px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: var(--card-shadow);
        }

        .menu-items {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .menu-item {
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: var(--card-shadow);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            width: calc(33.333% - 13.333px);
            display: flex;
            flex-direction: column;
        }

        .menu-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,0.15);
        }

        .item-image {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .item-details {
            padding: 15px 20px;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
        }

        .item-header {
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            margin-bottom: 10px;
        }

        .item-name {
            font-size: 1.3rem;
            font-weight: 600;
            margin: 0;
            color: var(--text-color);
        }

        .item-price {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--primary-color);
            background: #e6f0ff;
            padding: 4px 12px;
            border-radius: 20px;
        }

        .item-description {
            color: var(--light-text);
            margin: 10px 0 15px;
            font-size: 1rem;
            flex-grow: 1;
        }

        .no-items {
            text-align: center;
            padding: 50px;
            color: var(--light-text);
            font-style: italic;
            font-size: 1.2rem;
        }

        @media (max-width: 992px) {
            .menu-item {
                width: calc(50% - 10px);
            }
        }

        @media (max-width: 600px) {
            .menu-item {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<header>
    <div class="container">
        <button onclick="history.back()" style="margin-bottom: 10px; padding: 6px 12px; font-size: 1rem; cursor: pointer;">&larr; Back</button>
        <h1>Our Menu</h1>
    </div>
</header>

<div class="container">
    <%
        Map<String, List<MenuItem>> itemsByCategory = (Map<String, List<MenuItem>>) request.getAttribute("itemsByCategory");
        if (itemsByCategory != null && !itemsByCategory.isEmpty()) {
            for (Map.Entry<String, List<MenuItem>> entry : itemsByCategory.entrySet()) {
                String category = entry.getKey();
                List<MenuItem> items = entry.getValue();
    %>
    <div class="category-section">
        <h2><%= category %></h2>
        <div class="menu-items">
            <% for (MenuItem item : items) { %>
            <div class="menu-item">
                <img src="<%= item.getImageUrl() %>" alt="<%= item.getName() %>" class="item-image" />
                <div class="item-details">
                    <div class="item-header">
                        <h3 class="item-name"><%= item.getName() %></h3>
                        <span class="item-price">$<%= String.format("%.2f", item.getPrice()) %></span>
                    </div>
                    <p class="item-description"><%= item.getDescription() %></p>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <%
        }
    } else {
    %>
    <div class="no-items">
        <p>No menu items available at the moment.</p>
    </div>
    <%
        }
    %>
</div>
</body>
</html>
