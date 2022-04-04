/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.LoginDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Client;
import model.User;

/**
 *
 * @author dotav
 */
@WebServlet(name = "ControlLogin", urlPatterns = {"/ControlLogin"})
public class ControlLogin extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try{
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            LoginDAO loginDAO = new LoginDAO();
            
            User u = new User(user,pass);
            String role = loginDAO.checkLogin(u);
            int id = loginDAO.getID(u);
            if (role.equals("client")) {
                HttpSession session = request.getSession();
                session.setAttribute("clientid", id);
                session.setAttribute("username", user);
                response.sendRedirect("ClientHomepage.jsp");
            }
            else if (role.equals("admin")){
                response.sendRedirect("AdminHomepage.jsp");
            }
            else if (role.equals("receptionist")){
                response.sendRedirect("Payment/ReceptionistHomepage.jsp");
            }
            else response.sendRedirect("login.jsp");
        }
        catch (Exception e){
            throw new ServletException("Login failed", e);
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
