package com;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@WebServlet(urlPatterns = {"/PatientRecords"})
public class PatientRecordsServlet extends HttpServlet {

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
        HttpSession session = request.getSession();
        Integer patientId = 0;
        Integer patientListId = 0;
        if (session.getAttribute("patientListIdReload") !=null){
            patientListId = (Integer) session.getAttribute("patientListIdReload");
        }else {
            patientListId = Integer.parseInt(request.getParameter("patientListId"));        
        }
        System.out.println(patientListId + "patientListId");

        ArrayList patientDOlist = (ArrayList) session.getAttribute("patientDOlist");
        PatientDO patient = new PatientDO();
        patient = (PatientDO) patientDOlist.get(patientListId);
        patientId = patient.getPatientId();
        System.out.println(patientId + "PATIENT ID LOR");
        session.setAttribute("patientDO", patient);
        session.setAttribute("patientId", patientId);
        session.setAttribute("patientListIdReload", patientListId);

        Database db = new Database();
        ArrayList patientRecordList = db.retrievePatientRecords(patientId);
        System.out.println(patientRecordList);
        session.setAttribute("patientRecordList", patientRecordList);
        response.sendRedirect("PatientRecord");

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
