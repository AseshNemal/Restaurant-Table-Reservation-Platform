package com.example.restaurant_table_reservation.service;



import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.MenuItem;
import com.example.restaurant_table_reservation.utils.FileUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class MenuService {
    private List<MenuItem> menuList;
    private Gson gson = new Gson();

    public MenuService() {
        loadMenu();
    }

    private void loadMenu() {
        String json = FileUtils.readFile();
        Type listType = new TypeToken<List<MenuItem>>(){}.getType();
        menuList = gson.fromJson(json, listType);
        if (menuList == null) menuList = new ArrayList<>();
        System.out.println("Loaded Menu: " + menuList);
    }

    private void saveMenu() {
        FileUtils.writeFile(gson.toJson(menuList));
    }

    public List<MenuItem> getAllItems() {
        loadMenu();
        return menuList;
    }

    public void addItem(String name, double price, String description, boolean available, String imageUrl, String category) {
        int id = menuList.isEmpty() ? 1 : menuList.get(menuList.size() - 1).getId() + 1;
        menuList.add(new MenuItem(id, name, price, description, available, imageUrl, category));
        saveMenu();
        loadMenu();
        loadMenu();


    }

    public void deleteItem(int id) {
        menuList.removeIf(item -> item.getId() == id);
        saveMenu();
    }

    public void updateItem(int id, String name, double price, String description, boolean available, String imageUrl, String category) {
        for (MenuItem item : menuList) {
            if (item.getId() == id) {
                item.setName(name);
                item.setPrice(price);
                item.setDescription(description);
                item.setAvailable(available);
                item.setImageUrl(imageUrl);
                item.setCategory(category);
                saveMenu();
                break;
            }
        }
    }

    public MenuItem getItemById(int id) {
        for (MenuItem item : menuList) {
            if (item.getId() == id) {
                return item;
            }
        }
        return null;  // Return null if item with given ID is not found
    }
}

