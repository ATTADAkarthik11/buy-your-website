package com.controller;

import java.io.IOException;

import com.dao.RequestDao;
import com.model.User;
import com.model.WebsiteRequest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/BookWebsiteController")
public class BookWebsiteController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int templateId = Integer.parseInt(
                request.getParameter("templateId")
        );

        String requirements = request.getParameter("requirements");

        HttpSession session = request.getSession(false);

        User user = (User) session.getAttribute("user");

        if (user != null) {

            WebsiteRequest websiteRequest =
                    new WebsiteRequest(
                            user.getUserId(),
                            templateId,
                            requirements
                    );

            RequestDao dao = new RequestDao();

            boolean result = dao.bookWebsite(websiteRequest);

            if (result) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendRedirect("booking.jsp");
            }

        } else {

            response.sendRedirect("login.jsp");
        }
    }
}