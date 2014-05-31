<%-- 
    Document   : patientSearchResults
    Created on : May 11, 2014, 2:52:40 PM
    Author     : Sean
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.PatientDO" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            function decidePatientListId(a) {
                var listId = a;
                document.patientSearchResult.patientListId.value = listId;
                document.patientSearchResult.submit();

            }

        </script>   

    </head>
    <body>
        <%@include file="/validationLogin.jsp"%>
        <div id ="menuItems" class="menuItems">
            <table border="1" cellpadding="15" cellspacing="0">
                <tr>


                    <td>
                        <ul class="btnMenuTab">
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/Index">Patient Search</a></li>
                            <li class="btnMenu" ><a href="<%=request.getContextPath()%>/PatientRecord">Patient Record</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/PatientRegistration">Patient Registration</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/ApplicationMaintainence">Application Maintainence</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/HomePage">Log Out</a></li>

                        </ul>

                    </td>
                </tr>
            </table>
        </div>        
        <%
            ArrayList patientDOlist = new ArrayList();
            if (session.getAttribute("patientDOlist") != null) {
                patientDOlist = (ArrayList) session.getAttribute("patientDOlist");
            }
        %>
        <form method = "post" name = "patientSearchResult" action = "PatientRecords">
            <%if (patientDOlist.isEmpty()) {
                    session.setAttribute("errorNoPatient", "errorNoPatient");
                    response.sendRedirect("Index");
                } else {
                    session.removeAttribute("errorNoPatient");

                }%>
            <div id ="bodyContent" class="bodyContent">

                <table border = '1' cellspacing = '0' cellpadding = '10'>
                    <tr>
                        <td> Patient ID </a> </td>
                        <td> First Name  </td>
                        <td> Last Name   </td>
                        <td> Gender </td>
                        <td> Date Of Birth  </td>

                    </tr>     




                    <% for (int i = 0; i < patientDOlist.size(); i++) {
                            PatientDO patient = (PatientDO) patientDOlist.get(i);%>
                    <tr>
                        <td> <a href="#" onclick ="javascript:decidePatientListId(<%=i%>);" > <%= patient.getPatientId()%>  </a> </td>
                        <td> <%= patient.getFirstName()%>  </td>
                        <td> <%= patient.getLastName()%>  </td>
                        <td> <%= patient.getGender()%>  </td>
                        <td> <%= patient.getDob()%>  </td>


                    </tr>
                    <%}%>
                    <input type ="hidden" name="patientListId" >
                </table>
            </div>
        </form>

    </body>
</html>
