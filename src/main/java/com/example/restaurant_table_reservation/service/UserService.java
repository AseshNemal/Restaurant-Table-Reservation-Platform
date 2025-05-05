package com.example.restaurant_table_reservation.service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.User;
import com.example.restaurant_table_reservation.utils.UserFileUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class UserService {
    private List<User> userList;
    private Gson gson = new Gson();
    private static final String USER_FILE = "users.json";

    public UserService() {
        loadUsers();
    }

    private void loadUsers() {
        String json = UserFileUtils.readFile();
        Type listType = new TypeToken<List<User>>(){}.getType();
        userList = gson.fromJson(json, listType);
        if (userList == null) userList = new ArrayList<>();
        System.out.println("Loaded Users: " + userList);
    }

    private void saveUsers() {
        UserFileUtils.writeFile(gson.toJson(userList));
    }

    public List<User> getAllUsers() {
        return userList;
    }

    public boolean registerUser(String username, String password, String email) {
        // Check if username already exists
        for (User user : userList) {
            if (user.getUsername().equalsIgnoreCase(username)) {
                return false; // Username already taken
            }
        }
        int id = userList.isEmpty() ? 1 : userList.get(userList.size() - 1).getId() + 1;
        userList.add(new User(id, username, password, email));
        saveUsers();
        // Removed loadUsers() call to avoid reloading from file immediately
        return true;
    }

    public User authenticateUser(String username, String password) {
        for (User user : userList) {
            if (user.getUsername().equalsIgnoreCase(username) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null; // Authentication failed
    }

    public void updateUser(User updatedUser) {
        for (int i = 0; i < userList.size(); i++) {
            if (userList.get(i).getId() == updatedUser.getId()) {
                userList.set(i, updatedUser);
                saveUsers();
                break;
            }
        }
    }

    public void deleteUser(int id) {
        userList.removeIf(user -> user.getId() == id);
        saveUsers();
    }
}
