package com.example.restaurant_table_reservation.service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.Review;
import com.example.restaurant_table_reservation.utils.FileUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class ReviewService {
    private List<Review> reviewList;
    private Gson gson = new Gson();

    public ReviewService() {
        loadReviews();
    }

    private void loadReviews() {
        String json = FileUtils.readFile();
        Type listType = new TypeToken<List<Review>>(){}.getType();
        reviewList = gson.fromJson(json, listType);
        if (reviewList == null) reviewList = new ArrayList<>();
        System.out.println("Loaded Reviews: " + reviewList);
    }

    private void saveReviews() {
        FileUtils.writeFile(gson.toJson(reviewList));
    }

    public List<Review> getAllReviews() {
        return reviewList;
    }

    public void addReview(String customerName, String email, String message, int rating) {
        int id = reviewList.isEmpty() ? 1 : reviewList.get(reviewList.size() - 1).getId() + 1;
        reviewList.add(new Review(id, customerName, email, message, rating, null));
        saveReviews();
    }

    public void deleteReview(int id) {
        reviewList.removeIf(review -> review.getId() == id);
        saveReviews();
    }

    public Review getReviewById(int id) {
        for (Review review : reviewList) {
            if (review.getId() == id) {
                return review;
            }
        }
        return null;
    }

    public void updateReview(int id, String customerName, String email, String message, int rating, String adminReply) {
        Review review = getReviewById(id);
        if (review != null) {
            review.setCustomerName(customerName);
            review.setEmail(email);
            review.setMessage(message);
            review.setRating(rating);
            review.setAdminReply(adminReply);
            saveReviews();
        }
    }
}
