package com.uor.fot.Complain.Management.System.controller;

import com.uor.fot.Complain.Management.System.dto.RegistrationResponseDto;
import com.uor.fot.Complain.Management.System.dto.UserRegistrationDTO;
import com.uor.fot.Complain.Management.System.dto.UserUpdateDTO;
import com.uor.fot.Complain.Management.System.model.User;
import com.uor.fot.Complain.Management.System.model.UserRole;
import com.uor.fot.Complain.Management.System.service.FacultyService;
import com.uor.fot.Complain.Management.System.service.UserRoleService;
import com.uor.fot.Complain.Management.System.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    private static final String SUCCESS_MESSAGE = "User registered successfully.";
    private static final String INTERNAL_ERROR_MESSAGE = "An error occurred during registration.";

    private final UserService userService;
    private final UserRoleService userRoleService;
    private final FacultyService facultyService;

    @Autowired
    public UserController(UserService userService, UserRoleService userRoleService, FacultyService facultyService) {
        this.userService = userService;
        this.userRoleService = userRoleService;
        this.facultyService = facultyService;
    }

    // Create a new user
    @PostMapping("/register")
    public String registerUser(@ModelAttribute UserRegistrationDTO userRegistrationDTO, RedirectAttributes redirectAttributes) {
        // validate request
        validateRequest(userRegistrationDTO);
        boolean isCreated = userService.createUser(userRegistrationDTO);
        if (isCreated) {
            redirectAttributes.addFlashAttribute("registrationSuccess", true);
            return "redirect:/login";
        } else {
            redirectAttributes.addFlashAttribute("registrationSuccess", false);
            // handle the error case
            return "redirect:/register";
        }
    }

    private void validateRequest(UserRegistrationDTO request) {
        if (request == null) {
            throw new IllegalArgumentException("Request cannot be null");
        }

        if (request.getEmail() == null || request.getEmail().isEmpty()) {
            throw new IllegalArgumentException("Email address is required");
        }

        if (request.getPassword() == null || request.getPassword().isEmpty()) {
            throw new IllegalArgumentException("Password is required");
        }

        if (request.getFirstName() == null || request.getFirstName().isEmpty()) {
            throw new IllegalArgumentException("First name is required");
        }

        if (request.getLastName() == null || request.getLastName().isEmpty()) {
            throw new IllegalArgumentException("Last name is required");
        }

        if (request.getContact() == null || request.getContact().isEmpty()) {
            throw new IllegalArgumentException("Mobile number is required");
        }
    }

    // Get all users
    @GetMapping("/get/all")
    public ResponseEntity<List<User>> getAllUsers() {
        List<User> users = userService.getAllUsers();
        return new ResponseEntity<>(users, HttpStatus.OK);
    }

    // Get user by ID
    @GetMapping("/get/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        User user = userService.getUserById(id);
        if (user != null) {
            return new ResponseEntity<>(user, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Update user
    @PutMapping("/update/{id}")
    public ResponseEntity<User> updateUser(@PathVariable Long id, @RequestBody UserUpdateDTO userUpdateDTO) {
        // Map the UserUpdateDTO to a User entity
        User user = mapUpdateDTOToUser(id, userUpdateDTO);

        User updatedUser = userService.updateUser(id, user);
        if (updatedUser != null) {
            return new ResponseEntity<>(updatedUser, HttpStatus.OK);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Delete user by ID
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<Void> deleteUser(@PathVariable Long id) {
        boolean deleted = userService.deleteUser(id);
        if (deleted) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        } else {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
    }

    // Helper method to map UserUpdateDTO to User
    private User mapUpdateDTOToUser(Long id, UserUpdateDTO userUpdateDTO) {
        User user = new User();
        user.setId(id);
        user.setFirstName(userUpdateDTO.getFirstName());
        user.setLastName(userUpdateDTO.getLastName());
        user.setEmail(userUpdateDTO.getEmail());
        user.setPassword(userUpdateDTO.getPassword());
        user.setContact(userUpdateDTO.getContact());
        // Get user role
        UserRole role = userRoleService.getUserRoleById(userUpdateDTO.getRole());
        user.setRole(role);

        return user;
    }
}

