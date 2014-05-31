/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
import java.util.*;
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
@WebServlet(name = "PatientSearchServlet", urlPatterns = {"/PatientSearchServlet"})
public class PatientSearchServlet extends HttpServlet {

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

        String searchCondition = request.getParameter("searchCondition");

        String sFirstName = request.getParameter("firstName");
        String slastName = request.getParameter("lastName");
        String sPatientId = request.getParameter("patientId");
        String sMobile = request.getParameter("mobile");

        SearchCriteriaDO searchCrit = new SearchCriteriaDO();
        searchCrit.setFirstName(sFirstName);
        searchCrit.setLastName(slastName);
        searchCrit.setPatientId(sPatientId);
        searchCrit.setMobile(sMobile);
        searchCrit.setSearchOption(Integer.parseInt(searchCondition));

        String sUnitNo = request.getParameter("unitNo");
        String sStreet = request.getParameter("street");
        String sStreetNo = request.getParameter("streetNo");
        //String sStreetType = request.getParameter("streetType");
        String sState = request.getParameter("state");
        String sSuburb = request.getParameter("suburb");
        String sPostcode = request.getParameter("postCode");

        searchCrit.setUnitNo(sUnitNo);
        searchCrit.setState(sState);
        searchCrit.setStreet(sStreet);
        searchCrit.setStreetNo(sStreetNo);
        searchCrit.setSuburb(sSuburb);
        searchCrit.setPostcode(sPostcode);
        //searchCrit.setStreetType(sStreetType);

        Database db = new Database();
        ArrayList patientDOlist = new ArrayList();
            patientDOlist = db.searchPatient(searchCrit);

            //patientDOlist = db.searchPatientByAddress(searchCrit);



        HttpSession session = request.getSession();
        session.setAttribute("patientDOlist", patientDOlist);
        session.removeAttribute("patientListIdReload");
        session.removeAttribute("patientDO");
        session.removeAttribute("patientId");
        session.removeAttribute("patientRecordList");
        session.removeAttribute("newPatientId");

        response.sendRedirect("PatientSearchResults");

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
