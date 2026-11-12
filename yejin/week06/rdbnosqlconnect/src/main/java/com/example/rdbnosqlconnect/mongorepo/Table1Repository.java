package com.example.rdbnosqlconnect.mongorepo;

import com.example.rdbnosqlconnect.document.Table1Document;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface Table1Repository extends MongoRepository<Table1Document, String> {

}
