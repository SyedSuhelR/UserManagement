package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import utils.DBUtil;


@WebServlet("/requestAccess")
public class RequestServlet extends HttpServlet {
	

	    // Handle GET request to retrieve software list
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        List<String[]> softwareList = new ArrayList<>();
	        
	        // Retrieve software list from the database
	        try (Connection conn = DBUtil.getConnection()) {
	            String sql = "SELECT id, name FROM software"; // Make sure the table name is correct
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            ResultSet rs = stmt.executeQuery();
	            
	            // Populate software list
	            while (rs.next()) {
	                String[] software = {String.valueOf(rs.getInt("id")), rs.getString("name")};
	                softwareList.add(software);
	            }
	            request.setAttribute("softwareList", softwareList);
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            request.setAttribute("error", "Failed to retrieve software list.");
	        }

	        // Forward request to the JSP page
	        request.getRequestDispatcher("requestAccess.jsp").forward(request, response);
	    }

	    // Handle POST request to submit the access request
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        HttpSession session = request.getSession();
	        String username = (String) session.getAttribute("username");
	        int softwareId = Integer.parseInt(request.getParameter("software_id"));
	        String accessType = request.getParameter("access_type");
	        String reason = request.getParameter("reason");

	        // Insert access request into the database
	        try (Connection conn = DBUtil.getConnection()) {
	            String sql = "INSERT INTO requests (user_id, software_id, access_type, reason, status) " +
	                         "VALUES ((SELECT id FROM users WHERE username = ?), ?, ?, ?, 'Pending')";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, username);
	            stmt.setInt(2, softwareId);
	            stmt.setString(3, accessType);
	            stmt.setString(4, reason);
	            stmt.executeUpdate();
	            
	            // Redirect with success message
	            response.sendRedirect("requestAccess.jsp?success=Request Submitted");
	            
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("requestAccess.jsp?error=Failed to submit request.");
	        }
	    }
	}
