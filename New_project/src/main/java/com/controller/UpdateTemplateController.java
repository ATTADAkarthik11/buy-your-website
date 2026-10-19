package com.controller;

import java.io.IOException;

import com.dao.TemplateDao;
import com.model.WebsiteTemplate;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateTemplateController")
public class UpdateTemplateController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        int templateId = Integer.parseInt(
                request.getParameter("templateId")
        );

        String templateName = request.getParameter("templateName");
        String description = request.getParameter("description");
        String category = request.getParameter("category");
        double price = Double.parseDouble(
                request.getParameter("price")
        );
        String demoImage = request.getParameter("demoImage");
        String status = request.getParameter("status");

        WebsiteTemplate template = new WebsiteTemplate();

        template.setTemplateId(templateId);
        template.setTemplateName(templateName);
        template.setDescription(description);
        template.setCategory(category);
        template.setPrice(price);
        template.setDemoImage(demoImage);
        template.setStatus(status);

        TemplateDao dao = new TemplateDao();

        dao.updateTemplate(template);

        response.sendRedirect("AdminHome.jsp");
    }
}