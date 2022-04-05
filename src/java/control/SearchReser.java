/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.ReserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Reser;

/**
 *
 * @author dotav
 */
@WebServlet(name = "SearchReser", urlPatterns = {"/SearchReser"})
public class SearchReser extends HttpServlet {

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
        try {
            String servlet = "/RestaurantManagement/CreateReceipt";
            String clientname = (String) request.getParameter("clientname");
            ReserDAO rsdao = new ReserDAO();
            ArrayList<Reser> rs = rsdao.getOrderedReser(clientname);
            PrintWriter out = response.getWriter();
            out.println("<table class =\"table\">\n" +
"                <tr bgcolor=\"c5d9f1\">\n" +
"                    <th style =\"padding: 1rem;\"><strong>Customer</strong></th>\n" +
"                    <th><strong>Phone number</strong></th>\n" +
"                    <th><strong>Guest number</strong></th>\n" +
"                    <th><strong>Date</strong></th>\n" +
"                    <th><strong>Time</strong></th>\n" +
"                    <th>Action</th>"
                    + "</tr>");
            int cnt=0;
            for (Reser i:rs){
                cnt++;
                out.println("<tr bgcolor=\"ffffff\">\n" +
                                "<td style =\"padding: 1.2rem;\">"+i.getName()+"</td>\n" +
                                "<td>"+i.getPhone()+"</td>\n" +
                                "<td>"+i.getQuantity()+"</td>\n" +
                                "<td>"+i.getDate()+"</td>\n" +
                                "<td>"+i.getTime()+"</td>\n" +
                                "<td>\n" +
                                    "<form action=\""+servlet+"\">\n" +
                                        "<button name=\"reser_id\" value = \""+i.getId()+"\" type = \"submit\" class=\"btn-payment\" >Confirm payment</button>\n" +
                                    "</form>"+                               
                                "</td>\n" +
                            "</tr>");
            }
            out.println("</table>");
        }
        catch (IOException e) {
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
