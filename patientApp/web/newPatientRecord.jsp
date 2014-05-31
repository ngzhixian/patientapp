<%-- 
    Document   : newPatientRecord
    Created on : May 11, 2014, 11:15:34 PM
    Author     : Sean
--%>
<%@include file="/validationLogin.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.MasterDO" %>
<%@ page import="com.Database" %>
<%@ page import="com.PatientDO" %>
<%@ page import="com.PatientRecordsDO" %>

<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/template.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/chosen.css" rel="stylesheet"/>
        <link href="css/metallic.css" rel="stylesheet"/>

        <script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
        <script src="js/chosen.jquery.js"></script>
        <script src="js/jquery.easytabs.js" type="text/javascript"></script>
        <script src="js/zebra_datepicker.src.js" type="text/javascript"></script>
        <script type="text/javascript">

            $(document).ready(function() {
                function PopIt() {
                    return "Unsaved changes will be lost ";
                }
                function UnPopIt() { /* nothing to return */
                }
                 
                window.onbeforeunload = PopIt;
                $("#saveRecord").click(function()
                {
                    window.onbeforeunload = UnPopIt;
                });

                $("#saveRecord").click(function() {
                    $("#newPatientRecord").submit();
                });
                $("#review").click(
                        function() {
                            var str = "";
                            var chiefComplaints = $("#chiefComplaints").val();
                            var presentSymptoms = $("#presentSymptoms").val();
                            var otherSymptoms = $("#otherSymptoms").val();
                            var tongue = $("#tongue").val();
                            var pulse = $("#pulse").val();
                            var tcmSd = $("#tcmSd").val();
                            var tcmDd = $("#tcmDd").val();
                            var aetPath = $("#aetPath").val();
                            var westMd = $("#westMd").val();
                            var acupuncture = $("#acupuncture").val();
                            var herbs = $("#herbs").val();
                            var remedialMassage = $("#remedialMassage").val();
                            var principleOfTreatment = $("#principleOfTreatment").val();
                            var treatmentPlan = $("#treatmentPlan").val();
                            var advice = $("#advice").val();
                            var outcome = $("#outcome").val();


                            str += chiefComplaints + "\n\n" + presentSymptoms + "\n\n" + otherSymptoms +
                                    "\n\n" + tongue + "\n\n" + pulse + "\n\n" + tcmSd + "\n\n" + tcmDd + "\n\n" + aetPath + "\n\n" + westMd + "\n\n" + principleOfTreatment + "\n\n" + acupuncture + "\n\n" + herbs +
                                    "\n\n" + remedialMassage + "\n\n" + treatmentPlan + "\n\n" + outcome + "\n\n" + advice;
                            $("#finalPatientRecord").val(str);
                        });

                $("#chiefComplaintsDrop").change(function() {
                    $("#chiefComplaints").val($("#chiefComplaints").val() + " " + $("#chiefComplaintsDrop option:selected").text());
                }).change();

                $("#presentSymptomsDrop").change(function() {
                    $("#presentSymptoms").val($("#presentSymptoms").val() + " " + $("#presentSymptomsDrop option:selected").text());
                }).change();

                $("#otherSymptomsDrop").change(function() {
                    $("#otherSymptoms").val($("#otherSymptoms").val() + " " + $("#otherSymptomsDrop option:selected").text());
                }).change();

                $("#tcmDdDrop").change(function() {
                    $("#tcmDd").val($("#tcmDd").val() + " " + $("#tcmDdDrop option:selected").text());
                }).change();
                $("#tcmSdDrop").change(function() {
                    $("#tcmSd").val($("#tcmSd").val() + " " + $("#tcmSdDrop option:selected").text());
                }).change();
                $("#aetPathDrop").change(function() {
                    $("#aetPath").val($("#aetPath").val() + " " + $("#aetPathDrop option:selected").text());
                }).change();
                $("#westMdDrop").change(function() {
                    $("#westMd").val($("#westMd").val() + " " + $("#westMdDrop option:selected").text());
                }).change();

                $("#acupunctureDrop").change(function() {
                    $("#acupuncture").val($("#acupuncture").val() + " " + $("#acupunctureDrop option:selected").text());
                }).change();
                $("#addHerbs").click(function() {
                    $("#herbs").val($("#herbs").val() + " " + $("#herbsDrop option:selected").text() + " " + $("#herbsUnitDrop option:selected").text() + "\n");
                }).change();
                $("#remedialMassageDrop").change(function() {
                    $("#remedialMassage").val($("#remedialMassage").val() + " " + $("#remedialMassageDrop option:selected").text());
                }).change();
                $("#principleOfTreatmentDrop").change(function() {
                    $("#principleOfTreatment").val($("#principleOfTreatment").val() + " " + $("#principleOfTreatmentDrop option:selected").text());
                }).change();
                $("#treatmentPlanDrop").change(function() {
                    $("#treatmentPlan").val($("#treatmentPlan").val() + " " + $("#treatmentPlanDrop option:selected").text());
                }).change();
                $("#outcomeDrop").change(function() {
                    $("#outcome").val($("#outcome").val() + " " + $("#outcomeDrop option:selected").text());
                }).change();
                $("#adviceDrop").change(function() {
                    $("#advice").val($("#advice").val() + " " + $("#adviceDrop option:selected").text());
                }).change();


                $(".chosen-select").chosen();
                $('#tab-container').easytabs();
                $('#dateOfConsultation').Zebra_DatePicker();

            });
        </script>
    </head>
    <body>
        <span id ="menuItems" class="menuItems">     

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
        </span>
        <span id ="bodyContent" class="bodyContent">

            <form name ="newPatientRecord" id ="newPatientRecord" action="NewPatientDetails" method ="post">
                <%
                    Database db = new Database();
                    ArrayList chiefComplaintArr = new ArrayList();
                    ArrayList presentSymptomsArr = new ArrayList();
                    ArrayList otherSymptomsArr = new ArrayList();
                    ArrayList acupunctureArr = new ArrayList();
                    ArrayList herbsArr = new ArrayList();
                    ArrayList tcmsdArr = new ArrayList();
                    ArrayList westMedArr = new ArrayList();
                    ArrayList aethArr = new ArrayList();
                    ArrayList tcmddArr = new ArrayList();
                    ArrayList remedialMassageArr = new ArrayList();
                    ArrayList potArr = new ArrayList();
                    ArrayList tpArr = new ArrayList();
                    ArrayList outcomeArr = new ArrayList();
                    ArrayList adviceArr = new ArrayList();

                    PatientDO patient = new PatientDO();
                    Integer practitionerId = 0;
                    String practitionerName = "";
                    PatientRecordsDO record = new PatientRecordsDO();
                    if (session.getAttribute("patientDO") != null && session.getAttribute("userId") != null) {
                        patient = (PatientDO) session.getAttribute("patientDO");
                        practitionerId = (Integer) session.getAttribute("userId");
                        practitionerName = (String) session.getAttribute("displayName");

                    }
                    
                    ArrayList masterDrop = db.retrieveDropDownValues();
                    for (int i = 0; i < masterDrop.size(); i++) {
                        MasterDO master = (MasterDO) masterDrop.get(i);
                        if ("CHIEF_COMPLAINTS".equals(master.getKeyTy())) {
                            chiefComplaintArr.add(master);
                        } else if ("PRESENT_SYMPTOMS".equals(master.getKeyTy())) {
                            presentSymptomsArr.add(master);
                        } else if ("OTHER_SYMPTOMS".equals(master.getKeyTy())) {
                            otherSymptomsArr.add(master);
                        } else if ("TCM_DD".equals(master.getKeyTy())) {
                            tcmddArr.add(master);
                        } else if ("TCM_SD".equals(master.getKeyTy())) {
                            tcmsdArr.add(master);
                        } else if ("ACUPUNCTURE".equals(master.getKeyTy())) {
                            acupunctureArr.add(master);
                        } else if ("WEST_MED".equals(master.getKeyTy())) {
                            westMedArr.add(master);
                        } else if ("AET_PATH".equals(master.getKeyTy())) {
                            aethArr.add(master);
                        } else if ("HERBS".equals(master.getKeyTy())) {
                            herbsArr.add(master);
                        } else if ("REMEDIAL_MASSAGE".equals(master.getKeyTy())) {
                            remedialMassageArr.add(master);
                        } else if ("PRINCIPLE_OF_TREATMENT".equals(master.getKeyTy())) {
                            potArr.add(master);
                        } else if ("TREATMENT_PLAN".equals(master.getKeyTy())) {
                            tpArr.add(master);
                        } else if ("OUTCOME".equals(master.getKeyTy())) {
                            outcomeArr.add(master);
                        } else if ("ADVICE".equals(master.getKeyTy())) {
                            adviceArr.add(master);
                        }

                    }
                    
                    if (session.getAttribute("singleRecord")!= null){
                        record  = (PatientRecordsDO) session.getAttribute("singleRecord");
                    }
                    String dateOfConsultation = "";
                    String chiefComplaints = "";
                    String presentSymptoms = "";
                    String otherSymptoms = "";
                    String tongue = "";
                    String pulse = "";
                    String tcmDD = "";
                    String tcmSD = "";
                    String aeth = "";
                    String westMed = "";
                    String principleTreatment = "";
                    String acupuncture = "";
                    String herbs = "";
                    String remedialMassage = "";
                    String advice = "";
                    String outcome = "";
                    String treatmentPlan = "";
                    String finalRecord = "";
                    Integer recordId = 0;
                    
                    recordId = record.getRecordId();
                    if(recordId == null)
                     recordId = 0;
                    
                    dateOfConsultation = record.getDateOfConsultation();
                    if(dateOfConsultation == null)
                     dateOfConsultation = "";
                     
                    chiefComplaints = record.getChiefComplaints();
                    if(chiefComplaints == null)
                     chiefComplaints = "";
                    
                    presentSymptoms = record.getPresentSymptoms();
                    if(presentSymptoms == null)
                     presentSymptoms = "";
                    
                    otherSymptoms = record.getOtherSymptoms();
                    if(otherSymptoms == null)
                     otherSymptoms = "";
                    
                    pulse = record.getPulse();
                    if(pulse == null)
                     pulse = "";
                    
                    tongue = record.getTongue();
                    if(tongue == null)
                     tongue = "";
                    
                     tcmDD = record.getTcmDd();
                    if(tcmDD == null)
                     tcmDD = "";
                    
                     tcmSD = record.getTcmSd();
                    if(tcmSD == null)
                     tcmSD = "";
                    
                    aeth = record.getAetPath();
                    if(aeth == null)
                     aeth = "";
                    westMed = record.getWesternMed();
                    if(westMed == null)
                     westMed = "";
                    
                    principleTreatment = record.getPrincipleTreatment();
                    if(principleTreatment == null)
                     principleTreatment = "";
                    
                    acupuncture = record.getAcupuncture();
                    if(acupuncture == null)
                     acupuncture = "";
                    
                    herbs = record.getHerbs();
                    if(herbs == null)
                     herbs = "";
                    
                    remedialMassage = record.getRemedialMassage();
                    if(remedialMassage == null)
                     remedialMassage = "";
                    
                    treatmentPlan = record.getTreatmentPlan();
                    if(treatmentPlan == null)
                     treatmentPlan = "";
                    
                    advice = record.getAdvice();
                    if(advice == null)
                     advice = "";
                    
                    outcome = record.getOutcome();
                    if(outcome == null)
                     outcome = "";
                    
                    finalRecord = record.getFinalPatientRecord();
                    if(finalRecord == null)
                     finalRecord = "";
                %> 
                <table width = "800px">
                    <tr>
                        <td>Patient Id</td>
                        <td><input type="text" name="patientId" value="<%=patient.getPatientId()%>"  readonly="readonly" /></td>
                        <td>Patient Name </td>
                        <td><input type="text" name="patientName" value="<%=patient.getFirstName() + " " + patient.getLastName()%>" readonly="readonly" /></td>
                        <td>Date of Treatment</td>
                        
                        <td><input type="text" name="dateOfConsultation" id ="dateOfConsultation" value="<%=dateOfConsultation%>"></td>
                    </tr>
                    <tr>
                        <td>
                            Record Id:     
                        </td>
                        <td><input type="text" name="recordId" value="<%=recordId%>" readonly="readonly" /></td>

                        <td>
                            Practitioner Id:     
                        </td>
                        <td><input type="text" name="practitionerId" value="<%=practitionerId%>" readonly="readonly" /></td>
                        <td>
                            Practitioner Name:     
                        </td>
                        <td><input type="text" name="practitionerName" value="<%=practitionerName%>" readonly="readonly" /></td>
                    </tr>
                    <tr>
                        <td colspan="6" align="right"> 
                            <ul class="btnMenuTab">
                                <li class="btnMenu"><a href="#" id = "review" >Review Record</a></li>
                                <li class="btnMenu"><a href="#" id= "saveRecord" >Save Patient Record</a></li></ul>
                        </td>


                    </tr>

                </table>
                <table>
                    <tr><td>
                            <div id="tab-container" class="tab-container">                
                                <ul class='etabs'>
                                    <li class='tab'><a href="#tabs-symptomsTable">Symptoms</a></li>
                                    <li class='tab'><a href="#tabs-tongueTable">Tongue</a></li>
                                    <li class='tab'><a href="#tabs-pulseTable">Pulse</a></li>
                                    <li class='tab'><a href="#tabs-diagnosisTable">Diagnosis</a></li>                   
                                    <li class='tab'><a href="#tabs-treatmentPlanTable">Treatment Plan</a></li>

                                </ul>
                                <table id ="tabs-symptomsTable">
                                    <tr>
                                        <td>Chief Complaints</td>
                                        <td>
                                            <select class="chosen-select" name="chiefComplaintsDrop" size = "10" id="chiefComplaintsDrop" style="width:200px"  >
                                                <% for (int i = 0; i < chiefComplaintArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) chiefComplaintArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>

                                            </select>
                                            <br/>
                                            <textarea id ="chiefComplaints" name="chiefComplaints" rows="10" cols="40" ><% if(chiefComplaints!=""){out.println(chiefComplaints);}else{out.println("Chief Complaints:");}%></textarea>
                                        </td>

                                    </tr>


                                    <tr>
                                        <td>Present Symptoms / signs</td>
                                        <td>
                                            <select class="chosen-select" name="presentSymptomsDrop" size = "10" id="presentSymptomsDrop" style="width:200px" >
                                                <% for (int i = 0; i < presentSymptomsArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) presentSymptomsArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>

                                            </select>
                                            <br/>
                                            <textarea id ="presentSymptoms"  name="presentSymptoms" rows="10" cols="40" ><% if(presentSymptoms!=""){out.println(presentSymptoms);}else{out.println("Present Symptoms:");}%></textarea>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Other Symptoms / signs</td>
                                        <td>
                                            <select class="chosen-select" name="otherSymptomsDrop" size = "10" id="otherSymptomsDrop" style="width:200px" >
                                                <% for (int i = 0; i < otherSymptomsArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) otherSymptomsArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>
                                            </select>
                                            <br/>
                                            <textarea id ="otherSymptoms" name="otherSymptoms" rows="10" cols="40" ><% if(otherSymptoms!=""){out.println(otherSymptoms);}else{out.println("Other Symptoms:");}%></textarea>
                                        </td>
                                    </tr>


                                </table>
                                <table width="500px"  id="tabs-tongueTable"> 
                                    <tr>
                                        <td>Tongue</td>
                                        <td><select class="chosen-select" name="tongue1" size = "10" id="tongue1" style="width:200px" ></select>
                                            <select class="chosen-select" name="tongue2" size = "10" id="tongue2" style="width:200px" ></select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Color</td>
                                        <td><select class="chosen-select" name="tongueColor" size = "10" id="tongueColor" style="width:200px" ></select>
                                            <select class="chosen-select" name="tongueColor2" size = "10" id="tongueColor2" style="width:200px" ></select>
                                        </td>
                                    </tr>
                                    <tr>   
                                        <td>Shape</td>
                                        <td><select class="chosen-select" name="tongueShape" size = "10" id="tongueShape" style="width:200px" >
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Condition</td>
                                        <td><select class="chosen-select" name="tongueCondition" size = "10" id="tongueCondition" style="width:200px" >
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Liquidity</td>
                                        <td><select class="chosen-select" name="tongueLiquidity" size = "10" id="tongueLiquidity" style="width:200px" >
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <textarea id ="tongue" name="tongue" rows="10" cols="40"><% if(tongue!=""){out.println(tongue);}else{out.println("Tongue");}%></textarea>

                                        </td>
                                    </tr>


                                </table>
                                <table id="tabs-pulseTable"> 
                                    <tr>
                                        <td>Pulse</td>
                                        <td><select class="chosen-select" name="pulse1" size = "10" id="pulse1" style="width:200px" >
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Shape</td>
                                        <td><select class="chosen-select" name="pulseShape" size = "10" id="pulseShape" style="width:200px" >
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Frequency</td>
                                        <td><select class="chosen-select" name="PulseFrequency" size = "10" id="PulseFrequency" style="width:200px" >
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <td>Condition</td>
                                        <td><select class="chosen-select" name="PulseCondition" size = "10" id="PulseCondition" style="width:200px" >
                                            </select></td>

                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>

                                        <td >
                                            <textarea id ="pulse" name="pulse" rows="10" cols="40"><% if(pulse!=""){out.println(pulse);}else{out.println("Pulse");}%></textarea>
                                        </td>
                                    </tr>



                                </table><br/>
                                <table id = 'tabs-diagnosisTable'> 
                                    <tr>
                                        <td>TCM disease Diagnostics 
                                            <br/>
                                            <select class="chosen-select" name="tcmDdDrop" size = "10" id="tcmDdDrop" style="width:200px" >
                                                <% for (int i = 0; i < tcmddArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) tcmddArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>
                                            </select>
                                            <br/>
                                            <textarea id ="tcmDd" name="tcmDd" rows="10" cols="40"><% if(tcmDD!=""){out.println(tcmDD);}else{out.println("TCM disease Diagnostics:");}%></textarea></td>
                                        <td>TCM Syndrome differentiation
                                            <br/>
                                            <select class="chosen-select" name="tcmSdDrop" size = "10" id="tcmSdDrop" style="width:200px" >
                                                <% for (int i = 0; i < tcmsdArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) tcmsdArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>
                                            </select>
                                            <br/>
                                            <textarea id ="tcmSd" name="tcmSd" rows="10" cols="40"><% if(tcmSD!=""){out.println(tcmSD);}else{out.println("TCM Syndrome differentiation:");}%></textarea></td>
                                    </tr>

                                    <tr>
                                        <td>Aetiology Pathogenesis
                                            <br/>

                                            <select class="chosen-select" name="aetPathDrop" size = "10" id="aetPathDrop" style="width:200px" >
                                                <% for (int i = 0; i < aethArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) aethArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>
                                            </select>
                                            <br/>
                                            <textarea id ="aetPath" name="aetPath" rows="10" cols="40"><% if(aeth!=""){out.println(aeth);}else{out.println("Aetiology Pathogenesis:");}%></textarea></td>
                                        <td>Western Medicine Diagnosis  
                                            <br/>
                                            <select class="chosen-select" name="westMdDrop" size = "10" id="westMdDrop" style="width:200px" >
                                                <% for (int i = 0; i < westMedArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) westMedArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>
                                            </select>
                                            <br/>
                                            <textarea id ="westMd" name="westMd" rows="10" cols="40"><% if(westMed!=""){out.println(westMed);}else{out.println("Western Medicine Diagnosis:");}%></textarea></td>
                                    </tr>


                                </table>
                                <table id = "tabs-treatmentPlanTable"> 
                                    <tr>
                                        <td>Principle of treatment</td>
                                        <td><select class="chosen-select" name="principleOfTreatmentDrop" size = "10" id="principleOfTreatmentDrop" style="width:200px" >
                                                <% for (int i = 0; i < potArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) potArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>
                                            </select>
                                            <br/>
                                            <textarea id ="principleOfTreatment" name="principleOfTreatment" rows="10" cols="40"><% if(principleTreatment!=""){out.println(principleTreatment);}else{out.println("Principle Of Treatment:");}%></textarea>
                                        </td>            
                                    </tr>
                                    <tr>
                                        <td>Treatment - Acupuncture</td>
                                        <td><select class="chosen-select" name="acupunctureDrop" size = "10" id="acupunctureDrop" style="width:200px" >
                                                <% for (int i = 0; i < acupunctureArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) acupunctureArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>
                                            </select>
                                            <br/>
                                            <textarea id ="acupuncture" name="acupuncture" rows="10" cols="40"><% if(acupuncture!=""){out.println(acupuncture);}else{out.println("Acupuncture:");}%></textarea>
                                        </td>            
                                    </tr>
                                    <tr>
                                        <td>Herbs</td>
                                        <td><select class="chosen-select" name="herbsDrop" size = "10" id="herbsDrop" style="width:200px" >
                                                <% for (int i = 0; i < herbsArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) herbsArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%>                        
                                            </select>
                                            <select class="chosen-select" name="herbsUnitDrop" size = "10" id="herbsUnitDrop" style="width:200px" >
                                                <option>1cm</option>
                                            </select><br/>
                                            <input class="btnClass" name = "addHerbs" type = "button" id = "addHerbs" value = "Add Herbs">
                                            <br/>
                                            <textarea id ="herbs" name="herbs" rows="10" cols="40"><% if(herbs!=""){out.println(herbs);}else{out.println("Herbs:");}%></textarea>
                                        </td>             
                                    </tr>
                                    <tr>
                                        <td>Remedial Massage</td>
                                        <td><select class="chosen-select" name="remedialMassageDrop" size = "10" id="remedialMassageDrop" style="width:200px" >
                                                <% for (int i = 0; i < remedialMassageArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) remedialMassageArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%> 
                                            </select>
                                            <br/>
                                            <textarea id ="remedialMassage" name="remedialMassage" rows="10" cols="40"><% if(remedialMassage!=""){out.println(remedialMassage);}else{out.println("Remedial Massage:");}%></textarea>
                                        </td>             
                                    </tr>
                                    <tr>
                                        <td>Treatment Plan</td>
                                        <td><select class="chosen-select" name="treatmentPlanDrop" size = "10" id="treatmentPlanDrop" style="width:200px" >
                                                <% for (int i = 0; i < tpArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) tpArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%> 
                                            </select>
                                            <br/>
                                            <textarea id ="treatmentPlan" name="treatmentPlan" rows="10" cols="40"><% if(treatmentPlan!=""){out.println(treatmentPlan);}else{out.println("Treatment Plan:");}%></textarea>
                                        </td>             
                                    </tr>
                                    <tr>
                                        <td>Outcome</td>
                                        <td><select class="chosen-select" name="outcomeDrop" size = "10" id="outcomeDrop" style="width:200px" >
                                                <% for (int i = 0; i < outcomeArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) outcomeArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%> 
                                            </select>
                                            <br/>
                                            <textarea id ="outcome" name="outcome" rows="10" cols="40"><% if(outcome!=""){out.println(outcome);}else{out.println("Outcome:");}%></textarea>
                                        </td>             
                                    </tr>
                                    <tr>
                                        <td>Advice</td>
                                        <td><select class="chosen-select" name="adviceDrop" size = "10" id="adviceDrop" style="width:200px" >
                                                <% for (int i = 0; i < adviceArr.size(); i++) {
                                                        MasterDO masterSpecific = (MasterDO) adviceArr.get(i);
                                                %>
                                                <option value = "<%= masterSpecific.getDecode()%>"><%= masterSpecific.getDescription()%></option>
                                                <%}%> 
                                            </select>
                                            <br/>
                                            <textarea id ="advice" name="advice" rows="10" cols="40"><% if(advice!=""){out.println(advice);}else{out.println("Advice:");}%></textarea>
                                        </td>             
                                    </tr>
                                </table>
                            </div>
                        </td>
                        <td>Patient Record Review:<br/>
                            <textarea id="finalPatientRecord" name ="finalPatientRecord" rows="38" cols="40" readonly><% if(finalRecord!=""){out.println(finalRecord);}%></textarea>
                        </td>
                </table>
            </form>

        </span>

    </body>
</html>