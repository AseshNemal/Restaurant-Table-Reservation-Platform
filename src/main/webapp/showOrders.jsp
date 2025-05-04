<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Orders</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1528605248644-14dd04022da1') no-repeat center center/cover;
            color: white;
        }
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
        }
        th, td {
            padding: 12px 15px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #ff6347;
        }
        tr:nth-child(even) {
            background-color: rgba(255, 255, 255, 0.1);
        }
        a {
            color: #ff6347;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<h2 style="text-align:center;">Orders</h2>
<table>
    <thead>
    <tr>
        <th>Order ID</th>
        <th>User ID</th>
        <th>Items</th>
        <th>Total Price</th>
        <th>Status</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="order" items="${orders}">
        <tr>
            <td>${order.id}</td>
            <td>${order.userId}</td>
            <td>
                <c:forEach var="item" items="${order.items}">
                    ${item.name} (x${item.quantity})<br/>
                </c:forEach>
            </td>
            <td>${order.totalPrice}</td>
            <td>${order.status}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p style="text-align:center;"><a href="index.jsp">Back to Home</a></p>
</body>
</html>
