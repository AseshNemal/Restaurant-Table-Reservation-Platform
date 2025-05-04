<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Order</title>
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
            width: 400px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
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
            padding: 10px 15px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #0056b3;
        }
        .button-group {
            display: flex;
            justify-content: space-between;
        }
        .btn-cancel {
            background-color: #6c757d;
        }
        .btn-cancel:hover {
            background-color: #5a6268;
        }
    </style>
</head>
<body>
<h2>Edit Order</h2>
<form action="EditOrderServlet" method="post">
    <input type="hidden" name="id" value="${order.id}"/>
    <label for="customerName">Customer Name:</label>
    <input type="text" id="customerName" name="customerName" value="${order.customerName}" required/>

    <label for="tableNumber">Table Number:</label>
    <input type="number" id="tableNumber" name="tableNumber" value="${order.tableNumber}" required/>

    <label for="orderDetails">Order Details:</label>
    <textarea id="orderDetails" name="orderDetails" rows="4" required>${order.orderDetails}</textarea>

    <label for="totalPrice">Total Price:</label>
    <input type="number" step="0.01" id="totalPrice" name="totalPrice" value="${order.totalPrice}" required/>

    <div class="button-group">
        <button type="submit">Save</button>
        <a href="showOrders" class="btn-cancel btn" style="text-align:center; padding:10px 15px; color:white; text-decoration:none; border-radius:5px;">Cancel</a>
    </div>
</form>
</body>
</html>
