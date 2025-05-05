package com.example.restaurant_table_reservation.utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;

public class TableFileUtils {
    private static final String FILE_PATH = "tables.json";

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
