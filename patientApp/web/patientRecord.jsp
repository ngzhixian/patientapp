<%-- 
    Document   : patientRecord
    Created on : May 10, 2014, 10:01:21 AM
    Author     : Sean
--%>
<%@include file="/validationLogin.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.PatientRecordsDO" %>
<%@ page import="com.PatientDO" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Records</title>

        <script>
            function decidePatientRecordId(a) {
                var listId = a;
                document.patientRecord.patientRecordListId.value = listId;
                document.patientRecord.submit();

            }

            function newPatientTreatment() {
                document.location.href = "NewPatientRecord";
            }
        </script>
    </head>
    <body>
        <span id ="menuItems" class="menuItems">

            <table border="1" cellpadding="15" cellspacing="0">
                <tr>


                    <td>
                        <ul class="btnMenuTab">
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/Index">Patient Search</a></li>
                            <li class="btnMenu" ><a class="active" href="<%=request.getContextPath()%>/PatientRecord">Patient Record</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/PatientRegistration">Patient Registration</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/ApplicationMaintainence">Application Maintainence</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/HomePage">Log Out</a></li>

                        </ul>

                    </td>
                </tr>
            </table>
        </span>
        <span id ="bodyContent" class="bodyContent">

            <%  ArrayList patientRecordList = new ArrayList();
                String disableNewTreatment = "";
                PatientDO patient = new PatientDO();
                if (session.getAttribute("patientRecordList") != null) {
                    patientRecordList = (ArrayList) session.getAttribute("patientRecordList");
                    patient = (PatientDO) session.getAttribute("patientDO");

                }
                if (session.getAttribute("singleRecord") != null) {
                    session.removeAttribute("singleRecord");
                }
                
            %>
            <form method = "post" name = "patientRecord" action = "PatientDetailsServlet">
                <% if (patient.getPatientId() == null) {%>
                <h2 class="error">Please search for a patient first using the search functionality.</h2>
                <% disableNewTreatment = "disabled";
                } else {%>
                <h2> Patient Record for <%= patient.getFirstName() + " " + patient.getLastName()%> </h2> 
                <%}%>   
                <table width="500px" border = '1' cellspacing = '0' cellpadding = '10'>
                    <tr>
                        <td><input class="btnClass" onclick="return newPatientTreatment()" type ="button" name ="NewPatientDetail" id="newPatientDetail" <%=disableNewTreatment%> value="New Patient Treatment"></td>
                    </tr>
                    <tr>

                        <td> Date of Consultation </td>
                        <td> Treated By </td>

                    </tr>     


                    <% for (int i = 0; i < patientRecordList.size(); i++) {
                            PatientRecordsDO patientRecord = (PatientRecordsDO) patientRecordList.get(i);%>

                    <tr>
                        <td> <a href="#" onclick ="javascript:decidePatientRecordId(<%=i%>)" > <%= patientRecord.getDateOfConsultation()%>  </a> </td>
                        <td><%=patientRecord.getPractitionerName()%></td>
                        

                    </tr>
                    <%}%>

                    <input type ="hidden" name="patientRecordListId" >

                </table>
            </form>
        </span>
    </body>
</html>