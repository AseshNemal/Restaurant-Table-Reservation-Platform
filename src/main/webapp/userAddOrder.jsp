<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Place Your Order</title>
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
        form {
            width: 40%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #555;
        }
        input[type="text"], input[type="number"], textarea {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border-radius: 4px;
            border: 1px solid #ccc;
            font-size: 14px;
        }
        button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 10px 0;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }
        button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<button onclick="history.back()" style="margin: 20px; padding: 6px 12px; font-size: 1rem; cursor: pointer;">&larr; Back</button>
<h2>Place Your Order</h2>
<form action="AddOrderServlet" method="POST">
    <label for="customerName">Your Name:</label>
    <input type="text" id="customerName" name="customerName" required>

    <label for="tableNumber">Table Number:</label>
    <input type="number" id="tableNumber" name="tableNumber" required>

    <label for="orderDetails">Order Details:</label>
    <textarea id="orderDetails" name="orderDetails" rows="4" required></textarea>

    <label for="totalPrice">Total Price ($):</label>
    <input type="number" id="totalPrice" name="totalPrice" step="0.01" required>

    <label for="orderDateTime">Order Date and Time:</label>
    <input type="datetime-local" id="orderDateTime" name="orderDateTime" required>

    <button type="submit">Submit Order</button>
</form>
</body>
</html>
