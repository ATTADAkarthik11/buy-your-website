package com.controller;

import java.io.IOException;

import com.dao.UserDao;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterController")
public class RegisterController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("================================");
        System.out.println("REGISTER CONTROLLER REACHED");
        System.out.println("================================");

        String username = request.getParameter("username");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String aadhaar = request.getParameter("aadhaar");
        String pan = request.getParameter("pan");
        String password = request.getParameter("password");

        System.out.println("Username  : " + username);
        System.out.println("Firstname : " + firstname);
        System.out.println("Lastname  : " + lastname);
        System.out.println("Email     : " + email);
        System.out.println("Mobile    : " + mobile);
        System.out.println("Aadhaar   : " + aadhaar);
        System.out.println("PAN       : " + pan);

        User user = new User(
                username,
                firstname,
                lastname,
                email,
                mobile,
                aadhaar,
                pan,
                password
        );

        UserDao dao = new UserDao();

        boolean result = dao.registerUser(user);

        System.out.println("Registration result = " + result);

        if (result) {

            System.out.println("USER INSERTED SUCCESSFULLY");

            response.sendRedirect("login.jsp");

        } else {

            System.out.println("USER INSERT FAILED");

            response.sendRedirect("register.jsp");
        }
    }
}