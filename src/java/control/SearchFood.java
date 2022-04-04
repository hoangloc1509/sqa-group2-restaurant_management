/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import dao.DishDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Dish;

/**
 *
 * @author dotav
 */
@WebServlet(name = "SearchFood", urlPatterns = {"/SearchFood"})
public class SearchFood extends HttpServlet {

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
            String dish_name = request.getParameter("dishname");
            String type = request.getParameter("type");
            if (type.equals("all")){
                DishDAO dishdao = new DishDAO();
                List<Dish> res = dishdao.getAllDish(dish_name);
                request.setAttribute("listDish", res);
                PrintWriter out = response.getWriter();
                RequestDispatcher rd = request.getRequestDispatcher("OrderFood/SelectFood.jsp");
                rd.forward(request, response);
            }
            else if (type.equals("appetit")){
                DishDAO dishdao = new DishDAO();
                List<Dish> res = dishdao.getAppetitDish(dish_name);
                request.setAttribute("listDish", res);
                PrintWriter out = response.getWriter();
                RequestDispatcher rd = request.getRequestDispatcher("OrderFood/SelectFood.jsp");
                rd.forward(request, response);
            } 
            else if (type.equals("main")){
                DishDAO dishdao = new DishDAO();
                List<Dish> res = dishdao.getMainDish(dish_name);
                request.setAttribute("listDish", res);
                PrintWriter out = response.getWriter();
                RequestDispatcher rd = request.getRequestDispatcher("OrderFood/SelectFood.jsp");
                rd.forward(request, response);
            }
            else if (type.equals("dessert")){
                DishDAO dishdao = new DishDAO();
                List<Dish> res = dishdao.getDessertDish(dish_name);
                request.setAttribute("listDish", res);
                PrintWriter out = response.getWriter();
                RequestDispatcher rd = request.getRequestDispatcher("OrderFood/SelectFood.jsp");
                rd.forward(request, response);
            }
            else if (type.equals("drink")){
                DishDAO dishdao = new DishDAO();
                List<Dish> res = dishdao.getDrink(dish_name);
                request.setAttribute("listDish", res);
                PrintWriter out = response.getWriter();
                RequestDispatcher rd = request.getRequestDispatcher("OrderFood/SelectFood.jsp");
                rd.forward(request, response);
            }
        } catch (Exception e) {
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
