package com.controller;

import java.io.IOException;

import com.dao.RequestDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AdminRequestController")
public class AdminRequestController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int requestId = Integer.parseInt(
                request.getParameter("requestId")
        );

        String status = request.getParameter("status");
        String adminMessage = request.getParameter("adminMessage");

        RequestDao dao = new RequestDao();

        boolean result = dao.updateRequestStatus(
                requestId,
                status,
                adminMessage
        );

        if (result) {
            response.sendRedirect("AdminHome.jsp");
        } else {
            response.sendRedirect("AdminHome.jsp");
        }
    }
}