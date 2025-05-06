package com.example.restaurant_table_reservation.servlet.feedback;

import java.io.IOException;
import java.util.List;

import com.example.restaurant_table_reservation.model.Review;
import com.example.restaurant_table_reservation.service.ReviewService;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class UserReviewsServlet extends HttpServlet {
    private ReviewService service;

    @Override
    public void init() throws ServletException {
        service = new ReviewService();
        getServletContext().setAttribute("reviewService", service);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        ReviewService service = (ReviewService) getServletContext().getAttribute("reviewService");
        List<Review> reviews = service.getAllReviews();
        req.setAttribute("reviews", reviews);
        req.getRequestDispatcher("userReviews.jsp").forward(req, resp);
    }
}
