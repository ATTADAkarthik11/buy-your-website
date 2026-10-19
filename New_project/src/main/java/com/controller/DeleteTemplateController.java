package com.controller;

import java.io.IOException;

import com.dao.TemplateDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/DeleteTemplateController")
public class DeleteTemplateController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int templateId = Integer.parseInt(
                request.getParameter("id")
        );

        TemplateDao dao = new TemplateDao();

        dao.deleteTemplate(templateId);

        response.sendRedirect("AdminHome.jsp");
    }
}