/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Sean
 */
@WebServlet(name = "MaintainDropDown", urlPatterns = {"/MaintainDropDown"})
public class MaintainDropDown extends HttpServlet {

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
        
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        String keyTy = request.getParameter("selectDdForEdit");
        System.out.println(keyTy);
        String actionTy = request.getParameter("actionTy");
        System.out.println(actionTy);

        String dropDownItemToBeRemove = request.getParameter("existingList");
                System.out.println(dropDownItemToBeRemove);

        String newItem = request.getParameter("newItem");
                        System.out.println(newItem);

        Database db = new Database();

        if ("remove".equalsIgnoreCase(actionTy) && dropDownItemToBeRemove != null) {
            System.out.println(actionTy);
            db.removeDropDownValue(dropDownItemToBeRemove, keyTy);
        } else if ("add".equalsIgnoreCase(actionTy) && newItem != null) {
            System.out.println(actionTy);
            db.insertDropDownValue(newItem, keyTy);

        }

        ArrayList masterDrop = db.retrieveSingleDropDownValues(keyTy);

        session.setAttribute("MasterSingleDrop", masterDrop);
        session.setAttribute("KeyTy", keyTy);

        response.sendRedirect("ApplicationMaintainence");

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
