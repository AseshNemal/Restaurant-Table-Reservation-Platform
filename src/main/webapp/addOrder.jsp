<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.restaurant_table_reservation.service.MenuService" %>
<%@ page import="com.example.restaurant_table_reservation.model.MenuItem" %>
<%
    MenuService menuService = new MenuService();
    java.util.List<MenuItem> menuItems = menuService.getAllItems();
%>
<html>
<head>
    <title>Add Order</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1528605248644-14dd04022da1') no-repeat center center/cover;
            color: white;
        }
        form {
            width: 60%;
            margin: 40px auto;
            background-color: rgba(0,0,0,0.7);
            padding: 20px;
            border-radius: 8px;
        }
        label, input {
            display: block;
            margin-bottom: 10px;
            font-size: 16px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            border: 1px solid #ff6347;
            text-align: left;
        }
        th {
            background-color: #ff6347;
        }
        input[type="number"] {
            width: 60px;
        }
        input[type="submit"] {
            background-color: #ff6347;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 6px;
        }
        input[type="submit"]:hover {
            background-color: #ff4500;
        }
    </style>
</head>
<body>
<h2 style="text-align:center;">Add New Order</h2>
<form method="post" action="addOrder">
    <label for="userId">User ID:</label>
    <input type="number" id="userId" name="userId" required min="1" />
    <table>
        <thead>
            <tr>
                <th>Select</th>
                <th>Menu Item</th>
                <th>Price</th>
                <th>Quantity</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (MenuItem item : menuItems) {
        %>
            <tr>
                <td><input type="checkbox" name="itemId" value="<%=item.getId()%>" onchange="toggleQuantity(this)" /></td>
                <td><%=item.getName()%></td>
                <td>$<%=String.format("%.2f", item.getPrice())%></td>
                <td><input type="number" name="itemQuantity" value="1" min="1" disabled /></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>
    <script>
        function toggleQuantity(checkbox) {
            var quantityInput = checkbox.parentElement.nextElementSibling.nextElementSibling.nextElementSibling.querySelector('input[type="number"]');
            quantityInput.disabled = !checkbox.checked;
        }
        // Initialize quantity inputs on page load
        window.onload = function() {
            var checkboxes = document.querySelectorAll('input[name="itemId"]');
            checkboxes.forEach(function(checkbox) {
                toggleQuantity(checkbox);
            });
        };
    </script>
    <div style="text-align:center; margin-top:20px;">
        <input type="submit" value="Place Order" />
    </div>
</form>
</body>
</html>
