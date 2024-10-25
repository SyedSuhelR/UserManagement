package servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import utils.DBUtil;

@WebServlet("/createSoftware")
public class SoftwareServlet extends HttpServlet {
	

	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String softwareName = request.getParameter("name");
	        String description = request.getParameter("description");
	        String[] accessLevelsArray = request.getParameterValues("access_levels");
	        String accessLevels = String.join(",", accessLevelsArray); // Convert to a comma-separated string

	        try (Connection conn = DBUtil.getConnection()) {
	            String sql = "INSERT INTO software (name, description, access_levels) VALUES (?, ?, ?)";
	            PreparedStatement stmt = conn.prepareStatement(sql);
	            stmt.setString(1, softwareName);
	            stmt.setString(2, description);
	            stmt.setString(3, accessLevels);
	            stmt.executeUpdate();
	            response.sendRedirect("createSoftware.jsp?success=Software Created");
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.sendRedirect("createSoftware.jsp?error=Failed to create software.");
	        }
	    }
	}







