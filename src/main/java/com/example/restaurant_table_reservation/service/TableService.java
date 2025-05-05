package com.example.restaurant_table_reservation.service;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import com.example.restaurant_table_reservation.model.Table;
import com.example.restaurant_table_reservation.utils.TableFileUtils;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class TableService {
    private List<Table> tableList;
    private Gson gson = new Gson();

    public TableService() {
        loadTables();
    }

    private void loadTables() {
        String json = TableFileUtils.readFile();
        Type listType = new TypeToken<List<Table>>(){}.getType();
        tableList = gson.fromJson(json, listType);
        if (tableList == null) tableList = new ArrayList<>();
        System.out.println("Loaded Tables: " + tableList);
    }

    private void saveTables() {
        TableFileUtils.writeFile(gson.toJson(tableList));
    }

    public List<Table> getAllTables() {
        return tableList;
    }

    public void addTable(int number, int capacity, boolean available, String category) {
        int id = tableList.isEmpty() ? 1 : tableList.get(tableList.size() - 1).getId() + 1;
        tableList.add(new Table(id, number, capacity, available, category));
        saveTables();
    }

    public void deleteTable(int id) {
        tableList.removeIf(table -> table.getId() == id);
        saveTables();
    }

    public void updateTable(int id, int number, int capacity, boolean available, String category) {
        for (Table table : tableList) {
            if (table.getId() == id) {
                table.setNumber(number);
                table.setCapacity(capacity);
                table.setAvailable(available);
                table.setCategory(category);
                saveTables();
                break;
            }
        }
    }

    public Table getTableById(int id) {
        for (Table table : tableList) {
            if (table.getId() == id) {
                return table;
            }
        }
        return null;
    }
}
