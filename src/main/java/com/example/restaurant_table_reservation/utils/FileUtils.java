package com.example.restaurant_table_reservation.utils;

import java.io.*;
import java.nio.file.*;

public class FileUtils {
    private static final String FILE_PATH = "menu.json";

    public static String readFile() {
        try {
            File file = new File(FILE_PATH);
            if (!file.exists()) {
                file.createNewFile();
                writeFile("[]");
            }
            return new String(Files.readAllBytes(file.toPath()));
        } catch (IOException e) {
            return "[]";
        }
    }

    public static void writeFile(String content) {
        try (FileWriter writer = new FileWriter(FILE_PATH)) {
            writer.write(content);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}