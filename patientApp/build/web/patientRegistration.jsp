<%@include file="/validationLogin.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="com.MasterDO" %>
<%@ page import="com.Database" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css">
        <title> My first JSP   </title>
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script src="js/zebra_datepicker.src.js" type="text/javascript"></script>
        <link href="css/metallic.css" rel="stylesheet"/>

        <script type="text/javascript">
            $(document).ready(function() {
                        $("#dob").Zebra_DatePicker();
        
                $('input, select').keypress(function() {
                    return event.keyCode != 13;
                });
                

            });
        </script>
    </head>	
    <body>	
        <%
            Database db = new Database();
            ArrayList masterDrop = db.retrieveDropDownValues();
            ArrayList medicalFundArr = new ArrayList();

            for (int i = 0; i < masterDrop.size(); i++) {
                MasterDO master = (MasterDO) masterDrop.get(i);
                if ("MEDICAL_FUND".equals(master.getKeyTy())) {
                    medicalFundArr.add(master);
                }
            }

        %>
        <span class="menuItems" id ="menuItems">
            <table >
                <tr>
                    <td>
                        <ul class="btnMenuTab">
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/Index">Patient Search</a></li>
                            <li class="btnMenu" ><a href="<%=request.getContextPath()%>/PatientRecord">Patient Record</a></li>
                            <li class="btnMenu"><a class="active" href="<%=request.getContextPath()%>/PatientRegistration">Patient Registration</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/ApplicationMaintainence">Application Maintainence</a></li>
                            <li class="btnMenu"><a href="<%=request.getContextPath()%>/HomePage">Log Out</a></li>

                        </ul>

                    </td>
                </tr>
            </table>
        </span>

        <form action="patientRegistration" method="post">	
            <div class="bodyContent" id="bodyContent">

                <table width="400px">
                    <tr>
                        <td>Title</td>
                        <td><select name="title" size="1">
                                <option value = "Mr">Mr</option>
                                <option value = "Mdm">Mdm</option>
                                <option value = "Dr">Dr</option>
                                <option value = "Miss">Miss</option>

                            </select></td>
                    </tr>
                    <tr>
                        <td>First Name</td>
                        <td><input type="text" name="firstName"size="20px"></td>
                    </tr>
                    <tr>
                        <td>Last Name</td>
                        <td><input type="text" name="lastName"size="20px"></td>
                    </tr>
                    <tr>
                        <td>Gender</td>
                        <td><select name="gender" size="1">
                                <option value = "Male">Male</option>
                                <option value = "Female">Female</option>
                            </select> </td>
                    </tr>
                    <tr>
                        <td>Date Of Birth</td>
                        <td><input type="text"  id="dob" name="dob" size="20px"></td>

                    </tr>
                    <tr>
                        <td>Mobile</td>
                        <td><input type="text"  name="mobile"size="20px"></td>

                    </tr>
                    <tr>
                        <td>Home Number</td>
                        <td><input type="text"  name="homeNo"size="20px"></td>

                    </tr>
                    <tr>
                        <td>Unit No</td>
                        <td><input type="text" name="unitNo"size="20px"></td>
                    </tr>
                    <tr>
                        <td>Street No</td>
                        <td><input type="text" name="streetNo"size="20px"></td>

                    </tr>
                    <tr>
                        <td>Street Name</td>
                        <td><input type="text" name="streetName"size="20px"></td>

                    </tr>

                    <tr>
                        <td>Suburb</td>
                        <td><input type="text" name="suburb"size="20px"></td>
                    </tr>
                    <tr>
                        <td>State</td>
                        <td><select name="state" size="1">
                                <option value = "NSW">NSW</option>
                                <option value = "NT">NT</option>
                                <option value = "QLD">QLD</option>
                                <option value = "TAS">TAS</option>
                                <option value = "ACT">ACT</option>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td>Postcode</td>
                        <td><input ext" name="postCode"size="20px"></td>

                    </tr>
                    <tr>
                        <td>Medical Fund</td>
                        <td><select name="medicalFund" size="1" >
                                <% for (int i = 0; i < medicalFundArr.size(); i++) {
                                        MasterDO masterSpecific = (MasterDO) medicalFundArr.get(i);
                                %>
                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                <%}%>
                            </select>
                        </td>

                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" value="Register" >						
                        </td>
                    </tr>
                </table>   
            </div>

        </form>		
    </body>
</html>