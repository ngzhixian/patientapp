<%-- 
    Document   : newPatientRecord
    Created on : May 11, 2014, 11:15:34 PM
    Author     : Sean
--%>
<%@include file="/validationLogin.jsp"%>
<%@page import="com.PatientRecordsDO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.PatientRecordsDO" %>
<%@ page import="com.PatientDO" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/template.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/chosen.css" rel="stylesheet"/>
        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script src="js/chosen.jquery.js"></script>
        <script type="text/javascript">
            $(document).ready(function() {
                $(".chosen-select").chosen();

            });

        </script>

        <title>JSP Page</title>
    </head>
    <body>
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
        <%PatientRecordsDO patientRecord = (PatientRecordsDO) session.getAttribute("patientSingleRecord");
                       PatientDO patient = (PatientDO) session.getAttribute("patientDO");%>
        <table>
            <tr>
                <td>Patient Id</td>
                <td><input type="text" name="patientId" value="<%=patient.getPatientId()%>" readonly="readonly" disabled="disabled" /></td>
            </tr>
            <tr>
                <td>Date of Treatment</td>
                <td><input type="text" name="dateOfTreatment" value="<%=patientRecord.getDateOfConsultation()%>" readonly="readonly"  />
                    Record Id 
                    <input type="text" name="dateOfTreatment" value="<%=patientRecord.getRecordId()%>" readonly="readonly"  />
                </td>                    

            </tr>
        </table>
        <table>
            <tr>
                <td>Symptoms</td>
                <td>    <textarea id="symptoms" name ="symptoms" rows="10" cols="60" >Symptoms: </textarea>
                </td>   
                <td rowspan="4" > Final Patient Record <br/>
                    <textarea id="finalPatientRecord" name ="finalPatientRecord" rows="52" cols="50" readonly><%=patientRecord.getFinalPatientRecord()%></textarea>

                </td>
            </tr>
            <tr>
                <td>Chief Complaints</td>
                <td>
                    <textarea id ="chiefComplaints" name="chiefComplaints" rows="10" cols="60" ><%=patientRecord.getChiefComplaints()%></textarea>
                </td>
            </tr>
            <tr>
                <td>Present Symptoms / signs</td>
                <td>
                    <textarea id ="presentSymptoms"  name="presentSymptoms" rows="10" cols="60" ><%=patientRecord.getPresentSymptoms()%></textarea>
                </td>
            </tr>
            <tr>
                <td>Other Symptoms / signs</td>
                <td>
                    <textarea id ="otherSymptoms" name="otherSymptoms" rows="10" cols="60" ><%=patientRecord.getOtherSymptoms()%></textarea>
                </td>
            </tr>


        </table>

        <table> 
            <tr>
                <td>Tongue</td>
                <td>Color</td>
                <td>Shape</td>
                <td>Condition</td>
                <td>Liquidity</td>

            </tr>
            <tr>
                <td><select class="chosen-select" name="tongue" size = "10" id="tongue" style="width:200px" ></select>
                    <select class="chosen-select" name="tongue2" size = "10" id="tongue2" style="width:200px" ></select>
                </td>
                <td><select class="chosen-select" name="tongueColor" size = "10" id="tongueColor" style="width:200px" ></select>
                    <select class="chosen-select" name="tongueColor2" size = "10" id="tongueColor2" style="width:200px" ></select>
                </td>
                <td><select class="chosen-select" name="tongueShape" size = "10" id="tongueShape" style="width:200px" >
                    </select>
                </td>
                <td><select class="chosen-select" name="tongueCondition" size = "10" id="tongueCondition" style="width:200px" >
                    </select>
                </td>
                <td><select class="chosen-select" name="tongueLiquidity" size = "10" id="tongueLiquidity" style="width:200px" >
                    </select>
                </td>
            </tr>
        </table>
        <table> 
            <tr>
                <td>Pulse</td>
                <td>Shape</td>
                <td>Frequency</td>
                <td>Condition</td>

            </tr>
            <tr>
                <td><select class="chosen-select" name="pulse" size = "10" id="pulse" style="width:200px" >
                    </select></td>
                <td><select class="chosen-select" name="pulseShape" size = "10" id="pulseShape" style="width:200px" >
                    </select></td>
                <td><select class="chosen-select" name="PulseFrequency" size = "10" id="PulseFrequency" style="width:200px" >
                    </select></td>
                <td><select class="chosen-select" name="PulseCondition" size = "10" id="PulseCondition" style="width:200px" >
                    </select></td>
            </tr>


        </table><br/>
        <table> 
            <tr>
                <td>TCM disease Diagnostics 
                    <br/>
                    <textarea id ="tcmDd" name="tcmDd" rows="10" cols="60"><%=patientRecord.getTcmDd()%></textarea></td>
                <td>TCM Syndrome differentiation
                    <br/>
                    <textarea id ="tcmSd" name="tcmSd" rows="10" cols="60"><%=patientRecord.getTcmSd()%></textarea></td>
            </tr>

            <tr>
                <td>Aetiology Pathogenesis
                    <br/>
                    <textarea id ="aetPath" name="aetPath" rows="10" cols="60"><%=patientRecord.getAetPath()%></textarea></td>
                <td>Western Medicine Diagnosis  
                    <br/>
                    <textarea id ="westMd" name="westMd" rows="10" cols="60"><%=patientRecord.getWesternMed()%></textarea></td>
            </tr>


        </table>
        <table> 
            <tr>
                <td>Treatment - Acupuncture</td>
                <td><select class="chosen-select" name="acupunctureDrop" size = "10" id="acupunctureDrop" style="width:200px" >
                    </select>
                    <br/>
                    <textarea id ="acupuncture" name="acupuncture" rows="10" cols="60"><%=patientRecord.getAcupuncture()%></textarea>
                </td>            
            </tr>
            <tr>
                <td>Herbs</td>
                <td><select class="chosen-select" name="herbsDrop" size = "10" id="herbsDrop" style="width:200px" >
                        <option>aaaaa</option>
                    </select>
                    <select class="chosen-select" name="herbsUnitDrop" size = "10" id="herbsUnitDrop" style="width:100px" >
                        <option>1cm</option>
                    </select>
                    <input name = "addHerbs" type = "button" id = "addHerbs" value = "Add Herbs">
                    <br/>
                    <textarea id ="herbs" name="herbs" rows="10" cols="60"><%=patientRecord.getHerbs()%></textarea>
                </td>             
            </tr>
            <tr>
                <td>Remedial Massage</td>
                <td><select class="chosen-select" name="remedialMassageDrop" size = "10" id="remedialMassageDrop" style="width:200px" >
                    </select>
                    <br/>
                    <textarea id ="remedialMassage" name="remedialMassage" rows="10" cols="60"><%=patientRecord.getRemedialMassage()%></textarea>
                </td>             
            </tr>


        </table>
    </form>

</body>
</html>
