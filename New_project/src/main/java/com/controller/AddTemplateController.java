package com.controller;

import java.io.IOException;

import com.dao.TemplateDao;
import com.model.WebsiteTemplate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/AddTemplateController")
public class AddTemplateController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String templateName = request.getParameter("templateName");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double price = Double.parseDouble(
                request.getParameter("price")
        );
        String demoImage = request.getParameter("demoImage");

        WebsiteTemplate template = new WebsiteTemplate(
                templateName,
                description,
                category,
                price,
                demoImage,
                "ACTIVE"
        );

        TemplateDao dao = new TemplateDao();

        boolean result = dao.addTemplate(template);

        response.sendRedirect("AdminHome.jsp");
    }
}