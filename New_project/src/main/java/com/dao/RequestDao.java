package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.model.WebsiteRequest;
import com.utility.DbConnection;

public class RequestDao {

    public boolean bookWebsite(WebsiteRequest request) {

        boolean status = false;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "INSERT INTO website_requests "
                    + "(user_id, template_id, requirements) "
                    + "VALUES (?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, request.getUserId());
            ps.setInt(2, request.getTemplateId());
            ps.setString(3, request.getRequirements());

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

    public List<WebsiteRequest> getAllRequests() {

        List<WebsiteRequest> list = new ArrayList<>();

        try {

            Connection con = DbConnection.getConnection();

            String sql = "SELECT * FROM website_requests";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                WebsiteRequest request = new WebsiteRequest();

                request.setRequestId(rs.getInt("request_id"));
                request.setUserId(rs.getInt("user_id"));
                request.setTemplateId(rs.getInt("template_id"));
                request.setRequirements(rs.getString("requirements"));
                request.setRequestDate(rs.getString("request_date"));
                request.setStatus(rs.getString("status"));
                request.setAdminMessage(rs.getString("admin_message"));

                list.add(request);
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    public boolean updateRequestStatus(int requestId,
                                       String status,
                                       String adminMessage) {

        boolean result = false;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "UPDATE website_requests "
                    + "SET status=?, admin_message=? "
                    + "WHERE request_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, status);
            ps.setString(2, adminMessage);
            ps.setInt(3, requestId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    public boolean deleteRequest(int requestId) {

        boolean result = false;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "DELETE FROM website_requests WHERE request_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, requestId);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}