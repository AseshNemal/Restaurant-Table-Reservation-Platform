<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.restaurant_table_reservation.model.MenuItem" %>
<%@ page import="com.example.restaurant_table_reservation.service.MenuService" %>
<%
  String itemId = request.getParameter("id");
  int id = Integer.parseInt(itemId);
  MenuService service = new MenuService();
  MenuItem itemToEdit = service.getItemById(id);
%>
<html>
<head>
  <title>Edit Menu Item</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 0;
    }

    h2 {
      text-align: center;
      margin-top: 30px;
      color: #333;
    }

    form {
      background-color: #fff;
      max-width: 600px;
      margin: 30px auto;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0 2px 12px rgba(0, 0, 0, 0.1);
    }

    label {
      display: block;
      font-size: 14px;
      color: #333;
      margin-bottom: 6px;
    }

    input[type="text"],
    input[type="number"],
    textarea,
    select {
      width: 100%;
      padding: 10px;
      margin-bottom: 18px;
      border-radius: 6px;
      border: 1px solid #ccc;
      font-size: 14px;
    }

    textarea {
      resize: vertical;
      height: 100px;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #4CAF50;
      border: none;
      color: white;
      font-size: 16px;
      border-radius: 6px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #45a049;
    }

    .back-link {
      text-align: center;
      margin-top: 15px;
    }

    .back-link a {
      color: #4CAF50;
      text-decoration: none;
      font-size: 14px;
    }

    .back-link a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<h2>Edit Menu Item</h2>
<form action="menu" method="POST">
  <input type="hidden" name="action" value="edit">
  <input type="hidden" name="id" value="<%= itemToEdit.getId() %>">

  <label for="name">Name:</label>
  <input type="text" id="name" name="name" value="<%= itemToEdit.getName() %>" required>

  <label for="price">Price:</label>
  <input type="number" id="price" name="price" value="<%= itemToEdit.getPrice() %>" step="0.01" required>

  <label for="category">Category:</label>
  <select id="category" name="category" required>
    <option value="">Select category</option>
    <option value="main dishes" <%= "main dishes".equals(itemToEdit.getCategory()) ? "selected" : "" %>>Main Dishes</option>
    <option value="appetizers" <%= "appetizers".equals(itemToEdit.getCategory()) ? "selected" : "" %>>Appetizers</option>
    <option value="hard drink" <%= "hard drink".equals(itemToEdit.getCategory()) ? "selected" : "" %>>Hard Drink</option>
    <option value="soft drink" <%= "soft drink".equals(itemToEdit.getCategory()) ? "selected" : "" %>>Soft Drink</option>
    <option value="desserts" <%= "desserts".equals(itemToEdit.getCategory()) ? "selected" : "" %>>Desserts</option>
  </select>

  <label for="description">Description:</label>
  <textarea id="description" name="description"><%= itemToEdit.getDescription() %></textarea>

  <label for="available">Available:</label>
  <select id="available" name="available">
    <option value="true" <%= itemToEdit.isAvailable() ? "selected" : "" %>>Available</option>
    <option value="false" <%= !itemToEdit.isAvailable() ? "selected" : "" %>>Not Available</option>
  </select>

  <label for="imageUrl">Image URL:</label>
  <input type="text" id="imageUrl" name="imageUrl" value="<%= itemToEdit.getImageUrl() %>" required>

  <button type="submit">Update Item</button>
</form>

<div class="back-link">
  <a href="menu">← Back to Menu</a>
