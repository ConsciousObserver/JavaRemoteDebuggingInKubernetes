package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@SpringBootApplication
public class JavaRemoteDebuggingTestApplication {

    public static void main(String[] args) {
        SpringApplication.run(JavaRemoteDebuggingTestApplication.class, args);
    }
}

@Slf4j
@RestController
@RequestMapping("/")
class TestController {

    @GetMapping("/hello")
    public String hello() {

        log.info("Received request ------------------------");
        
        for (int i = 0; i < 10; i++) {
            log.info("Iteration: {}", i);
        }

        return "Hello World!";
    }
}