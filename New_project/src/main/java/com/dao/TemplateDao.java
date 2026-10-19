package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.WebsiteTemplate;
import com.utility.DbConnection;

public class TemplateDao {

    public List<WebsiteTemplate> getAllTemplates() {

        List<WebsiteTemplate> list = new ArrayList<>();

        try {

            Connection con = DbConnection.getConnection();

            String sql = "SELECT * FROM website_templates";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                WebsiteTemplate template = new WebsiteTemplate();

                template.setTemplateId(rs.getInt("template_id"));
                template.setTemplateName(rs.getString("template_name"));
                template.setDescription(rs.getString("description"));
                template.setCategory(rs.getString("category"));
                template.setPrice(rs.getDouble("price"));
                template.setDemoImage(rs.getString("demo_image"));
                template.setStatus(rs.getString("status"));

                list.add(template);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public WebsiteTemplate getTemplateById(int templateId) {

        WebsiteTemplate template = null;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "SELECT * FROM website_templates WHERE template_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, templateId);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                template = new WebsiteTemplate();

                template.setTemplateId(rs.getInt("template_id"));
                template.setTemplateName(rs.getString("template_name"));
                template.setDescription(rs.getString("description"));
                template.setCategory(rs.getString("category"));
                template.setPrice(rs.getDouble("price"));
                template.setDemoImage(rs.getString("demo_image"));
                template.setStatus(rs.getString("status"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return template;
    }

    public boolean addTemplate(WebsiteTemplate template) {

        boolean status = false;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "INSERT INTO website_templates "
                    + "(template_name, description, category, price, demo_image, status) "
                    + "VALUES (?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, template.getTemplateName());
            ps.setString(2, template.getDescription());
            ps.setString(3, template.getCategory());
            ps.setDouble(4, template.getPrice());
            ps.setString(5, template.getDemoImage());
            ps.setString(6, template.getStatus());

            int result = ps.executeUpdate();

            if (result > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public boolean deleteTemplate(int templateId) {

        boolean status = false;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "DELETE FROM website_templates WHERE template_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, templateId);

            int result = ps.executeUpdate();

            if (result > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    public boolean updateTemplate(WebsiteTemplate template) {

        boolean status = false;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "UPDATE website_templates SET "
                    + "template_name=?, description=?, category=?, "
                    + "price=?, demo_image=?, status=? "
                    + "WHERE template_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, template.getTemplateName());
            ps.setString(2, template.getDescription());
            ps.setString(3, template.getCategory());
            ps.setDouble(4, template.getPrice());
            ps.setString(5, template.getDemoImage());
            ps.setString(6, template.getStatus());
            ps.setInt(7, template.getTemplateId());

            int result = ps.executeUpdate();

            if (result > 0) {
                status = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
}