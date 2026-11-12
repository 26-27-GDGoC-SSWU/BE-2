package com.example.rdbnosqlconnect.controller;

import com.example.rdbnosqlconnect.mongorepo.Table1Repository;
import com.example.rdbnosqlconnect.mysqlrepo.FirstRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    private Table1Repository table1Repository;
    private FirstRepository firstRepository;

    @Autowired
    public MainController(Table1Repository table1Repository, FirstRepository firstRepository) {
        this.table1Repository = table1Repository;
        this.firstRepository = firstRepository;
    }

    @GetMapping("/")
    public String mainP(Model model) {

        model.addAttribute("RDB", firstRepository.findAll());
        model.addAttribute("MON", table1Repository.findAll());

        return "main";
    }
}
