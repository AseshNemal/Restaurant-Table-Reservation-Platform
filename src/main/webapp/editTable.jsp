<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Table</title>
    <style>
        :root {
            --primary: #4361ee;
            --primary-dark: #3a0ca3;
            --accent: #f72585;
            --light: #f8f9fa;
            --dark: #212529;
            --gray: #6c757d;
            --border: #dee2e6;
            --error: #dc3545;
            --success: #28a745;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f7fa;
            color: var(--dark);
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .edit-container {
            width: 100%;
            max-width: 600px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
            animation: fadeIn 0.5s ease;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .edit-header {
            text-align: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid var(--border);
        }

        .edit-header h2 {
            color: var(--primary);
            font-size: 24px;
            margin-bottom: 5px;
        }

        .edit-form {
            display: grid;
            grid-template-columns: 1fr;
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-group label {
            font-size: 14px;
            font-weight: 500;
            color: var(--dark);
        }

        .form-group input[type="text"],
        .form-group input[type="number"] {
            padding: 12px 15px;
            border: 1px solid var(--border);
            border-radius: 6px;
            font-size: 14px;
            transition: all 0.3s;
        }

        .form-group input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(67, 97, 238, 0.2);
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin: 10px 0;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: var(--primary);
        }

        .submit-btn {
            background-color: var(--primary);
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-top: 10px;
            width: 100%;
        }

        .submit-btn:hover {
            background-color: var(--primary-dark);
        }

        @media (max-width: 768px) {
            .edit-container {
                padding: 25px 20px;
            }

            .edit-form {
                gap: 15px;
            }
        }
    </style>
</head>
<body>
<div class="edit-container">
    <div class="edit-header">
        <h2>Edit Table Details</h2>
    </div>

    <form action="tables" method="post" class="edit-form">
        <input type="hidden" name="action" value="edit" />
        <input type="hidden" name="id" value="${table.id}" />

        <div class="form-group">
            <label for="number">Table Number</label>
            <input type="number" id="number" name="number" value="${table.number}" required />
        </div>

        <div class="form-group">
            <label for="category">Category</label>
            <input type="text" id="category" name="category" value="${table.category}" />
        </div>

        <div class="form-group">
            <label for="capacity">Capacity</label>
            <input type="number" id="capacity" name="capacity" value="${table.capacity}" required />
        </div>

        <div class="checkbox-group">
            <% if (request.getAttribute("table") != null) {
                com.example.restaurant_table_reservation.model.Table table = (com.example.restaurant_table_reservation.model.Table) request.getAttribute("table");
                if (table.isAvailable()) { %>
            <input type="checkbox" id="available" name="available" checked />
            <%  } else { %>
            <input type="checkbox" id="available" name="available" />
            <%  }
            } else { %>
            <input type="checkbox" id="available" name="available" />
            <% } %>
            <label for="available">Available</label>
        </div>

        <button type="submit" class="submit-btn">Update Table</button>
    </form>
</div>
</body>
</html>