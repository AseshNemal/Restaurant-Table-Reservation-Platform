<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DineEase - Restaurant Table Reservation</title>
  <style>
    :root {
      --primary: #ff6b6b;
      --primary-dark: #ff5252;
      --secondary: #4ecdc4;
      --dark: #292f36;
      --light: #f7fff7;
      --accent: #ffe66d;
      --gray: #6c757d;
    }

    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
      color: var(--dark);
      min-height: 100vh;
      overflow-x: hidden;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 2rem;
      position: relative;
    }

    header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 0;
      margin-bottom: 2rem;
    }

    .logo {
      font-size: 2rem;
      font-weight: 700;
      color: var(--primary);
      display: flex;
      align-items: center;
    }

    .logo i {
      margin-right: 0.5rem;
      color: var(--primary);
    }

    .admin-login {
      padding: 0.5rem 1rem;
      background-color: var(--dark);
      color: white;
      border-radius: 50px;
      font-size: 0.9rem;
      text-decoration: none;
      transition: all 0.3s ease;
      display: flex;
      align-items: center;
    }

    .admin-login i {
      margin-right: 0.5rem;
    }

    .admin-login:hover {
      background-color: var(--primary);
      transform: translateY(-2px);
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
    }

    .hero {
      text-align: center;
      padding: 3rem 0;
      margin-bottom: 3rem;
    }

    .hero h1 {
      font-size: 3.5rem;
      margin-bottom: 1rem;
      background: linear-gradient(to right, var(--primary), var(--secondary));
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      animation: fadeInUp 1s ease;
    }

    .hero p {
      font-size: 1.2rem;
      color: var(--gray);
      max-width: 700px;
      margin: 0 auto 2rem;
      animation: fadeInUp 1s ease 0.2s forwards;
      opacity: 0;
    }

    .features {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 2rem;
      margin-bottom: 3rem;
    }

    .feature-card {
      background: white;
      border-radius: 10px;
      padding: 2rem;
      box-shadow: 0 5px 15px rgba(0,0,0,0.05);
      transition: all 0.3s ease;
      text-align: center;
      opacity: 0;
      animation: fadeInUp 0.5s ease forwards;
    }

    .feature-card:nth-child(1) { animation-delay: 0.4s; }
    .feature-card:nth-child(2) { animation-delay: 0.6s; }
    .feature-card:nth-child(3) { animation-delay: 0.8s; }

    .feature-card:hover {
      transform: translateY(-10px);
      box-shadow: 0 15px 30px rgba(0,0,0,0.1);
    }

    .feature-icon {
      font-size: 2.5rem;
      margin-bottom: 1rem;
      color: var(--primary);
    }

    .feature-card h3 {
      margin-bottom: 1rem;
      color: var(--dark);
    }

    .feature-card p {
      color: var(--gray);
      font-size: 0.9rem;
    }

    .action-buttons {
      display: flex;
      flex-wrap: wrap;
      justify-content: center;
      gap: 1rem;
      margin-bottom: 3rem;
    }

    .btn {
      padding: 0.8rem 1.5rem;
      border-radius: 50px;
      font-size: 1rem;
      font-weight: 500;
      text-decoration: none;
      transition: all 0.3s ease;
      display: inline-flex;
      align-items: center;
      justify-content: center;
      min-width: 180px;
    }

    .btn-primary {
      background-color: var(--primary);
      color: white;
    }

    .btn-primary:hover {
      background-color: var(--primary-dark);
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(255, 107, 107, 0.3);
    }

    .btn-secondary {
      background-color: var(--secondary);
      color: white;
    }

    .btn-secondary:hover {
      background-color: #3dbeb6;
      transform: translateY(-3px);
      box-shadow: 0 5px 15px rgba(78, 205, 196, 0.3);
    }

    .btn-outline {
      border: 2px solid var(--primary);
      color: var(--primary);
      background: transparent;
    }

    .btn-outline:hover {
      background-color: var(--primary);
      color: white;
      transform: translateY(-3px);
    }

    .btn i {
      margin-right: 0.5rem;
    }

    footer {
      text-align: center;
      padding: 2rem 0;
      color: var(--gray);
      font-size: 0.9rem;
    }

    @keyframes fadeInUp {
      from {
        opacity: 0;
        transform: translateY(20px);
      }
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }

    @media (max-width: 768px) {
      .hero h1 {
        font-size: 2.5rem;
      }

      .hero p {
        font-size: 1rem;
      }

      .features {
        grid-template-columns: 1fr;
      }

      .action-buttons {
        flex-direction: column;
        align-items: center;
      }

      .btn {
        width: 100%;
        max-width: 250px;
      }
    }
  </style>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<div class="container">
  <header>
    <div class="logo">
      <i class="fas fa-utensils"></i>
      <span>DineEase</span>
    </div>
    <a href="adminLogin.jsp" class="admin-login">
      <i class="fas fa-lock"></i>
      Admin Login
    </a>
  </header>

  <section class="hero">
    <h1>Experience Seamless Dining</h1>
    <p>Book your table, explore our menu, and enjoy a hassle-free dining experience with DineEase</p>
  </section>

  <section class="features">
    <div class="feature-card">
      <div class="feature-icon">
        <i class="fas fa-calendar-alt"></i>
      </div>
      <h3>Easy Reservations</h3>
      <p>Book your table in just a few clicks with our intuitive reservation system</p>
    </div>
    <div class="feature-card">
      <div class="feature-icon">
        <i class="fas fa-utensils"></i>
      </div>
      <h3>Digital Menu</h3>
      <p>Browse our delicious offerings and place orders directly from your table</p>
    </div>
    <div class="feature-card">
      <div class="feature-icon">
        <i class="fas fa-star"></i>
      </div>
      <h3>Share Feedback</h3>
      <p>Help us improve by sharing your dining experience with us</p>
    </div>
  </section>

  <div class="action-buttons">
    <a href="#" class="btn btn-primary">
      <i class="fas fa-bookmark"></i> Reserve a Table
    </a>
    <a href="categoryMenu" class="btn btn-secondary">
      <i class="fas fa-book-open"></i> View Menu
    </a>
    <a href="login.jsp" class="btn btn-outline">
      <i class="fas fa-sign-in-alt"></i> Customer Login
    </a>
  </div>

  <div class="action-buttons">
    <a href="userAddOrder.jsp" class="btn btn-primary">
      <i class="fas fa-shopping-bag"></i> Place Order
    </a>
    <a href="submitReview.jsp" class="btn btn-secondary">
      <i class="fas fa-comment-alt"></i> Add Feedback
    </a>
    <a href="userReviews" class="btn btn-outline">
      <i class="fas fa-star"></i> View Reviews
    </a>
  </div>

  <footer>
    <p>&copy; 2023 DineEase Restaurant. All rights reserved.</p>
  </footer>
</div>

<script>
  // Smooth scrolling for anchor links
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      e.preventDefault();
      document.querySelector(this.getAttribute('href')).scrollIntoView({
        behavior: 'smooth'
      });
    });
  });

  // Animation on scroll
  const animateOnScroll = () => {
    const elements = document.querySelectorAll('.feature-card');

    elements.forEach(element => {
      const elementPosition = element.getBoundingClientRect().top;
      const screenPosition = window.innerHeight / 1.2;

      if(elementPosition < screenPosition) {
        element.style.animation = `fadeInUp 0.5s ease forwards`;
      }
    });
  };

  window.addEventListener('scroll', animateOnScroll);
  document.addEventListener('DOMContentLoaded', animateOnScroll);

  // Button hover effects
  const buttons = document.querySelectorAll('.btn');
  buttons.forEach(button => {
    button.addEventListener('mouseenter', () => {
      button.style.transform = 'translateY(-3px)';
    });
    button.addEventListener('mouseleave', () => {
      button.style.transform = 'translateY(0)';
    });
  });

</script>
</body>
</html>