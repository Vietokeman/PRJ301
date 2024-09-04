<%@ page import="Utils.DBUtils" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Edit</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./style.css"/>
    <style>
        body {
            background: url("https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100");
        }
        .form-container {
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Shadow for the form container */
            margin-top: 100px; /* Adjusted space from the top */
        }
        .btn-primary {
            margin-left: 230px; /* Adjusted button position */
        }
        .text-danger {
            margin-left: 238px; /* Adjusted link position */
        }
    </style>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 form-container"> <!-- Adjust column width as needed -->
            <%
                if (session == null || session.getAttribute("username") == null) {
                    response.sendRedirect("login.jsp");
                }

                int id = Integer.parseInt(request.getParameter("id"));
                Connection conn = DBUtils.getConnection();
                PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Appointments WHERE id = ?");
                stmt.setInt(1, id);
                ResultSet rs = stmt.executeQuery();
                if (rs.next()) {
            %>
            <form action="MainController" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <div class="mb-3">
                    <label class="form-label">Date:</label>
                    <input type="date" name="appointmentDate" class="form-control" value="<%= rs.getDate("appointmentDate") %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Time:</label>
                    <input type="time" name="appointmentTime" class="form-control" value="<%= rs.getTime("appointmentTime") %>" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Purpose:</label>
                    <input type="text" name="purpose" class="form-control" value="<%= rs.getString("purpose") %>" required>
                </div>
                <input class="btn btn-primary" type="submit" value="Save Changes" name="action">
            </form>
            <%
                }
                stmt.close();
                conn.close();
            %>
            <a class="text text-danger" href="viewAppointments.jsp">Back to Appointments</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
