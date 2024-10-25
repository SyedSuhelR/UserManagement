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

@WebServlet("/approveRequest")
public class ApprovalServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestIdParam = request.getParameter("request_id");
        String action = request.getParameter("action");

        // Validate input
        if (requestIdParam == null || action == null || (!action.equals("approve") && !action.equals("reject"))) {
            response.sendRedirect("pendingRequests.jsp?error=Invalid request");
            return;
        }

        int requestId;
        try {
            requestId = Integer.parseInt(requestIdParam);
        } catch (NumberFormatException e) {
            response.sendRedirect("pendingRequests.jsp?error=Invalid request ID");
            return;
        }

        try (Connection conn = DBUtil.getConnection()) {
            String sql = "UPDATE requests SET status = ? WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, action.equals("approve") ? "Approved" : "Rejected");
            stmt.setInt(2, requestId);
            stmt.executeUpdate();
            response.sendRedirect("pendingRequests.jsp?success=Request " + action + "d successfully");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("pendingRequests.jsp?error=Failed to update request status");
        }
    }
}