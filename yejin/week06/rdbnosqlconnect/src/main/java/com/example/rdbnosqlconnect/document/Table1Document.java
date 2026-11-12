package com.example.rdbnosqlconnect.document;

import jakarta.persistence.Id;
import lombok.Data;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "table1")
@Data
public class Table1Document {
    @Id
    private String id;

    private String data;
}
