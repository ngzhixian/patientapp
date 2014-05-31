package com;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
@WebServlet(urlPatterns = {"/patientRegistration"})
public class PatientRegistration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void init(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/patientRegistration.jsp").forward(request, response);

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
        Long mobileInt = 0L;
        Long homeNoInt = 0L;
        String title = request.getParameter("title");
        String mobile = request.getParameter("mobile").trim();
        String homeNo = request.getParameter("homeNo").trim();
        String medicalFund = request.getParameter("medicalFund");

        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String unitNo = request.getParameter("unitNo");
        String state = request.getParameter("state");
        String streetNo = request.getParameter("streetNo");
        String streetName = request.getParameter("streetName");
        String suburb = request.getParameter("suburb");
        String postCode = request.getParameter("postCode");

        PatientDO patient = new PatientDO();
        AddressDO address = new AddressDO();
        address.setUnitNo(unitNo);
        address.setState(state);
        address.setStreetNo(streetNo);
        address.setStreetName(streetName);
        address.setSuburb(suburb);
        address.setPostcode(postCode);


        patient.setTitle(title);
        patient.setMobile(mobile);
        patient.setHomeNo(homeNo);
        patient.setMedicalFund(medicalFund);
        patient.setFirstName(firstName);
        patient.setLastName(lastName);
        patient.setGender(gender);
        patient.setDob(dob);

        Database db = new Database();
        Integer patientId = db.insertPatient(patient);
        Integer addressId = db.insertAddress(address, patientId);

        HttpSession session = request.getSession();
        session.setAttribute("newPatientId", patientId);
        session.removeAttribute("errorNoPatient");
        response.sendRedirect("Index");

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
