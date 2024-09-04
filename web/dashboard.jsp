<%@page import="Utils.DBUtils"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url("https://images.unsplash.com/photo-1503602642458-232111445657?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=bf884ad570b50659c5fa2dc2cfb20ecf&auto=format&fit=crop&w=1000&q=100");
        }
        .form-container {

            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Shadow for the form container */
            margin-top: 250px; /* Space from the top */
        }

    </style>
</head>
<body>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }

    int userId = (int) session.getAttribute("userId");
    Connection conn = DBUtils.getConnection();
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM Appointments WHERE userId = ? AND status = 'Scheduled'");
    stmt.setInt(1, userId);
    ResultSet rs = stmt.executeQuery();
%>

<!-- Header -->
<h2 class="mt-3 text-center">Dashboard</h2>

<p class="text-center">Welcome, <%= session.getAttribute("username")%></p>
<p class="text-center">Email: <%= session.getAttribute("email")%></p>

<form method="POST" action="MainController">
    <button class="btn btn-outline-danger mb-3 col-md-12"  name="action" value="logout">Logout</button>
</form>

<h3 class="text-center mb-3">Upcoming Appointments</h3>
<table class="table" border="1">
    <tr>
        <th scope="col">Date</th>
        <th scope="col">Time</th>
        <th scope="col">Purpose</th>
        <th scope="col">Status</th>
    </tr>
    <%
        while (rs.next()) {
    %>
    <tr>
        <td><%= rs.getDate("appointmentDate")%></td>
        <td><%= rs.getTime("appointmentTime")%></td>
        <td><%= rs.getString("purpose")%></td>
        <td><%= rs.getString("status")%></td>
    </tr>
    <%
        }
        stmt.close();
        conn.close();
    %>
</table>

<div class="row d-flex justify-content-center">
    <a class="col-md-3 btn btn-outline-primary mt-3 me-3 rainbow-btn" href="createAppointment.jsp">Create New Appointment</a>
    <a class="col-md-3 btn btn-outline-primary mt-3 me-3 rainbow-btn" href="viewAppointments.jsp">View All Appointments</a>
    <a class="col-md-3 btn btn-outline-primary mt-3 rainbow-btn" href="appointmentHistory.jsp">View Appointment History</a>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>

</body>
</html>
