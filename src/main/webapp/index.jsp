<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Restaurant Table Reservation Platform</title>
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

    h1 {
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
      h1 {
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
<div class="overlay">
  <h1>Welcome to DineEase</h1>
  <p>Your ultimate solution for seamless table reservations and menu management</p>
    <div class="button-group">
    <a href="menu" class="btn">View Menu</a>
    <a href="reservations.jsp" class="btn">Reserve a Table</a>
    <a href="hello" class="btn">Hello Servlet</a>
    <a href="showUsers" class="btn">View Users</a>
    <a href="showOrders" class="btn">View Orders</a>
    <a href="addOrder.jsp" class="btn">Add Order</a>
  </div>
</div>
</body>
</html>
