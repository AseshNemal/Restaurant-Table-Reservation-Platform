<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registered Users</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('https://images.unsplash.com/photo-1528605248644-14dd04022da1') no-repeat center center/cover;
            color: white;
        }

        .overlay {
            background-color: rgba(0, 0, 0, 0.6);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            padding: 20px;
        }

        h1, h2 {
            font-size: 48px;
            margin-bottom: 10px;
        }

        p {
            font-size: 20px;
            margin-bottom: 40px;
        }

        .button-group {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
        }

        a {
            text-decoration: none;
            color: #ff6347;
        }

        .btn {
            padding: 12px 24px;
            font-size: 16px;
            border: none;
            border-radius: 6px;
            background-color: #ff6347;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #ff4500;
        }

        @media (max-width: 600px) {
            h1, h2 {
                font-size: 32px;
            }

            p {
                font-size: 16px;
            }

            .btn {
                width: 100%;
            }
        }
    </style>
</head>
<body>
<h2>Registered Users</h2>
<table>
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Email</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.id}</td>
            <td>${user.username}</td>
            <td>${user.email}</td>
            <td>
                <a href="editUser?id=${user.id}" class="btn">Edit</a>
                <a href="deleteUser?id=${user.id}" class="btn" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="menu">Back to Menu</a></p>
table {
    width: 80%;
    margin: 0 auto 40px auto;
    border-collapse: collapse;
    background-color: rgba(255, 255, 255, 0.1);
    color: white;
}

th, td {
    padding: 12px 15px;
    border: 1px solid #ddd;
    text-align: left;
}

th {
    background-color: rgba(255, 99, 71, 0.8);
}

tr:nth-child(even) {
    background-color: rgba(255, 255, 255, 0.05);
}

a.btn {
    padding: 6px 12px;
    font-size: 14px;
    border-radius: 4px;
    background-color: #ff6347;
