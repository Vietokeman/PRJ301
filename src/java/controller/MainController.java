/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})

public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String LOGIN_SERVLET = "LoginController";
    private static final String LOGOUT_SERVLET = "LogoutController";
    private static final String REGISTER_SERVLET = "RegisterController";

    private static final String CREATE_SERVLET = "CreateController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            if (action == null) {
                url = LOGIN_PAGE;
            } //            your code here
            else if (action.equalsIgnoreCase("Login")) {
                url = LOGIN_SERVLET;
            } else if (action.equalsIgnoreCase("Register")) {
                url = REGISTER_SERVLET;
            } else if (action.equalsIgnoreCase("Logout")) {
                url = LOGOUT_SERVLET;
            } else if (action.equalsIgnoreCase("Create Appointment")) {
                url = CREATE_SERVLET;
            }
            else if (action.equalsIgnoreCase("open")) {
                url = "OpenServlet";
            }
            else if (action.equalsIgnoreCase("Save Changes")) {
                url = "EditController";
            }
            else if (action.equalsIgnoreCase("completed")) {
                url = "CompleteController";
            }
            else if (action.equalsIgnoreCase("unCompleted")) {
                url = "UnCompleteController";
            }
            else if (action.equalsIgnoreCase("cancel")) {
                url = "CancelController";
            }
            else if (action.equalsIgnoreCase("Reminder")) {
                url = "ReminderController";
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
