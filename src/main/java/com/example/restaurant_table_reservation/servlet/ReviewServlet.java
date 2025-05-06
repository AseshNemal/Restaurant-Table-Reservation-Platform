package com.example.restaurant_table_reservation.servlet;

import java.io.IOException;
import java.util.List;

import com.example.restaurant_table_reservation.model.Review;
import com.example.restaurant_table_reservation.service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/reviews")
public class ReviewServlet extends HttpServlet {
    private ReviewService service;

    @Override
    public void init() throws ServletException {
        service = new ReviewService();
        getServletContext().setAttribute("reviewService", service);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ReviewService service = (ReviewService) getServletContext().getAttribute("reviewService");
        String action = req.getParameter("action");

        if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Review editReview = service.getReviewById(id);
            req.setAttribute("editReview", editReview);
            List<Review> reviews = service.getAllReviews();
            req.setAttribute("reviews", reviews);
            req.getRequestDispatcher("reviews.jsp").forward(req, resp);
        } else {
            List<Review> reviews = service.getAllReviews();
            req.setAttribute("reviews", reviews);
            req.getRequestDispatcher("reviews.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        ReviewService service = (ReviewService) getServletContext().getAttribute("reviewService");
        String action = req.getParameter("action");

        if ("add".equals(action)) {
            String customerName = req.getParameter("customerName");
            String email = req.getParameter("email");
            String message = req.getParameter("message");
            int rating = Integer.parseInt(req.getParameter("rating"));
            service.addReview(customerName, email, message, rating);
            resp.sendRedirect("index.jsp");
            return;
        } else if ("update".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            String customerName = req.getParameter("customerName");
            String email = req.getParameter("email");
            String message = req.getParameter("message");
            int rating = Integer.parseInt(req.getParameter("rating"));
            String adminReply = req.getParameter("adminReply");
            service.updateReview(id, customerName, email, message, rating, adminReply);

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            service.deleteReview(id);
        }

        resp.sendRedirect("reviews");
    }
}
