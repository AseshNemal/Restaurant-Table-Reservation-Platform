<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
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
<h2>Login</h2>
<form method="post" action="login">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" required><br><br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>
    <input type="submit" value="Login">
</form>
<c:if test="${not empty errorMessage}">
    <p style="color:red">${errorMessage}</p>
</c:if>
<p>Don't have an account? <a href="registration">Register here</a></p>
</body>
</html>
