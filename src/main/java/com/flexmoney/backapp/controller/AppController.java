package com.flexmoney.backapp.controller;


import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@CrossOrigin(origins = "http://localhost:8080")
@RestController
@RequestMapping("/app")
public class AppController {

    @GetMapping("/v1")
    public ResponseEntity<String> getAppInfoV1() {
        String msg = "This is V1 api call: demo service for FlexMoney Assignment";
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }
    @GetMapping("/v2")
    public ResponseEntity<String> getAppInfoV2() {
        String msg = "This is V2 api call: demo service for FlexMoney Assignment";
        return new ResponseEntity<>(msg, HttpStatus.OK);
    }
}
