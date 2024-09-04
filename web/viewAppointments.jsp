<%@page import="Utils.DBUtils"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>View Appointments</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./style.css"/>
    <style>
        body {
            background: url("https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100");
        }
        .container {
            margin-top: 50px;
        }
        .btn-group {
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col">
            <h2 class="text-center">All Appointments</h2>
            <table class="table table-bordered table-hover">
                <thead class="table-dark">
                <tr>
                    <th scope="col">Date</th>
                    <th scope="col">Time</th>
                    <th scope="col">Purpose</th>
                    <th scope="col">Status</th>
                    <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    if (session == null || session.getAttribute("username") == null) {
                        response.sendRedirect("login.jsp");
                    }
                    int userId = (int) session.getAttribute("userId");
                    Connection conn = DBUtils.getConnection();
                    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Appointments WHERE userId = ?");
                    stmt.setInt(1, userId);
                    ResultSet rs = stmt.executeQuery();
                    while (rs.next()) {
                        String status = rs.getString("status");
                %>
                <tr>
                    <td><%= rs.getDate("appointmentDate") %></td>
                    <td><%= rs.getTime("appointmentTime") %></td>
                    <td><%= rs.getString("purpose") %></td>
                    <td><%= status %></td>
                    <td>
                        <div class="btn-group" role="group" aria-label="Appointment Actions">
                            <a class="btn btn-warning" href="editAppointment.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                            <form action="MainController" method="post" style="display: inline;">
                                <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                                <input type="hidden" name="userId" value="<%= userId %>">
                                <% if ("Cancelled".equals(status)) { %>
                                    <button class="btn btn-success" name="action" value="open">Open</button>
                                    <button class="btn btn-success" name="action" value="completed">Completed</button>
                                <% } else if ("Completed".equals(status)) { %>
                                    <button class="btn btn-primary" name="action" value="unCompleted">Un-Completed</button>
                                <% } else if ("Scheduled".equals(status)) { %>
                                    <button class="btn btn-danger" name="action" value="cancel">Cancel</button>
                                    <button class="btn btn-success" name="action" value="completed">Completed</button>
                                <% } %>
                                <button class="btn btn-success" name="action" value="reminder">Reminder</button>
                            </form>
                        </div>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
            <a class="btn btn-primary" href="dashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
