package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.model.User;
import com.utility.DbConnection;

public class UserDao {

	public boolean registerUser(User user) {

	    boolean status = false;

	    try {

	        Connection con = DbConnection.getConnection();

	        if (con == null) {
	            System.out.println("DATABASE CONNECTION IS NULL");
	            return false;
	        }

	        String sql = "INSERT INTO users "
	                + "(username, firstname, lastname, email, mobile, aadhaar, pan, password) "
	                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

	        PreparedStatement ps = con.prepareStatement(sql);

	        ps.setString(1, user.getUsername());
	        ps.setString(2, user.getFirstname());
	        ps.setString(3, user.getLastname());
	        ps.setString(4, user.getEmail());
	        ps.setString(5, user.getMobile());
	        ps.setString(6, user.getAadhaar());
	        ps.setString(7, user.getPan());
	        ps.setString(8, user.getPassword());

	        int result = ps.executeUpdate();

	        System.out.println("INSERT RESULT = " + result);

	        if (result > 0) {
	            status = true;
	            System.out.println("USER REGISTERED SUCCESSFULLY");
	        }

	        ps.close();
	        con.close();

	    } catch (Exception e) {

	        System.out.println("========== REGISTRATION ERROR ==========");
	        e.printStackTrace();
	    }

	    return status;
	}

    public User loginUser(String username, String password) {

        User user = null;

        try {

            Connection con = DbConnection.getConnection();

            String sql = "SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                user = new User();

                user.setUserId(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setFirstname(rs.getString("firstname"));
                user.setLastname(rs.getString("lastname"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setAadhaar(rs.getString("aadhaar"));
                user.setPan(rs.getString("pan"));
                user.setPassword(rs.getString("password"));
            }

            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }
}
