<%-- 
    Document   : patientSearch
    Created on : May 10, 2014, 2:53:37 PM
    Author     : Sean
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body>
        <%@include file="/validationLogin.jsp"%>
        <form method ="post" action = "PatientSearchServlet" name="patientSearchForm">
            <span id ="menuItems" class="menuItems">     
                <table>
                    <td>
                        <ul class="btnMenuTab">
                            <li class="btnMenu"><a class="active" href="<%=request.getContextPath()%>/Index">Patient Search</a></li>
                            <li class="btnMenu" ><a href="<%=request.getContextPath()%>/PatientRecord">Patient Record</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/PatientRegistration">Patient Registration</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/ApplicationMaintainence">Application Maintainence</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/Receipt">Receipt</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/HomePage">Log Out</a></li>

                        </ul>

                    </td>
                </table>
            </span>
            <span id ="bodyContent" class="bodyContent">

                <%
                    if (session.getAttribute("errorNoPatient") != null) {%>
                <h2 class="error">No patient record was found. Please search again!</h2>
                <% } else if (session.getAttribute("newPatientId") != null) {%>
                <h2>Your new patient Id is <%=session.getAttribute("newPatientId")%>. Please use this patient Id for future consultation.</h2>

                <% }
                %>
                <table>

                    <tr><td>
                            <table border="1">
                                <tr>
                                    <th><input type="radio" name="searchCondition" value="1" checked="checked" />
                                        Search by Patient Info</th>
                                    <th></th>
                                </tr>

                                <tr>
                                    <td>First Name:</td>
                                    <td><input type="text" name="firstName" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Last Name</td>
                                    <td><input type="text" name="lastName" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Patient Id</td>
                                    <td><input type="text" name="patientId" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Mobile</td>
                                    <td><input type="text" name="mobile" value="" /></td>
                                </tr>


                            </table>
                        </td><td>
                            <table border="1">

                                <tr>
                                    <th><input type="radio" name="searchCondition" value="2" />
                                        Search by Address</th>
                                    <th>&nbsp;</th>
                                </tr>

                                <tr>
                                    <td>Unit No</td>
                                    <td><input type="text" name="unitNo" value="" /></td>
                                </tr>
                                <tr>
                                    <td>Street No</td>
                                    <td><input type="text" name="streetNo" value="" /></td>
                                </tr>

                                <tr>
                                    <td>Street</td>
                                    <td><input type="text" name="street" value="" /></td>
                                </tr>

                                <tr>
                                    <td>Suburb</td>
                                    <td><input type="text" name="suburb" value="" /></td>
                                </tr>
                                <tr>
                                    <td>State</td>
                                    <td><input type="text" name="state" value="" /></td>
                                </tr>

                                <tr>
                                    <td>PostCode</td>
                                    <td><input type="text" name="postCode" value="" /></td>
                                </tr>

                            </table>
                        </td></tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Search" name="patientSearchSubmit" />
                        </td>
                    </tr>
                </table>
            </span>

        </form>    
    </body>
</html>
