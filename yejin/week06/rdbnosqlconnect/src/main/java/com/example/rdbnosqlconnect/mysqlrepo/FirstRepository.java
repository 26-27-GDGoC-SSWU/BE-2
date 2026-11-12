package com.example.rdbnosqlconnect.mysqlrepo;

import com.example.rdbnosqlconnect.entity.FirstEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface FirstRepository extends JpaRepository<FirstEntity, Integer> {

}
