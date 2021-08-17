package com.telstra.jwt.controller;

import com.telstra.jwt.model.JwtResponse;
import com.telstra.jwt.utility.JWTUtility;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @Autowired
    private JWTUtility jwtUtility;

    @Autowired
    private AuthenticationManager authenticationManager;

    @GetMapping("/")
    public String home(){
        return "I love spring security";
    }

    @PostMapping("/authenticate")
    public JwtResponse authenticate(@RequestBody JwtResponse jwtResponse)
    {


    }
}
