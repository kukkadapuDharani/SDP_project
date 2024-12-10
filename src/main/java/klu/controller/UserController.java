package klu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import klu.model.User;
import klu.model.UserManager;
import klu.repository.UserRepository;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    UserManager UM;

    @Autowired
    UserRepository userRepository;

    @PostMapping("/save")
    public String save(@RequestBody User U) {
        return UM.saveUser(U);
    }
    @PostMapping("/signup")
    public String signUp(@RequestBody User user) {
        try {
            // Check if username already exists
            if (userRepository.validateUsername(user.getUsername()) > 0) {
                throw new Exception("Username already exists!");
            }

            // Check if email already exists
            if (userRepository.validateEmail(user.getEmailid()) > 0) {
                throw new Exception("Email already registered!");
            }

            // Save the user to the database
            userRepository.save(user);
            return "User registered successfully!";
        } catch (Exception e) {
            return e.getMessage();
        }
    }

    @GetMapping("/login/{uname}/{pwd}")
    public String login(@PathVariable("uname") String un, @PathVariable("pwd") String pw) {
        return UM.loginUser(un, pw);
    }

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        String uname = user.getUsername();
        String pwd = user.getPassword();
        // Validate credentials using the repository
        if (userRepository.validateCredentials(uname, pwd) > 0) {
            return "User logged in successfully!";
        } else {
            return "Invalid credentials!";
        }
    }

    


}
