package com.rean;

import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@RequestMapping("/api/v1")
public class HelloController {

    @GetMapping("hello")
    public ResponseEntity<Object> hello() {
        log.info("Hello ...");
        return new ResponseEntity<>("Hello", HttpStatus.OK);
    }
}
