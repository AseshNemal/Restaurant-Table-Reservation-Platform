<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Order</title>
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
        form {
            width: 50%;
            margin: 0 auto;
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
        input[type="text"], input[type="number"], select {
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
    </style>
</head>
<body>
<h2>Add New Order</h2>
<form action="AddOrderServlet" method="POST">
    <label for="customerName">Customer Name:</label>
    <input type="text" id="customerName" name="customerName" required>

    <label for="tableNumber">Table Number:</label>
    <input type="number" id="tableNumber" name="tableNumber" required>

    <label for="orderDetails">Order Details:</label>
    <textarea id="orderDetails" name="orderDetails" rows="4" required></textarea>

    <label for="totalPrice">Total Price:</label>
    <input type="number" id="totalPrice" name="totalPrice" step="0.01" required>

    <button type="submit">Place Order</button>
</form>
<br/>
<form action="showOrders" method="GET">
    <button type="submit">Back to Orders</button>
</form>
</body>
</html>
