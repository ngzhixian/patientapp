/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.io.IOException;
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
@WebServlet(name = "newPatientDetails", urlPatterns = {"/NewPatientDetails"})
public class NewPatientDetails extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        String pracId =  request.getParameter("practitionerId");
        Integer pracIdConvert = 0;
        if (pracId != null || pracId != ""){
            pracIdConvert = Integer.parseInt(pracId);
        }
        String pracName =  request.getParameter("practitionerName");
        Integer patientId = Integer.parseInt(request.getParameter("patientId"));
        String dateOfTreatment = request.getParameter("dateOfConsultation");
        System.out.println(dateOfTreatment);
        String symptoms = request.getParameter("symptoms");
        String chiefComplaints = request.getParameter("chiefComplaints");
        String presentSymptoms = request.getParameter("presentSymptoms");
        String otherSymptoms = request.getParameter("otherSymptoms");
        String tongue = request.getParameter("tongue");
        String pulse = request.getParameter("pulse");
        String tcmDd = request.getParameter("tcmDd");
        String tcmSd = request.getParameter("tcmSd");
        String aetPath = request.getParameter("aetPath");
        String westMd = request.getParameter("westMd");
        String acupuncture = request.getParameter("acupuncture");
        String herbs = request.getParameter("herbs");
        String remedialMassage = request.getParameter("remedialMassage");
        String principleOfTreatment = request.getParameter("principleOfTreatment");
        String treatmentPlan = request.getParameter("treatmentPlan");
        String advicce = request.getParameter("advice");
        
        String outcome = request.getParameter("outcome");
        
        String finalPatientRecord = request.getParameter("finalPatientRecord");
        
        PatientRecordsDO record = new PatientRecordsDO();
        record.setDateOfConsultation(dateOfTreatment);
        record.setSymptoms(symptoms);
        record.setChiefComplaints(chiefComplaints);
        record.setPresentSymptoms(presentSymptoms);
        record.setOtherSymptoms(otherSymptoms);
        record.setTongue(tongue);
        record.setAdvice(advicce);
        record.setOutcome(outcome);
        record.setPrincipleTreatment(principleOfTreatment);
        record.setTreatmentPlan(treatmentPlan);
        record.setPulse(pulse);
        record.setAcupuncture(acupuncture);
        record.setAetPath(aetPath);
        record.setTcmDd(tcmDd);
        record.setTcmSd(tcmSd);
        record.setWesternMed(westMd);
        record.setHerbs(herbs);
        record.setRemedialMassage(remedialMassage);
        record.setFinalPatientRecord(finalPatientRecord);
        
        Boolean update = false; 
        HttpSession session = request.getSession();
        Integer recordId = 0;
        if(session.getAttribute("singleRecord")!= null){
            update = true;
            record.setRecordId(Integer.parseInt(request.getParameter("recordId")));
        }
        Database db = new Database();
        
        recordId = db.insertRecord(record, patientId, pracIdConvert, pracName, update);
        
        if (update == false){
        Integer orderNo = db.insertPatientRecordMap(patientId, recordId);
        System.out.println(orderNo);
        }
        request.getRequestDispatcher("PatientRecords").forward(request, response);        
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
